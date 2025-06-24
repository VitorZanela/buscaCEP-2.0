

BuscaCep = Data.define(:cep, :logradouro, :complemento, :bairro, :uf, :localidade, :regiao, :ddd) do
    def to_s
        members.map { |field| "#{field.to_s.capitalize}: #{send(field)}" }.join("\n")
    end

    def self.from_api(api_data)
        new(**api_data.slice(*self.members))
    end
end

