#!/usr/bin/env ruby
# Target:
# * Show current network configuration: IP, mask, interface name
# Changes:
# * Execute command wiht system(command)
# * Filter only real IP with grep and grep -v
# * Save command output using %x[command]
# * Pretty and clear output
# * It's easy then show if_name
# * Print colors using Rainbow gem (gem install rainbow)
# * Show gateway and verify Internet access
# * Organize code using functions
# * Organize code using gems. Remove extension from filename.
# * Verify DNS server configuration
# * Learn about IP configuration
#     * URL: https://www.tecmint.com/ip-command-examples/
#
# Edit network configuration file for eth0:
# vi /etc/sysconfig/network-scripts/ifcfg-eth0
#
# DEVICE="eth0"
# BOOTPROTO=static
# ONBOOT=yes
# TYPE="Ethernet"
# IPADDR=192.168.50.2
# NAME="System eth0"
# HWADDR=00:0C:29:28:FD:4C
# GATEWAY=192.168.50.1
#
# For Ubuntu/Debian/Linux Mint
# Edit configuration file /etc/network/interfaces
#
# auto eth0
# iface eth0 inet static
# address 192.168.50.2
# netmask 255.255.255.0
# gateway 192.168.50.1
#
# Command to assign a IP Address to Specific Interface
# ip addr add 192.168.50.5 dev eth1
#
# How to Remove an IP Address
# ip addr del 192.168.50.5/24 dev eth1
#
# How to Enable Network Interface
# ip link set eth1 up
#
# How to Disable Network Interface
# ip link set eth1 down
#
# How do I Check Route Table?
# ip route show

require_relative '01netconf.rb'
menu
