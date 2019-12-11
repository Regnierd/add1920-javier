def menu
  option = print("Elige una opción para cambiar la configuración de red: \n
          1: Classroom 109 \n
          2: My Home \n
          3: reset \n")

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

end

def classroom109_configutarion
  system("ip addr add 172.19.13.31/16 dev eth0")

end

def myhome_configuration
  system("ip addr add 192.168.13.42/24 dev eth0")
end
