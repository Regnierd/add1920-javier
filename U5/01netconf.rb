def menu
  print("
          Elige una opción para cambiar la configuración de red:
          1: Classroom 109
          2: My Home
          3: reset")

  option = gets.chomp

  if option == '1'
      classroom109_configutarion

  elsif option == '2'
      myhome_configuration

  elsif option == '3'
    reset

  else
    puts("Error. Introduce un numero entre 1 y 3.")
  end
end

def reset
  system("ifdown eth0")
  system("ifup eth0")
  systm("ip a | grep 'inet ' | grep -v 'host lo'")
end

def classroom109_configutarion
  system("ip addr add 172.19.13.31/16 dev eth0")
  systm("ip a | grep 'inet ' | grep -v 'host lo'")
end

def myhome_configuration
  system("ip addr add 192.168.13.42/24 dev eth0")
  systm("ip a | grep 'inet ' | grep -v 'host lo'")
end
