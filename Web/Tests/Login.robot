*** Settings ***
Documentation    Testes da tela de Login
Resource         ../Resources/Base.resource
Library          Browser

*** Test Cases ***
Login do Administrador

    Go To Login Page
    Fill Credentials    admin@smartbit.com    qacademy
    Submit Credentials
    User Login    Admin

Email inválido

    Go To Login Page
    Fill Credentials    404@smartbit.com    qacademy
    Submit Credentials
    Toaster             Suas credenciais são inválidas, por favor tente novamente!

Senha inválido

    Go To Login Page
    Fill Credentials    admin@smartbit.com    xxx
    Submit Credentials
    Toaster             Suas credenciais são inválidas, por favor tente novamente!

Email Formato Incorreto

    Go To Login Page
    Fill Credentials    @.com.br    xxx
    Submit Credentials
    Formato email

Senha Vazia

    Go To Login Page
    Fill Credentials    admin@smartbit.com    ${EMPTY}
    Submit Credentials
    Alerta    password    A senha é obrigatória

Email Vazio

    Go To Login Page
    Fill Credentials    ${EMPTY}    xxx
    Submit Credentials
    Alerta    email    O e-mail é obrigatório

Email e Senha Vazios

    Go To Login Page
    Submit Credentials
    Alerta    email    O e-mail é obrigatório
    Alerta    password    A senha é obrigatória