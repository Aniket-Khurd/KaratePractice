Feature: Call one scenario from another scenario

@tag1
Scenario: first scenario
* print "I'm first Scenario"

@tag2
Scenario: second scenario
* print "I'm second Scenario"
* def result = call read("CallScenarioDemo.feature@tag1")