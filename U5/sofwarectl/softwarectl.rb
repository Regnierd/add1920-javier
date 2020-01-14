#!/usr/bin/env ruby

param0 = ARGV[0]
param1 = ARGV[1]

def status
  lines = File.read('filename').split("\n")
    lines.each do |line|
	  campos = line.split(":")
	  a = `whereis #{campos[0]} | grep bin | wc -l`.to_i
      if a == 0
	    puts "#{campos[0]} No esta instalado"
	  else
	    puts "#{campos[0]} Si esta instalado"
	  end
	end
end

def run
  lines = File.read('filename').split("\n")
  lines.each do |line|
    campos = line.split(":")
	if campos[1] == 'install'
	  puts "procesando paquete #{campos[0]}"
	  puts "instalando #{campos[0]}"
	  system("sudo zypper in -y #{campos[0]} > /dev/null ")	
	elsif campos[1] == 'remove'
	  puts "procesando paquete #{campos[0]}"
      puts "desinstalando #{campos[0]}"
	  system("sudo zypper rm -y #{campos[0]} > /dev/null")
	end
  end
end

if param0 == nil
  puts "Para mas ayuda usa el --help"
elsif param0 == '--help'
  puts "Usage:
		systemctml [OPTIONS] [FILENAME]
	Options:
		--help, mostrar esta ayuda.
		--version, mostrar información sobre el autor del script y fecha de creación.
	 	--status FILENAME, comprueba si puede instalar/desintalar.
		--run FILENAME, instala/desinstala el software indicado.
	 Description:
		Este script se encarga de instalar/desinstalar
		el softaware indicado en el fichero FILENAME,
		Ejemplo de FILENAME:
       		  tree:install
		  nmap:install
		  atom:remove"
elsif param0 == '--status' 
  status
elsif param0 == '--run'
  run
elsif param0 == '--version'
  puts "Script hecho por Javier Lima Pérez en 8/1/20."
end
