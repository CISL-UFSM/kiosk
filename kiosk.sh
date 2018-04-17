#!/usr/sh

apt install xorg python3-pyqt5 python3-pyqt5.qtwebengine python3-yaml openbox

mkdir -pv /etc/systemd/system/getty@tty1.service.d

cat <<EOF >/etc/systemd/system/getty@tty1.service.d/autologin.conf
[Service]
ExecStart=
ExecStart=-/sbin/agetty --autologin kiosk --noclear %I 38400 linux
Type=simple
EOF

systemctl enable getty@tty1.service

