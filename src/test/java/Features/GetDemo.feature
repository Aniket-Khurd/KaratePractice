Feature: Get API demo 

Background: 
	* url "https://reqres.in/api"

Scenario: Get request demo 
	Given path "/users?page=2" 
	When method GET 
	Then status 200 
	And print response 
	And print responseStatus 
	And print responseTime 
	And print responseHeaders 
	And print responseCookies 
	
Scenario: Get request demo with parameter 
	Given path "/users" 
	And param page = 2 
	When method GET 
	Then status 200 
	And print response 
	
Scenario: Get request demo with Assertions 
	Given path "/users" 
	And param page = 2 
	When method GET 
	Then status 200 
	And print response
	And match response.data[0].first_name != null
	And assert response.data.length == 6
	And match response.data[2].id == 9
	