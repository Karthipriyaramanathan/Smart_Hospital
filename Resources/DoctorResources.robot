*** Settings ***
Documentation    A Doctor page resource file with reusable keywords and variables.
Library    SeleniumLibrary

*** Variables ***
${Dashboard}    css:i[class="fas fa-television"]
${Appointment}    xpath://i[@class='fa fa-calendar-check-o']//following-sibling::span
${IPD_in_patient}    xpath://i[@class="fas fa-procedures"]//parent::a
${notification_icon}    xpath://i[@class="fa fa-bell-o"]//parent::a
${language_icon}    xpath://button[@class="btn dropdown-toggle selectpicker btn-default"]
${betstatus_icon}    xpath://i[@class="fas fa-bed cal15"]//parent::a

${delete_notification_button}    xpath://i[@class="fa fa-trash"]//parent::button

${valid_hindi_language}    xpath://a[normalize-space()='Hindi']
${invalid_hindi_language}    xpath://a[normalize-space()='Spanish']
${add_patient_button}    css:a[id="addp"]
${new_patient_button}    css:a[id="addpip"]
${name_field}    css:input[id="name"]
${guardian_name_field}    css:div[class="col-lg-6 col-md-6 col-sm-6"] input[name="guardian_name"]
${dob_field}    xpath://div[@class="col-sm-4"]//input[@name="dob"]
${blood_group_field}    css:div[class="col-sm-3"] select[name="blood_group"]
${blood_group_field_specific}    css:div[class="col-sm-3"] select[name="blood_group"] option
${marital_status_field}    css:div[class="col-sm-3"] select[id="marital_status"]
${phone_number_field}    css:input[id="number"]
${email_field}    css:input[id="addformemail"]
${address_field}    css:input[name="address"]
${remarks}    css:textarea[id="note"]
${known_allergies_field}    css:div[class="col-lg-12 col-md-12 col-sm-12"] textarea[name="known_allergies"]
${TPA_ID_field}    css:input[name="insurance_id"]
${TPA_validity_field}    css:input[name="validity"]
${national_identity_number_field}    css:input[name="identification_number"]
${alternate_number_field}    css:input[id="custom_fields[patient][3]"]
${save_button}    css:button[id="formaddpabtn"]

${addnewpatient_validalert}    css:div[class='toast-message']
${addnewpatient_invalidalert}    css:div[class='toast-message'] p

${select_consultant_amith}    xpath://div[@class="col-sm-6"]//select[@name="consultant_doctor"]//option[@value='11']
${select_consultant_choice}    xpath://span[@id="select2-consultant_doctor-container"]
${consultant_input_field}    xpath://input[@class="select2-search__field"]
${bed_145}    xpath://div[text()='FF - 145']
${bed_status_save_button}    xpath://button[@id="formaddbtn"]
${admisstion_date_field}    xpath://input[@id="admission_date"]

*** Keywords ***

Change the valid system language
    Wait Until Element Is Enabled    ${language_icon}
    Click Button    ${language_icon}
    #Select From List By Value    //a[normalize-space()='Hindi']    Hindi
    Click Link    ${valid_hindi_language}

Change the invalid system language
    Wait Until Element Is Enabled    ${language_icon}
    Click Button    ${language_icon}
    #Select From List By Value    //a[normalize-space()='Hindi']    Hindi
    Click Link    ${invalid_hindi_language}

Addition of new patient in the IPD inpatient with valid Credentials
    [Arguments]    ${patient_name}    ${guardian_name}    ${dob}    ${bloodgroup}    ${marital_status}    ${phone_number}    ${email}    ${address}    ${known_allergies}    ${TPA_ID}    ${TPA_Validity}    ${ni_number}    ${alternate_number}
    Click Link    ${IPD_in_patient}
    Click Link    ${add_patient_button}
    Click Link    ${new_patient_button}
    Input Text    ${name_field}    ${patient_name}
    Input Text    ${guardian_name_field}    ${guardian_name}
    Input Text    ${dob_field}    ${dob}
   # Click Element    ${blood_group_field}
    #Input Text    ${blood_group_field}    ${bloodgroup}
    #Select From List By Value    ${blood_group_field_specific}    ${bloodgroup}
    #Click Element   ${marital_status_field}
    #Input Text    ${marital_status_field}    ${marital_status}
    #Select From List By Value    ${marital_status_field}    ${marital_status}
    Input Text    ${phone_number_field}    ${phone_number}
    Input Text    ${email_field}    ${email}
    Input Text    ${address_field}    ${address}
    Input Text    ${known_allergies_field}    ${known_allergies}
    Input Text    ${TPA_ID_field}    ${TPA_ID}
    Input Text    ${TPA_validity_field}    ${TPA_Validity}
    Input Text    ${national_identity_number_field}    ${ni_number}
    Input Text    ${alternate_number_field}    ${alternate_number}
    Click Button    ${save_button}

View the notification messages
    Click Link    ${notification_icon}

Delete the all notification message
    Click Link    ${notification_icon}
    Click Button    ${delete_notification_button}
    Alert Should Be Present

Verify the successfull sytem language change
    Wait Until Element Is Enabled    ${language_icon}
    ${result}=    Get Text    ${language_icon}
    Should Contain    ${result}    Hindi

Verify the unsuccessfull sytem language change
    Wait Until Element Is Enabled    ${language_icon}
    ${result}=    Get Text    ${language_icon}
    Should Not Contain  ${result}    Hindi

Verify sucsessfull deletion of all notification messages
    Click Link    ${notification_icon}
    Element Text Should Be    css:div[class="alert alert-danger"]    No Record Found

Verify unsuccessfull deletion of all notification messages
    Click Link    ${notification_icon}
    Element Text Should Not Be    css:div[class="alert alert-danger"]    No Record Found

Verify the successfull adding of new patient 
    Element Text Should Be    ${addnewpatient_validalert}    Record Saved Successfully

Verify the unsuccessfull addition of new patient
    Element Text Should Be    ${addnewpatient_invalidalert}    The Name field is required. 

Successfull selection of a bed
    Click Link    ${betstatus_icon}
    Click Link    ${bed_145}
    Click Element    ${admisstion_date_field}
    Click Element    ${select_consultant_choice}
    Input Text    ${consultant_input_field}    Amit  Singh (9009)
    Click Button    ${bed_status_save_button}

verify the successfull selection of a bed
    Click Link    ${betstatus_icon}
    Click Link    ${bed_145}


