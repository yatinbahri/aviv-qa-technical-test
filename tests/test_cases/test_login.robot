*** Settings ***
Library    SeleniumLibrary
Library    JSONLibrary
Library    Collections
Resource   ../pages/login_page.robot
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
Login as Home Buyer
    [Documentation]    Logs in as a Home Buyer and verifies Dashboard
    ${buyer}=    Get From Dictionary    ${TEST_DATA["users"]}    user
    Open Login Page
    Enter Username    ${buyer["email"]}
    Enter Password    ${buyer["password"]}
    Click Login Button
    Verify Successful Login    user

Login as Real Estate Agent
    [Documentation]    Logs in as a Real Estate Agent and verifies Dashboard
    ${agent}=    Get From Dictionary    ${TEST_DATA["users"]}    agent
    Open Login Page
    Enter Username    ${agent["email"]}
    Enter Password    ${agent["password"]}
    Click Login Button
    Verify Successful Login    agent

Login as Admin
    [Documentation]    Logs in as an Admin and verifies Admin Dashboard
    ${admin}=    Get From Dictionary    ${TEST_DATA["users"]}    admin
    Open Login Page
    Enter Username    ${admin["email"]}
    Enter Password    ${admin["password"]}
    Click Login Button
    Verify Successful Login    admin

Login with Invalid Credentials
    [Documentation]    Attempt to log in with incorrect email/password
    ${invalid}=    Get From Dictionary    ${TEST_DATA}    invalid_credentials
    Open Login Page
    Enter Username    ${invalid["email"]}
    Enter Password    ${invalid["password"]}
    Click Login Button
    Verify Login Failure    ${LOGIN_ERROR_TEXT}

Login with Empty Email
    [Documentation]    Attempt to log in with an empty email field
    Open Login Page
    Enter Username    ${EMPTY}
    Enter Password    Test123!
    Click Login Button
    Verify Login Failure    ${EMPTY_EMAIL_FIELD_TEXT}

Login with Invalid Email Format
    [Documentation]    Attempt to log in with incorrectly formatted email
    ${invalid_email}=    Get From Dictionary    ${TEST_DATA}    invalid_email
    ${invalid}=    Get From Dictionary    ${TEST_DATA}    invalid_credentials
    Open Login Page
    Enter Username    ${invalid["email"]}
    Enter Password    ${invalid["password"]}
    Click Login Button
    sleep    2s
    Enter Username    ${invalid_email["email"]}
    Verify Login Failure   ${EMPTY_EMAIL_FIELD_TEXT}

Login with Empty Password
    [Documentation]    Attempt to log in with an empty password field
    Open Login Page
    Enter Username    test@example.com
    Enter Password    ${EMPTY}
    Click Login Button
    Verify Login Failure    ${EMPTY_PASSWORD_ERROR_TEXT}