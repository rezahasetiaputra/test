*** Settings ***
Library     SeleniumLibrary    5   run_on_failure=NONE
Library     XvfbRobot
Library     Collections
Library     String
Library     DebugLibrary

Resource    logics/_LOGICS_IMPORT.robot
Resource    pages/_PAGES_IMPORT.robot
Resource    test_data.robot

*** Keywords ***
Open Web
  [Arguments]           ${url}
  Close All Browsers
  Run Keyword If                         '${VIRTUAL_DISPLAY}'=='true'               VirtualDisplay          ${url}
  ...                  ELSE              GUIDisplay           ${url}
  Maximize Browser Window
  # Set Window Size          1800      1200

GUIDisplay
  [Arguments]           ${url}
  ${chrome_options} =     Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()    sys, selenium.webdriver
  Call Method    ${chrome_options}   add_argument         --disable-web-security
  ${options}=    Call Method         ${chrome_options}    to_capabilities
  Open Browser   url=${url}          browser=Chrome       alias=TV         desired_capabilities=${options}

VirtualDisplay
  [Arguments]           ${url}
  # Start Virtual Display   1920    1080
  ${chrome_options} =     Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()    sys, selenium.webdriver
  Call Method    ${chrome_options}   add_argument    headless
  Call Method    ${chrome_options}   add_argument    disable-gpu
  Call Method    ${chrome_options}   add_argument    --disable-web-security
  ${options}=     Call Method     ${chrome_options}    to_capabilities
  Open Browser                           url=${url}    browser=Chrome   alias=TV            desired_capabilities=${options}
