*** Settings ***
Resource    ../resources/common.robot

*** Keywords ***
Open PetClinic
    Open Browser    http://localhost:8080    chrome
    Maximize Browser Window

Go To Add Owner Page
    Wait Until Element Is Visible    xpath=//a[@href="/owners/find"]
    Click Element    xpath=//a[@href="/owners/find"]
    Wait Until Element Is Visible    xpath=//a[@href="/owners/new"]
    Click Element    xpath=//a[@href="/owners/new"]

Go To Find Owner
    Wait Until Element Is Visible    xpath=//a[@href="/owners/find"]
    Click Element    xpath=//a[@href="/owners/find"]

Fill Owner Form
    [Arguments]    ${first}    ${last}    ${address}    ${city}    ${phone}
    Input Text    id=firstName    ${first}
    Input Text    id=lastName     ${last}
    Input Text    id=address      ${address}
    Input Text    id=city         ${city}
    Input Text    id=telephone    ${phone}

Fill LastName Owner
    [Arguments]    ${last}
    Input Text     id=lastName     ${last}

Submit Owner Form
    Click Button    xpath=//button[@type='submit']

Verify Owner Created
    [Arguments]    ${fullname}
    Page Should Contain    ${fullname}

Verify Owner In Results
    [Arguments]    ${last}
    Wait Until Element Is Visible    xpath=//table[@id='owners']
    Page Should Contain    ${last}

Select Owner From Results
    [Arguments]    ${fullname}
    Wait Until Element Is Visible    xpath=//table[@id='owners']
    Click Link    ${fullname}

Go To Edit Owner Page
    [Arguments]    ${fullname}
    Go To Owner Page    ${fullname}
    Wait Until Element Is Visible    xpath=//a[contains(@href,'/edit')]
    Click Element    xpath=//a[contains(@href,'/edit')]

Edit Owner Form
    [Arguments]    ${field}    ${value}
    Clear Element Text    id=${field}
    Input Text    id=${field}    ${value}

Verify Owner Updated
    [Arguments]    ${value}
    Page Should Contain    ${value}

Close Browser Session
    Close Browser