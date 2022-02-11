Feature: Create and Delete user

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

  Scenario: Create and Delete a uesr
    # Create a user using Post request
    Given path 'public/v1/users'
    And print requestBody
    And request requestBody
    And header Authorization = 'Bearer '+ tokenID
    When method POST
    Then status 201
    And print response
    * def postResponse = response
    And match $.data.id == '#present'
    And match $.data.name == 'Jack'
    And match $.data.email == requestBody.email
    
    # fetching user id from post call
    * def userId = $.data.id
    * print userId
    
    # Delete a user using Delete request
    Given path "public/v1/users/"+userId
    And header Authorization = "Bearer "+tokenID
    When method DELETE
    Then status 204
    
    # Get a deleted user by get request
    Given path "public/v1/users/"+userId
    And header Authorization = "Bearer "+tokenID
    When method GET
    Then status 404
    And print response
    And match $.data.message == "Resource not found"
