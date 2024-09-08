*** Settings ***
Library         AppiumLibrary
Resource        ../Variabled/variabled.robot
Resource        ../Keyword/commond_keyword.robot
Resource        ../Keyword/addToCart_keyword.robot


Suite Setup     Set Appium Timeout  10

Test Setup       Run keywords
...              Open application Swag Lab
...    AND       Tab username "standard_user" to autofill
...    AND       Click Login button
...    AND       Display swag lab page

Test Teardown    Run Keywords
...              Close Application


*** Test Cases ***
Scenario: Add Item to cart
    Add Item name "Sauce Labs Onesie" to cart
    Display Remove button below product "Sauce Labs Onesie"
    Display number of product in cart with 1
    Tab cart button in menu bar
    Display product "Sauce Labs Onesie" in cart list row 1

Scenario: Add Item to cart and remove 
    Add Item name "Sauce Labs Backpack" to cart
    Display Remove button below product "Sauce Labs Backpack"
    Display number of product in cart with 1
    Display Add to cart button below product name "Sauce Labs Backpack"
    Add Item name "Sauce Labs Bike Light" to cart
    Display number of product in cart with 2
    Click Remove button below product "Sauce Labs Backpack"
    Display number of product in cart with 1
    Tab cart button in menu bar
    Not display product "Sauce Labs Backpack" in cart list
    Display product "Sauce Labs Bike Light" in cart list row 1

Scenario: Add Item to cart in detail page
    Click Item name "Sauce Labs Backpack" for see detail
    Display product detail page
    Display product name "Sauce Labs Backpack" in detail page
    Display price of product with "$29.99" in detail page
    Click Add to cart button in product detail
    Display number of product in cart with 1
    Tab cart button in menu bar
    Display product "Sauce Labs Backpack" in cart list row 1

Sceanrio: Add Item to cart by select in list view
    Change view of product
    Select Item name "Sauce Labs Bolt T-Shirt" in list product to cart
    Display number of product in cart with 1
    Tab cart button in menu bar
    Display product "Sauce Labs Bolt T-Shirt" in cart list row 1












