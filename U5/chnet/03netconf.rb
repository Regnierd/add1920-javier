#!/usr/bin/env ruby
system("clear")
def menu
  puts "Elige una opción para cambiar la configuración de red:"
  puts "  1: Change Classroom 109"
  puts "  2: Change My Home"
  puts "  r: reset"
  option = gets.chop
  if option == '1'
      change_file_classroom
  elsif option == '2'
      change_file_home
  elsif option == '3'
      change_file
  elsif option == 'r'
    reset    
  else
    print("Error. Introduce un número o letra: 1 o 2 o r).")
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
def change_file_classroom
  system("sudo cp /home/javier/Documentos/ejercicios_ruby/add1920-javier-master/U5/classroom /etc/sysconfig/network/ifcfg-eth0")
  reset
  display_network_information
end
def change_file_home
  system("sudo cp /home/javier/Documentos/ejercicios_ruby/add1920-javier-master/U5/home /etc/sysconfig/network/ifcfg-eth0")
  reset
  display_network_information
end
def reset
  system("sudo ifdown eth0")
  system("sudo ifup eth0")
end
menu
