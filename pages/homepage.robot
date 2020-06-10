*** Keywords ***
Verify in HomePage
  Wait Until Page Contains     Read the guide

Select Plus
  Wait Until Page Contains Element    css=.octicon.octicon-plus
  Click Element                       css=.octicon.octicon-plus

Select New Gist
  Wait Until Page Contains Element    xpath=//a[@class="dropdown-item"][contains(text(),"New gist")]    timeout=3
  Click Element                       xpath=//a[@class="dropdown-item"][contains(text(),"New gist")]
