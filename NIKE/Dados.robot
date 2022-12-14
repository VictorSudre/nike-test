*** Settings ***
Library     SeleniumLibrary
Resource    Scripts_Nike.robot

*** Variables ***
#Massa de dados usuário
${Email}                      exemplo@gmail.com             #inserir email
${Senha}                      exemplor@0000                 #inserir senha do email
${ItemDesejado}               Tênis Nike Air Force 1        #inserir o produto desejado
${Tamanho}                    40                            #inserir tamanho desejado