#!/bin/bash
set -eo pipefail

zp() { printf '\e[96m%s\e[m\n' "$1"; }

readarray -t blks < <(lsblk -dinpro NAME)

zp "which disk"
lsblk -dinpro NAME,SIZE | while read -r name size; do
	echo -e "$((++i)). $name\t$size"
done

read -rp "> " i < /dev/tty
if (( i > ${#blks[@]} || i < 1 )); then
	echo "bye"
	exit 1
fi

dev="${blks[i-1]}"

read -rp "username: " username < /dev/tty
read -rsp "password: " password < /dev/tty
echo
read -rp "timezone: " timezone < /dev/tty
read -rp "hostname: " hostname < /dev/tty
read -n 1 -rp "use iwd? [y/N] " useiwd < /dev/tty
echo

zp "writing partitions"
printf "label: gpt\n,1G,U\n,,L\n" | sfdisk -f "$dev"
sync

zp "creating filesystems"
readarray -t parts < <(lsblk -inpro NAME "$dev" | tail -n2)
mkfs.vfat -F 32 "${parts[0]}"
mkfs.ext4 -F "${parts[1]}"

zp "mounting partitions"
mount -v "${parts[1]}" /mnt
mount -v "${parts[0]}" /mnt/boot/efi --mkdir

zp "pacstrap"
pacstrap -K /mnt base base-devel linux linux-firmware git vim openssh iwd

zp "fstab"
genfstab -U /mnt | tee /mnt/etc/fstab

zp "cmdline"
uuid=$(blkid -s UUID -o value "${parts[1]}")
echo "root=UUID=$uuid rw" | tee /mnt/etc/kernel/cmdline

zp "efibootmgr"
efibootmgr -c -d "${parts[0]}" -l "\\arch.efi" -L "zarch"

zp "make user"
sed -i '/%w.*) A/ s/# //' /mnt/etc/sudoers
useradd -m -G wheel -s /bin/bash -R /mnt "$username"
passwd6=$(openssl passwd -6 "$password")
echo "$username:$passwd6" | chpasswd -e -R /mnt

if [[ "yY" == *"$useiwd"* ]]; then
	zp "iwd"
	mkdir -p /mnt/etc/iwd /mnt/var/lib/iwd
	echo "[General]\nEnableNetworkConfiguration=true" > /mnt/etc/iwd/main.conf
	cp -r /var/lib/iwd/* /mnt/var/lib/iwd
fi

zp "other mounts"
mount -v -t proc proc /mnt/proc --mkdir
mount -v --rbind /sys /mnt/sys --mkdir
mount -v --rbind /dev /mnt/dev --mkdir
mount -v --rbind /run /mnt/run --mkdir

zp "misc nonsense"
echo "en_US.UTF-8 UTF-8" > /mnt/etc/locale.gen
chroot /mnt /usr/bin/locale-gen
ln -svf "/usr/share/zoneinfo/$timezone" /mnt/etc/localtime
echo "$hostname" > /mnt/etc/hostname
echo "nameserver 1.1.1.1" > /mnt/resolv.conf
echo -e "KEYMAP=us\nFONT=default8x16" > /mnt/etc/vconsole.conf

zp "uki"
cat << EOF | tee /mnt/etc/mkinitcpio.d/linux.preset
ALL_kver="/boot/vmlinuz-linux"
PRESETS=('default')
default_uki="/boot/efi/arch.efi"
EOF
chroot /mnt /usr/bin/mkinitcpio -P

zp "done"

