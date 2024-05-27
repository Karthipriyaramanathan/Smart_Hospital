*** Settings ***
Documentation         Test case for the valid system language change
Library    SeleniumLibrary
Test Setup    Open the Browser with URL
Test Teardown    close the browser
Resource    ../Resources/GenericResources.robot
Resource    ../Resources/LoginResources.robot
Resource    ../Resources/DoctorResources.robot


*** Test Cases ***

Successfull system language change
    GenericResources.Click the login in button
    LoginResources.Fill the successfull login form by clicking the doctor role
    LoginResources.Verify the successfull login with valid credentials for doctor
    DoctorResources.Change the valid system language
    DoctorResources.Verify the successfull sytem language change
    