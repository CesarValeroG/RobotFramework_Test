*** Settings ***
Documentation   This is a sample Robot Framework test case CVG.
Library         OperatingSystem
Library         BuiltIn
Library         Collections


*** Keywords ***
My Keyword
    [Arguments]    ${arg}
    Log    ${arg}

*** Variables ***


*** Test Cases ***
Test Example
    Log    Hello World Robot Cesar
    Should Be Equal    ${1}    ${1}

