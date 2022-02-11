Feature: Post API request

  Background: 
    * url 'https://gorest.co.in/'
    * def random_string =
      """
        function(length) {
        var result           = '';
        var characters       = 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789';
        for ( var i = 0; i < length; i++ ) {result += characters.charAt(Math.floor(Math.random() * characters.length));
       }
       return result;
      }
      """
    * def randomString = random_string(6)
    * print randomString
    * def requestBody =
      """
      {
       'name' : 'Jack',
       'gender' : 'male',
       'status' : 'active'
      }
      """
    * requestBody.email = randomString+'@samplemail.com'
    

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
