*** Settings ***
Documentation    Representação do menu superior
Library          Browser

*** Keywords ***
User Login
    [Arguments]    ${user_name}
    ${logged_user}    Set Variable    css=aside strong        
    Wait For Elements State    ${logged_user}    visible    15s
    Get Text       ${logged_user}    equal    ${user_name}