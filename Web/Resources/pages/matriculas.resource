*** settings ***
Documentation    Representação da matricula
Library          libs/DateTricks.py
Library          Browser

*** Keywords ***

Entra em matriculas
    Click    css=a[href="/matriculas"]

Cria nova matrícula
    Click    css=a[href="/matriculas/new"]

Seleciona Nome
    [Arguments]    ${student_name}
    Fill Text    xpath=//div[contains(text(), "nome do aluno")]/..//input
    ...          Falcão
    Click    css=div[class$=option] >> text=Falcão

Seleciona Plano
    [Arguments]    ${student_plan}
    Click    xpath=//label[text()="PLANO"]/..//div[contains(text(), "Selecione")]
    Click    css=div[class$=option] >> text=Smart

Seleciona Data
    
    Focus    css=input[name=start_date]

    ${start_date}    Get Start Date
    FOR    ${number}    IN    @{start_date}
        Keyboard Key    press    ${number}
    END

Salvar
    Click    css=button >> text=Salvar

