*** Settings ***
Library    SeleniumLibrary
Resource   ../resources/selectors.robot

*** Keywords ***
Logout User
    Click Element    ${PROFILE_BUTTON}
    Click Element    ${LOGOUT_BUTTON}

Verify Logout Successful
    Wait Until Location Is    ${LOGIN_PAGE_URL}
    Page Should Contain Element    ${LOGIN_BUTTON}