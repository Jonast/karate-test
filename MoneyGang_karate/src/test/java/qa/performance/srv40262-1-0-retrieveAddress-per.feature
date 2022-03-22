
Feature: Test metodo Get servicios Jonas

Background:
    Given url 'http://fttx.wom.uat/ocp/resource/srv40262-1-0/rest/resourcePoolManagement/retrieveAddress'

    * def sleep = function(ms){java.lang.Thread.sleep(ms)}
    * def pause = karate.get('__gatling.pause', sleep)
Scenario: Performance srv40262-retrieveAddress
    And request 
    """
        {
            "areaName": "LAS CONDES",
            "streetName": "Leonardo Da Vinci",
            "houseNo": "7346",
            "houseNoExt": "",
            "pageFlag": "",
            "pageSize": "",
            "pageIndex": ""
        }
    """
    Then status 200