*** Settings ***
Library        AppiumLibrary
Resource       ../Variabled/variabled.robot

*** Keywords ***
Open application Swag Lab
    Open Application    remote_url=http://${host}:${port}    platformName=${platformName}    appium:platformVersion=${platformVersion}    appium:deviceName=${deviceName}    appium:app=${appPath}    appium:automationName=${automationName}    appium:appActivity=${appActivity}    appium:appPackage=${appPackage}    appium:noReset=false         
    Wait Until Element Is Visible    ${loginBtn}
    Element Should Be Visible    ${loginBtn}

Fill in username field with "${username}"
    Wait Until Element Is Visible    ${usernameField}
    Click Element    ${usernameField}
    Input Text    ${usernameField}    ${username}

Fill in password field with "${password}"
    Wait Until Element Is Visible    ${passwordField}
    Click Element    ${passwordField}
    Input Password   ${passwordField}    ${password}

Click Login button
    Wait Until Element Is Visible    ${loginBtn}
    Click Element    ${loginBtn}

Display swag lab page
    Wait Until Element Is Visible    ${logoApp}
    Element Should Be Visible    ${logoApp}

Tab username "${username}" to autofill
    Wait Until Element Is Visible    //android.widget.TextView[@text="${username}"]
    Click Element    //android.widget.TextView[@text="${username}"]
    Element Should Contain Text    ${usernameField}    ${username}

Display error message "${error}"
    Wait Until Element Is Visible    //android.widget.TextView[@text="${error}"]
    Element Should Contain Text    //android.widget.TextView[@text="${error}"]    ${error}

