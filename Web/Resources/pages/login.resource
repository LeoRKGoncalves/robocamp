*** settings ***
Documentation    Representação da tela de Login
Library          Browser

*** Keywords ***

Fill Credentials

   [Arguments]    ${email}    ${password}

    Fill Text      css=input[name=email]       ${email}
    Fill Text      css=input[name=password]        ${password}

Submit Credentials
   Click          css=button >> text=Entrar no sistema

Go To Login Page
    New Browser    headless=False    browser=chromium
    New Page       http://localhost:3000/

Formato email
    Get Attribute    css=input[placeholder="Seu e-mail"]    
    ...    type    equal    email

Alerta
    [Arguments]    ${campo}    ${alerta}
    Get Text    xpath=//input[@type="${campo}"]/..//span
    ...         equal    ${alerta}