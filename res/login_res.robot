*** Settings ***
Library     SeleniumLibrary
Variables   ../env/environment.py
Variables   ../locators/login_locators.py
Variables   ../test_data/login_data.py

*** Variables ***
${timeout} =    25s

*** Keywords ***
Open the browser and enter the url
    Wait Until Keyword Succeeds     25x     1s  open browser    ${url}      ${browser}

Validate user not able to login with invalid credentials
    Wait Until Element Is Visible    ${invalid_credential}      timeout=${timeout}
    Wait Until Keyword Succeeds     25x     1s  Element Should Be Visible    ${invalid_credential}

Enter the username and password
    [Arguments]     ${username_value}       ${password_value}
    Wait Until Element Is Visible    ${username_xpath}      timeout=${timeout}
    Input Text    ${username_xpath}     ${username_value}
    Wait Until Element Is Visible    ${password_xpath}      timeout=${timeout}
    Input Text    ${password_xpath}     ${password_value}

Click on the login button
    Wait Until Element Is Visible    ${login_button}      timeout=${timeout}
    Click Button    ${login_button}

Validate user is able to login
    Wait Until Element Is Visible    ${dashboard_xpath}      timeout=${timeout}
    Wait Until Keyword Succeeds     25x     1s  Element Should Be Visible    ${dashboard_xpath}



