*** Settings ***
Documentation   This is a sample Robot Framework using Resource CVG.
Library         OperatingSystem
Resource        ../resources/Resource.robot


*** Test Cases ***
TEST RESOURCE USAGE
    [Tags]    demo      demo2
    Log My Specific Usarname and Password       &{DICTIONARY}[username]    &{DICTIONARY}[password]