dist="http://distfiles.gentoo.org/releases/amd64/autobuilds"
stage3="$(busybox wget -qO- $dist/latest-stage3-amd64.txt | busybox tail -n 1)"

busybox echo "Downloading and extracting ${stage3}..."
busybox wget "${dist}/${stage3}" -qO- \
  | busybox tar \
    --exclude="./etc/hosts" \
    --exclude="./sys/*" \
    -pxjf -

env-update

ebegin "Config timezone"
echo 'UTC' > /etc/timezone
eend $?

ebegin "Copy make.conf"
cp /_files/etc/portage/make.conf /etc/portage/make.conf
eend $?

ebegin "Copy cpu.conf"
cp /_files/etc/portage/cpu.conf /etc/portage/cpu.conf
eend $?

ebegin "Remove doc"
rm -rf /usr/share/doc
eend $?

ebegin "Remove info"
rm -rf /usr/share/info
eend $?

ebegin "Remove man"
rm -rf /usr/share/man
eend $?

ebegin "Remove gtk-doc"
rm -rf /usr/share/gtk-doc
eend $?

ebegin "Remove _files"
rm -rf /_files/
eend $?

ebegin "Remove Dockerfile"
rm /Dockerfile
eend $?

ebegin "Remove build.sh"
rm /build.sh
eend $?
