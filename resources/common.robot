*** Settings ***
Library    SeleniumLibrary
Library    String

*** Keywords ***
Open PetClinic
    ${options}=    Evaluate    selenium.webdriver.ChromeOptions()    modules=selenium.webdriver
    Call Method    ${options}    add_argument    --headless\=new
    Call Method    ${options}    add_argument    --no-sandbox
    Call Method    ${options}    add_argument    --disable-dev-shm-usage
    Call Method    ${options}    add_argument    --disable-gpu
    Call Method    ${options}    add_argument    --window-size\=1920,1080
    Create Webdriver    Chrome    options=${options}
    Go To    http://127.0.0.1:8080
    Wait Until Page Contains    PetClinic    timeout=30s

Close Browser Session
    Close Browser

Set Field Value
    [Arguments]    ${field_id}    ${value}
    Wait Until Element Is Visible    id=${field_id}    timeout=10s
    Wait Until Element Is Enabled    id=${field_id}    timeout=10s
    Execute Javascript               document.getElementById('${field_id}').value = ''
    Click Element                    id=${field_id}
    Input Text                       id=${field_id}    ${value}

Set Date Field
    [Arguments]    ${field_id}    ${date_value}
    Wait Until Element Is Visible    id=${field_id}    timeout=10s
    Execute Javascript
    ...    var el = document.getElementById('${field_id}');
    ...    var nativeInputValueSetter = Object.getOwnPropertyDescriptor(window.HTMLInputElement.prototype, 'value').set;
    ...    nativeInputValueSetter.call(el, '${date_value}');
    ...    el.dispatchEvent(new Event('input', { bubbles: true }));
    ...    el.dispatchEvent(new Event('change', { bubbles: true }));