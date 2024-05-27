*** Settings ***
Documentation    A User page resource file with reusable keywords and variables.
Library    SeleniumLibrary

*** Variables ***
${pharmacy_bill_search_field}    css:input[type="search"]
${show_field}    css:i[class="fa fa-reorder"]
${pay_button}    css:button[class="btn btn-primary btn-xs"]
${view_payment_option}    css:a[class="btn btn-default view_payment btn-xs"]
${payment_amount_field}    css:input[id="amount_total_paid"]
${add_pay_button}    css:button[id="pay_button"]
${paywithcard_button}    css:button[class="stripe-button-el"]
${payment_email_field}    css:div[class="emailInput input"] input[id='email']
${payment_cardnumber_field}    css:input[id="card_number"]
${card_expiry_date_field}    css:input[id="cc-exp"]
${card_cvv_field}    css:input[id="cc-csc"]
${final_pay_button}    css:button[id="submitButton"]
${pharmacy_option}    xpath://i[@class="fas fa-mortar-pestle"]//parent::a
${pharmacy_bill_record_assert}    css:div[id="DataTables_Table_0_info"]
${pharmacy_view_details}    xpath://a[@class="btn btn-default btn-xs"]
${view_detail_assert}    xpath://h5[text()='Bill No : PHARMAB307']
${norecord}    xpath://td[@class="dataTables_empty"]
${card_pincode}    css:input[id="billing-zip"]
${successfull_payment_alert}    css:div[class="alert alert-success alert-dismissible"] h4 i

*** Keywords ***
Sucessfull search by bill number
    Click Link    ${pharmacy_option}
    Wait Until Element Is Enabled    ${pharmacy_bill_search_field}
    Input Text    ${pharmacy_bill_search_field}    PHARMAB307

Unsuccessfull search by bill number
    Click Link    ${pharmacy_option}
    Wait Until Element Is Enabled    ${pharmacy_bill_search_field}
    Input Text    ${pharmacy_bill_search_field}    lkjhgfcvb

Verify the successfull search by bill number
    Wait Until Element Is Visible    ${pharmacy_bill_record_assert}
    Should Not Contain    ${pharmacy_bill_record_assert}    Records: 0 to 0 of 0

Verify the unsuccessfull search by bill number
    Wait Until Element Is Visible    ${pharmacy_bill_record_assert} 
    Element Text Should Be    ${pharmacy_bill_record_assert}    Records: 0 to 0 of 0 (filtered from 10 total records)

Successfull view of the bill details
    Wait Until Element Is Enabled    ${pharmacy_view_details}
    Click Link    ${pharmacy_view_details}

Verify the successfull view of the bill details
    Wait Until Element Is Visible    ${view_detail_assert}
    Element Text Should Be    ${view_detail_assert}    Bill No : PHARMAB307

verify the unsuccessfull view of the bill details
    Wait Until Element Is Visible    ${view_detail_assert}
    Element Text Should Not Be    ${view_detail_assert}    Bill No : PHARMAB307

Successfull payment for the bill
    Click Button    ${pay_button}
    Click Button    ${add_pay_button}
    Click Button    ${paywithcard_button}
    Wait Until Element Is Enabled    ${payment_email_field}
    Input Text    ${payment_email_field}    olivier@gmail.com
    Input Text    ${payment_cardnumber_field}    6555900000604105
    Input Text    ${card_expiry_date_field}    08/30
    Input Text    ${card_cvv_field}    345
    Input Text    ${card_pincode}    345678
    Click Button    ${final_pay_button}

Verify the successfull payment for the bill
    Wait Until Element Is Visible    ${successfull_payment_alert}
    Should Contain    ${successfull_payment_alert}     Success 
    
    


    

    