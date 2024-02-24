*** Settings ***
Library     SeleniumLibrary
Variables   ../env/environment.py
Variables   ../locators/admin_locators.py
Variables   ../test_data/admin_data.py
Resource   ../res/common_res.robot
Library     FakerLibrary
Library    XML
Library    String


*** Variables ***
${timeout} =  25s

*** Keywords ***

Go to admin panel
        Wait Until Element Is Visible    ${admin_xpath}      timeout=${timeout}
        Click Element    ${admin_xpath}

Perform add action
        Wait Until Element Is Visible    ${add_xpath}      timeout=${timeout}
        Click Button    ${add_xpath}

Enter user details
        Wait Until Element Is Visible    ${user_dropdown}      timeout=${timeout}
        Click Element    ${user_dropdown}
        Wait Until Element Is Visible    ${user_role_xpath}    timeout=${timeout}
        Wait Until Keyword Succeeds     25x     1s      Page Should Contain Element     ${user_role_xpath}
        Click Element      ${user_role_xpath}
        Wait Until Element Is Visible    ${employee_name}       timeout=${timeout}
        Wait Until Keyword Succeeds     25x     1s      Click Element    ${employee_name}
        Wait Until Keyword Succeeds     25x     1s      Input Text    ${employee_name}      ${employee_initial}
        Sleep   5s
        Wait Until Element Is Visible    ${employee_name_value}     timeout=${timeout}
        Click Element    ${employee_name_value}
        ${username_random} =  FakerLibrary.first_name
        Wait Until Element Is Visible    ${admin_username_xpath}
        Wait Until Keyword Succeeds     25x     1s      Input Text    ${admin_username_xpath}    ${username_random}
        ${password_random} =  FakerLibrary.Password
        Wait Until Element Is Visible    ${admin_password_xpath}
        Wait Until Keyword Succeeds     25x     1s      Input Text    ${admin_password_xpath}    ${password_random}
        Wait Until Element Is Visible    ${confirm_password}
        Wait Until Keyword Succeeds     25x     1s      Input Text    ${confirm_password}        ${password_random}
        Set Suite Variable    ${username_random}
        [Return]    ${username_random}
        

Enter enabled status
        Wait Until Keyword Succeeds     25x     1s      Click Element    ${status_dropdown}
        Wait Until Element Is Visible    ${status_enabled}      timeout=${timeout}
        Click Element    ${status_enabled}

Perform save action
        Wait Until Element Is Visible    ${save_button}     timeout=${timeout}
        Wait Until Keyword Succeeds     25x     1s      Click Button    ${save_button}
        Log To Console    ${CURDIR}
        Log    ${CURDIR}

Validate user is successfully added
        Wait Until Keyword Succeeds    25x    1s    Page Should Contain    Success
        Log To Console    User has been successfully added
        Wait Until Keyword Succeeds    25x    1s    Page Should Contain    Successfully Saved
        Log     New added user is displayed

Search newly added user with username
        Wait Until Element Is Visible    ${user_xpath}      timeout=${timeout}
        Input Text    ${user_xpath}     ${username_random}
        Wait Until Element Is Visible    ${search_button}       timeout=${timeout}
        Wait Until Keyword Succeeds     25x     1s      Click Button    ${search_button}
        Wait Until Element Is Visible    ${record_found}      timeout=${timeout}
        Wait Until Keyword Succeeds     25x     1s      Element Should Be Visible    ${record_found}

Enter disabled status
        Wait Until Keyword Succeeds     25x     1s      Click Element    ${status_dropdown}
        Wait Until Element Is Visible    ${status_disabled}      timeout=${timeout}
        Click Element    ${status_disabled}

Enter existing user details
        [Arguments]         ${exist_user}
        Wait Until Element Is Visible    ${user_dropdown}      timeout=${timeout}
        Click Element    ${user_dropdown}
        Wait Until Element Is Visible    ${user_role_xpath}    timeout=${timeout}
        Wait Until Keyword Succeeds     25x     1s      Page Should Contain Element     ${user_role_xpath}
        Click Element      ${user_role_xpath}
        Wait Until Element Is Visible    ${employee_name}       timeout=${timeout}
        Wait Until Keyword Succeeds     25x     1s      Click Element    ${employee_name}
        Wait Until Keyword Succeeds     25x     1s      Input Text    ${employee_name}      ${employee_initial}
        Sleep   5s
        Wait Until Element Is Visible    ${employee_name_value}     timeout=${timeout}
        Click Element    ${employee_name_value}

        Wait Until Keyword Succeeds     25x     1s      Click Element    ${status_dropdown}
        Wait Until Element Is Visible    ${status_disabled}      timeout=${timeout}
        Click Element    ${status_disabled}

        Wait Until Element Is Visible    ${admin_username_xpath}
        Wait Until Keyword Succeeds     25x     1s      Input Text   ${admin_username_xpath}     ${exist_user}

Validate error message is displayed
        Wait Until Element Is Visible    ${username_alert}        timeout=${timeout}
        Element Should Be Visible        ${username_alert}        timeout=${timeout}

Search newly added user with username & user role
        Wait Until Element Is Visible    ${close_button}      timeout=${timeout}
        Wait Until Keyword Succeeds     25x     1s      Click Button    ${close_button}
        Wait Until Element Is Visible    ${user_xpath}      timeout=${timeout}
        Wait Until Keyword Succeeds     25x     1s      Input Text    ${user_xpath}    ${username_random}
        Wait Until Keyword Succeeds     25x     1s      Click Element   ${userrole_dropdown}
        Wait Until Element Is Visible    ${userrole_option}      timeout=${timeout}
        Wait Until Keyword Succeeds     25x     1s      Click Element    ${userrole_option}
        Wait Until Keyword Succeeds     25x     1s      Click Button    ${search_button}

Validate newly added user details
        Wait Until Element Is Visible    ${record_found_1}        timeout=${timeout}
        Element Should Be Visible        ${record_found_1}        timeout=${timeout}
        Wait Until Keyword Succeeds    25x    1s        Page Should Not Contain     No Records Found

Search newly added user with username, user role & Employee name
        Wait Until Keyword Succeeds     25x     1s      Click Button    ${reset_button}
        Wait Until Element Is Visible    ${user_xpath}      timeout=${timeout}
        Wait Until Keyword Succeeds     25x     1s      Input Text    ${user_xpath}    ${username_random}
        Wait Until Keyword Succeeds     25x     1s      Click Element   ${userrole_dropdown}
        Wait Until Element Is Visible    ${userrole_option}      timeout=${timeout}
        Wait Until Keyword Succeeds     25x     1s      Click Element    ${userrole_option}
        Wait Until Keyword Succeeds     25x     1s      Click Element    ${search_employee}
        Wait Until Keyword Succeeds     25x     1s      Input Text    ${search_employee}    ${employee_initial}
        Sleep    5s
        Wait Until Element Is Visible       ${search_employee_dropdown}     timeout=${timeout}
        Wait Until Keyword Succeeds     25x     1s      Click Element    ${search_employee_dropdown}
        Wait Until Keyword Succeeds     25x     1s      Click Button    ${search_button}

Search newly added user with username, user role, Employee name & status(Disabled)
        Wait Until Keyword Succeeds     25x     1s      Click Button    ${reset_button}
        Wait Until Element Is Visible    ${user_xpath}      timeout=${timeout}
        Wait Until Keyword Succeeds     25x     1s      Input Text    ${user_xpath}    ${username_random}
        Wait Until Keyword Succeeds     25x     1s      Click Element   ${userrole_dropdown}
        Wait Until Element Is Visible    ${userrole_option}      timeout=${timeout}
        Wait Until Keyword Succeeds     25x     1s      Click Element    ${userrole_option}
        Wait Until Keyword Succeeds     25x     1s      Click Element    ${search_employee}
        Wait Until Keyword Succeeds     25x     1s      Input Text    ${search_employee}    ${employee_initial}
        Sleep    5s
        Wait Until Element Is Visible       ${search_employee_dropdown}     timeout=${timeout}
        Wait Until Keyword Succeeds     25x     1s      Click Element    ${search_employee_dropdown}
        Wait Until Keyword Succeeds     25x     1s      Click Element    ${status}
        Wait Until Element Is Visible    ${search_disabled}      timeout=${timeout}
        Wait Until Keyword Succeeds     25x     1s      Click Element    ${search_disabled}
        Wait Until Keyword Succeeds     25x     1s      Click Button    ${search_button}

Edit the employee from the record
        Execute JavaScript    window.scrollBy(0, 500)
        ${updated_edit_xpath} =     Replace String      ${edit_button}      [adduser]       ${username_random}
        Wait Until Element Is Visible      ${updated_edit_xpath}          timeout=${timeout}
        Wait Until Keyword Succeeds    25x    1s    Click Element  ${updated_edit_xpath}

        Wait Until Element Is Visible      ${edit_userrole}        timeout=${timeout}
        Wait Until Keyword Succeeds    25x    1s    Click Element    ${edit_userrole}
        Wait Until Element Is Visible      ${select_userrole1}     timeout=${timeout}
        Wait Until Keyword Succeeds    25x    1s    Click Element    ${select_userrole1}

        Wait Until Element Is Visible      ${edit_employee_name}     timeout=${timeout}
        Wait Until Keyword Succeeds    25x    1s    Press Keys       ${edit_employee_name}       CTRL+a+BACKSPACE
        Wait Until Keyword Succeeds     25x     1s  Input Text       ${edit_employee_name}      ${employee_initial}
        Sleep    10s
        Wait Until Element Is Visible    ${employee_name_value}     timeout=${timeout}
        Click Element    ${employee_name_value}

        Wait Until Element Is Visible      ${edit_status}     timeout=${timeout}
        Wait Until Keyword Succeeds    25x    1s    Click Element    ${edit_status}
        Wait Until Element Is Visible      ${select_status1}     timeout=${timeout}
        Wait Until Keyword Succeeds    25x    1s    Click Element    ${select_status1}

        ${username_edit} =  FakerLibrary.first_name
        Wait Until Element Is Visible      ${edit_username}     timeout=${timeout}
        Wait Until Keyword Succeeds    25x    1s    Press Keys       ${edit_username}       CTRL+a+BACKSPACE
        Sleep    10s
        Wait Until Keyword Succeeds     25x     1s  Input Text       ${edit_username}       ${username_edit}

        Wait Until Element Is Visible      ${edit_save}     timeout=${timeout}
        Wait Until Keyword Succeeds    25x    1s    Click Button    ${edit_save}

        [Return]    ${username_edit}

Validate user is successfully updated
        Wait Until Keyword Succeeds    25x    1s    Page Should Contain    Success
        Log To Console    User has been successfully updated
        Wait Until Keyword Succeeds    25x    1s    Page Should Contain    Successfully Updated
        Log     User has been updated successfully

Delete the employee from the record
        [Arguments]         ${edit_user}
        Execute JavaScript    window.scrollBy(0, 500)
        ${updated_delete_xpath} =     Replace String      ${delete_button}      [deleteuser]       ${edit_user}
        Wait Until Element Is Visible    ${updated_delete_xpath}    timeout=${timeout}
        Wait Until Keyword Succeeds     25x     1s      Click Element   ${updated_delete_xpath}
        Switch Window
        Wait Until Element Is Visible    ${yes_delete}    timeout=${timeout}
        Wait Until Keyword Succeeds     25x     1s      Click Element   ${yes_delete}

Validate user is successfully deleted
        Wait Until Keyword Succeeds    25x    1s    Page Should Contain    Success
        Log To Console    User has been successfully deleted
        Wait Until Keyword Succeeds    25x    1s    Page Should Contain    Successfully Deleted
        Log     User has been deleted successfully

Click on Profile Page Section
        Wait Until Element Is Visible    ${profile_click}       timeout=${timeout}
        Wait Until Keyword Succeeds    25x    1s    Click Element    ${profile_click}

Validate the about section details
        Wait Until Element Is Visible    ${about}       timeout=${timeout}
        Wait Until Keyword Succeeds    25x    1s    Click Element    ${about}
        Switch Window
        Wait Until Keyword Succeeds    25x    1s    Page Should Contain    About
        Wait Until Keyword Succeeds    25x    1s    Page Should Contain    Version:  OrangeHRM OS 5.6
        Wait Until Keyword Succeeds    25x    1s    Page Should Contain    Active Employees:  117

Close the about section
        Wait Until Element Is Visible    ${about_close}       timeout=${timeout}
        Wait Until Keyword Succeeds    25x    1s    Click Element    ${about_close}

Validate the footer
        Execute Javascript      window.scrollTo(0,document.body.scrollHeight)
        Wait Until Keyword Succeeds    25x    1s    Page Should Contain    OrangeHRM OS 5.6


















