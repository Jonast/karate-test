#Author: jonathan.tapia@wom.cl
@testRun175
Feature: test srv40175 metodo put

  Scenario Outline: Prueba unitarias <name>
    Given header 'Content-Type' = 'application/json'
    When url 'http://customercoreservices.wom.uat/ocp/srv40175-1-0/rest/challenger'
    And request { "contact": "<contact>", "channel": "<channel>", "challenge": [{"code": "<code>" }]}
    And method <method>
    And assert responseStatus == <responseStatus>

    Examples: 
	|read('datosSrv40175-put.csv')|