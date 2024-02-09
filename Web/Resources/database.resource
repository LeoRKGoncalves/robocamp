*** Settings ***
Documentation    Gerenciando a massa de teste
Library          Browser
Library          DatabaseLibrary

*** Keywords ***
Connect To Postgres
    Connect To Database    psycopg2    
    ...                        nxosafep    
    ...                        nxosafep    
    ...                        8Q8yH7bGJ6vtRataQshdL0PxW0PgbUKf    
    ...                        tuffi.db.elephantsql.com    
    ...                        5432  

Seleciona aluno pelo email
    [Arguments]    ${email}

    ${query}    Set Variable
    ...         SELECT * FROM public.students where email = '${email}';

    ${result}    Query    ${query}

    [Return]    ${result}[0]

Delete Enroll
    [Arguments]    ${email}
    ${user}     Seleciona aluno pelo email    ${email}
    ${query}    Set Variable
    ...         DELETE FROM public.enrollments where student_id = '${user}[0]';

    Execute Sql String    ${query}  

Delete Student By email

    [Arguments]    ${email}

    ${query}    Set Variable    
    ...         DELETE FROM public.students where email = '${email}'

    Execute Sql String    ${query}

Reset Student
    
    [Arguments]    ${email}
    Connect To Postgres
    Delete Student By email    ${email}
    Disconnect From Database