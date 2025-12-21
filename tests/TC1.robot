*** Settings ***
Library         SeleniumLibrary

*** Variables ***
${brwoser}    headlesschrome
${url}        https://demo.nopcommerce.com/

*** Test Cases ***
LoginTest
    Log    Hello World Robot Cesar
    Open Browser        ${url}       ${brwoser}   #  options=add_argument("--headless");add_argument("--no-sandbox");add_argument("--disable-dev-shm-usage")
    Maximize Browser Window
    loginToApplication
    close Browser


*** Keywords ***
loginToApplication
    Wait Until Element Is Visible    xpath=//a[@class='ico-login']    timeout=30
    click link       xpath=//a[@class='ico-login']
    Sleep    3
    Wait Until Element Is Visible    id=Email    timeout=30
    Input Text       id=Email  pavonoltraining@gmail.com
    Input Text       id=Password  Test@123
    Click element    xpath=//button[@class='button-1 login-button']