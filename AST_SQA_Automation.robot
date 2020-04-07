*** Settings ***
Library           SeleniumLibrary

*** Variables ***
${url}            http://sqa.grp.gov.bd/global/web/dashboard
${browser}        gc
@{credentials}    mors0001    123456789    ashok@bcc.gov.bd    123456789    taif0001    123456789    risa0001    123456789    nila0001    123456789

*** Test Cases ***
Login PRC
    Login PRC

OPM - DCP
    OPM - DCP
    Close All Browsers

Login AST
    Login AST

Orders receive from DCP - Store Keeper
    Orders receive from DCP - Store Keeper
    Close All Browsers

Asset Return - Self Return - Store Keeper
    Asset Return - self return - store keeper
    Close All Browsers

Asset Return - Request \ Return - Store Admin
    Asset Return - Request \ Return - Store Admin
    Close All Browsers

Inspection - Inspector Assign - Store Admin
    Inspection - Inspector Assign - Store Admin
    Close All Browsers

Inspection - Inspection results - Inspector
    Inspection - Inspection results - Inspector
    Close All Browsers

Inspection - Inspection approval - Store Admin
    Inspection - Inspection approval - Store Admin
    Close All Browsers

Asset Tagging - After Inspection - Store Keeper
    Asset Tagging - After Inspection - Store Keeper
    Close All Browsers

Direct In - Direct in request send for approval - Store keeper
    Direct In - Direct in request send for approval - Store keeper
    Close All Browsers

Asset Requisition -New Requisition Create - User
    Asset Requisition -New Requisition Create - User

Asset Requisition -Requisition approval - Store admin
    Asset Requisition -Requisition approval - Store admin
    Close All Browsers

Asset Requisition - Issue Item \ - Store keeper
    Asset Requisition - Issue Item \ - Store keeper
    Close All Browsers

*** Keywords ***
Login PRC
    Open Browser    ${url}    ${browser}
    Maximize Browser Window
    Input Text    (//input[@name='username'])    ${credentials}[0]
    Sleep    2
    Input Text    (//input[@name='password'])    ${credentials}[1]
    Sleep    2
    Click Element    (//button[@class='btn btn-primary px-4'])
    Sleep    3
    Click Element    (//img[@src='assets/img/brand/procurement.svg'])
    Sleep    3

OPM - DCP
    [Documentation]    _From Procurement Module - Procuring Entity(PE) \ can add item, add other info and save and finally PE can edit /update the OPM untill the status is 'NEW'_
    Click Element    (//i[@class='nav-icon fa fa-angle-down'])[5]
    Sleep    2
    Click Element    //a/i[@class='nav-icon fa fa-money']
    Sleep    2
    Click Element    //span[@class='mat-button-wrapper']
    Sleep    2
    Click Element    (//div[@class='mat-select-arrow-wrapper'])[1]
    Sleep    2
    Click Element    (//span[@class='mat-option-text'])[2]
    Sleep    2
    Click Element    (//div[@class='mat-select-arrow-wrapper'])[3]
    Sleep    2
    Click Element    (//span[@class='mat-option-text'])[1]
    Sleep    2
    Input Text    (//input[@placeholder='রেফারেন্স নং'])[1]    PRC/TEST/001
    Sleep    2
    Input Text    (//div/textarea[@placeholder='বিবরণ'])[1]    This is automatically inputed 25 Mar
    Sleep    2
    Input Text    (//div/textarea[@placeholder='মন্তব্য'])[1]    Test By SQA
    Click Element    (//button[@class='btn btn-pill btn-block custom-add-item'])[1]
    Sleep    2
    Click Element    (//div[@class='mat-select-arrow-wrapper'])[4]
    Sleep    2
    Click Element    (//span[@class='mat-option-text'])[8]
    Sleep    4
    Click Element    (//span[@class='mat-button-wrapper'])[3]
    Sleep    2
    Input Text    (//input[@id='requestedQuantity'])[1]    5
    Sleep    2
    Input Text    (//input[@id='requestedQuantity'])[2]    5000
    Sleep    2
    Input Text    (//input[@id='requestedQuantity'])[3]    Test 1 Data
    Sleep    2
    Click Element    (//mat-icon[@class='mat-icon notranslate material-icons mat-icon-no-color'])[1]
    Sleep    2
    Input Text    (//input[@id='requestedQuantity'])[4]    10
    Sleep    2
    Input Text    (//input[@id='requestedQuantity'])[5]    6000
    Sleep    2
    Input Text    (//input[@id='requestedQuantity'])[6]    Test 2 Data
    Sleep    2
    Click Element    (//mat-icon[@class='mat-icon notranslate material-icons mat-icon-no-color'])[2]
    Sleep    2
    Click Element    (//button[@class='mat-button mat-button-base'])    #item add pop up shut down
    Sleep    2
    #Click Element    (//i[@class='fa fa-map-marker'])[1]
    #Sleep    2
    #Click Element    (//span[@class='mat-button-wrapper'])[12]
    #Sleep    2
    #Click Element    (//i[@class='fa fa-pencil-square-o'])[1]
    #Sleep    2
    #Clear Element Text    //input[@placeholder='পরিমাণ']
    #Sleep    2
    #Input Text    //input[@placeholder='পরিমাণ']    3
    #Sleep    2
    #Click Element    (//button[@class='btn btn-cus-success'])
    #Sleep    2
    Input Text    (//input[@formcontrolname='discount'])    4    #discount
    Sleep    2
    Input Text    (//input[@formcontrolname='vat'])    3    #vat
    Sleep    2
    Input Text    (//input[@formcontrolname='ait'])    2    #ait
    Sleep    2
    Click Element    (//i[@class='fa fa-save'])    \    #হালনাগাদ করুন
    Sleep    3
    Click Element    (//button[@class='btn btn-cus-success btn-md'])
    Sleep    3

Login AST
    Open Browser    ${url}    ${browser}
    Maximize Browser Window
    Input Text    (//input[@name='username'])    ${credentials}[4]
    Sleep    2    123456789
    Input Text    (//input[@name='password'])    ${credentials}[5]
    Sleep    2
    Click Element    (//button[@class='btn btn-primary px-4'])
    Sleep    4
    #Click Element    //div/button[contains(text(),'উপসচিব, কার্যনির্বাহী শাখা')]
    #Sleep    2
    Click Element    (//img[@src='assets/img/brand/asset.svg'])
    Sleep    3

Orders receive from DCP - Store Keeper
    Click Element    (//i[@class='nav-icon icon-user'])[1]    \    #click for orders
    Sleep    2
    Click Element    (//div[@class='e-text-wrap'])[2]    \    #click for select sqa store
    Sleep    2
    Click Element    (//span[@class='mat-button-wrapper'])[4]    \    #receive for inspection
    Sleep    2
    Input Text    (//input[@placeholder='চালান নং'])    cha/test/ast/23/03/2020/001
    Sleep    2
    Click Element    (//i[@class='fa fa-arrow-right'])    \    # গ্রহণ এবং ইন্সপেকশনের জন্য প্রেরণ করুন
    Sleep    2

Inspection - Inspector Assign - Store Admin
    [Documentation]    Store admin part for inspector assign
    Open Browser    ${url}    ${browser}    #login as store admin part for inspector assign
    Maximize Browser Window
    Input Text    (//input[@name='username'])    ${credentials}[0]
    Sleep    2
    Input Text    (//input[@name='password'])    ${credentials}[1]
    Sleep    2
    Click Element    (//button[@class='btn btn-primary px-4'])
    Sleep    2
    Click Element    (//img[@src='assets/img/brand/asset.svg'])
    Sleep    3
    Click Element    (//i[@class='nav-icon icon-user'])[5]    \    #Inspector
    Sleep    2
    Click Element    (//i[@class='nav-icon icon-user'])[6]    \    # Inspector assign
    Sleep    2
    Click Element    (//span[@class='mat-button-wrapper'])[5]
    Sleep    2
    Click Element    (//div[@class='mat-select-arrow-wrapper'])[1]    \    #Inspector Type
    Sleep    2
    Click Element    (//span[@class='mat-option-text'])[2]    \    #for kormokorta
    Sleep    2
    Click Element    (//div[@class='mat-select-arrow-wrapper'])[2]    \    # select inspector
    Sleep    2
    Click Element    (//span[@class='mat-option-text'])[101]    \    # raisa amin
    Sleep    2
    Click Element    (//span[@class='mat-button-wrapper'])[2]
    Sleep    2

Inspection - Inspection results - Inspector
    [Documentation]    Inspector - inspection results
    Open Browser    ${url}    ${browser}    #login as Inspector for inspection results
    Maximize Browser Window
    Input Text    (//input[@name='username'])    ${credentials}[6]
    Sleep    2
    Input Text    (//input[@name='password'])    ${credentials}[7]
    Sleep    2
    Click Element    (//button[@class='btn btn-primary px-4'])
    Sleep    4
    Click Element    (//img[@src='assets/img/brand/asset.svg'])
    Sleep    3
    Click Element    (//i[@class='nav-icon icon-user'])[1]    \    #Inspection
    Sleep    2
    Click Element    (//i[@class='nav-icon icon-user'])[3]    \    #Inspection results
    Sleep    2
    Click Element    (//span[@class='mat-button-wrapper'])[1]    \    #click for inspection
    Sleep    3
    #Input Text    (//input[@id='textbox_2'])    Okey
    #Sleep    2
    #Input Text    (//input[@id='textbox_3'])    All is Okey
    #Sleep    2
    Click Element    (//i[@class='fa fa-check-square'])
    Sleep    2

Inspection - Inspection approval - Store Admin
    [Documentation]    Store admin approves the inspected results by Inspector
    Open Browser    ${url}    ${browser}    #Store admin approves the inspected results by Inspector
    Maximize Browser Window
    Input Text    (//input[@name='username'])    ${credentials}[0]
    Sleep    2
    Input Text    (//input[@name='password'])    ${credentials}[1]
    Sleep    2
    Click Element    (//button[@class='btn btn-primary px-4'])
    Sleep    3
    Click Element    (//img[@src='assets/img/brand/asset.svg'])
    Sleep    2
    Click Element    (//i[@class='nav-icon icon-user'])[5]    \    #Inspection
    Sleep    2
    Click Element    (//i[@class='nav-icon icon-user'])[8]    \    #পরিদর্শনকৃত
    Sleep    2
    Click Element    (//span[@class='mat-button-wrapper'])[1]    \    #click for approval
    Sleep    2
    Click Element    (//i[@class='fa fa-check-square'])    \    #Approve button
    Sleep    2

Asset Tagging - After Inspection - Store Keeper
    [Documentation]    Asset tagging - Store keeper tagged asset after inspection approval
    Open Browser    ${url}    ${browser}    #Asset tagging - Store keeper tagged asset after inspection approval
    Maximize Browser Window
    Input Text    (//input[@name='username'])    ${credentials}[4]
    Sleep    2
    Input Text    (//input[@name='password'])    ${credentials}[5]
    Sleep    2
    Click Element    (//button[@class='btn btn-primary px-4'])
    Sleep    4
    Click Element    (//img[@src='assets/img/brand/asset.svg'])
    Sleep    2
    Click Element    (//i[@class='nav-icon icon-user'])[2]
    Sleep    2
    Click Element    (//span[@class='mat-button-wrapper'])[2]
    Sleep    2
    Click Element    (//span[@class='mat-button-wrapper'])[2]    \    #click for tagging
    Sleep    2
    Input Text    (//input[@class='e-control e-textbox e-lib e-input'])[2]    24
    Sleep    3
    Click Element    (//div[@class='card-header ng-star-inserted'])    \    #Other any place click
    Sleep    2
    Click Element    (//span[@class='mat-button-wrapper'])[2]    \    #Submit
    Sleep    2
    Click Element    (//span[@class='mat-button-wrapper'])[2]    \    #back button
    Sleep    2

Asset Return - self return - store keeper
    [Documentation]    Store keeper can give return request ( self return )
    Open Browser    ${url}    ${browser}    #Store keeper can give return request ( self return )
    Maximize Browser Window
    Input Text    (//input[@name='username'])    ${credentials}[4]
    Sleep    2
    Input Text    (//input[@name='password'])    ${credentials}[5]
    Sleep    2
    Click Element    (//button[@class='btn btn-primary px-4'])
    Sleep    4
    Click Element    (//img[@src='assets/img/brand/asset.svg'])
    Sleep    2
    Click Element    (//i[@class='nav-icon icon-user'])[6]    \    #click for asset return
    Sleep    2
    Click Element    (//i[@class='nav-icon icon-user'])[7]    \    #click for return existing item
    Sleep    2
    Input Text    (//input[@placeholder='ট্যাগ'])    2020/03/19/13/34/22/17390    #input tag
    Sleep    2
    Click Element    (//span[@class='mat-button-wrapper'])[1]    \    # add item button
    Sleep    2
    Click Element    (//span[@class='mat-button-wrapper'])[3]    \    # click for inspection
    Sleep    2

Asset Return - Request \ Return - Store Admin
    Open Browser    ${url}    ${browser}
    Maximize Browser Window
    Input Text    (//input[@name='username'])    ${credentials}[0]
    Sleep    2
    Input Text    (//input[@name='password'])    ${credentials}[1]
    Sleep    2
    Click Element    (//button[@class='btn btn-primary px-4'])
    Sleep    2
    Click Element    (//img[@src='assets/img/brand/asset.svg'])
    Sleep    2
    Click Element    (//i[@class='nav-icon icon-user'])[9]    \    #click for asset return
    Sleep    2
    Click Element    (//i[@class='nav-icon icon-user'])[10]    \    #click for asset return request \ \
    Sleep    2

Direct In - Direct in request send for approval - Store keeper
    Open Browser    ${url}    ${browser}
    Maximize Browser Window
    Input Text    (//input[@name='username'])    ${credentials}[4]
    Sleep    2
    Input Text    (//input[@name='password'])    ${credentials}[5]
    Sleep    2
    Click Element    (//button[@class='btn btn-primary px-4'])
    Sleep    5
    Click Element    (//img[@src='assets/img/brand/asset.svg'])
    Sleep    3
    Click Element    (//i[@class='nav-icon icon-user'])[20]    \    #For direct in
    Sleep    2
    Click Element    (//div[@class='e-tab-text'])[2]    \    #For cokreates store
    Sleep    2
    Click Element    (//span[@class='mat-button-wrapper'])[2]    \    # ' + '
    Sleep    2
    Input Text    (//input[@placeholder='গ্রহণের ধরণ'])    Donation
    Sleep    2
    Input Text    (//input[@placeholder='ন্যায্যতা'])    For Biddhanondo Foundation
    Sleep    2
    Click Element    (//span[@class='mat-button-wrapper'])[2]    \    # ' + '
    Sleep    2
    Click Element    (//div[@class='mat-select-arrow-wrapper'])[1]    \    #Category select
    Sleep    2
    Click Element    (//span[@class='mat-option-text'])[5]    \    #for air conditioner
    Sleep    2
    Input Text    (//input[@id='textbox_4'])    10
    Sleep    2
    Click Element    (//span[@class='mat-button-wrapper'])[3]
    Sleep    2

Asset Requisition -New Requisition Create - User
    Open Browser    ${url}    ${browser}
    Maximize Browser Window
    Input Text    (//input[@name='username'])    ${credentials}[0]
    Sleep    2
    Input Text    (//input[@name='password'])    ${credentials}[1]
    Sleep    2
    Click Element    (//button[@class='btn btn-primary px-4'])
    Sleep    4
    Click Element    (//img[@src='assets/img/brand/asset.svg'])
    Sleep    3
    Click Element    (//i[@class='nav-icon icon-user'])[12]    \    #requisition
    Sleep    2
    Click Element    (//i[@class='nav-icon icon-user'])[13]    \    #new requisition
    Sleep    2
    Click Element    (//span[@class='mat-button-wrapper'])[1]    \    # ' \ + \ '
    Sleep    2
    Click Element    (//span[@class='mat-button-wrapper'])[1]    \    # ' \ + \ '
    Sleep    2
    Click Element    (//div[@class='mat-select-arrow-wrapper'])[4]    \    #category select
    Sleep    2
    Click Element    (//span[@class='mat-option-text'])[5]    \    # for AC
    Sleep    2
    Input Text    (//input[@id='textbox_2'])    1
    Sleep    2
    Click Element    (//span[@class='mat-button-wrapper'])[2]    \    # ' \ + \ '
    Sleep    3
    Click Element    (//span[@class='mat-button-wrapper'])[5]    #send for approval
    Sleep    2

Asset Requisition -Requisition approval - Store admin
    #Click Element    (//i[@class='nav-icon icon-user'])[12]
    #Sleep    2
    Click Element    (//i[@class='nav-icon icon-user'])[14]    \    #click for approval
    Sleep    2
    Click Element    (//span[@class='mat-button-wrapper'])[13]    \    #click for enter
    Sleep    2
    Click Element    (//span[@class='mat-button-wrapper'])[2]    \    #history view
    Sleep    2
    Click Element    (//span[@class='mat-button-wrapper'])[7]    \    #click for ' + '
    Sleep    2
    Click Element    (//span[@class='mat-button-wrapper'])[1]    \    # add asset
    Sleep    2
    Click Element    (//span[@class='mat-button-wrapper'])[2]    \    # add asset
    Sleep    2
    #Input Text    (//input[@id='textbox_11'])    Test 1 April    #comments for approve
    #Sleep    2
    Click Element    (//span[@class='mat-button-wrapper'])[6]
    Sleep    2
    Input Text    (//input[@placeholder ='মন্তব্য'])    Given for test purpose - 1 April    #comments for approve \
    Sleep    2
    Click Element    (//span[@class='mat-button-wrapper'])[7]    \    #add
    Sleep    2
    Click Element    (//span[@class='mat-button-wrapper'])[2]
    Sleep    2

Asset Requisition - Issue Item \ - Store keeper
    Open Browser    ${url}    ${browser}
    Maximize Browser Window
    Input Text    (//input[@name='username'])    ${credentials}[4]
    Sleep    2
    Input Text    (//input[@name='password'])    ${credentials}[5]
    Sleep    2
    Click Element    (//button[@class='btn btn-primary px-4'])
    Sleep    4
    Click Element    (//img[@src='assets/img/brand/asset.svg'])
    Sleep    3
    Click Element    (//i[@class='nav-icon icon-user'])[11]
    Sleep    2
    Click Element    (//i[@class='nav-icon icon-user'])[13]
    Sleep    2
    Click Element    (//div[@class='e-tab-text'])[2]
    Sleep    2
    Click Element    (//span[@class='mat-button-wrapper'])[1]
    Sleep    2
    Click Element    (//span[@class='mat-button-wrapper'])[2]
    Sleep    2
