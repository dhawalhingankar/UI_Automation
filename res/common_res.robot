*** Settings ***
Library     SeleniumLibrary
Variables   ../env/environment.py
Variables   ../locators/login_locators.py
Variables   ../test_data/login_data.py
Library      OperatingSystem

*** Variables ***
${timeout} =    25s

*** Keywords ***

Open the browser and enter the url to the application
    ${download_dir}=    Join Path   ${CURDIR}   Downloads
    Set Global Variable    ${download_dir}
    ${path}=    Set Variable    ${download_dir}
    Create Directory    ${path} # for create download dir runtime
    ${CHROME_OPTIONS}=    Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()    sys, selenium.webdriver
    ${prefs}=    Create Dictionary    download.default_directory=${path}
    Call Method    ${CHROME_OPTIONS}    add_experimental_option    prefs ${prefs}
    Create Webdriver    Chrome    chrome_options=${CHROME_OPTIONS}

#    Wait Until Keyword Succeeds     25x     1s   Go To    ${url}
    Wait Until Keyword Succeeds     25x     1s  open browser    ${url}      ${browser}

Login to the application
    Wait Until Element Is Visible    ${username_xpath}      timeout=${timeout}
    Input Text    ${username_xpath}     ${valid_username}
    Wait Until Element Is Visible    ${password_xpath}      timeout=${timeout}
    Input Text    ${password_xpath}     ${valid_password}

    Wait Until Element Is Visible    ${login_button}      timeout=${timeout}
    Click Button    ${login_button}

    Wait Until Element Is Visible    ${dashboard_xpath}      timeout=${timeout}
    Wait Until Keyword Succeeds     25x     1s  Element Should Be Visible    ${dashboard_xpath}


