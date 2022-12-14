*** Settings ***
Resource    Scripts_Nike.robot

*** Keywords ***
Dado que eu acesse o site da nike
    acessar
    
E Realize login
    Abrir modal de login
    Inserir dados de acesso
    Clicar no botão acessar 

E realize a busca pelo produto que desejo
    Inserir texto no campo de busca
    Aceitar Cookies

Quando eu encontrar o produto nas configurações desejadas
    Configurar filtros
    Ordenar por "menor preço"

Então eu realizo a compra desse produto
    Selecionar Produto mais barato
    Adicionar produto no carrinho