*** Settings ***
Documentation         Test case for the invalid doctor login
Library    SeleniumLibrary
Test Setup    Open the Browser with URL
Test Teardown    close the browser
Resource    ../Resources/GenericResources.robot
Resource    ../Resources/LoginResources.robot
Resource    ../Resources/DoctorResources.robot

*** Test Cases ***

Unsucessfull doctor login using invalid login credentials
    GenericResources.Click the login in button
    LoginResources.Fill the login form with login credentials for doctor    ${doctor_valid_username}    ${doctor_invalid_password}
    LoginResources.Verify the unsucessfull login with invalid credentials

Unsucessfull doctor login by clicking invalid user role 
    GenericResources.Click the login in button
    LoginResources.Fill the unsuccessfull login form by clicking the doctor role
    LoginResources.Verify the unsuccessfull login with valid credentials for doctor

Unsucessfull doctor login with blank username and password
    GenericResources.Click the login in button
    LoginResources.Click the admin login button
    LoginResources.Click the signin button
    LoginResources.Verify the unsuccessfull login with blank credentials

Unsucessfull doctor login with blank username
    GenericResources.Click the login in button
    LoginResources.Fill the login form with login credentials for doctor     username=    password="sdfghj"
    LoginResources.Verify the unsucessfull login with the blank username

Unsucessfull doctor login with the blank password
    GenericResources.Click the login in button
    LoginResources.Fill the login form with login credentials for doctor    username="sonia@gmail.com"    password=
    LoginResources.Verify the unsucessfull login with the blank password