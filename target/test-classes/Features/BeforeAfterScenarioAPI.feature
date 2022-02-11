Feature: Before and After Scenario API

  Background: 
    * def getDateStamp =
      """
      function()
      {
      	var dateStamp = Java.type("com.test.runner.APIUtils");
      	var date = new dateStamp();
      	return date.getDateTime();
      }
      """
    * configure afterScenario =
      """
      function(){
      var info = karate.info;
      karate.log(info.scenarioName+" executed at ", getDateStamp());
      }
      """

  Scenario: ReqresAPI GET request
    Given url "https://reqres.in/api/users?page=2"
    When method GET
    Then status 200
    And print response

  Scenario: GorestAPI GET request 
    Given url "https://gorest.co.in//public/v1/users"
    When method GET
    And status 200
    Then print response
