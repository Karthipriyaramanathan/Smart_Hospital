*** Settings ***
Documentation         Test case for the invalid bed status update
Library    SeleniumLibrary
Test Setup    Open the Browser with URL
Test Teardown    close the browser
Resource    ../Resources/GenericResources.robot
Resource    ../Resources/LoginResources.robot
Resource    ../Resources/DoctorResources.robot

*** Test Cases ***

Successfull update of bedstaus
    [Tags]    smoke
    GenericResources.Click the login in button
    LoginResources.Fill the successfull login form by clicking the doctor role
    LoginResources.Verify the successfull login with valid credentials for doctor
    DoctorResources.Unsuccessfull update of the bed status
    DoctorResources.Verify the unsuccessfull updation of the bed status