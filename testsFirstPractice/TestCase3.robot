*** Settings ***
Documentation   This is a Third Robot Framework test case CVG.
Library         OperatingSystem

*** Keywords ***
Log My Username
    Log    ${DICTIONARY}[username]

Log My Password
    Log    ${DICTIONARY}[password]

Log Usarname and Password 1
    Log     ${DICTIONARY}[username]
    Log     ${DICTIONARY}[password]

Log Userarname and Password 2
    Log My Username
    Log My Password

*** Variables ***
&{DICTIONARY}    username=Cesar    password=mypassword    url=http://example.com
    
*** Test Cases ***
TEST3
 #   Log My Username
 #   Log My Password
    Log Usarname and Password