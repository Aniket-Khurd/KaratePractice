Feature: hooks demo

  Background: 
    * karate.callSingle('sample.feature')
    * configure afterScenario =
      """
      function(){
      var info = karate.info;
      karate.log('Afetr Scenario', info.scenarioName);
      }
      """
    * configure afterFeature =
      """
      function(){
      var info = karate.info;
      karate.log('Afetr Feature', info.featureFileName);
      }
      """

  Scenario: sample
    * print 'hello'

  Scenario: sample1
    * print 'world'
