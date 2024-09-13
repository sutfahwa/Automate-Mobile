*** Settings ***
Library        AppiumLibrary
Resource       ../Variabled/variabled.robot
Resource       ../Variabled/addTocart_variables.robot

*** Keywords ***

Add Item name "${ItemName}" to cart
    Scroll Until Element Found //android.widget.TextView[@content-desc="test-Item title" and @text="${ItemName}"]
    Sleep  0.5s
    Wait Until Element Is Visible     ${productList}
    ${list}=    Get Matching Xpath Count    ${productList}
    Log    ${list}
    FOR  ${i}  IN RANGE  ${list}
        ${num}=    Evaluate    int(${i} + 1)
        ${text}=    Get Text   xpath=${productList}\[${num}]//android.view.ViewGroup//android.widget.TextView[2]
        Log    ${text}
        Exit For Loop IF	'${ItemName}' == '${text}'
    END
    Log    ${text}
    Click Element    xpath=(//android.view.ViewGroup[@content-desc="test-Item"])[${num}]//android.view.ViewGroup${addTOCartBtn}

Display Remove button below product "${ItemName}"
    Wait Until Element Is Visible     ${productList}
    ${list}=    Get Matching Xpath Count    ${productList}
    Log    ${list}
    FOR  ${i}  IN RANGE  ${list}
        ${num}=    Evaluate    int(${i} + 1)
        ${text}=    Get Text   xpath=${productList}\[${num}]//android.view.ViewGroup//android.widget.TextView[@content-desc="test-Item title"]
        Log    ${text}
        Exit For Loop IF	'${ItemName}' == '${text}'
    END
    Log    ${text}
    Wait Until Element Is Visible    xpath=${removeProductBtn}\[${num}]
    Element Should Be Visible    xpath=${removeProductBtn}\[${num}]

Scroll Until Element Found ${element_xpath}
    ${element_found}=    Run Keyword And Return Status    Element Should Be Visible    ${element_xpath}
    WHILE    '${element_found}' == 'False'
        FOR    ${index}    IN RANGE    10
            Scroll Down
            ${element_found}=    Run Keyword And Return Status    Element Should Be Visible    ${element_xpath}
            Log  ${element_found}
            Exit For Loop If    '${element_found}' == 'True'
            Log    Element not found after scrolling 10 times
        END
    END

Scroll Down
    ${x_start}=    Evaluate    int(${SCREEN_WIDTH} * 0.5)  #หน้าจอแนวนอนคิดเป็น 100% 0.5 = 50% คือจะเริ่มที่จุดกึ่งกลาง
    ${y_start}=    Evaluate    int(${SCREEN_HEIGHT} * 0.9)    #y start มากกว่าแสดงว่าเริ่มเลื่อนจากขอบล่างของจอไปที่ขอบบนของจอ โดยตำแหน่งอยู่ที่ 0.7 หรือ 70% ของจอ ก็ประมาณเกือบขอบๆ โดยเริ่มเลื่อนจากล่าง 70% ไปที่บนประมาณ 30% ของจอ
    ${x_end}=      Evaluate    int(${SCREEN_WIDTH} * 0.5)  #หน้าจอแนวนอนคิดเป็น 100% 0.5 = 50% คือจะเริ่มที่จุดกึ่งกลาง x เท่ากันเท่ากับจะเลื่อนขึ้นลง
    ${y_end}=      Evaluate    int(${SCREEN_HEIGHT} * 0.17)
    Swipe    ${x_start}    ${y_start}    ${x_end}    ${y_end}    500


Display number of product in cart with ${number}
    Wait Until Element Is Visible    ${titleMenuBar}${cartBtnMenuBar}
    ${getNumber}=    Get Text    ${titleMenuBar}${cartBtnMenuBar}//android.widget.TextView
    Should Be Equal    ${number}    ${getNumber}

Tab cart button in menu bar
    Wait Until Element Is Visible    ${titleMenuBar}${cartBtnMenuBar}
    Click Element    ${titleMenuBar}${cartBtnMenuBar}
    Wait Until Element Is Visible    ${listCart} 
    Element Should Be Visible    ${listCart}

### Cart List
Display product "${productName}" in cart list row ${rowNumber}
    Wait Until Element Is Visible        ${productListInCartList}
    Scroll Until Element Found //android.widget.TextView[@text="${productName}"]
    Sleep  0.5s
    ${list}=    Get Matching Xpath Count    ${productListInCartList}
    ${text}=    Get Text   xpath=${productListInCartList}//android.view.ViewGroup[@content-desc="test-Description"]\[${rowNumber}]//android.widget.TextView[1]
    Log    ${text}
    Should Be Equal    ${text}    ${productName}

Delete product "${productName}" in cart list row ${rowNumber}
    Wait Until Element Is Visible        ${productListInCartList}
    Scroll Until Element Found //android.widget.TextView[@text="${productName}"]
    Sleep  0.5s
    ${list}=    Get Matching Xpath Count    ${productListInCartList}
    ${text}=    Get Text   xpath=${productListInCartList}//android.view.ViewGroup[@content-desc="test-Description"]\[${rowNumber}]//android.widget.TextView[1]
    Log    ${text}
    Should Be Equal    ${text}    ${productName}
    Wait Until Element Is Visible    xpath=//android.view.ViewGroup[@content-desc="test-REMOVE"][${rowNumber}]
    Click Element    xpath=//android.view.ViewGroup[@content-desc="test-REMOVE"][${rowNumber}]

Click Remove button below product "${ItemName}"
    Wait Until Element Is Visible     ${productList}
    ${list}=    Get Matching Xpath Count    ${productList}
    Log    ${list}
    FOR  ${i}  IN RANGE  ${list}
        ${text}=    Get Text   xpath=${productList}\[${i}+1]//android.view.ViewGroup//android.widget.TextView[@content-desc="test-Item title"]
        Log    ${text}
        Exit For Loop IF	'${ItemName}' == '${text}'
    END
    Log    ${text}
    Wait Until Element Is Visible    xpath=${removeProductBtn}\[${i}+1]
    Click Element    xpath=${removeProductBtn}\[${i}+1]

Display Add to cart button below product name "${ItemName}"
    Scroll Until Element Found //android.widget.TextView[@content-desc="test-Item title" and @text="${ItemName}"]
    Sleep  0.5s
    Wait Until Element Is Visible     ${productList}
    ${list}=    Get Matching Xpath Count    ${productList}
    Log    ${list}
    FOR  ${i}  IN RANGE  ${list}
        ${text}=    Get Text   xpath=${productList}\[${i}+1]//android.view.ViewGroup//android.widget.TextView[@content-desc="test-Item title"]
        Log    ${text}
        Exit For Loop IF	'${ItemName}' == '${text}'
    END
    Log    ${text}
    Wait Until Element Is Visible    xpath=${addTOCartBtn}\[${i}+1]
    Element Should Be Visible    xpath=${addTOCartBtn}\[${i}+1]

Not display product "${productName}" in cart list
    Wait Until Element Is Visible        ${productListInCartList}
    ${list}=    Get Matching Xpath Count    ${productListInCartList}    
    Log    ${list}
    FOR  ${i}  IN RANGE  ${list}
        ${text}=    Get Text   xpath=${productListInCartList}//android.view.ViewGroup[@content-desc="test-Description"]\[${i}+1]//android.widget.TextView[1]
        Log    ${text}
        Exit For Loop IF	'${productName}' == '${text}'
        Log    Product not found in list

    END

Click Item name "${ItemName}" for see detail
    Scroll Until Element Found //android.widget.TextView[@content-desc="test-Item title" and @text="${ItemName}"]
    Sleep  0.5s
    Wait Until Element Is Visible     ${productList}
    ${list}=    Get Matching Xpath Count    ${productList}
    Log    ${list}
    FOR  ${i}  IN RANGE  ${list}
        ${num}=    Evaluate    int(${i} + 1)
        ${text}=    Get Text   xpath=${productList}\[${num}]//android.view.ViewGroup//android.widget.TextView[2]
        Log    ${text}
        Exit For Loop IF	'${ItemName}' == '${text}'
    END
    Log    ${text}
    Click Element    xpath=${productList}\[${num}]//android.view.ViewGroup//android.widget.TextView[2]

Display product detail page
    Wait Until Element Is Visible    ${productDetail}
    Element Should Be Visible    ${productDetail}

Display product name "${name}" in detail page
    Wait Until Element Is Visible    ${productTitle}
    Element Text Should Be    ${productTitle}    ${name}

Display price of product with "${price}" in detail page
    Wait Until Element Is Visible    ${producrPrice}
    Element Text Should Be    ${producrPrice}   ${price}

Click Add to cart button in product detail
    Wait Until Element Is Visible    ${addProductBtn}
    Element Should Be Visible    ${addProductBtn}
    Click Element    ${addProductBtn}

Change view of product
    Wait Until Element Is Visible    ${changeView}
    Element Should Be Visible    ${changeView}
    Click Element    ${changeView}

Display product list
    Wait Until Element Is Visible    //android.widget.ScrollView[@content-desc="test-PRODUCTS"]    20s
    Element Should Be Visible    //android.widget.ScrollView[@content-desc="test-PRODUCTS"]

Select Item name "${productName}" in list product to cart
    Sleep  0.5s
    Wait Until Element Is Visible     //android.widget.ScrollView[@content-desc="test-PRODUCTS"]
    ${list}=    Get Matching Xpath Count    (//android.view.ViewGroup[@content-desc="test-Item"])
    Log    ${list}
    FOR  ${i}  IN RANGE  ${list}
        ${num}=    Evaluate    int(${i} + 1)
        ${text}=    Get Text   xpath=(//android.view.ViewGroup[@content-desc="test-Item"])[${num}]//android.widget.TextView[1]
        Log    ${text}
        Exit For Loop IF	'${productName}' == '${text}'
    END
    Log    ${text}
    Click Element    xpath=(//android.widget.TextView[@text="+"])[${num}]
    



