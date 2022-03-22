
@testRun262
Feature: Test srv40262-1-0 - availabilityCheck

Background:
    Given url 'http://fttx.wom.uat/ocp/resource/srv40262-1-0/rest/resourcePoolManagement/availabilityCheck'

Scenario: Validacion estatus code 200
    And request 
    """
        {
        "addrId": "211215105969782020",
        "prodInstId": "",
        "spId": ""
        }
    """
    When method Post
    Then status 200
    And match response.success == true
    And match response.checkId == '#present'

Scenario: Validacion tipo dato response con estatus code 200 
    And request 
    """
        {
        "addrId": "211215105969782020",
        "prodInstId": "",
        "spId": ""
        }
    """
    When method Post
    Then status 200
    Then match response.address == '#object'
    Then match response.curAccSchema == '#object'
    Then match response.accSchemaList == '#[]'
    Then match response ==
    """
        {
        "resultCode": '#string',
        "success": '#boolean',
        "errorMessage": '#string',
        "checkId": '#string',
        "address": {
            "areaCode": '#string',
            "diggingFlag": '#string',
            "houseNo": '#string',
            "towerNo": '#string',
            "floorNo": '#string',
            "streetName": '#string',
            "buildingType": '#string',
            "houseNoExt": '#string',
            "longitude": '#string',
            "latitude": '#string',
            "addressId": '#string',
            "addressName": '#string',
            "areaName": '#string',
            "addrGrade": '#string'
        },
        "curAccSchema": {
            "accMode": '#null',
            "maxDownloadBw": '#null',
            "planDate": '#null',
            "prodList": '#null'
        },
        "accSchemaList": [
            {
                "accMode": '#string',
                "maxDownloadBw": '#string',
                "planDate": '#string',
                "prodList": '#null'
            },
            {
                "accMode": '#string',
                "maxDownloadBw": '#string',
                "planDate": '#string',
                "prodList": '#null'
            },
            {
                "accMode": '#string',
                "maxDownloadBw": '#string',
                "planDate": '#string',
                "prodList": [
                    {
                        "prodSpecCode": '#string',
                        "prodSpecId": '#string',
                        "prodSpecName": '#string',
                        "prodSpecType": '#string',
                        "relaProdSpec": '#string'
                    },
                    {
                        "prodSpecCode": '#string',
                        "prodSpecId": '#string',
                        "prodSpecName": '#string',
                        "prodSpecType": '#string',
                        "relaProdSpec": '#string'
                    }
                ]
        }
    ]
}
    """

    Scenario:  Validacion codigo 400 campo AddrId vacio
        And request 
        """
            {
            "addrId": "",
            "prodInstId": "",
            "spId": ""
            }
        """
        When method Post
        Then status 400
        And match each response..field == "addrId"
        * def subErrors = response.subErrors


    