Feature: PUT API Demo

  Background: 
    * url "https://reqres.in/api"
    * header Accept = "application/json"
    * def expectedResponse = read("file:src/test/resources/Payload/putresponse.json")
    * def requestBody = read("file:src/test/resources/Payload/putrequest.json")

  #Simple PUT request
  Scenario: PUT Demo 1
    Given url "https://reqres.in/api/users/2"
    And request {"name": "morpheus","job": "zion resident"}
    When method PUT
    Then status 200
    And print response

  #PUT request with background
  Scenario: PUT Demo 2
    Given path "/users/2"
    And request {"name": "morpheus","job": "Marketing"}
    When method PUT
    Then status 200
    And print response

  #PUT request with assertions
  Scenario: PUT Demo 3
    Given path "/users/2"
    And request {"name": "morpheus","job": "Marketing"}
    When method PUT
    Then status 200
    And match response == {"name": "morpheus","job": "Marketing","updatedAt": "#ignore"}
    And print response

  #PUT request with read response from file for assertion
  Scenario: PUT Demo 4
    Given path "/users/2"
    And request {"name": "morpheus","job": "Marketing"}
    When method PUT
    Then status 200
    And match response == expectedResponse
    And print response

  #PUT request with read request body from file
  Scenario: PUT Demo 5
    Given path "/users/2"
    And print requestBody
    And request requestBody
    When method PUT
    Then status 200
    And match response == expectedResponse
    And print response
