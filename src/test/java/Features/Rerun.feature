Feature: Retry or Rerun feature

  Background: 
    * configure retry = { count: 10, interval: 5000 }

  Scenario: Get request
    Given url "https://gorest.co.in//public/v1/users"
    And retry until responseStatus == 201
    When method GET
    And status 200
    Then print response
