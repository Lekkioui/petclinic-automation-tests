*** Settings ***
Library     SeleniumLibrary
Library     String
Resource    ../resources/common.robot

*** Keywords ***
Go To Add Owner Page
    Wait Until Element Is Visible    xpath=//a[@href="/owners/find"]    timeout=10s
    Click Element                    xpath=//a[@href="/owners/find"]
    Wait Until Element Is Visible    xpath=//a[@href="/owners/new"]    timeout=10s
    Click Element                    xpath=//a[@href="/owners/new"]

Go To Find Owner
    Wait Until Element Is Visible    xpath=//a[@href="/owners/find"]    timeout=10s
    Click Element                    xpath=//a[@href="/owners/find"]

Fill Owner Form
    [Arguments]    ${first}    ${last}    ${address}    ${city}    ${phone}
    Wait Until Element Is Visible    id=firstName    timeout=10s
    Set Field Value    firstName    ${first}
    Set Field Value    lastName     ${last}
    Set Field Value    address      ${address}
    Set Field Value    city         ${city}
    Set Field Value    telephone    ${phone}

Fill LastName Owner
    [Arguments]    ${last}
    Wait Until Element Is Visible    id=lastName    timeout=10s
    Set Field Value                  lastName       ${last}

Submit Owner Form
    Click Button    xpath=//button[@type='submit']

Go To Owner Page
    [Arguments]    ${fullname}
    ${name_parts}=    Split String    ${fullname}    ${SPACE}
    ${last}=          Set Variable    ${name_parts}[-1]
    Go To Find Owner
    Fill LastName Owner    ${last}
    Submit Owner Form
    Wait Until Element Is Visible    xpath=//table[@id='owners']    timeout=10s
    Click Link    ${fullname}

Verify Owner Created
    [Arguments]    ${fullname}
    Wait Until Page Contains    ${fullname}    timeout=10s

Verify Owner In Results
    [Arguments]    ${last}
    Wait Until Element Is Visible    xpath=//table[@id='owners']    timeout=10s
    Page Should Contain    ${last}

Select Owner From Results
    [Arguments]    ${fullname}
    Wait Until Element Is Visible    xpath=//table[@id='owners']
    Click Link    ${fullname}

Go To Edit Owner Page
    [Arguments]    ${fullname}
    Go To Owner Page    ${fullname}
    Wait Until Element Is Visible    xpath=//a[contains(@href,'/edit')]    timeout=10s
    Click Element                    xpath=//a[contains(@href,'/edit')]

Edit Owner Form
    [Arguments]    ${field}    ${value}
    Set Field Value    ${field}    ${value}

Verify Owner Updated
    [Arguments]    ${value}
    Wait Until Page Contains    ${value}    timeout=10s