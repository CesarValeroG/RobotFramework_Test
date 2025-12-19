*** Settings ***
Library    RequestsLibrary
Library    Collections

*** Variables ***
${BASE_URL}            https://restful-booker.herokuapp.com
${BOOKING_ENDPOINT}    /booking

*** Keywords ***
Create Session For API
    Create Session    booking_api    ${BASE_URL}    verify=True

Create Booking
    [Arguments]    ${firstname}    ${lastname}    ${totalprice}    ${depositpaid}    ${checkin}    ${checkout}    ${additionalneeds}
    ${bookingdates}    Create Dictionary    checkin=${checkin}    checkout=${checkout}
    ${request_body}    Create Dictionary
    ...    firstname=${firstname}
    ...    lastname=${lastname}
    ...    totalprice=${totalprice}
    ...    depositpaid=${depositpaid}
    ...    bookingdates=${bookingdates}
    ...    additionalneeds=${additionalneeds}

    ${response}    POST On Session    booking_api    ${BOOKING_ENDPOINT}    json=${request_body}
    RETURN    ${response}

Get Booking ID From Response
    [Arguments]    ${response}
    ${booking_id}    Get From Dictionary    ${response.json()}    bookingid
    RETURN    ${booking_id}

Get Booking Details From Response
    [Arguments]    ${response}    ${path}
    ${value}    Get From Dictionary    ${response.json()}    ${path}
    RETURN    ${value}

Get First Name From Response
    [Arguments]    ${response}
    ${booking}    Get From Dictionary    ${response.json()}    booking
    ${firstname}    Get From Dictionary    ${booking}    firstname
    RETURN    ${firstname}

Get Check In Date From Response
    [Arguments]    ${response}
    ${booking}    Get From Dictionary    ${response.json()}    booking
    ${bookingdates}    Get From Dictionary    ${booking}    bookingdates
    ${checkin}    Get From Dictionary    ${bookingdates}    checkin
    RETURN    ${checkin}

Get Booking
    [Arguments]    ${booking_id}
    ${response}    GET On Session    booking_api    ${BOOKING_ENDPOINT}/${booking_id}
    RETURN    ${response}

Delete Booking
    [Arguments]    ${booking_id}    ${username}=admin    ${password}=password123
    ${auth}    Evaluate    ('${username}', '${password}')
    ${response}    DELETE On Session    booking_api    ${BOOKING_ENDPOINT}/${booking_id}    auth=${auth}
    RETURN    ${response}

