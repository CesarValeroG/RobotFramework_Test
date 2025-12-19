*** Settings ***
Documentation   This is a Resource File CVG.
Library         OperatingSystem

*** Variables ***
${MY-VARIABLE}          my Test variable
${MY-Second-VARIABLE}   my Second Test variable

${GOOGLE-SEARCH-FIELD}    //input[@title='search2']

@{LIST}     test1    test2    test3     test4

&{DICTIONARY}    username=Cesar    password=mypassword
&{DICTIONARY}    username=Cesar2    password=mypassword2


*** Keywords ***
Log My Username
    [Arguments]     ${USERNAME}
    Log             ${USERNAME}

Log My Password
    [Arguments]     ${PASSWORD}
    Log             ${PASSWORD}

Log My Specific Usarname and Password
    [Arguments]     ${USERNAME2}    ${PASSWORD}
    Log             ${USERNAME2}
    Log             ${PASSWORD}

