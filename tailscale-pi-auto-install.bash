#!/bin/bash

# variables

replaceText="USERNAME"
currentUser=$USER

## credentials

## define console colours

RED='\033[0;31m' # red
WHITE='\033[1;37m' # white

## define formatting

UNDERLINE='\033[4m'
RESETUNDERLINE='\033[24m'

# install Tailscale
## Perform apt update and upgrade

printf "\nPerforming update and upgrade"

sudo apt-get update && sudo apt-get upgrade -y

## install packages

printf "\nInstalling Packages"

sudo apt-get install apt-transport-https -y

curl -fsSL https://pkgs.tailscale.com/stable/raspbian/bullseye.noarmor.gpg | sudo tee /usr/share/keyrings/tailscale-archive-keyring.gpg > /dev/null

curl -fsSL https://pkgs.tailscale.com/stable/raspbian/bullseye.tailscale-keyring.list | sudo tee /etc/apt/sources.list.d/tailscale.list

sudo apt-get update -y

## install Tailscale

printf "\nInstalling Tailscale"

sudo apt-get install tailscale -y

## configure forwarding

printf "\nConfigure Forwarding"

echo 'net.ipv4.ip_forward = 1' | sudo tee -a /etc/sysctl.d/99-tailscale.conf

echo 'net.ipv6.conf.all.forwarding = 1' | sudo tee -a /etc/sysctl.d/99-tailscale.conf

sudo sysctl -p /etc/sysctl.d/99-tailscale.conf

## start Tailscale

printf "\nStarting Tailscale. Use the URL to authenticate..."

sudo tailscale up --advertise-routes=$1

printf "\nRemember to disable the key expiry in the portal - https://login.tailscale.com/"
printf "\nRemember to enable the advertised routes/subnets in the portal"
sleep 5

# reboot the device 

printf "\n\n Rebooting now..."
sudo reboot
