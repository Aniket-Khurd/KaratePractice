Feature: Put request API feature

Background:
* url "https://gorest.co.in/"
* def requestPut = 
"""
{
  "status" : "active"
}
"""

Scenario: Update the user
Given path "public/v1/users/102"
And request requestPut
And header Authorization = "Bearer "+tokenID
When method PUT
Then status 200
And print response
* match response.data.id == "#present"
* match $.data.name == "Fr. Chaitan Somayaji"