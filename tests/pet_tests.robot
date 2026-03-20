*** Settings ***
Resource    ../resources/common.robot
Resource    ../keywords/owner_keywords.robot
Resource    ../keywords/pet_keywords.robot

*** Test Cases ***
Add Pet Test
    Open PetClinic
    Go To Owner Page       Anasse Lekkioui
    Go To Add Pet Page
    Fill Pet Form          Mil    2022-01-15    dog
    Submit Pet Form
    Verify Pet Created     Mil
    Close Browser Session

Edit Pet Test
    Open PetClinic
    Go To Edit Pet Page    Anasse Lekkioui    Mil
    Edit Pet Form    name    Roc
    Submit Pet Form
    Verify Pet Updated    Roc
    Close Browser Session