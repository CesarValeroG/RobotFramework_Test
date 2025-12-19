*** Settings ***
Library         SeleniumLibrary

*** Variables ***
${brwoser}    chrome
${url}        https://demo.nopcommerce.com/

*** Test Cases ***
LoginTest
    Log    Hello World Robot Cesar
    Open Browser        ${url}       ${brwoser}
    Maximize Browser Window
    title Should Be    nopCommerce demo store
    loginToApplication
    close Browser


*** Keywords ***
loginToApplication
    click link       xpath=//a[@class='ico-login']
    Sleep    2
    Input Text       id=Email  pavonoltraining@gmail.com
    Input Text       id=Password  Test@123
    Click element    xpath=//button[@class='button-1 login-button']