require_relative "../classes/Menu"
require_relative "../classes/ServiceBuscaCep"
require_relative "../classes/BuscaCep"

puts "---- BUSCA DE ENDEREÇO ----"

menu = Menu.new




opc = menu.escolherOpc()
if opc == 1
    buscaCep = menu.lerCep()
    while buscaCep.to_s.length != 8 do ##Corrigir erro de validação, quando erra esta puts pra sempre
        puts "Verifique o CEP e tente novamente!"
    end

    resultado = BuscaCep.new
    cepService = ServiceBuscaCep.new

    cepService.buscar(buscaCep)

    puts cepService

else
    puts "estou na 2"
end