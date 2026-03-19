*** Settings ***
Resource    ../resources/common.robot
Resource    ../keywords/owner_keywords.robot

*** Test Cases ***
Add Owner Test
    Open PetClinic
    Go To Add Owner Page
    Fill Owner Form    Anasse    Lekkioui    Massira    Marrakech    0666027605
    Submit Owner Form
    Verify Owner Created    Anasse Lekkioui
    Close Browser Session

Search Owner
    Open PetClinic
    Go To Find Owner
    Fill LastName Owner     Lekkioui
    Submit Owner Form
    Verify Owner In Results    Lekkioui
    Close Browser Session

Edit Owner Test
    Open PetClinic
    Go To Edit Owner Page    Anasse Lekkioui
    Edit Owner Form    city    Casablanca
    Submit Owner Form
    Verify Owner Updated    Casablanca
    Close Browser Session