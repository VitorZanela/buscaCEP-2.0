require_relative "../classes/Menu"
require_relative "../classes/ServiceBuscaCep"
require_relative "../classes/ServiceBuscaEnd"
require_relative "../classes/BuscaCep"

require 'json'

puts "---- BUSCA DE ENDEREÇO ----"

menu = Menu.new
cepService = ServiceBuscaCep.new
endService = ServiceBuscaEnd.new


loop do
    opc = menu.escolherOpc()
    if opc == 1
        buscaCep = menu.lerCep()
        while buscaCep.to_s.length != 8
            puts "ERRO!! Verifique o CEP e tente novamente!\n"
            buscaCep = menu.lerCep()
        end

        resultado = cepService.buscar(buscaCep)
        if resultado.nil?
            puts "CEP não encontrado ou invalido"
        else
            resulEditado = BuscaCep.from_api(JSON.parse(resultado, symbolize_names: true))

            puts "----- RESULTADO -----"
            puts resulEditado
            puts "---------------------"
        end

    elsif opc == 2
        dados = menu.buscaEndereco()
        resultado = endService.buscar(dados[0],dados[1],dados[2])

        if resultado.nil?
            puts "Endereço não localizado ou inválido"
        else
            enderecosList = JSON.parse(resultado, symbolize_names: true)
            if enderecosList.empty?
                puts "Endereço não localizado ou inválido"
            else
                enderecosList.each do |endereco|
                    puts "----- RESULTADO -----"
                    puts BuscaCep.from_api(endereco)
                    puts "---------------------"
                end
            end
        end
    else
        puts "Opção invalida!! Tente Novamente"
    end

    if !menu.desejaContinuar() 
        break
    end
end