*** Variables ***
# Login Page
${LOGIN_BUTTON}                  //a[@href='/login']
${LOGOUT_URL}                    http://localhost:5173/logout
${EMAIL_FIELD}                   //input[@name='email']
${PASSWORD_FIELD}                //input[@name='password']
${LOGIN_ERROR_TEXT}                   Invalid email or password
${EMPTY_PASSWORD_ERROR_TEXT}          Password must be at least 6 characters
${EMPTY_EMAIL_FIELD_TEXT}             Invalid email address

# Logout Page
${PROFILE_BUTTON}        //button[@class='flex items-center focus:outline-none']
${LOGOUT_BUTTON}         //button[normalize-space()='Logout']
${LOGIN_PAGE_URL}        http://localhost:5173/login

# Registration Page
${SIGNUP_BUTTON}                 //a[@href='/register']
${FULL_NAME_FIELD}               //input[@name='name']
${EMAIL_FIELD}                   //input[@name='email']
${PHONE_FIELD}                   //input[@name='phone']
${ROLE_DROPDOWN}                 //select[@name='role']
${ROLE_BUYER}                    //option[@value='user']
${ROLE_AGENT}                    //option[@value='agent']
${PASSWORD_FIELD}                //input[@name='password']
${CONFIRM_PASSWORD}              //input[@name='confirmPassword']
${CREATE_ACCOUNT_BTN}            //button[normalize-space()='Create Account']

# Dashboard Page
${USER_DASHBOARD_TEXT}           My Dashboard
${AGENT_DASHBOARD_TEXT}          Agent Dashboard
${DASHBOARD_URL}                 http://localhost:5173/dashboard
${LOGIN_URL}                     http://localhost:5173/login
${PROFILE_BUTTON}        //button[@class='flex items-center focus:outline-none']
${LOGOUT_BUTTON}         //button[normalize-space()='Logout']

# Admin Dashboard
${USER_BUTTON_ON_ADMIN_DASHBOARD}  //button[normalize-space()='Users']
