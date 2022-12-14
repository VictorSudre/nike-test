*** Settings ***
Library     SeleniumLibrary
Resource    Dados.robot
*** Variables ***
${url}                        https://www.nike.com.br/
${AceitarCookies}             css:button[class="ButtonFill__StyledButton-sc-pzo00r-0 iIrFWZ"]
#Login
${Entrar}                     xpath://*[@id="navigationHeader"]/div/div[1]/div/div/div/div/div[2]/button[2]
${CampoEmail}                 css:input[name="emailAddress"]
${CampoSenha}                 css:input[name="password"]
${BotaoEntrar}                css:input[value="ENTRAR"]

#Pesquisa
${CampoBusca}                 css:input[placeholder="Buscar"]

#filtros
${FiltroCores}                id:cores-filter
${FiltroTamanho}              css:a[aria-label="${Tamanho}"]

#Ordenar
${BotaoOrdernar}              id:orderby

#Produto
${SelecionarProduto}          css:div[class="ProductCardstyled__ProductCardContainer-sc-1t3m0gl-5 sGYGW"] a
${DescricaoProduto}           xpath://*[@id="__next"]/div[2]/div[2]/div/main/div[3]/div[4]/div[3]/div/div/p[1]/b
${SelecionarTamanho}          css:input[data-testid="product-size-${Tamanho}"]

#Compra
${BotaoAdicionar}             css:button[class="ButtonFill__StyledButton-sc-pzo00r-0 kJwrcd"]

*** Keywords
#Comandos de inicialização e finalização.

acessar
    Open Browser                    ${url}     chrome
    maximize browser window
    Sleep               3

fechar 
    #Capture Page Screenshot
    Close Browser

#login
Abrir modal de login
    Click Element           ${Entrar}
    Sleep                   6
Inserir dados de acesso
    Input text              ${CampoEmail}              ${Email}
    Sleep                   1
    Input text              ${CampoSenha}              ${Senha}
    Sleep                   2
Clicar no botão acessar
    Click Element           ${BotaoEntrar}
    Sleep                   5

#pesquisa
#pesquisa
Inserir texto no campo de busca
    Input Text               ${CampoBusca}            ${ItemDesejado}
    Sleep                    1
    Press keys               none                                       RETURN
    Sleep                    5
Aceitar Cookies
    Click Element            ${AceitarCookies}
    Sleep                    1
Configurar filtros
    Click Element            ${FiltroCores}
    Sleep                    1
    Click Element            ${FiltroTamanho}     #selecionar o tamanho desejado
    Sleep                    3
Ordenar por "menor preço"
    Click Element            ${BotaoOrdernar}
    Sleep                    1
    Press keys               none                                       ARROW_DOWN
    Press keys               none                                       ARROW_DOWN
    Press keys               none                                       ARROW_DOWN
    Press keys               none                                       ARROW_DOWN
    Press keys               none                                       RETURN
    Sleep                    3
Selecionar Produto mais barato
    Click Element            ${SelecionarProduto}
    Sleep                    5
Adicionar produto no carrinho
    Switch Window            locator=NEW
    Sleep                    1
    Scroll Element into view    ${DescricaoProduto}
    Click Element               ${SelecionarTamanho}
    Sleep                       1
    Click Element               ${BotaoAdicionar}