*** Settings ***
Library     SeleniumLibrary
Variables   ../env/environment.py
Variables   ../locators/pim_locators.py
Variables   ../test_data/pim_data.py
Resource   ../res/common_res.robot
Library     FakerLibrary

*** Variables ***
${timeout} =  25s

*** Keywords ***
#Add the employee details without login details
#        Wait Until Element Is Visible    ${pim_menu}        ${timeout}
#        Wait Until Keyword Succeeds     25x     1s      Click Element    ${pim_menu}
#
#        Wait Until Element Is Visible    ${pim_add_button}        ${timeout}
#        Wait Until Keyword Succeeds     25x     1s      Click Element    ${pim_add_button}
#
#        Wait Until Element Is Visible    ${pim_f_name}        ${timeout}
#        Wait Until Keyword Succeeds     25x     1s      Input Text    ${pim_f_name}    Ganesh
#
#        Wait Until Element Is Visible    ${pim_m_name}        ${timeout}
#        Wait Until Keyword Succeeds     25x     1s      Input Text    ${pim_m_name}    Ramesh
#
#        Wait Until Element Is Visible    ${pim_l_name}        ${timeout}
#        Wait Until Keyword Succeeds     25x     1s      Input Text    ${pim_l_name}    Khatane
#
#        Wait Until Element Is Visible    ${pim_save}        ${timeout}
#        Wait Until Keyword Succeeds     25x     1s      Click Element    ${pim_save}


Add the employee details with login details
        Wait Until Element Is Visible    ${pim_menu}        ${timeout}
        Wait Until Keyword Succeeds     25x     1s      Click Element    ${pim_menu}

        Wait Until Element Is Visible    ${pim_add_button}        ${timeout}
        Wait Until Keyword Succeeds     25x     1s      Click Element    ${pim_add_button}
        ${f_emp_name} =  FakerLibrary.first_name
        Wait Until Element Is Visible    ${pim_f_name}        ${timeout}
        Wait Until Keyword Succeeds     25x     1s      Input Text    ${pim_f_name}    ${f_emp_name}
        ${m_emp_name} =  FakerLibrary.first_name
        Wait Until Element Is Visible    ${pim_m_name}        ${timeout}
        Wait Until Keyword Succeeds     25x     1s      Input Text    ${pim_m_name}    ${m_emp_name}
        ${l_emp_name} =  FakerLibrary.last_name
        Wait Until Element Is Visible    ${pim_l_name}        ${timeout}
        Wait Until Keyword Succeeds     25x     1s      Input Text    ${pim_l_name}    ${l_emp_name}

        Wait Until Element Is Visible    ${toggle_button}        ${timeout}
        Wait Until Keyword Succeeds     25x     1s      Click Element    ${toggle_button}

        Wait Until Element Is Visible    ${pim_username}        ${timeout}
        Wait Until Keyword Succeeds     25x     1s      Input Text    ${pim_username}    ${f_emp_name}

        Wait Until Element Is Visible    ${radio_enabled}       ${timeout}
        Wait Until Keyword Succeeds    25x    1s    Click Element    ${radio_enabled}
        ${password} =  FakerLibrary.password
        Wait Until Element Is Visible    ${pim_password}        ${timeout}
        Wait Until Keyword Succeeds     25x     1s      Input Text    ${pim_password}    ${password}

        Wait Until Element Is Visible    ${pim_con_password}        ${timeout}
        Wait Until Keyword Succeeds     25x     1s      Input Text    ${pim_con_password}    ${password}

        Wait Until Element Is Visible    ${pim_save}        ${timeout}
        Wait Until Keyword Succeeds     25x     1s      Click Element    ${pim_save}

Validate employee added successfully
        Wait Until Keyword Succeeds    25x    1s    Page Should Contain    Success
        Log To Console    Employee has been successfully added
        Wait Until Keyword Succeeds    25x    1s    Page Should Contain    Successfully Saved
        Log     New employee has been added

#Add Personal Details
        #validating first, middle & last name and employee id



