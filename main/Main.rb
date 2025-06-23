require_relative "../classes/Menu"

puts "---- BUSCA DE ENDEREÇO ----"

menu = Menu.new
opc = menu.escolherOpc()
if opc == 1
    buscaCep = menu.lerCep()
    if buscaCep.to_s.length != 8
        puts "Verifique o CEP e tente novamente!"
    end
else
    puts "estou na 2"
end