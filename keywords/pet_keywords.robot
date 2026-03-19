*** Settings ***
Library     SeleniumLibrary
Library     Collections
Resource    ../resources/common.robot
Resource    ../keywords/owner_keywords.robot

*** Keywords ***
Go To Owner Page
    [Arguments]    ${fullname}
    ${name_parts}=    Split String    ${fullname}    ${SPACE}
    ${last}=          Set Variable    ${name_parts}[-1]
    Go To Find Owner
    Fill LastName Owner    ${last}
    Submit Owner Form
    Wait Until Element Is Visible    xpath=//table[@id='owners']    timeout=10s
    Click Link    ${fullname}

Go To Add Pet Page
    Wait Until Element Is Visible    xpath=//a[contains(@href,'/pets/new')]    timeout=10s
    Click Element    xpath=//a[contains(@href,'/pets/new')]

Fill Pet Form
    [Arguments]    ${name}    ${birthdate}    ${type}
    Wait Until Element Is Visible    id=name    timeout=10s
    Input Text    id=name         ${name}
    Execute Javascript    document.getElementById('birthDate').value = '${birthdate}'
    Select From List By Value    id=type    ${type}

Submit Pet Form
    Click Button    xpath=//button[@type='submit']
    Wait Until Element Is Visible    xpath=//table[contains(@class,'table-striped')]    timeout=10s

Verify Pet Created
    [Arguments]    ${petname}
    Wait Until Page Contains    ${petname}    timeout=10s

Go To Edit Pet Page
    [Arguments]    ${fullname}    ${petname}
    Go To Owner Page    ${fullname}
    Wait Until Element Is Visible    xpath=//a[contains(@href,'/pets/') and contains(@href,'/edit')]    timeout=10s
    Click Element    xpath=//a[contains(@href,'/pets/') and contains(@href,'/edit')]

Edit Pet Form
    [Arguments]    ${field}    ${value}
    Clear Element Text    id=${field}
    Input Text    id=${field}    ${value}

Verify Pet Updated
    [Arguments]    ${value}
    Wait Until Page Contains    ${value}    timeout=10s