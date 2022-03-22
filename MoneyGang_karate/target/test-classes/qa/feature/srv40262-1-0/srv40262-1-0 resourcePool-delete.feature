
@testRun262
Feature: Test srv40262-1-0 resourcePool - Delete

Background:
    Given url 'http://fttx.wom.uat/ocp/resource/srv40262-1-0/rest/resourcePoolManagement/resourcePool/21121617140699683'
    

Scenario: Validacion srv40262-1-0 resourcePool estatus code 200
    When method Delete
    Then status 200
    Then match response.resultCode == '0'
    Then match response.resultDesc == 'Success'

Scenario: Validacion tipo dato response con estatus code 200 
    When method Delete
    Then status 200
    Then match response.resultCode == '#string'
    Then match response.resultDesc == '#string'

