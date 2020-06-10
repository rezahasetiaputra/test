*** Keywords ***
Verify File Created With Name
  [arguments]       ${filename}
  Wait Until Page Contains Element    xpath=//a[@class="css-truncate"]//strong[contains(text(),"${filename}")]

Verify Description Gist Created
  [arguments]       ${desc}
  Wait Until Page Contains Element    xpath=//div[@itemprop="about"][contains(text(),"${desc}")]

Verify Note Created on File
  [arguments]       ${filename}       ${text}
  Wait Until Page Contains Element    xpath=//a[@class="css-truncate"]//strong[contains(text(),"${filename}")]/ancestor::div[@id="file-${filename}"]//td[contains(text(),"${text}")]

Select File
  [arguments]       ${filename}
  Wait Until Page Contains Element    xpath=//strong[@class="css-truncate-target"][contains(text(),"${filename}")]
  Click Element                       xpath=//strong[@class="css-truncate-target"][contains(text(),"${filename}")]

Verify File Deleted
  [arguments]     ${filename}
  Wait Until Page Does Not Contain Element    xpath=//a[@class="css-truncate"]//strong[contains(text(),"${filename}")]

Go To Gist List Page
  [arguments]     ${USER}
  Go To     ${URL_GIST}${USER.USERNAME}

Verify View Github Profile Button Is Shown
  Wait Until Page Contains Element      css=.btn.btn-outline.width-full.text-center

Verify In Gist List Page
  Location Should Be        ${URL_GIST}${USER.USERNAME}
