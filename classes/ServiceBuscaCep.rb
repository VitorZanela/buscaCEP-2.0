require 'net/http'
require 'uri'

class ServiceBuscaCep
    def buscar(cep)
        begin
            uri = URI("https://viacep.com.br/ws/#{cep}/json/")
            response = Net::HTTP.get_response(uri)
            if response.code == "400"
                return nil
            elsif response.body.nil? || response.body.include?("erro")
                return nil
            end
            return response.body

        rescue StandardError => e
            return nil
        end
    end
end 