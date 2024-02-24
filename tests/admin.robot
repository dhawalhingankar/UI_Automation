*** Settings ***
Documentation   This is a Admin Test Suite
Resource        ../res/admin_res.robot
Resource        ../res/common_res.robot
Variables       ../test_data/admin_data.py

*** Test Cases ***
To verify user is able to add new admin with enabled status
    [Documentation]     This test case is for adding new user with enabled status
    [Tags]              Smoke
    Open the browser and enter the url to the application
    Login to the application
    Go to admin panel
    Perform add action
    ${user_enable}  Enter user details
    Enter enabled status
    Perform save action
    Validate user is successfully added
    Search newly added user with username

To verify user is able to add new admin with disabled status
    [Documentation]     This test case is for adding new user with disabled status
    [Tags]              Regression
    Go to admin panel
    Perform add action
    ${user_disable}    Enter user details
    Enter disabled status
    Perform save action
    Validate user is successfully added
    Search newly added user with username
    Set Suite Variable    ${user_disable}

To verify user is able to add existing user
    [Documentation]     This test case is for adding existing user
    [Tags]              Regression
    Go to admin panel
    Perform add action
    Enter disabled status
    Enter existing user details     ${user_disable}
    Validate error message is displayed

To verify search functionality is working
    [Documentation]     This test case is to test Search functionality
    [Tags]              Regression
    Search newly added user with username & user role
    Validate newly added user details
    Search newly added user with username, user role & Employee name
    Validate newly added user details
    Search newly added user with username, user role, Employee name & status(Disabled)
    Validate newly added user details

To verify user details are editable without changing the password
    [Documentation]     This test case is to test edit functionality
    [Tags]              Smoke
    ${edit_username}    Edit the employee from the record
    Validate user is successfully updated
    Set Suite Variable    ${edit_username}

To verify user can delete the emloyees from admin screen
    [Documentation]     This test case is to test Delete functionality
    [Tags]              Smoke
    Delete the employee from the record     ${edit_username}
    Validate user is successfully deleted

To validate profile about section
    [Documentation]     This test case is to validate profile about section
    [Tags]              Regression
    Click on Profile Page Section
    Validate the about section details
    Close the about section

To validate footer
    [Documentation]     This test case is to validate footer section
    [Tags]              Regression
    Validate the footer
