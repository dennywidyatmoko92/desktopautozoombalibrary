*** Settings ***
Documentation     Zoomba Desktop Library Tests.
Library           Zoomba.DesktopLibrary
Library    FakerLibrary
Library    String
Library    DateTime
Suite Setup       Start App
Test Setup        Launch Application
Test Teardown     Quit Application
Force Tags        Windows
    

*** Variables ***
${REMOTE_URL}           http://127.0.0.1:4723
${APP}                 C:/Windows/System32/notepad.exe
${APP2}    C:/Users/dennypc/Documents/IPOT/IPOT.exe
${text}    Lorem Ipsum is simply dummy text of the printing and typesetting industry. 
*** Keywords ***
Start App
    [Documentation]     Sets up the application for quick launching through 'Launch Application' and starts the winappdriver
    Open Application    ${REMOTE_URL}     platformName=Windows    deviceName=Windows   app=${APP}
    Maximize Window
    Quit Application

*** Test Cases ***
test    
    Wait For And Input Text    accessibility_id=15    ${text}
    Send Keys    \ue007
    ${now}=    Date Time    
    Wait For And Input Text    accessibility_id=15    Sekarang adalah ${now}
    ${nama}=    FakerLibrary.Name
    Send Keys    \ue007
    Wait For And Input Text    accessibility_id=15    Nama saya adalah ${nama}
    ${pekerjaan}=    FakerLibrary.Job
    Send Keys    \ue007
    Wait For And Input Text    accessibility_id=15    Pekerjaan saya adalah ${pekerjaan}
    ${rumah}=    FakerLibrary.Address
    Send Keys    \ue007
    Wait For And Input Text    accessibility_id=15    Rumah saya ada di ${rumah}
    
    Wait For And Click Element    Name=Help     
    Wait For And Click Element    Name=About Notepad
    Wait For And Click Element    accessibility_id=1
    Wait For And Click Element    Name=File 
    Wait For And Click Element    accessibility_id=2
     Wait For And Click Element    Name=Save
     ${acak}=    Generate Random String    length=6    chars=[NUMBERS]
     Wait For And Input Text    accessibility_id=1001    test${acak}.txt
     Wait For And Click Element    accessibility_id=1
