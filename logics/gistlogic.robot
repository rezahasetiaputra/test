*** Keywords ***
Create New Public Gist
  [arguments]             ${DATA_GIST}
  Input Description       ${DATA_GIST.DESCRIPTION}
  Input Filename          ${DATA_GIST.FILENAME}
  Input On Text Area      ${DATA_GIST.NOTES}
  Select Create Public Gist

Verify Public Gist Created
  [arguments]             ${DATA_GIST}
  Verify File Created With Name       ${DATA_GIST.FILENAME}
  Verify Description Gist Created     ${DATA_GIST.DESCRIPTION}
  Verify Note Created on File         ${DATA_GIST.FILENAME}         ${DATA_GIST.NOTES}

Verify Public Gist Updated
  [arguments]           ${filename}       ${note}
  Verify Note Created on File         ${filename}       ${note}

Delete Public Gist
  Sleep    1
  Select Delete Button
  Sleep    1
  Choose Yes To Delete

Should Be In Gist List Page
  Verify View Github Profile Button Is Shown
  Verify In Gist List Page
