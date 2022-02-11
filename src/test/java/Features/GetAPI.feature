@env=naveen
Feature: GET API Feature
Background:
* url baseURL

  Scenario: GET user details
    Given url "https://gorest.co.in//public/v1/users"
    And path "/30"
    When method GET
    And status 200
    Then print response
    * def jsonResponse = response
    * print jsonResponse
    * def actualName = jsonResponse.data.name
    * print actualName
    * match actualName == "Gurdev Nair" 

  Scenario: GET user details - user not found
    Given url "https://gorest.co.in//public/v1/users"
    And path "/10000"
    When method GET
    And status 404
    Then print response
