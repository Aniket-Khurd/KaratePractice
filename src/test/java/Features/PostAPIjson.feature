Feature: Post API request using java method

  Background: 
    * url 'https://gorest.co.in/'
    * def random_string =
      """
      function(count)
      {
	      var JavaDemo = Java.type("com.test.runner.APIUtils");
	      var call = new JavaDemo();
	      return call.generateRandomString(count);
      }
      """
    * def randomString = random_string(5)
    * print randomString
    * def requestBody = read("file:src/test/resources/Payload/postapi.json")
    * set requestBody.email = randomString+'@sample.com'
   

  Scenario: create a user using requestBody
    Given path 'public/v1/users'
    And print requestBody
    And request requestBody
    And header Authorization = 'Bearer '+ tokenID
    When method POST
    Then status 201
    And print response
    And match $.data.id == '#present'
    And match $.data.name == 'Jack'
    And match $.data.email == requestBody.email
