*** Settings ***
Documentation         Test case for the valid doctor login
Library    SeleniumLibrary
Test Setup    Open the Browser with URL
Test Teardown    close the browser
Resource    ../Resources/GenericResources.robot
Resource    ../Resources/LoginResources.robot
Resource    ../Resources/DoctorResources.robot

*** Test Cases ***

Successfull doctor login by clicking doctor login button
    GenericResources.Click the login in button
    LoginResources.Fill the successfull login form by clicking the doctor role
    LoginResources.Verify the successfull login with valid credentials for doctor

Successful patient login by the default login credentials
    GenericResources.Click the login in button
    LoginResources.Fill the login form by default credentials for user role
    LoginResources.Verify the successfull login with valid credentials for user


