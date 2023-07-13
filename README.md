# Tailscale Pi Auto Install

This script will install Tailscale on a Raspberry Pi - Buster.

1. The script can be invoked using the following, but make sure you edit the subnet(s) to suit your network:

#### Raspian
```bash
cd /home/$USER
wget --no-cache -O tailscale-pi-install https://raw.githubusercontent.com/cmptscpeacock/tailscale-pi-auto-install/master/tailscale-pi-auto-install.bash && chmod +x tailscale-pi-install && ./tailscale-pi-install '10.0.0.0/24,10.0.1.0/24'
```

## Copyright & Credit

### StreamEye

Tailscale is managed by Tailscale, the creator and owner. You can find the stable GitHub repo here: https://github.com/tailscale
