*** Settings ***
Documentation    Reusable keywords for Robot Framework tests
Library          String
Library          Collections

*** Keywords ***
Create Greeting Message
    [Documentation]    Creates a personalized greeting message
    [Arguments]    ${name}
    ${greeting}=    Set Variable    Hello, ${name}! Welcome to Robot Framework testing.
    RETURN    ${greeting}

Verify Text Contains Keyword
    [Documentation]    Verifies that text contains a specific keyword
    [Arguments]    ${text}    ${keyword}
    Should Contain    ${text}    ${keyword}    msg=Text does not contain '${keyword}'

Convert Text To Uppercase
    [Documentation]    Converts text to uppercase
    [Arguments]    ${text}
    ${uppercase}=    Convert To Upper Case    ${text}
    RETURN    ${uppercase}

Convert Text To Lowercase
    [Documentation]    Converts text to lowercase
    [Arguments]    ${text}
    ${lowercase}=    Convert To Lower Case    ${text}
    RETURN    ${lowercase}

Create Test Data List
    [Documentation]    Creates a sample list of test data
    [Arguments]    @{items}
    RETURN    @{items}

Get Dictionary Value Safely
    [Documentation]    Gets a value from dictionary with default if key doesn't exist
    [Arguments]    ${dictionary}    ${key}    ${default}=None
    ${value}=    Get From Dictionary    ${dictionary}    ${key}    default=${default}
    RETURN    ${value}

Log Test Information
    [Documentation]    Logs test information for debugging
    [Arguments]    ${message}    ${level}=INFO
    Log    ${message}    level=${level}
