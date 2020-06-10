*** Settings ***
Resource              ../resource.robot
Suite Teardown        Close All Browsers
Test Setup            Open Web      ${URL}
Test Teardown         Close Browser

*** Test Case ***
Test Create Public Gist
    Login To github           ${USER}
    Go To Gist Editor Page
    Create New Public Gist        ${DATA_GIST}
    Verify Public Gist Created    ${DATA_GIST}

Test Edit Gist
    Login To github         ${USER}
    Go To Gist List Page    ${USER}
    Select File             ${DATA_GIST.FILENAME}
    Select Edit Button
    Input On Text Area    Change Note
    Select Update Public Gist
    Verify Public Gist Updated      ${DATA_GIST.FILENAME}       ${DATA_GIST.NOTES}Change Note

Test Delete Gist
    Login To github         ${USER}
    Go To Gist List Page    ${USER}
    Select File             ${DATA_GIST.FILENAME}
    Delete Public Gist
    Should Be In Gist List Page
    Verify File Deleted     ${DATA_GIST.FILENAME}
