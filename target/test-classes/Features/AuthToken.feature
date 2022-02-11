Feature: Auth Token feature

  Scenario: 
    * print tokenID
    Given header Authorization = "Bearer "+ tokenID
    And url "https://gorest.co.in//public/v1/users"
    And path "30"
    When method GET
    Then status 200
    * print response
