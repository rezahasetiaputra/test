*** Keywords ***
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
  Wait Until Page Contains Element      css=.btn.btn-primary
  Click Element                         css=.btn.btn-primary

Select Edit Button
  Wait Until Page Contains Element      xpath=//a[@aria-label="Edit this Gist"]
  Click Element                         xpath=//a[@aria-label="Edit this Gist"]

Select Delete Button
  Wait Until Page Contains Element      xpath=//button[@aria-label="Delete this Gist"]
  Click Element                         xpath=//button[@aria-label="Delete this Gist"]

Verify In Gist Editor Page
  Location Should Be          ${URL_GIST}

Choose Yes To Delete
  Handle Alert          action=ACCEPT
