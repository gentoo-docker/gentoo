dist="http://distfiles.gentoo.org/releases/amd64/autobuilds"
stage3="$(busybox wget -qO- $dist/latest-stage3-amd64.txt | busybox tail -n 1)"

busybox echo "Downloading and extracting ${stage3}..."
busybox wget "${dist}/${stage3}" -qO- \
  | busybox tar \
    --exclude="./etc/hosts" \
    --exclude="./sys/*" \
    -pxjf -

echo 'UTC' > /etc/timezone

cp /_files/etc/portage/make.conf /etc/portage/make.conf

cp /_files/etc/portage/cpu.conf /etc/portage/cpu.conf

rm -rf /usr/share/doc

rm -rf /usr/share/info

rm -rf /usr/share/man

rm -rf /usr/share/gtk-doc

rm -rf /_files/

rm /Dockerfile

rm /build.sh
