*** Settings ***
Documentation         Test case for the valid user login
Library    SeleniumLibrary
Test Setup    Open the Browser with URL
Test Teardown    close the browser
Resource    ../Resources/GenericResources.robot
Resource    ../Resources/LoginResources.robot
Resource    ../Resources/DoctorResources.robot

*** Test Cases ***

Successful patient login by the default login credentials
    GenericResources.Click the login in button
    LoginResources.Fill the login form by default credentials for user role
    LoginResources.Verify the successfull login with valid credentials for user