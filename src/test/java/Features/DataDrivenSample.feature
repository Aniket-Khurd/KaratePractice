#@ignore
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

  #* def requestBody =
  #"""
  #{
  #'name' : <name>,
  #'gender' : <gender>,
  #'status' : <status>
  #}
  #"""
  #* set requestBody.email = randomString+'@sample.com'
  Scenario Outline: 
    Given path "public/v1/users"
    * def requestBody =  {'name' : <name>,'gender' : <gender>,'status' : <status>}
    * def randomString = random_string(5)
    * print randomString
    * set requestBody.email = randomString+'@sample.com'
    * print requestBody.email
    And request requestBody
    And header Authorization = "Bearer "+tokenID
    When method POST
    Then status 201
    * print response
    #* karate.Runner('file:src/test/java/Features/')
    #* karate.call(read('file:src/test/java/Features'))
    * karate.call('file:src/test/java/Features/BeforeAfterScenarioAPI.feature')
    * call read('CallScenarioAPI.feature@tag2')
    #* def runAllFeature =
      #"""
      #function()
      #{
      #	var runAll = Java.type('com.test.runner.APIUtils');
      #	var run = new runAll();
      #	return run.allFeatureFilesRunner();
      #	}
      #"""
      #* def start = runAllFeature()
      #* print start
      

    Examples: 
      | read('file:src/test/resources/datanew.csv') |
