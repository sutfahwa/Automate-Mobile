*** Variables ***


## Product list ##
${productList}         //android.view.ViewGroup[@content-desc="test-Item"]
${addTOCartBtn}        //android.view.ViewGroup[@content-desc="test-ADD TO CART"]
${removeProductBtn}    (//android.view.ViewGroup[@content-desc="test-REMOVE"])
${titleMenuBar}        //android.widget.FrameLayout[@resource-id="android:id/content"]/android.widget.FrameLayout/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup[1]
${cartBtnMenuBar}      //android.view.ViewGroup[@content-desc="test-Cart"]/android.view.ViewGroup
${listCart}            //android.widget.ScrollView[@content-desc="test-Cart Content"]
${productListInCartList}    //android.view.ViewGroup[@content-desc="test-Item"]
${dragToCart}          //android.view.ViewGroup[@content-desc="test-Drag Handle"]
${dropZone}            accessibility_id=test-Cart drop zone
${changeView}          accessibility_id=test-Toggle
${productListPage}     accessibility_id=test-PRODUCTS

## Product detail ##
${productDetail}    //android.view.ViewGroup[@content-desc="test-Inventory item page"]
${productTitle}     //android.view.ViewGroup[@content-desc="test-Inventory item page"]//android.view.ViewGroup[@content-desc="test-Description"]//android.widget.TextView[1]
${producrPrice}     accessibility_id=test-Price
${addProductBtn}    accessibility_id=test-ADD TO CART
