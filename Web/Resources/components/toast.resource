*** Settings ***
Documentation    Representação do componente Toast
Library          Browser

*** Keywords ***
Toaster
    [Arguments]    ${message}
    Wait For Elements State    
    ...    css=.Toastify__toast-body div >> text=${message}
    ...    visible    5

    Wait For Elements State
    ...    css=.Toastify__toast-body div
    ...    detached    10