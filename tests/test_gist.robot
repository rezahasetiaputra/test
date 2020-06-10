*** Settings ***
Resource              ../resource.robot
Suite Teardown        Close All Browsers
Test Setup            Open Web      ${URL}
Test Teardown         Close Browser

*** Test Case ***
Test Create Public Gist
    Choose Sign in
    Input UserName        ${USER.USERNAME}
    Input Password        ${USER.PASSWORD}
    Select Sign in Button
    Verify in HomePage
    Select Plus
    Select New Gist
    Verify In Gist Editor
    Input Description       ${DATA_GIST.DESCRIPTION}
    Input Filename          ${DATA_GIST.FILENAME}
    Input On Text Area      ${DATA_GIST.NOTES}
    Select Create Public Gist
    Verify File Created With Name       ${DATA_GIST.FILENAME}
    Verify Description Gist Created     ${DATA_GIST.DESCRIPTION}
    Verify Note Created on File         ${DATA_GIST.FILENAME}     ${DATA_GIST.DESCRIPTION}

Test Edit Gist
    Choose Sign in
    Input UserName        ${USER.USERNAME}
    Input Password        ${USER.PASSWORD}
    Select Sign in Button
    Verify in HomePage
    Go To     https://gist.github.com/${USER.USERNAME}
    Select Edit Button
    Input On Text Area        Change Note
    Select Update Public Gist

Test Delete Gist
    Choose Sign in
    Input UserName      ${USER.USERNAME}
    Input Password      ${USER.PASSWORD}
    Select Sign in Button
    Verify in HomePage
    Go To     https://gist.github.com/${USER.USERNAME}
    Select File             ${DATA_GIST.FILENAME}
    Select Delete Button
    Choose Yes To Delete
    Verify File Deleted     ${DATA_GIST.FILENAME}
