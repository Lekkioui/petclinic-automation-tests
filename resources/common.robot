*** Settings ***
Library    SeleniumLibrary
Library    String

*** Keywords ***
Open PetClinic
    ${chrome_options}=    Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()    sys
    Call Method    ${chrome_options}    add_argument    --headless=new
    Call Method    ${chrome_options}    add_argument    --no-sandbox
    Call Method    ${chrome_options}    add_argument    --disable-dev-shm-usage
    Call Method    ${chrome_options}    add_argument    --disable-gpu
    Call Method    ${chrome_options}    add_argument    --window-size=1920,1080
    
    Open Browser    http://127.0.0.1:8080    chrome    options=${chrome_options}
    Maximize Browser Window
    Wait Until Page Contains    PetClinic    timeout=30s

Close Browser Session
    Close Browser