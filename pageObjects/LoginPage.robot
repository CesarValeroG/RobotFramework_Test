*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${USERNAME_FIELD}           id=user-name
${PASSWORD_FIELD}           id=password
${LOGIN_BUTTON}             id=login-button
${PRODUCTS_TITLE}           xpath=//span[text()='Products']
${ERROR_MESSAGE}            xpath=//h3[@data-test='error']

*** Keywords ***
Login With Credentials
    [Arguments]    ${username}    ${password}
    Wait Until Element Is Visible    ${USERNAME_FIELD}    timeout=120
    Input Text    ${USERNAME_FIELD}    ${username}
    Input Text    ${PASSWORD_FIELD}     ${password}
    Click Button    ${LOGIN_BUTTON}

Get Products Title
    Wait Until Element Is Visible    ${PRODUCTS_TITLE}    timeout=30
    ${text}    Get Text    ${PRODUCTS_TITLE}
    [Return]    ${text}

Get Error Message
    Wait Until Element Is Visible    ${ERROR_MESSAGE}    timeout=30
    ${error}    Get Text    ${ERROR_MESSAGE}
    [Return]    ${error}

