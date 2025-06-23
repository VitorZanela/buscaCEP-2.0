require 'net/http'
require 'uri'

class ServiceBuscaCep
    def buscar(cep)
        uri = URI("https://viacep.com.br/ws/#{cep}/json/")
        response = Net::HTTP.get_response(uri)
        return response.body
    end
end 