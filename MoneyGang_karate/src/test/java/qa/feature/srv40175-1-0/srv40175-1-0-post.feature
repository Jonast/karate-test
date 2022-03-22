#Author: jonathan.tapia@wom.cl
@testRun175
Feature: test srv40175 metodo post

  Scenario Outline: Verificar <name>
    Given header 'Content-Type' = 'application/json'
    When url 'http://customercoreservices.wom.uat/ocp/srv40175-1-0/rest/challenger/<linea>'
    And request { "length": "<length>", "media": "<media>", "channel": "<channel>", "transaction": "<transaction>","typeChallenger": "<typeChallenger>" }
    And method <method>
    And assert responseStatus == <responseStatus>

    Examples: 
|read('datosSrv40175-post.csv')|