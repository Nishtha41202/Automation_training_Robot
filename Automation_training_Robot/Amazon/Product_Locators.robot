*** Variables ***
${Search_field}    //input[@id="twotabsearchtextbox"]
${text_search_icon}    //input[@id="nav-search-submit-button"]
${phone_locator}    (//span[contains(text(),"iPhone 16 128 GB")])[1]
${result_heading}    //h2[text()="Results"]
${Buy_Now}    //input[@id="buy-now-button"]
${Cart_locator_PDP}    (//input[@id="add-to-cart-button"])[2]
${PDP_closebutton}    //a[@class="a-link-normal attach-close-button"]
${cart_count}    //span[@id="nav-cart-count"]
${Cart}    //a[@id="nav-cart"]
${Shoppingcart_heading}    //h2[contains(text(),"Shopping Cart")]
${Proceed_to_buy}    //input[@name="proceedToRetailCheckout"]
${phone_locator_cart}    //span[contains(text(),"iPhone 16 128 GB")]
${product_title}    //span[@id="productTitle"]
${Instock}    //*[@id="availability"]//span
${Product_price}    //div[@id="corePriceDisplay_desktop_feature_div"]//span[@class="a-price-whole"]
${colorPDP}    //span[@id="inline-twister-expanded-dimension-text-color_name"]
${Shoppingcart_heading}    //h2[contains(text(),"Shopping Cart")]
${Proceed_to_buy}    //input[@name="proceedToRetailCheckout"]
${phone_locator_cart}    //span[contains(text(),"iPhone 16 128 GB")]
${Deliverydetails}    //h2[contains(text(),"Delivering to Nishtha")]
${heading_paymentmethod}    (//h2[contains(text(),"Payment method")])[2]
${Change_address}    //a[@data-csa-c-slot-id="checkout-change-shipaddressselect"]
${Select_delivery_heading}    (//h2[contains(text(),"Select a delivery address")])[2]
${Add_new_delivery_address}    //a[@id="add-new-address-desktop-sasp-tango-link"]
${Deliver_to_this_address}    //span[@id="checkout-primary-continue-button-id-announce"]
${Order_total}    //td[@class="a-color-base a-size-medium grand-total-cell a-text-bold"]//span
${pop-up_heading_addnewadd}    //h2[text()="Enter a new delivery address"]
${Country_India}    //span[text()="India"]
${Add_firstname}    //input[@id="address-ui-widgets-enterAddressFullName"]
${Add_phoneno}    //input[@id="address-ui-widgets-enterAddressPhoneNumber"]
${pincode}    //input[@id="address-ui-widgets-enterAddressPostalCode"]
${Addline1}    //input[@id="address-ui-widgets-enterAddressLine1"]
${Use_this_address}    (//span[@id="checkout-primary-continue-button-id"])[2]
${Area}    //input[@id="address-ui-widgets-enterAddressLine2"]
${Landmark}    //input[@id="address-ui-widgets-landmark"]
${City}    //input[@id="address-ui-widgets-enterAddressCity"]
${State_dropdown}    (//span[@class="a-dropdown-prompt"])[2]
${Uttar_Pradesh}    //a[text()="UTTAR PRADESH"]
${Updated_deliveryname}    //h2[contains(text(),"Delivering to")]
${Updated_Address}    //span[@id="deliver-to-address-text"]



&{iphone16details}
...    name=iPhone 16 128 GB: 5G Mobile Phone with Camera Control, A18 Chip and a Big Boost in Battery Life. Works with AirPods; Teal    
...    stock=In stock
...    price=69,999 
...    color=Teal

&{address}
...     Full name=Nishtha Bhardwaj
...     Mobile number=9009009009
...     Pincode=201301
...     House no=C-108
...     Area=Sector61
...     Landmark=Near Shopprix Mall
...     City=Noida
...     State=UTTARPRADESH

@{Expected_Categories}
...     Electronics
...     Mobiles & Accessories
...     Mobile Accessories
...     Mobile Broadband Device
...     SIM Cards
...     Smartphones & Basic Mobiles
...     Smartwatches




