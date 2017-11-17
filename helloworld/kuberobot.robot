##################################################################################################
#    kuberobot REST test by Robot-framework
#    nov 2017
#
##################################################################################################
# START
*** settings ***
Documentation     REST kubernetes.
Library           Collections
Library           RequestsLibrary
Library           OperatingSystem
Library           String
Suite Setup
Suite Teardown		Delete All Sessions

##################################################################################################
*** Variables ***
${API_ENDPOINT}	http://127.0.0.1:8080

##################################################################################################
*** Keywords ***



##################################################################################################
*** test cases ***

Test api v1 
    [Documentation]  api v1
    Create Session	kubernetes      ${API_ENDPOINT}
    ${resp}=    Get Request     kubernetes      /api/v1
    Should Be Equal As Strings  ${resp.status_code}     200
    Log  ${resp.json()}



Test api v1 configmaps				
    [Documentation]  configmaps		
    Create Session	kubernetes	${API_ENDPOINT}
    ${resp}=	Get Request	kubernetes	/api/v1/configmaps
    Should Be Equal As Strings	${resp.status_code}	200	
    Log  ${resp.json()}
    



# END
##################################################################################################






