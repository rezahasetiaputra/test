*** Settings ***
Library         ../script/postmanBehavior.py

*** Test Case ***
Test API Guru
  ${APIURL}        Set Variable    https://api.apis.guru/v2//list.json
  Input Header     Accept          application/json
  ${status_code}   Do Request And Get Status    GET    ${APIURL}
  Should Be Equal  ${status_code}  200
