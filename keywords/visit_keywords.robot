*** Settings ***
Resource    ../resources/common.robot
Resource    ../keywords/owner_keywords.robot
Resource    ../keywords/pet_keywords.robot

*** Keywords ***
Go To Add Visit Page
    [Arguments]    ${fullname}    ${petname}
    Go To Owner Page    ${fullname}
    Wait Until Element Is Visible    xpath=//a[contains(@href,'/visits/new')]
    Click Element    xpath=//a[contains(@href,'/visits/new')]

Fill Visit Form
    [Arguments]    ${date}    ${description}
    Wait Until Element Is Visible    id=date
    Execute Javascript    document.getElementById('date').value = '${date}'
    Input Text    id=description    ${description}

Submit Visit Form
    Click Button    xpath=//button[@type='submit']

Verify Visit Created
    [Arguments]    ${description}
    Wait Until Element Is Visible    xpath=//table[contains(@class,'table-striped')]
    Page Should Contain    ${description}