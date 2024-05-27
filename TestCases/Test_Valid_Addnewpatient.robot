*** Settings ***
Documentation         Test case to add new patient in the patient list
Library    SeleniumLibrary
Library    DataDriver    file=../TestData/NewPatientData.xlsx   sheet_name=Sheet1    encoding=utf_8      dialect=unix
Test Setup    Open the Browser with URL
Test Teardown    close the browser
Resource    ../Resources/GenericResources.robot
Resource    ../Resources/LoginResources.robot
Resource    ../Resources/DoctorResources.robot
Test Template    Successfull addition of new patient 



*** Test Cases ***

addition of new patient   ${patient_name}    ${guardian_name}    ${dob}    ${bloodgroup}    ${marital_status}    ${phone_number}    ${email}    ${address}    ${known_allergies}    ${TPA_ID}    ${TPA_Validity}    ${ni_number}    ${alternate_number}    # robotcode: ignore

*** Keywords ***
Successfull addition of new patient
    [Arguments]    ${patient_name}    ${guardian_name}    ${dob}    ${bloodgroup}    ${marital_status}    ${phone_number}    ${email}    ${address}    ${known_allergies}    ${TPA_ID}    ${TPA_Validity}    ${ni_number}    ${alternate_number}
    GenericResources.Click the login in button
    LoginResources.Fill the successfull login form by clicking the doctor role
    LoginResources.Verify the successfull login with valid credentials for doctor
    DoctorResources.Addition of new patient in the IPD inpatient with valid Credentials    ${patient_name}    ${guardian_name}    ${dob}    ${bloodgroup}    ${marital_status}    ${phone_number}    ${email}    ${address}    ${known_allergies}    ${TPA_ID}    ${TPA_Validity}    ${ni_number}    ${alternate_number}
    DoctorResources.Verify the successfull adding of new patient


