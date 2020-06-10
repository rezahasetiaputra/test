*** Keywords ***
Login To github
  [arguments]          ${USER}
  Choose Sign in
  Sleep   1
  Input UserName        ${USER.USERNAME}
  Input Password        ${USER.PASSWORD}
  Select Sign in Button
  Verify in HomePage
