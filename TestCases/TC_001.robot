*** Settings ***
Library  SeleniumLibrary

*** Variables ***
${Browser}  chrome
${URL}  https://www.google.com/

*** Test Cases ***
Google Search
    Given user is on Google
    When user clicks on search bar
    And user searches for hello
    Then result is hello

*** Keywords ***
User is on Google
    open browser  ${URL}  ${Browser}
    maximize browser window

User clicks on search bar
    wait until element is visible  xpath://input[@name='q']
    click element  xpath://input[@name='q']

User searches for hello
    press keys  xpath://input[@name='q']  hello
    press keys  xpath://input[@name='q']  ENTER

Result is hello
    wait until page contains element  xpath://h3[contains(.,'hello')]
    close browser