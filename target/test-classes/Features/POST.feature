Feature: Post demo

  #background will run before every scenario
  Background: 
    * url "https://reqres.in/api"
    * header Accept = "application/json"
    * def projectPath = java.lang.System.getProperty("user.dir")
    * def expectedOutput = read('file:src/test/resources/Payload/response.json')
    * def requestBody = read('file:src/test/resources/Payload/request.json')

  #Simple post request
  Scenario: Post demo 1
    Given url "https://reqres.in/api/users"
    And request {"name":"Arpit","job":"Analyst"}
    When method POST
    Then status 201
    And print response

  #Post request with Background
  Scenario: Post demo 2
    Given path "/users"
    And request {"name":"Akshat","job":"HR"}
    When method POST
    Then status 201
    And print response
    And print responseStatus

  #Post request with assertion
  Scenario: Post demo 3
    Given path "/users"
    And request {"name":"Akshata","job":"Manager"}
    When method POST
    Then status 201
    And match response == {"name": "Akshata","job": "Manager","id": "#string","createdAt": "#ignore"}
    And print response
    And print responseStatus

  #Post request read response from file
  Scenario: Post demo 4
    Given path "/users"
    And request {"name":"Akshata","job":"Manager"}
    When method POST
    Then status 201
    And print projectPath
    And print expectedOutput
    And match response == expectedOutput
    And print response
    And print responseStatus

  #Post read request from file
  Scenario: Post demo 5
    Given path "/users"
    And print requestBody
    And request requestBody
    When method POST
    Then status 201
    And print projectPath
    And print expectedOutput
    And match response == expectedOutput
    And print response
    And print responseStatus

  #Post read request from file change request body value
  Scenario: Post demo 6
    Given path "/users"
    And print requestBody
    And requestBody.job = "Lead"
    And print requestBody
    And request requestBody
    When method POST
    Then status 201
    And print projectPath
    And print expectedOutput
    And match response == expectedOutput
    And print response
    And print responseStatus
