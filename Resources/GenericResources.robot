*** Settings ***
Documentation    A resource file with reusable keywords and variables.
Library    SeleniumLibrary

*** Variables ***
${url}    https://demo.smart-hospital.in/
${login_button}   //i[@class="fa fa-user"]//parent::a 


*** Keywords ***
Open the browser with url
    Create Webdriver    Chrome
    Go To   ${url}    
    Maximize Browser Window
    Set Selenium Implicit Wait    5
    
Close the browser
    Close Browser

Click the login in button
    Click Element    ${login_button}