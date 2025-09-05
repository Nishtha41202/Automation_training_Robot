*** Settings ***
Library    SeleniumLibrary
Library    Collections
Library    String
Library    XML
Resource    Product_Locators.robot
Resource    Login_Locators.robot

*** Variables ***
${URL}    https://www.amazon.in/

*** Keywords ***

Verify The Product Search
    Click Element    ${Search_field} 
    Input Text    ${Search_field}    iphone16 128gb teal
    Click Element    ${text_search_icon}

Expand The Product
    Wait Until Element Is Visible    ${result_heading}    ${Max_limit}
    Page Should Contain Element    ${phone_locator}
    Click Element    ${phone_locator}
    Switch Window    NEW

Add To Cart The Product And Verify
    Wait Until Element Is Visible    ${phone_locator}    ${Max_limit}
    Scroll Element Into View    ${Cart_locator_PDP}
    Page Should Contain Element    ${Buy_Now}
    Click Element    ${Cart_locator_PDP}
    Wait Until Element Is Visible    ${PDP_closebutton}    ${Max_limit}
    Click Element    ${PDP_closebutton}
    Element Should Be Visible    ${cart_count}
#    ${cartcount}=    Get Text    ${cart_count}
#    Should Be Equal As Integers    ${cartcount}    1
    
Navigate To The Cart Page
    Click Element    ${Cart}
    Wait Until Element Is Visible    ${Shoppingcart_heading}    ${Max_limit}
    Page Should Contain Element    ${phone_locator_cart}
    Page Should Contain Element    ${Proceed_to_buy}
    Sleep    10s
    
Verify The Product Details On PDP
    [Arguments]    ${product_dictionary}
    Wait Until Element Is Visible    ${product_title}    ${Max_limit}
    ${name}=    Get Text    ${product_title}
    ${stock}=    Get Text    ${Instock}
    ${price}=    Get Text    ${Product_price}
    ${color}=    Get Text    ${colorPDP}
    &{actual}=    Create Dictionary    name=${name}    stock=${stock}    price=${price}    color=${color}
    Dictionaries Should Be Equal    ${product_dictionary}    ${actual}

Click Proceed To Buy Button
    Click Element    ${Proceed_to_buy}
    Wait Until Element Is Visible    ${Deliverydetails}    ${Max_limit}
    Page Should Contain Element    ${heading_paymentmethod}

Add New Delivery Address Using Link And Verify
    Click Element    ${Change_address}
    Wait Until Element Is Visible    ${Select_delivery_heading}    ${Max_limit}
    Page Should Contain Element    ${Deliver_to_this_address}
    Page Should Contain Element    ${Order_total}
    Scroll Element Into View    ${Add_new_delivery_address}
    Click Element    ${Add_new_delivery_address}
    Wait Until Element Is Visible    ${pop-up_heading_addnewadd}    ${Max_limit}

Add New Address And Verify
    [Arguments]    ${add_address}
    Page Should Contain Element    ${Country_India}
    Wait Until Element Is Visible    ${Add_firstname}    ${Max_limit}
    Click Element    ${Add_firstname}
    Input Text    ${Add_firstname}    ${add_address}[Full name]
    Click Element    ${Add_phoneno}
    Input Text    ${Add_phoneno}    ${add_address}[Mobile number]
    Scroll Element Into View    ${pincode}
    Click Element    ${pincode}
    Input Text    ${pincode}    ${add_address}[Pincode]    
    Scroll Element Into View    ${Addline1}
    Click Element    ${Addline1}
    Input Text    ${Addline1}    ${add_address}[House no]
    Scroll Element Into View    ${Use_this_address}
    Click Element    ${Area}
    Input Text    ${Area}    ${add_address}[Area]
    Click Element    ${Landmark}
    Input Text    ${Landmark}    ${add_address}[Landmark]
    Click Element    ${City}
    Input Text    ${City}    ${add_address}[City]
    Click Element    ${State_dropdown}
    Click Element    ${Uttar_Pradesh}
    Click Element    ${Use_this_address}
    Wait Until Element Is Visible    ${Updated_deliveryname}     ${Max_limit}
    Wait Until Element Is Visible    ${Updated_Address}    ${Max_limit}

    ${add_text}=    Get Text    ${Updated_Address}
    @{add_list}=    Split String    ${add_text}    ,
    @{add_list}=    Evaluate    [x.replace(" ", "") for x in $add_list]
    Log    ${add_list}

    @{final_address}    Create List

    FOR    ${item}    IN    @{add_list}
        ${trim}=    Strip String    ${item}     characters=None
        Append To List    ${final_address}   ${trim}

    END

    Should Be Equal    ${add_list[0]}    ${add_address}[House no]
    Should Be Equal    ${add_list[1]}    ${add_address}[Area]
    Should Be Equal    ${add_list[2]}    ${add_address}[City]
    Should Be Equal    ${add_list[3]}    ${add_address}[State]
    Should Be Equal    ${add_list[4]}    ${add_address}[Pincode]
    Should Be Equal    ${add_list[5]}    India

Sign Out And Verify
    Click Element    ${application_logo}
    Mouse Over    ${acc_list}
    Wait Until Element Is Visible    ${Signout_link}    ${Max_limit}
    Click Element    ${Signout_link}
    Page Should Contain Element    ${Mobile_emailfield}


    



      


   



    
    








    

    


    
    
                    
        