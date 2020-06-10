*** Keywords ***
Choose Sign in
  Wait Until Page Contains Element     xpath=//a[@href="/login"]
  Click Element                        xpath=//a[@href="/login"]

Input UserName
  [arguments]        ${username}
  Wait Until Page Contains Element     id=login_field
  Input Text                           id=login_field     ${username}

Input Password
  [arguments]        ${password}
  Wait Until Page Contains Element     id=password
  Input Text                           id=password        ${password}

Select Sign in Button
  Wait Until Page Contains Element     css=.btn.btn-primary.btn-block
  Click Element                        css=.btn.btn-primary.btn-block

Verify in HomePage
  Wait Until Page Contains     Read the guide

Select Plus
  Wait Until Page Contains Element    css=.octicon.octicon-plus
  Click Element                       css=.octicon.octicon-plus

Select New Gist
  Wait Until Page Contains Element    xpath=//a[@class="dropdown-item"][contains(text(),"New gist")]    timeout=3
  Click Element                       xpath=//a[@class="dropdown-item"][contains(text(),"New gist")]

Verify In Gist Editor
  Location Should Be          ${URL_GIST}

Input Description
  [arguments]       ${text}
  Wait Until Page Contains Element    xpath=//input[@aria-label='Gist description']
  Input Text                          xpath=//input[@aria-label='Gist description']       ${text}

Input Filename
  [arguments]       ${filename}
  Wait Until Page Contains Element    css=.form-control.filename.js-gist-filename.js-blob-filename
  Input Text                          css=.form-control.filename.js-gist-filename.js-blob-filename      ${filename}

Input On Text Area
  [arguments]       ${text}
  Wait Until Page Contains Element    css=.CodeMirror-code
  Input Text                          css=.CodeMirror-code        ${text}

Select Create Public Gist
  Wait Until Page Contains Element    css=.btn.btn-secret.js-gist-create
  Click Element                       css=.btn.btn-secret.js-gist-create

Select Update Public Gist
  Wait Until Page Contains Element      css=btn.btn-primary
  Click Element                          css=btn.btn-primary

Verify File Created With Name
  [arguments]       ${filename}
  Wait Until Page Contains Element    xpath=//a[@class="css-truncate"]//strong[contains(text(),"${filename}")]

Verify Description Gist Created
  [arguments]       ${desc}
  Wait Until Page Contains Element    xpath=//div[@itemprop="about"][contains(text(),"${desc}")]

Verify Note Created on File
  [arguments]       ${filename}       ${text}
  Wait Until Page Contains Element    xpath=//a[@class="css-truncate"]//strong[contains(text(),"${filename}")]/ancestor::div[@id="file-file"]//td[contains(text(),"${text}")]

Select File
  [arguments]       ${filename}
  Wait Until Page Contains Element    xpath=//strong[@class="css-truncate-target"][contains(text(),"${filename}")]
  Click Element                       xpath=//strong[@class="css-truncate-target"][contains(text(),"${filename}")]

Select Edit Button
  Wait Until Page Contains Element      xpath=//a[@aria-label="Edit this Gist"]
  Click Element                         xpath=//a[@aria-label="Edit this Gist"]

Select Delete Button
  Wait Until Page Contains Element      xpath=//a[@aria-label="Delete this Gist"]
  Click Element                         xpath=//a[@aria-label="Delete this Gist"]

Choose Yes To Delete
  Handle Alert          action=ACCEPT

Verify File Deleted
  [arguments]     ${filename}
  Wait Until Page Does Not Contain Element    xpath=//a[@class="css-truncate"]//strong[contains(text(),"${filename}")]
