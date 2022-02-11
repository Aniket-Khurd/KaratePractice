Feature: Get API with Query

  Scenario: get all active users
    * def query = {status:'active'}
    Given url "https://gorest.co.in//public/v1/users"
    And params query
    When method GET
    Then status 200
    * print response

  Scenario: get all male active users
    * def query = {status:'active', gender:'male'}
    Given url "https://gorest.co.in//public/v1/users"
    And params query
    When method GET
    Then status 200
    * print response

  Scenario: get all active users and get the count
    * def query = {status:'active'}
    Given url "https://gorest.co.in//public/v1/users"
    And params query
    When method GET
    Then status 200
    * def jsonResponse = response
    * print jsonResponse
    * def userCount = jsonResponse.data.length
    * print userCount
    * match userCount == 20
    * assert userCount == jsonResponse.meta.pagination.limit
    
