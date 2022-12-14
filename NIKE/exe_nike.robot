*** Settings ***
Resource    Scripts_Nike.robot
Resource    Steps.robot

*** Test Cases  ***
Funcionalidade: Fluxo de compra NIKE
    Dado que eu acesse o site da nike
    E realize a busca pelo produto que desejo
    Quando eu encontrar o produto nas configurações desejadas
    Então eu realizo a compra desse produto
   