Feature: Call Sceanrio API example

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
    * def randomString = random_string(5)
    * print randomString
    * def requestBody = read("file:src/test/resources/Payload/postapi.json")
    * set requestBody.email = randomString+'@sample.com'

  @ignore 
  @tag1
  Scenario: Get request
    Given path "public/v1/users/"+userID
    And header Authorization = "Bearer "+tokenID
    When method GET
    Then status 200
    * print response
    * def response2 = response

  @tag2
  Scenario: Create user by POST request
    Given path "public/v1/users"
    And request requestBody
    And header Authorization = "Bearer "+tokenID
    When method POST
    Then status 201
    * print response
    * def response1 = response
    * def userID = response1.data.id
    * call read("CallScenarioAPI.feature@tag1")
    * match response1 == response2
