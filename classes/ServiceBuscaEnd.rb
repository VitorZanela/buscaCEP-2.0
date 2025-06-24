require 'net/http'
require 'uri'

class ServiceBuscaEnd
    def buscar(estado, cidade, rua)
        uri = URI("https://viacep.com.br/ws/#{estado}/#{formatar(cidade)}/#{formatar(rua)}/json/")
        response = Net::HTTP.get_response(uri)
        return response.body
    end

    private 
    
    def formatar(texto)
    texto.tr(
      "áàãâéèêíìîóòõôúùûçÁÀÃÂÉÈÊÍÌÎÓÒÕÔÚÙÛÇ",
      "aaaaeeeiiioooouuucAAAAEEEIIIOOOOUUUC"
    ).gsub(" ", "%20")
  end
end 