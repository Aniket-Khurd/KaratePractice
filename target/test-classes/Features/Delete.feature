Feature: Delete API Demo

  Background: 
    * url "https://reqres.in/api"

  Scenario: DELETE Demo 1
    Given url "https://reqres.in/api/users/2"
    When method DELETE
    And status 204

  #Delete request with url from background
  Scenario: DELETE Demo 2
    Given path "/users/2"
    When method DELETE
    And print responseStatus
    And status 204
    And print response
