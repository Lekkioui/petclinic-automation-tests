*** Settings ***
Library     SeleniumLibrary
Library     Collections
Resource    ../resources/common.robot
Resource    ../keywords/owner_keywords.robot

*** Keywords ***
Go To Add Pet Page
    Wait Until Element Is Visible    xpath=//a[contains(@href,'/pets/new')]    timeout=10s
    Click Element                    xpath=//a[contains(@href,'/pets/new')]

Fill Pet Form
    [Arguments]    ${name}    ${birthdate}    ${type}
    Wait Until Element Is Visible    id=name    timeout=10s
    Wait Until Element Is Enabled    id=name    timeout=10s
    Execute Javascript               document.getElementById('name').value = ''
    Click Element                    id=name
    Input Text                       id=name    ${name}
    Set Date Field                   birthDate    ${birthdate}
    Wait Until Element Is Visible    id=type    timeout=10s
    Select From List By Value        id=type    ${type}

Submit Pet Form
    Click Button    xpath=//button[@type='submit']
    Wait Until Element Is Visible    xpath=//table[contains(@class,'table-striped')]    timeout=15s

Verify Pet Created
    [Arguments]    ${petname}
    Wait Until Page Contains    ${petname}    timeout=10s

Go To Edit Pet Page
    [Arguments]    ${fullname}    ${petname}
    Go To Owner Page    ${fullname}
    Wait Until Element Is Visible    xpath=//a[contains(@href,'/pets/') and contains(@href,'/edit')]    timeout=10s
    Click Element                    xpath=//a[contains(@href,'/pets/') and contains(@href,'/edit')]

Edit Pet Form
    [Arguments]    ${field}    ${value}
    Set Field Value    ${field}    ${value}

Verify Pet Updated
    [Arguments]    ${value}
    Wait Until Page Contains    ${value}    timeout=10s