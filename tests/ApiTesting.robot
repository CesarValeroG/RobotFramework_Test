*** Settings ***
Resource        ../resources/keywords/BookingAPI.robot

*** Variables ***
${FIRSTNAME}           Jim
${LASTNAME}            Brown
${TOTALPRICE}          111
${DEPOSITPAID}         ${True}
${CHECKIN}             2018-07-01
${CHECKOUT}            2019-07-20
${ADDITIONALNEEDS}     Breakfast

*** Test Cases ***
CreateBooking
    [Documentation]    Test to create a booking and validate response
    Create Session For API
    ${response}    Create Booking    ${FIRSTNAME}    ${LASTNAME}    ${TOTALPRICE}    ${DEPOSITPAID}    ${CHECKIN}    ${CHECKOUT}    ${ADDITIONALNEEDS}

    # Print response
    Log    Status Code: ${response.status_code}
    Log    Response Text: ${response.text}

    # Validate status code
    Should Be Equal As Integers    ${response.status_code}    200

    # Extract booking ID
    ${booking_id}    Get Booking ID From Response    ${response}
    Log    Booking ID: ${booking_id}
    Set Suite Variable    ${BOOKING_ID}    ${booking_id}

GetBooking
    [Documentation]    Test to get a booking by ID and validate response
    [Tags]    get_booking
    ${response}    Get Booking    ${BOOKING_ID}

    # Print response
    Log    Status Code: ${response.status_code}
    Log    Response Text: ${response.text}

    # Validate status code
    Should Be Equal As Integers    ${response.status_code}    200

    # Validate response fields
    ${firstName}    Get From Dictionary    ${response.json()}    firstname
    ${lastName}    Get From Dictionary    ${response.json()}    lastname
    ${totalPrice}    Get From Dictionary    ${response.json()}    totalprice

    Log    First Name: ${firstName}
    Log    Last Name: ${lastName}
    Log    Total Price: ${totalPrice}

    # Validate booking dates
    ${bookingdates}    Get From Dictionary    ${response.json()}    bookingdates
    ${checkin}    Get From Dictionary    ${bookingdates}    checkin
    ${checkout}    Get From Dictionary    ${bookingdates}    checkout

    Log    Check-in Date: ${checkin}
    Log    Check-out Date: ${checkout}

    # Assertions
    Should Be Equal    ${firstName}    ${FIRSTNAME}
    Should Be Equal    ${lastName}    ${LASTNAME}
    Should Be Equal As Integers    ${totalPrice}    ${TOTALPRICE}
    Should Be Equal    ${checkin}    ${CHECKIN}
    Should Be Equal    ${checkout}    ${CHECKOUT}

DeleteBooking
    [Documentation]    Test to delete a booking and validate response
    [Tags]    delete_booking
    ${response}    Delete Booking    ${BOOKING_ID}    admin    password123

    # Print response
    Log    Status Code: ${response.status_code}
    Log    Response Text: ${response.text}

    # Validate status code
    Should Be Equal As Integers    ${response.status_code}    201

*** Keywords ***