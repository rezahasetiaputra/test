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
