*** Settings ***
Library    SeleniumLibrary
Resource   ../resources/selectors.robot 

*** Keywords ***
Open Login Page
    Go To    ${LOGIN_URL}
    Execute JavaScript    document.querySelector("input[name='email']").setAttribute("novalidate", true);

Enter Username
    [Arguments]    ${email}
    Input Text    ${EMAIL_FIELD}    ${email}

Enter Password
    [Arguments]    ${password}
    Input Text    ${PASSWORD_FIELD}    ${password}

Click Login Button
    Press Keys    ${PASSWORD_FIELD}    ENTER

Verify Successful Login
    [Arguments]    ${role}
    IF    '${role}' == 'user'
        Wait Until Location Is    ${DASHBOARD_URL}
        Page Should Contain    ${USER_DASHBOARD_TEXT}
    ELSE IF    '${role}' == 'agent'
        Wait Until Location Is    ${DASHBOARD_URL}
        Page Should Contain    ${AGENT_DASHBOARD_TEXT}
    ELSE IF    '${role}' == 'admin'
        Wait Until Location Is    ${DASHBOARD_URL}
        Wait Until Element Is Visible    ${USER_BUTTON_ON_ADMIN_DASHBOARD}    timeout=5s 
    ELSE
        Fail    "Unknown role provided: ${role}"
    END

Verify Login Failure
    [Arguments]    ${expected_error}
    Wait Until Page Contains    ${expected_error}    timeout=5s

Verify Invalid Email Error
    ${validation_message}=    Execute JavaScript    return document.querySelector("input[name='email']").validationMessage;
    Log To Console    "Validation Message: ${validation_message}"
    Should Be Equal As Strings    ${validation_message}    Please include an '@' in the email address.
