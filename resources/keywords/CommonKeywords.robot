*** Settings ***
Library    SeleniumLibrary

*** Keywords ***
Open And Maximize Browser
    [Arguments]    ${url}    ${browser}
    Open Browser    ${url}    ${browser}
    Maximize Browser Window

Close Application
    Close Browser

