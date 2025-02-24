*** Settings ***
Library    SeleniumLibrary
Library    JSONLibrary
Library    Collections
Resource   ../pages/login_page.robot
Resource   ../pages/dashboard_page.robot
Resource   ../resources/selectors.robot

Test Setup     Setup Environment
Test Teardown  Close Browser

*** Variables ***
${BROWSER}    chrome
${TEST_DATA}    NONE

*** Keywords ***
Setup Environment
    [Arguments]    ${browser}=${BROWSER}
    Open Browser    ${LOGIN_URL}    ${browser}
    Load Test Data

Load Test Data
    ${data}=    Load JSON From File    ${CURDIR}/../resources/login_data.json
    Set Suite Variable    ${TEST_DATA}    ${data}

*** Test Cases ***
Logout as Home Buyer
    [Documentation]    Logs in as a Home Buyer and verifies logout
    ${buyer}=    Get From Dictionary    ${TEST_DATA["users"]}    user
    Open Login Page
    Enter Username    ${buyer["email"]}
    Enter Password    ${buyer["password"]}
    Click Login Button
    Verify Successful Login    user
    Logout User
    Verify Logout Successful

Logout as Real Estate Agent
    [Documentation]    Logs in as an Agent and verifies logout
    ${agent}=    Get From Dictionary    ${TEST_DATA["users"]}    agent
    Open Login Page
    Enter Username    ${agent["email"]}
    Enter Password    ${agent["password"]}
    Click Login Button
    Verify Successful Login    agent
    Logout User
    Verify Logout Successful

Logout as Admin
    [Documentation]    Logs in as an Admin and verifies logout
    ${admin}=    Get From Dictionary    ${TEST_DATA["users"]}    admin
    Open Login Page
    Enter Username    ${admin["email"]}
    Enter Password    ${admin["password"]}
    Click Login Button
    Verify Successful Login    admin
    Logout User
    Verify Logout Successful