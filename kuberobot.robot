##################################################################################################
#    kuberobot REST test by Robot-framework
#    nov 2017
#
##################################################################################################
*** settings ***
Documentation     REST kubernetes.
Library           Collections
Library           RequestsLibrary
Library           OperatingSystem
Library           String
Suite Setup
Suite Teardown		Delete All Sessions

################################################################################################
*** Variables ***
${API_ENDPOINT}	http://127.0.0.1:8080

################################################################################################
*** Keywords ***
GetListofVerbs
    [Arguments]	${apiVerbs}	${apiName}	
    :FOR    ${verb}    IN    @{apiVerbs}
    \	 runTest	${apiName}
    


runTest
   [Arguments]	${apiName}
   #Log to console	 ${apiName}
   Create Session      kubernetes      ${API_ENDPOINT}
   ${resp}=    Get Request     kubernetes      /api/v1/${apiName}
   #Should Be Equal As Strings  ${resp.status_code}     200


################################################################################################
*** test cases ***

Get api v1 
    [Documentation]  api v1
    Create Session	kubernetes      ${API_ENDPOINT}
    ${resp}=    Get Request     kubernetes      /api/v1
    Should Be Equal As Strings  ${resp.status_code}     200
    ${json} =  Set Variable  ${resp.json()}
    Log  ${json}

    ${kind} =  Get From Dictionary  ${json}  kind
    Should Be Equal  ${kind}  APIResourceList
    ${resources} =  Get From Dictionary  ${json}  resources

    :FOR    ${apiDict}    IN    @{resources}
    \  ${apiName} =  Get From Dictionary  ${apiDict}  name
    \  List Should Contain Value    ${apiDict}    verbs
    \  ${apiVerbs} =  Get From Dictionary  ${apiDict}  verbs
    \  Log List	 ${apiVerbs}
    # \  Log to console   ${apiName}  
    \  GetListofVerbs	${apiVerbs}	${apiName}

    


################################################################################################
