*** Settings ***
Documentation   This is a second sample Robot Framework test case CVG.
Library         OperatingSystem

*** Variables ***
${MY-VARIABLE}          my Test variable
${MY-Second-VARIABLE}   my Second Test variable

@{LIST}     test1    test2    test3     test4

&{DICTIONARY}    key1=value1    key2=value2    key3=value3


*** Test Cases ***
Should Log Message And Assert True
    [Tags]    demo      demo2
 #   Log     ${MY-VARIABLE} This is my second test case
 #   Log     ${MY-Second-VARIABLE} Another variable log
 #   Log     ${LIST}[1]
    Log    ${DICTIONARY}[key2]
    Log    ${DICTIONARY}[key3]
