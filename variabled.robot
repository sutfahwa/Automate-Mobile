*** Variables ***
${host}                localhost
${port}                4723
${platformName}        Android
${platformVersion}     13
${deviceName}          mobile_test
${appPath}             /Users/sutthasinee.wa/Automate-Mobile/Android.SauceLabs.Mobile.Sample.app.2.7.1.apk
${automationName}      UiAutomator2
${appActivity}         com.swaglabsmobileapp.SplashActivity
${appPackage}          com.swaglabsmobileapp

### Location ###
## Login page ##
${loginBtn}            accessibility_id=test-LOGIN
${usernameField}       accessibility_id=test-Username
${passwordField}       accessibility_id=test-Password
${errorMsg}            accessibility_id=test-Error message


## main page ##
${logoApp}            xpath=//android.widget.FrameLayout[@resource-id="android:id/content"]/android.widget.FrameLayout/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup[1]/android.widget.ImageView[2]
