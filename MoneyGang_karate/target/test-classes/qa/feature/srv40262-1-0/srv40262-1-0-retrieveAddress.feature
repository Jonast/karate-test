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
    


Scenario: Validacion tipo dato response con estatus code 200 
    And request 
    """
        {
            "areaName": "SANTIAGO",
            "streetName": "LAS ENCINAS",
            "houseNo": "3298",
            "houseNoExt": "",
            "pageFlag": "",
            "pageSize": "",
            "pageIndex": ""
        }
    """
    When method Post
    Then status 200
    And match response.resultCode == '#string'
    And match response.success == '#boolean'
    And match response.errorMessage == '#string'
    And match response.totalCount == '#string'
    And match response.pageCount == '#string'
    And match response.addrs == '#[]'
    
Scenario: validacion tipo dato response con estatus code 400 
    And request 
    """
        {
            "areaName": "",
            "streetName": "LAS ENCINAS",
            "houseNo": "3298",
            "houseNoExt": "",
            "pageFlag": "",
            "pageSize": "",
            "pageIndex": ""
        }
    """
    When method Post
    Then status 400
    And match response.codigoError == '#string'
    And match response.mensajeError == '#string'
    And match response.subErrors == '#[]'
    And match each response..field == '#string'
    And match each response..message == '#string'
    And match each response..rejectedValue == '#string'


Scenario: Validacion codigo 400 campo areaName vacio
    And request 
    """
        {
            "areaName": "",
            "streetName": "LAS ENCINAS",
            "houseNo": "3298",
            "houseNoExt": "",
            "pageFlag": "",
            "pageSize": "",
            "pageIndex": ""
        }
    """
    When method Post
    And match each response..field == "areaName"
    Then status 400

Scenario: Validacion codigo 400 campo streetName vacio
    And request 
    """
        {
            "areaName": "SANTIAGO",
            "streetName": "",
            "houseNo": "3298",
            "houseNoExt": "",
            "pageFlag": "",
            "pageSize": "",
            "pageIndex": ""
        }
    """
    When method Post
    And match each response..field == "streetName"
    Then status 400

Scenario: Validacion codigo 400 campo houseNo vacio
    And request 
    """
        {
            "areaName": "SANTIAGO",
            "streetName": "LAS ENCINAS",
            "houseNo": "",
            "houseNoExt": "",
            "pageFlag": "",
            "pageSize": "",
            "pageIndex": ""
        }
    """
    When method Post
    And match each response..field == "houseNo"
    Then status 400

