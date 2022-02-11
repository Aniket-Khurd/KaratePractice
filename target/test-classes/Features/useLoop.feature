Feature: For loop demo

  Scenario: get all male active users
    * def query = {status:'active', gender:'male'}
    Given url "https://gorest.co.in//public/v1/users"
    And params query
    When method GET
    Then status 200
    * print response
    * def expected =
      """
      function(data){
      for (var i = 0; i < data.length; i++)
      {
          if (data[i].gender != 'female' && data[i].status != 'inactive')
          {
              return true;
          }
          return false;
      };
      }

      """
    * def getVal = expected(response.data)
    * print getVal
    * match getVal == true

  Scenario: get all female active users
    * def query = {status:'active', gender:'female'}
    Given url "https://gorest.co.in//public/v1/users"
    And params query
    When method GET
    Then status 200
    * print response
    * match each response.data contains {status:'active', gender:'female'}
