*** Settings ***
Library    SeleniumLibrary
Library    String

*** Keywords ***
Open PetClinic
    ${chrome_options}=    Evaluate    selenium.webdriver.ChromeOptions()    modules=selenium.webdriver
    Call Method    ${chrome_options}    add_argument    --headless\=new
    Call Method    ${chrome_options}    add_argument    --no-sandbox
    Call Method    ${chrome_options}    add_argument    --disable-dev-shm-usage
    Call Method    ${chrome_options}    add_argument    --disable-gpu
    Call Method    ${chrome_options}    add_argument    --window-size\=1920,1080
    Create Webdriver    Chrome    options=${chrome_options}
    Go To    http://127.0.0.1:8080
    Wait Until Page Contains    PetClinic    timeout=30s

Close Browser Session
    Close Browser

# ============================================
# NOUVEAUX KEYWORDS CORRIGÉS (SANS JAVASCRIPT)
# ============================================

Set Field Value
    [Arguments]    ${field_id}    ${value}
    Wait Until Element Is Visible    id=${field_id}    timeout=10s
    Wait Until Element Is Enabled    id=${field_id}    timeout=10s
    Clear Element Text    id=${field_id}
    Input Text    id=${field_id}    ${value}

Set Date Field
    [Arguments]    ${field_id}    ${date_value}
    Wait Until Element Is Visible    id=${field_id}    timeout=10s
    Wait Until Element Is Enabled    id=${field_id}    timeout=10s
    Clear Element Text    id=${field_id}
    Input Text    id=${field_id}    ${date_value}

Set Textarea Value
    [Arguments]    ${field_id}    ${value}
    Wait Until Element Is Visible    id=${field_id}    timeout=10s
    Wait Until Element Is Enabled    id=${field_id}    timeout=10s
    Clear Element Text    id=${field_id}
    Input Text    id=${field_id}    ${value}