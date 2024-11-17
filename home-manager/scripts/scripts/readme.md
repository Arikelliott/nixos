disable-screensaver.sh instructions:
- change permissions to 744
- change permissions of disable-screensaver.service to 664
- cp script to /usr/local/bin/ and service to /etc/systemd/system/
- systemctl daemon-reload
- systemctl enable disable-screensaver.service
