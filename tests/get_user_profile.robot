*** Settings ***
Library      RequestsLibrary
Library      Collections
Resource     ../testdata/user_profile_data.robot

Suite Setup    Create Reqres Session

*** Keywords ***
Create Reqres Session
    ${headers}=    Create Dictionary    x-api-key=${API_KEY}
    Create Session    reqres    ${BASE_URL}    headers=${headers}

*** Test Cases ***
Get user profile success
    [Documentation]    Verify GET existing user profile returns status code 200 and correct response body
    ${response}=    GET On Session    reqres    /api/users/${EXISTING_USER_ID}
    Should Be Equal As Integers    ${response.status_code}    ${EXPECTED_STATUS_OK}

    ${body}=    Set Variable    ${response.json()}
    ${data}=    Get From Dictionary    ${body}    data

    Should Be Equal As Integers    ${data}[id]    ${EXPECTED_ID}
    Should Be Equal    ${data}[email]    ${EXPECTED_EMAIL}
    Should Be Equal    ${data}[first_name]    ${EXPECTED_FIRST_NAME}
    Should Be Equal    ${data}[last_name]    ${EXPECTED_LAST_NAME}
    Should Be Equal    ${data}[avatar]    ${EXPECTED_AVATAR}

Get user profile but user not found
    [Documentation]    Verify GET non-existing user profile returns status code 404 and empty response body
    ${response}=    GET On Session    reqres    /api/users/${NOT_FOUND_USER_ID}    expected_status=404
    Should Be Equal As Integers    ${response.status_code}    ${EXPECTED_STATUS_404}

    ${body}=    Set Variable    ${response.json()}
    ${empty_dict}=    Create Dictionary
    Dictionaries Should Be Equal    ${body}    ${empty_dict}