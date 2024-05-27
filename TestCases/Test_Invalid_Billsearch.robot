*** Settings ***
Documentation         Test case for the Invalid search for a bill using bill number
Library    SeleniumLibrary
Test Setup    Open the Browser with URL
Test Teardown    close the browser
Resource    ../Resources/GenericResources.robot
Resource    ../Resources/LoginResources.robot
Resource    ../Resources/UserResources.robot

*** Test Cases ***
Unsuccessfull search for a bill using bill number
    GenericResources.Click the login in button
    LoginResources.Fill the login form by default credentials for user role
    LoginResources.Verify the successfull login with valid credentials for user
    UserResources.Unsuccessfull search by bill number
    UserResources.Verify the unsuccessfull search by bill number