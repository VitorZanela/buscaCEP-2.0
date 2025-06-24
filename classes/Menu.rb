class Menu
    def escolherOpc()
        puts "1 - Busca por CEP / 2 - Busca por endereço"
        opc = gets.chomp.to_i
        return opc
    end

    def lerCep()
        puts "Digite o CEP (Somente números)"
        cep = gets.chomp
        return cep
    end

    def buscaEndereco()
        puts "Digite o Estado (EX: SP, MG, BA...)"
        estado = gets.chomp.rstrip
        puts "Digite a cidade (EX: São Paulo, Porto Seguro, Rio de Janeiro...)"
        cidade = gets.chomp.rstrip
        puts "Digite o nome da Rua(Rua, Avenida, Estrada ...)"
        rua = gets.chomp.rstrip

        return [estado, cidade, rua]
    end

    def desejaContinuar()
        puts "Deseja continuar? (S/N)"
        resp = gets.chomp.downcase
        if resp == "s"
            true
        elsif resp == "n"
            false
        else
            puts "Resposta Incorreta! Tente novamente!"
        end
    end

end