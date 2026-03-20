*** Settings ***
Library    SeleniumLibrary
Library     String

*** Keywords ***
Open PetClinic
    ${options}=    Create Dictionary    args=${EMPTY}
    Open Browser    http://127.0.0.1:8080    chrome    desired_capabilities=${options}
    Maximize Browser Window
    Wait Until Page Contains    PetClinic    timeout=30s