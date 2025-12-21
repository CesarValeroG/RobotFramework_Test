*** Settings ***
Library         SeleniumLibrary
Test Setup      Open And Maximize Browser
Test Teardown   Close Browser

*** Variables ***
${brwoser}      headlesschrome      # headlesschrome to run without opening the browser window
${url}          https://www.saucedemo.com/

*** Test Cases ***
LoginTest
    Log    Testing Valid credentials
    loginToApplication    standard_user    secret_sauce
    Wait Until Element Is Visible   xpath=//span[text()='Products']    timeout=30
    ${text}    Get Text    xpath=//span[text()='Products']
    Should Be Equal    ${text}    Products

InvalidCredentialsTest
    Log    Testing invalid credentials
    loginToApplication    invalid_user    wrong_password
    Wait Until Element Is Visible   xpath=//h3[@data-test='error']    timeout=30
    ${error_msg}    Get Text    xpath=//h3[@data-test='error']
    Should Be Equal    ${error_msg}    Epic sadface: Username and password do not match any user in this service

*** Keywords ***
Open And Maximize Browser
    ${chrome_options}=    Evaluate    sys.modules['selenium.webdriver']. ChromeOptions()    sys, selenium.webdriver
    Call Method    ${chrome_options}    add_argument    --headless
    Call Method    ${chrome_options}    add_argument    --no-sandbox
    Call Method    ${chrome_options}    add_argument    --disable-dev-shm-usage
    Call Method    ${chrome_options}    add_argument    --disable-gpu
    Call Method    ${chrome_options}    add_argument    --start-maximized

    Open Browser    ${url}    chrome    options=${chrome_options}
    # Nota: Maximize no funciona en headless, pero el tamaño se configuró arriba
#    Open Browser    ${url}    ${brwoser}
#    Maximize Browser Window

loginToApplication
    [Arguments]    ${username}    ${password}
    Wait Until Element Is Visible    id=user-name    timeout=120
    Input Text    id=user-name    ${username}
    Input Text    id=password     ${password}
    Click Button    id=login-button
