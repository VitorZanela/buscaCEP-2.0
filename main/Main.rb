require_relative "../classes/Menu"
require_relative "../classes/ServiceBuscaCep"
require_relative "../classes/BuscaCep"
require 'json'

puts "---- BUSCA DE ENDEREÇO ----"

menu = Menu.new




opc = menu.escolherOpc()
if opc == 1
    buscaCep = menu.lerCep()
    while buscaCep.to_s.length != 8
        buscaCep = menu.lerCep()
        puts "ERRO!! Verifique o CEP e tente novamente!\n" if buscaCep.to_s.length != 8
    end
        

    cepService = ServiceBuscaCep.new
    resultado = cepService.buscar(buscaCep)
    
    resulEditado = BuscaCep.from_api(JSON.parse(resultado, symbolize_names: true))
    puts "----- RESULTADO -----"
    puts resulEditado
    puts "---------------------"

else
    puts "estou na 2"
end