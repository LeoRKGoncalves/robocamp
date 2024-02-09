*** Settings ***
Documentation    Testes de matricula
Resource         ../Resources/Base.resource
Resource         ../Resources/database.resource
Resource         ../Resources/Services/sessions.resource
Resource         ../Resources/Services/students.resource

*** Test Cases ***
Matricular Aluno

    ${admin}       Get Fixture    Admin
    ${Students}    Get Fixture    Students
    
    Reset Student    ${Students}[student][email]

    ${token}    Get Service Token    ${admin}
    Post New Student    ${token}    ${students}[student]

    Login    ${admin}
    Entra em matriculas
    Cria nova matrícula
    Seleciona Nome    ${Students}[student][name]
    Seleciona Plano   ${Students}[enroll][plan]
    Seleciona Data
    Salvar
    Toaster    Matrícula cadastrada com sucesso