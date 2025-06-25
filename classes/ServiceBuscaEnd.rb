require 'net/http'
require 'uri'

class ServiceBuscaEnd
    def buscar(estado, cidade, rua)
      begin
        uri = URI("https://viacep.com.br/ws/#{estado}/#{formatar(cidade)}/#{formatar(rua)}/json/")
        response = Net::HTTP.get_response(uri)
        if response.code == "400" 
          return nil
        end
        return response.body
        rescue StandardError => e
            return nil
        end
    end

    private 
    
    def formatar(texto)
    texto.tr(
      "áàãâéèêíìîóòõôúùûçÁÀÃÂÉÈÊÍÌÎÓÒÕÔÚÙÛÇ",
      "aaaaeeeiiioooouuucAAAAEEEIIIOOOOUUUC"
    ).gsub(" ", "%20")
  end
end 