*** Settings ***
Documentation         Test case for the invalid user login
Library    SeleniumLibrary
Test Setup    Open the Browser with URL
Test Teardown    close the browser
Resource    ../Resources/GenericResources.robot
Resource    ../Resources/LoginResources.robot
Resource    ../Resources/UserResources.robot

*** Test Cases ***
Unsucessfull doctor login using invalid login credentials
    [Tags]   smoke
    GenericResources.Click the login in button
    LoginResources.Fill the login form with login credentials for user    ${doctor_valid_username}    ${doctor_invalid_password}
    LoginResources.Verify the unsucessfull login with invalid credentials

Unsucessfull doctor login with blank username
    GenericResources.Click the login in button
    LoginResources.Fill the login form with login credentials for user     username=    password="sdfghj"
    LoginResources.Verify the unsucessfull login with the blank username

Unsucessfull doctor login with the blank password
    GenericResources.Click the login in button
    LoginResources.Fill the login form with login credentials for user    username="sonia@gmail.com"    password=
    LoginResources.Verify the unsucessfull login with the blank password