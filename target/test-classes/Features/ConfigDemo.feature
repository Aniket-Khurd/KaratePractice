Feature: Config demo

  Background: 
    * url baseURL
    * header Accept = "application/json"

  Scenario: Config Demo 1
    Given print name

 
  Scenario: Get request demo
    Given path "/users?page=2"
    When method GET
    Then status 200
    And print response
    And print responseStatus
    And print responseTime
    And print responseHeaders
    And print responseCookies
