Feature: GET API Header feature

  Scenario: pass the user request with headers_part1
    Given header Content-Type = "application/json; charset=utf-8"
    And header Connection = "keep-alive"
    And header Accept-Encoding = "gzip,deflate"
    When url "https://gorest.co.in//public/v1/users"
    And path "30"
    When method GET
    Then status 200
    * print response

  Scenario: pass the user request with headers_part2
    * def request_headers = {Content-Type:"application/json; charset=utf-8", Connection:"keep-alive", Accept-Encoding:"gzip,deflate"}
    Given headers request_headers
    When url "https://gorest.co.in//public/v1/users"
    And path "30"
    When method GET
    Then status 200
    * print response

  Scenario: pass the user request with headers_part3
    * configure headers = {Content-Type:"application/json; charset=utf-8", Connection:"keep-alive", Accept-Encoding:"gzip,deflate"}
    When url "https://gorest.co.in//public/v1/users"
    And path "30"
    When method GET
    Then status 200
    * print response
