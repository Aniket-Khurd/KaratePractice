
Feature: Data driven sample feature

  Background: 
    * url "https://gorest.co.in/"
    * def random_string =
      """
      function(length)
      {
       var JavaDemo = Java.type("com.test.runner.APIUtils");
       var call = new JavaDemo();
       return call.generateRandomString(length);
      }
      """

 # * def requestBody = read("file:src/test/resources/Payload/datadrivenrequest.json")
 
  Scenario Outline: 
    Given path "public/v1/users"
    * def requestBody =  {'name' : <name>,'gender' : <gender>,'status' : <status>}
    * def randomString = random_string(5)
    * print randomString
    * set requestBody.email = randomString+'@sample.com'
    * print requestBody.email
    * print requestBody
    And request requestBody
    And header Authorization = "Bearer "+tokenID
    When method POST
    Then status 201
    * print response
    * karate.call('file:src/test/java/Features/BeforeAfterScenarioAPI.feature')
    * call read('CallScenarioAPI.feature')  

    Examples: 
      | read('file:src/test/resources/datanew.csv') |
