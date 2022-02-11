Feature: Basic schema validation

  Background: 
    * url "https://gorest.co.in/"
    * def random_string =
      """
      function(length)
      {
	      var RandomString = Java.type("com.test.runner.APIUtils");
	      var get = new RandomString();
	      return get.generateRandomString(length);
      }
      """
    * def randomString = random_string(5)
    * def expecetdSchema =
      """
      {
      "meta": null,
      "data": {
      "id": "#number",
      "name": "#string",
      "email": "#string",
      "gender": "##string",
      "status": "#string"
      }
      }
      """
    * def requestBody =
      """
      {
      "name": "Arjun",
      "status": "active",
      "gender": "male"
      }
      """
    * set requestBody.email = randomString+"@sample.com"
    * print requestBody.email

  Scenario: Response using GET request
    Given path "public/v1/users/30"
    When method GET
    Then status 200
    * print response
    And match response == expecetdSchema

  Scenario: Create a user and validate schema after getting same user
    Given path "public/v1/users"
    And request requestBody
    And header Authorization = "Bearer "+ tokenID
    When method POST
    Then status 201
    * print response
    * def userID = response.data.id
    * print userID
    Given path "public/v1/users/"+userID
    And header Authorization = "Bearer "+tokenID
    When method GET
    Then status 200
    * print response
    * remove response.data.gender
    * print response
    * print expecetdSchema
    And match response == expecetdSchema
