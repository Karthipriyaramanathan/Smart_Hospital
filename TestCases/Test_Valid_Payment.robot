*** Settings ***
Documentation         Test case for the valid payment for a bill number
Library    SeleniumLibrary
Test Setup    Open the Browser with URL
Test Teardown    close the browser
Resource    ../Resources/GenericResources.robot
Resource    ../Resources/LoginResources.robot
Resource    ../Resources/UserResources.robot

*** Test Cases ***
Successfull payment for the bill search
    GenericResources.Click the login in button
    LoginResources.Fill the login form by default credentials for user role
    LoginResources.Verify the successfull login with valid credentials for user
    UserResources.Sucessfull search by bill number
    UserResources.Verify the successfull search by bill number
    UserResources.Successfull payment for the bill
    UserResources.Verify the successfull payment for the bill