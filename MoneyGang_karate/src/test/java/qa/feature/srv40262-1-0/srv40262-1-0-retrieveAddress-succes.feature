@testRun262
Feature: Test srv40262-1-0 - retrieveAddress

Background:
    Given url 'http://fttx.wom.uat/ocp/resource/srv40262-1-0/rest/resourcePoolManagement/retrieveAddress'

Scenario: Validacion estatus code 200
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
    When method Post
    Then status 200
    And match response.errorMessage == "SUCCESS"
    And match each response..areaCode == '#notnull'
    And match each response..addressId == '#present'



    