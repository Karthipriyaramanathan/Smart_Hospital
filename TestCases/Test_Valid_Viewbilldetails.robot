*** Settings ***
Documentation         Test case for the valid view bill details
Library    SeleniumLibrary
Test Setup    Open the Browser with URL
Test Teardown    close the browser
Resource    ../Resources/GenericResources.robot
Resource    ../Resources/LoginResources.robot
Resource    ../Resources/UserResources.robot

*** Test Cases ***
Successfull search for a bill using bill number
    GenericResources.Click the login in button
    LoginResources.Fill the login form by default credentials for user role
    LoginResources.Verify the successfull login with valid credentials for user
    UserResources.Sucessfull search by bill number
    UserResources.Verify the successfull search by bill number
    UserResources.Successfull view of the bill details
    UserResources.Verify the successfull view of the bill details