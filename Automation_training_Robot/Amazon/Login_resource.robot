*** Settings ***
Library    SeleniumLibrary
Resource        Locators.robot
Resource        MobileCategory_Locators.robot

*** Variables ***
${URL}    https://www.amazon.in/

*** Keywords ***
Launch The Application
    Open Browser    ${URL}    chrome
    Maximize Browser Window
    Title Should Be    Online Shopping site in India: Shop Online for Mobiles, Books, Watches, Shoes and More - Amazon.in

Verify That User In On Home Page
    Page Should Contain Element    ${application_logo}    ${Max_limit}
    Mouse Over    ${acc_list}
    Wait Until Element Is Visible    ${Signin_button}    ${Max_limit}
    
Verify That User Is Able To Navigate To Login Page
    Click Element    ${Signin_button}
    Wait Until Element Is Visible    ${Continue_button}    ${Max_limit}
    Click Element    ${Mobile_emailfield}

Verify The Successfull Login
    Input Text    ${Mobile_emailfield}    9817413443
    Wait Until Element Is Visible    ${countrycode}    ${Max_limit}
    Click Element    ${Continue_button}
    Wait Until Element Is Visible    ${passwordtext}    ${Max_limit}
    Click Element    ${Password_field}
    Input Text    ${Password_field}    Nishth@4
    Click Element    ${submit}
    Wait Until Element Is Visible    ${application_logo}    ${Max_limit}
    Element Should Be Visible    ${Loggedin_user}
    Mouse Over     ${acc_list}
    Page Should Contain Element    ${Signout_link}

Navigate To Mobile Category
    Click Element    ${Hamburger}
    Wait Until Element Is Visible    ${Hello_popup}    ${Max_limit}
    Element Should Be Visible    ${Trending_heading}
    Element Should Be Visible    ${Digital_content}
    Scroll Element Into View    ${Shop_by_category}
    Click Element    ${Mobile_Computers}

Click On SubCategory And Select Brand
    Wait Until Element Is Visible    ${All_Mobile_phones}
    ${element}=    Get WebElement    ${All_Mobile_phones}    
    Execute JavaScript    arguments[0].click();    ARGUMENTS    ${element}
    Page Should Contain Element    ${Prime_checkbox}

Create Category Object Model
    Wait Until Element Is Visible    ${category_text_locators}    ${Max_limit}
    ${category_list}=    Get WebElements    ${category_text_locators}
    FOR    ${list_element}    IN    ${category_list}
        ${category_text}=    Get Text    ${list_element}
        Log    ${category_text}
        Should Contain   ${Expected_Categories}    ${category_text}
    END

#    Lists Should Be Equal

Select Any Brand And Verify
    Scroll Element Into View    ${Brands}
    Scroll Element Into View    ${Apple}
    ${element}=    Get WebElement    ${Apple}
    Execute JavaScript    arguments[0].click();    ARGUMENTS    ${element}
    Wait Until Element Is Visible    ${Results_brand}

Verify That Products Related To The Selected Brand Should Appear
    @{Brand_names_list}=    Create List
    Wait Until Page Contains Element    ${Specific_Brand_Product_Title}    ${Max_limit}
    @{One_Brand_Products}=    Get WebElements    ${Specific_Brand_Product_Title}
    FOR    ${product_name}    IN    @{One_Brand_Products}
        ${Brand_product_name}=    GetText    ${product_name}
        Append To List    ${Brand_names_list}    ${Brand_product_name}            
    END
#    Should Contain    @{Brand_names_list}    ${Brand_name}
    
    FOR    ${item}    IN    @{Brand_names_list}
#        ${status}    Run Keyword And Return Status        Should Contain    '${item}'    '${Brand_product_name}'
#        Run Keyword If        ${status}       Exit For Loop
         Should Contain    ${item}    ${Brand_name}
    END

    Log    ${Brand_names_list}

Navigate To New Releases
    Click Element    ${Hamburger}
    Wait Until Element Is Visible    ${Hello_popup}    ${Max_limit}
    Element Should Be Visible    ${Trending_heading}
    Wait Until Element Is Visible    ${New_Releases}    ${Max_limit}
    Click Element    ${New_Releases}
    Wait Until Element Is Visible    ${Amazon_Hot_New_Releases}    ${Max_limit}
    Wait Until Element Is Visible    ${Carousal_name}

Fetch Carousal Items
    @{names}=    Create List    ${Carousal_name}
    @{price}=    Create List    ${Carousal_price}
    @{rating}=    Create List    ${Carousal_rating}

    @{Carousal_list}=    Create List
    FOR    ${index}    IN    IN RANGE    0    ${len(${names})}
        ${names}=    Get Text    ${names}[${index}]
        ${price}=    Get Text    ${price}[${index}]
        ${rating}=    Get Text    ${rating}[${index}]
        
        ${Carousal_all_items}=    Create List    ${name}    ${price}    ${rating}
        Append To List    ${Carousal_list}    ${item}

    END
    
        Lists Should Be Equal    ${Carousal_list}    ${Carousal_all_items}
        Log To Console    ${Carousal_list}


    



    




    


    




    


    





    

    