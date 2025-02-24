*** Settings ***
Library    SeleniumLibrary
Resource   ../resources/selectors.robot

*** Keywords ***
Open Registration Page
    Click Element    ${LOGIN_BUTTON}
    Click Element    ${SIGNUP_BUTTON}
    Wait Until Location Is    http://localhost:5173/register

Fill Registration Form
    [Arguments]  ${name}  ${email}  ${phone}  ${role}  ${password}
    Input Text    ${FULL_NAME_FIELD}    ${name}
    Input Text    ${EMAIL_FIELD}    ${email}
    Input Text    ${PHONE_FIELD}    ${phone}
    Select From List By Value    ${ROLE_DROPDOWN}    ${role}
    Input Text    ${PASSWORD_FIELD}    ${password}
    Input Text    ${CONFIRM_PASSWORD}    ${password}

Submit Registration
    Click Button    ${CREATE_ACCOUNT_BTN}

Verify Registration Success
    [Arguments]    ${role}
    IF    '${role}' == 'user'
        Wait Until Location Is    http://localhost:5173/dashboard
        Page Should Contain    ${USER_DASHBOARD_TEXT}
    ELSE
        Wait Until Location Is    http://localhost:5173/dashboard
        Page Should Contain    ${AGENT_DASHBOARD_TEXT}
    END
