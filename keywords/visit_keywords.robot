*** Settings ***
Resource    ../resources/common.robot
Resource    ../keywords/owner_keywords.robot
Resource    ../keywords/pet_keywords.robot

*** Keywords ***
Go To Add Visit Page
    [Arguments]    ${fullname}    ${petname}
    Go To Owner Page    ${fullname}
    Wait Until Element Is Visible    xpath=//a[contains(@href,'/visits/new')]    timeout=10s
    Click Element                    xpath=//a[contains(@href,'/visits/new')]

Fill Visit Form
    [Arguments]    ${date}    ${description}
    Set Date Field       date         ${date}
    Set Textarea Value   description  ${description}

Submit Visit Form
    Click Button    xpath=//button[@type='submit']

Verify Visit Created
    [Arguments]    ${description}
    Wait Until Page Contains    ${description}    timeout=10s