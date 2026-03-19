*** Settings ***
Resource    ../resources/common.robot
Resource    ../keywords/owner_keywords.robot
Resource    ../keywords/pet_keywords.robot
Resource    ../keywords/visit_keywords.robot

*** Test Cases ***
Add Visit Test
    Open PetClinic
    Go To Add Visit Page    Anasse Lekkioui    Milou
    Fill Visit Form         2024-03-15    Routine checkup
    Submit Visit Form
    Verify Visit Created    Routine checkup
    Close Browser Session