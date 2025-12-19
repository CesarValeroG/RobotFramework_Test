*** Settings ***
Documentation    Sample test cases to demonstrate Robot Framework testing
Resource         ../resources/keywords.robot
Library          String

*** Test Cases ***
Test String Equality
    [Documentation]    Verify that two strings are equal
    ${string1}=    Set Variable    Hello World
    ${string2}=    Set Variable    Hello World
    Should Be Equal    ${string1}    ${string2}

Test String Contains
    [Documentation]    Verify that a string contains a substring
    ${text}=    Set Variable    Robot Framework is powerful
    Should Contain    ${text}    Framework

Test String Length
    [Documentation]    Verify string length calculation
    ${text}=    Set Variable    Robot
    ${length}=    Get Length    ${text}
    Should Be Equal As Integers    ${length}    5

Test Custom Keyword
    [Documentation]    Test using custom keyword from resources
    ${greeting}=    Create Greeting Message    Robot Framework
    Should Contain    ${greeting}    Robot Framework

Test Mathematical Operations
    [Documentation]    Verify basic mathematical operations
    ${result}=    Evaluate    2 + 2
    Should Be Equal As Integers    ${result}    4
    ${result}=    Evaluate    10 - 5
    Should Be Equal As Integers    ${result}    5

Test List Operations
    [Documentation]    Verify list operations
    @{fruits}=    Create List    Apple    Banana    Cherry
    List Should Contain Value    ${fruits}    Banana
    ${length}=    Get Length    ${fruits}
    Should Be Equal As Integers    ${length}    3
