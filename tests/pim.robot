*** Settings ***
Documentation   This is a PIM Test Suite
Resource        ../res/pim_res.robot
Resource        ../res/common_res.robot
Variables       ../test_data/pim_data.py

*** Test Cases ***
#To verify user is able to add New Employee without login details
#    [Documentation]     This test case is for adding new employee
#    [Tags]              Smoke
#    Open the browser and enter the url to the application
#    Login to the application
#    Add the employee details without login details

To verify user is able to add New Employee with login details
    [Documentation]     This test case is for adding new employee
    [Tags]              Smoke
    Open the browser and enter the url to the application
    Login to the application
    Add the employee details with login details
    Validate employee added successfully
#    Add Personal Details
