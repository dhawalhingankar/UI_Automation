*** Settings ***
Documentation   This is a Login Test Suite
Resource        ../res/login_res.robot
Variables       ../test_data/login_data.py

*** Test Cases ***

To verify user is able to login with valid username and invalid password
    [Documentation]     This test case is login with valid username and invalid password
    [Tags]              Regression
    Open the browser and enter the url
    Enter the username and password     ${valid_username}       ${invalid_password}
    Click on the login button
    Validate user not able to login with invalid credentials

To verify user is able to login with invalid username and valid password
    [Documentation]     This test case is login with invalid username and valid password
    [Tags]              Regression
    Enter the username and password     ${invalid_username}     ${valid_password}
    Click on the login button
    Validate user not able to login with invalid credentials

To verify user is able to login with invalid username and invalid password
    [Documentation]     This test case is login with invalid username and invalid password
    [Tags]              Regression
    Enter the username and password     ${invalid_username}     ${invalid_password}
    Click on the login button
    Validate user not able to login with invalid credentials

To verify user is able to login with valid username and valid password
    [Documentation]  This test case is login with valid username and valid password
    [Tags]           Smoke
    Enter the username and password     ${valid_username}       ${valid_password}
    Click on the login button
    Validate user is able to login

