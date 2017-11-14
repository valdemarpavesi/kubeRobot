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


##################################################################################################
*** Keywords ***



##################################################################################################
*** test cases ***

Get Requests				
    Create Session	kubernetes	127.0.0.1:8080
    ${resp}=	Get Request	kubernetes	/api/v1/configmaps
    Should Be Equal As Strings	${resp.status_code}	200	
    Dictionary Should Contain Value	${resp.json()}	Bulkan Savun Evcimen	



# END
##################################################################################################






