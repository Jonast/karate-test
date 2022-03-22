@testRun262
Feature: Test srv40262-1-0 resourcePool

Background:
    Given url 'http://fttx.wom.uat/ocp/resource/srv40262-1-0/rest/resourcePoolManagement/resourcePool'
    * def addressIdrRetrieveAddres = call read('srv40262-1-0-retrieveAddress-succes.feature')
    * def addrs = addressIdrRetrieveAddres.response.addrs
    * def id = addrs[0].addressId
    * def rq = {"addressId": #(id) , "prodList": "HSI_IPOE:NEW", "accMode": "GPON","prodInstId": ""}
    

Scenario: Validacion srv40262-1-0 resourcePool estatus code 200
    And request rq
    When method Post
    Then status 200
    Then match response.resultDesc == 'Success'
    Then match response.resultCode == '0'

Scenario: Validacion tipo dato response con estatus code 200 
    And request rq
    When method Post
    Then status 200
    Then match response.resultDesc == '#string'
    Then match response.resultCode == '#string'
    Then match response.resReserveId == '#string'


Scenario: Validacion codigo 400 campo addressId vacio
    And request
    """
        {
            "addressId": "",
            "prodList": "HSI_IPOE:NEW",
            "accMode": "GPON",
            "prodInstId": ""
        }
    """
    When method Post
    Then status 400
    Then match response.mensajeError == "Atributos no validos"
    And match each response..field == "addressId"

Scenario: Validacion codigo 400 campo prodList vacio
    And request
    """
        {
            "addressId": "211214113269666540",
            "prodList": "",
            "accMode": "GPON",
            "prodInstId": ""
        }
    """
    When method Post
    Then status 400
    Then match response.mensajeError == "Atributos no validos"
    And match each response..field == "prodList"

Scenario: Validacion codigo 400 campo accMode vacio
    And request
    """
        {
            "addressId": "211214113269666540",
            "prodList": "HSI_IPOE:NEW",
            "accMode": "",
            "prodInstId": ""
        }
    """
    When method Post
    Then status 400
    Then match response.mensajeError == "Atributos no validos"
    And match each response..field == "accMode"
    
