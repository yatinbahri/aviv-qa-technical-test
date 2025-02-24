*** Settings ***
Library    SeleniumLibrary
Library    JSONLibrary
Library    Collections
Resource   ../pages/registration_page.robot
Resource   ../pages/login_page.robot 
Resource   ../resources/selectors.robot  

Test Setup     Setup Environment
Test Teardown  Close Browser

*** Variables ***
${BROWSER}    chrome

*** Keywords ***
Setup Environment
    [Arguments]    ${browser}=${BROWSER}
    Open Browser    ${LOGIN_URL}    ${browser}
    Load Test Data

Load Test Data
    ${data}=    Load JSON From File    ${CURDIR}/../resources/registration_data.json
    Set Suite Variable    ${DATA}    ${data}

Logout User
    Go To    ${LOGOUT_URL} 
    Wait Until Element Is Visible    ${LOGIN_BUTTON}    timeout=5s   

*** Test Cases ***
Register as Home Buyer
    [Documentation]    Register a Home Buyer and validate the dashboard
    ${users_list}=    Get From Dictionary    ${DATA}    users
    ${buyer}=    Get From List    ${users_list}    0
    Open Registration Page
    Fill Registration Form    ${buyer["name"]}    ${buyer["email"]}    ${buyer["phone"]}    ${buyer["role"]}    ${buyer["password"]}
    Submit Registration
    Verify Registration Success    ${buyer["role"]}
    Logout User  

Register as Real Estate Agent
    [Documentation]    Register a Real Estate Agent and validate the dashboard
    ${users_list}=    Get From Dictionary    ${DATA}    users
    ${agent}=    Get From List    ${users_list}    1
    Open Registration Page
    Fill Registration Form    ${agent["name"]}    ${agent["email"]}    ${agent["phone"]}    ${agent["role"]}    ${agent["password"]}
    Submit Registration
    Verify Registration Success    ${agent["role"]}
    Logout User  
