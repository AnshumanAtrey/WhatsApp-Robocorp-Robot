*** Settings ***
Documentation       Template robot main suite.
Library    RPA.Windows
Library    RPA.Desktop
Library    OperatingSystem
Library    Collections

*** Variables ***
${JSON_FILE_PATH}    data.json
${ERROR_FILE_PATH}   error.json

*** Tasks ***
Whatsapp Send Message
    ${json_content}=    Get File    ${JSON_FILE_PATH}
    ${restaurants}=     Evaluate    json.loads('''${json_content}''')    json
    Windows Run    whatsapp.exe.lnk
    Control Window    WhatsApp
    FOR    ${restaurant}    IN    @{restaurants}
        ${phone_number}=    Set Variable    ${restaurant['phoneNumbers'][0]}
        ${restaurant_name}=    Set Variable    ${restaurant['name']}
        ${status}=    Run Keyword And Return Status    Send Whatsapp Message    ${phone_number}    ${restaurant_name}
        Run Keyword Unless    ${status}    Log Error    ${restaurant}
    END

*** Keywords ***
Send Whatsapp Message
    [Arguments]    ${phone_number}    ${restaurant_name}
    RPA.Windows.Click    id:SearchQueryTextBox
    Press Keys    ctrl    a
    Send Keys    id:SearchQueryTextBox    ${phone_number}
    Sleep    3sec
    RPA.Windows.Click    id:ChatsListItem
    RPA.Windows.Click    id:InputBarTextBox 
    Press Keys    ctrl    v
    Sleep    5sec
    Send Keys    id:CaptionEditBox    Hello, ${restaurant_name}
    Sleep    2sec
    RPA.Windows.Click    id:SubmitButton
    Sleep    2sec

Log Error
    [Arguments]    ${restaurant}
    ${errors}=    Get File    ${ERROR_FILE_PATH}
    ${errors}=    Evaluate    json.loads('''${errors}''')    json
    Append To List    ${errors}    ${restaurant}
    ${errors}=    Evaluate    json.dumps(${errors})    json
    Create File    ${ERROR_FILE_PATH}    ${errors}

