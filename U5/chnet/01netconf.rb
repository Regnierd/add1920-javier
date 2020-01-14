#!/usr/bin/env ruby
system("clear")
def menu
  puts "Elige una opción para cambiar la configuración de red:"
  puts "  1: Classroom 109"
  puts "  2: My Home"
  puts "  r: reset"
  option = gets.chop
  if option == '1'
      classroom109_configutarion
  elsif option == '2'
      myhome_configuration
  elsif option == 'r'
    reset    
  else
    print("Error. Introduce un número o letra (1 y 2 o r).")
  end
end
def get_network_information
  # Get network information
  data = {}
  items = %x[ip a | grep 'inet ' | grep -v 'host lo'].split
  data[:ip] = items[1]
  data[:device] = items.last

  items = %x[ip route | grep default].split
  data[:gateway] = items[2]

  ok = system('ping -c1 8.8.4.4 > /dev/null')
  data[:internet] = (ok ? 'Ok' : 'No access')
  ok = system('host www.nba.com > /dev/null')
  data[:dns] = (ok ? 'Ok' : 'No access')
  return data
end
def display_network_information
  data = get_network_information
  puts "[INFO] Displaying network configuration"
  puts "  Device   : #{data[:device]}"
  puts "  IP/mask  : #{data[:ip]}"
  puts "  Gateway  : #{data[:gateway]}"
  puts "  Internet : #{data[:internet]}"
  puts "  DNS      : #{data[:dns]}"
end
def reset
  system("sudo ifdown eth0")
  system("sudo ifup eth0")
end
def classroom109_configutarion
  data = get_network_information
  system("sudo ip addr add 172.19.13.32/16 dev eth0")
  system("sudo ip addr del #{data[:ip]} dev eth0")
end
def myhome_configuration
  data = get_network_information
  system("sudo ip addr add 192.168.13.42/24 dev eth0")
  system("sudo ip addr del #{data[:ip]} dev eth0")
end
menu
display_network_information
