*** Settings ***
Documentation    Tudo começa aqui
Resource    components/nav_bar.resource
Resource    components/toast.resource
Resource    pages/login.resource
Resource    pages/matriculas.resource
Resource    database.resource
Resource    Services/sessions.resource
Resource    Services/students.resource
Library     JSONLibrary

*** Keywords ***

Login

    [Arguments]    ${user}
    Go To Login Page
    Fill Credentials    ${user}[email]    ${user}[password]
    Submit Credentials
    User Login    ${user}[name]

Get Fixture
    [Arguments]    ${fixture_file}

    ${fixture}     Load json From File    
    ...            ${EXECDIR}/Resources/Fixtures/${fixture_file}.json
    ...            encoding=UTF-8

    [Return]       ${fixture}