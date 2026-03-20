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