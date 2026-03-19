*** Settings ***
Library      SeleniumLibrary
Resource     ../resources/common.robot
Resource     ../keywords/owner_keywords.robot
Resource     ../keywords/pet_keywords.robot

*** Test Cases ***
Add Multiple Owners Test
    [Template]    Add Single Owner
    Youssef    Alami      Hay Riad    Rabat        0661234567
    Sara       Benali     Maarif      Casablanca   0662345678
    Karim      Idrissi    Agdal       Rabat        0663456789

Add Multiple Pets Test
    [Template]    Add Single Pet
    Anasse Lekkioui    Rex      2022-03-10    dog
    Anasse Lekkioui    Luna     2021-07-15    cat
    Anasse Lekkioui    Nemo     2020-11-20    bird

*** Keywords ***
Add Single Owner
    [Arguments]    ${first}    ${last}    ${address}    ${city}    ${phone}
    Open PetClinic
    Go To Add Owner Page
    Fill Owner Form    ${first}    ${last}    ${address}    ${city}    ${phone}
    Submit Owner Form
    Verify Owner Created    ${first} ${last}
    Close Browser Session

Add Single Pet
    [Arguments]    ${owner}    ${petname}    ${birthdate}    ${type}
    Open PetClinic
    Go To Owner Page       ${owner}
    Go To Add Pet Page
    Fill Pet Form          ${petname}    ${birthdate}    ${type}
    Submit Pet Form
    Verify Pet Created     ${petname}
    Close Browser Session