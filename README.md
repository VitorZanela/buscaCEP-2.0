# 🔍 Projeto Busca de Endereços com Ruby

Este é um projeto simples em Ruby que realiza consultas de endereço por **CEP** ou **logradouro** utilizando a [API ViaCEP](https://viacep.com.br/). Ele roda via terminal e oferece uma interface interativa de uso.

---

## 📋 Funcionalidades

- ✅ Buscar informações completas a partir de um CEP válido.
- ✅ Buscar uma lista de endereços a partir do estado, cidade e logradouro.
- ✅ Interface no terminal para navegação simples.
- ✅ Conversão da resposta da API para um objeto Ruby formatado.
- ✅ Tratamento básico de entrada inválida (CEP com menos de 8 dígitos).
- ❌ Tratamento de exceções de rede, JSON inválido ou API fora do ar.
- ❌ Dockerização da aplicação.

---

## 🚀 Como Executar o Projeto

### Pré-requisitos
- Ruby 3.4 instalado (caso não utilize o docker)
- Conexão com a internet (para acesso à API)

### Clonando o repositório
```
git clone https://github.com/seu-usuario/buscaCEP-2.0.git
cd buscaCEP-2.0
```

### Executando com Ruby
```
ruby ./main/Main.rb
```

### Executando com Docker
```
docker build -t busca-end .
docker run -it busca-end
```

## 🗂️ Estrutura do Projeto

```
├── main/
│   └── Main.rb             # Arquivo principal que roda o menu interativo
├── classes/
│   ├── Menu.rb             # Classe para interações com o usuário
│   ├── ServiceBuscaCep.rb  # Consulta API ViaCEP por CEP
│   ├── ServiceBuscaEnd.rb  # Consulta API ViaCEP por logradouro
│   └── BuscaCep.rb         # Data object com mapeamento e formatação dos dados
```

## 📌 Etapas do Projeto
✅ Etapa 1: Criação da estrutura de pastas e classes
Separação entre o main e as classes auxiliares

Definição das responsabilidades de cada classe

✅ Etapa 2: Integração com API ViaCEP
Implementação das chamadas HTTP com Net::HTTP

Conversão de JSON para objetos Ruby

✅ Etapa 3: Interface de Menu
Menu simples via terminal com opções de busca

Leitura de entrada do usuário e execução das buscas

✅  Etapa 4: Tratamento de exceções 
Tratar possíveis erros:

CEP inexistente ou inválido

Falha de conexão com a API

Respostas com erro ou vazias

🐳 Etapa 5: Dockerização 
Criar um Dockerfile para empacotar o projeto

Tornar possível a execução com:
```
docker build -t busca-end .
docker run -it busca-end
```

## ✅ Exemplo de uso
#### Busca por CEP

```
1 - Busca por CEP / 2 - Busca por endereço
> 1
Digite o CEP (Somente números)
> 01001000

----- RESULTADO -----
Cep: 01001000
Logradouro: Praça da Sé
Complemento: lado ímpar
Bairro: Sé
Uf: SP
Localidade: São Paulo
Regiao: 
Ddd: 11
---------------------
```
#### Busca por endereço

```
1 - Busca por CEP / 2 - Busca por endereço
> 2
Digite o Estado (EX: SP, MG, BA...)
> SP
Digite a cidade (EX: São Paulo, Porto Seguro, Rio de Janeiro...)
> São Paulo
Digite o nome da Rua(Rua, Avenida, Estrada ...)
> Praça da Sé

----- RESULTADO -----
Cep: 01001000
Logradouro: Praça da Sé
...
```
## 🛠️ Tecnologias Utilizadas

- Ruby 3.4
- Net::HTTP
- JSON
- API ViaCEP


📄 Licença
Este projeto está licenciado sob a licença MIT. Veja o arquivo LICENSE para mais detalhes.