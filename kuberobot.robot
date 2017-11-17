################################################################################################
#    kuberobot REST test by Robot-framework
#    nov 2017
#
################################################################################################
*** settings ***
Documentation   REST API kubernetes.
Library         Collections
Library         RequestsLibrary
Library         OperatingSystem
Library         String
Suite Setup
Suite Teardown	Delete All Sessions

################################################################################################
*** Variables ***
${API_ENDPOINT}	http://127.0.0.1:8080

${nginx-service.json}		{"kind":"Service","apiVersion":"v1","metadata":{"name":"nginx-service","namespace":"default","labels": {"name":"nginx"} },"spec":{"ports":[{"port": 80}],"selector":{"name":"nginx"}}}

${nginx-pod.json}	 {"kind":"Pod","apiVersion":"v1","metadata":{"name":"nginx","namespace":"default","labels":{ "name": "nginx" } }, "spec": { "containers": [{"name":"nginx","image":"nginx","ports":[{"containerPort": 80}],"resources": {"limits":{"memory":"128Mi", "cpu": "500m"}}}]}}


################################################################################################
*** Keywords ***
GetListofapiVerbs
    [Arguments]	${apiVerbs}	${apiName}	
    :FOR    ${apiverb}    IN    @{apiVerbs}
    \	Run Keyword If  '${apiverb}' == 'get'   runTestAPIget	${apiName} 
    \   Run Keyword If  '${apiverb}' == 'create' and '${apiName}' == 'namespaces'   runTestAPIpost   ${apiName}
    


runTestAPIget
   [Arguments]	${apiName}
   #Log to console	 ${apiName}
   Create Session      kubernetes      ${API_ENDPOINT}
   ${resp}=    Get Request     kubernetes      /api/v1/${apiName}
   #Should Be Equal As Strings  ${resp.status_code}     200
   ${json} =  Set Variable  ${resp.json()}
   Log  ${json}
   [Tags]	${apiName}

runTestAPIpost
   [Arguments]  ${apiName}
   Create Session      kubernetes      ${API_ENDPOINT}
   &{headers}=  Create Dictionary  Content-Type=application/json
   ${resp}=  Post Request  kubernetes	/api/v1/${apiName}/default/pods  data=${nginx-pod.json}  headers=${headers}
   ${resp}=  Post Request  kubernetes   /api/v1/${apiName}/default/services  data=${nginx-service.json}  headers=${headers}
   #Should Be Equal As Strings  ${resp.status_code}  200



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
    \  GetListofapiVerbs	${apiVerbs}	${apiName}

    


################################################################################################
