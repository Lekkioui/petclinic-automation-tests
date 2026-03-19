*** Settings ***
Resource    ../resources/common.robot

*** Keywords ***
Open PetClinic
    ${chrome_options}=    Evaluate    
    ...    sys.modules['selenium.webdriver'].ChromeOptions()    sys
    Call Method    ${chrome_options}    add_argument    --headless=new
    Call Method    ${chrome_options}    add_argument    --no-sandbox
    Call Method    ${chrome_options}    add_argument    --disable-dev-shm-usage
    Call Method    ${chrome_options}    add_argument    --disable-gpu
    Call Method    ${chrome_options}    add_argument    --window-size\=1920,1080
    Call Method    ${chrome_options}    add_argument    --remote-debugging-port\=9222
    Create Webdriver    Chrome    options=${chrome_options}
    Go To    ${BASE_URL}
    Wait Until Element Is Visible    xpath=//a[@href="/owners/find"]    timeout=15s

Go To Add Owner Page
    Wait Until Element Is Visible    xpath=//a[@href="/owners/find"]
    Click Element    xpath=//a[@href="/owners/find"]
    Wait Until Element Is Visible    xpath=//a[@href="/owners/new"]
    Click Element    xpath=//a[@href="/owners/new"]

Go To Find Owner
    Wait Until Element Is Visible    xpath=//a[@href="/owners/find"]
    Click Element    xpath=//a[@href="/owners/find"]

Fill Owner Form
    [Arguments]    ${first}    ${last}    ${address}    ${city}    ${phone}
    Input Text    id=firstName    ${first}
    Input Text    id=lastName     ${last}
    Input Text    id=address      ${address}
    Input Text    id=city         ${city}
    Input Text    id=telephone    ${phone}

Fill LastName Owner
    [Arguments]    ${last}
    Input Text     id=lastName     ${last}

Submit Owner Form
    Click Button    xpath=//button[@type='submit']

Verify Owner Created
    [Arguments]    ${fullname}
    Wait Until Page Contains    ${fullname}    timeout=10s

Verify Owner In Results
    [Arguments]    ${last}
    Wait Until Element Is Visible    xpath=//table[@id='owners']    timeout=10s
    Page Should Contain    ${last}

Select Owner From Results
    [Arguments]    ${fullname}
    Wait Until Element Is Visible    xpath=//table[@id='owners']
    Click Link    ${fullname}

Go To Edit Owner Page
    [Arguments]    ${fullname}
    Go To Owner Page    ${fullname}
    Wait Until Element Is Visible    xpath=//a[contains(@href,'/edit')]
    Click Element    xpath=//a[contains(@href,'/edit')]

Edit Owner Form
    [Arguments]    ${field}    ${value}
    Clear Element Text    id=${field}
    Input Text    id=${field}    ${value}

Verify Owner Updated
    [Arguments]    ${value}
    Wait Until Page Contains    ${value}    timeout=10s

Close Browser Session
    Close Browser