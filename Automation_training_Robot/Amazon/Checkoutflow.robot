*** Settings ***
Library    SeleniumLibrary
Resource    Login_resource.robot
Resource    Product_resource.robot

*** Keywords ***

*** Test Cases ***
Verify That User Is Able To Login Successfully
    Launch The Application
    Verify That User In On Home Page
    Verify That User Is Able To Navigate To Login Page
    Verify The Successfull Login

Verify That User Is Able To Search The Product And Add To Cart
    Verify The Product Search
    Expand The Product
    Verify The Product Details On PDP     ${iphone16details}
    Add To Cart The Product And Verify
    Navigate To The Cart Page

Verify The User Can Checkout From Cart Page
    Click Proceed To Buy Button
    Add New Delivery Address Using Link And Verify    
    Add New Address And Verify    ${address}
    Sign Out And Verify

Verify The Navigation To Mobiles & Accessories
    Launch The Application
    Verify That User In On Home Page
    Verify That User Is Able To Navigate To Login Page
    Verify The Successfull Login
    Navigate To Mobile Category
    Click On SubCategory And Select Brand
    Create Category Object Model
    Select Any Brand And Verify
    Verify That Products Related To The Selected Brand Should Appear
    Sign Out And Verify

Capture The Name And The Price In Hot New Release Carousal
    Launch The Application
    Verify That User In On Home Page
    Verify That User Is Able To Navigate To Login Page
    Verify The Successfull Login
    Fetch Carousal Items


















