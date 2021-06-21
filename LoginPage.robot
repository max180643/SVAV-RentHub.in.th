# ทดสอบหน้าเข้าสู่ระบบ Login Page
*** Settings ***
Library    SeleniumLibrary
Test Setup    เปิด Browser
Test Teardown    Close Browser

*** Variables ***
${url}    https://www.renthub.in.th/login

***Test Cases***
ID1: เข้าสู่ระบบด้วยอีเมลที่มีอยู่ในระบบและรหัสผ่านที่ถูกต้อง
    เข้าสู่ระบบด้วยไอดีและรหัสผ่าน    correct@demo.com    CorrectPassword
    กดปุ่ม Sign in
    เข้าสู่ระบบสำเร็จ

ID2: เข้าสู่ระบบด้วยอีเมลที่มีอยู่ในระบบ แต่รหัสผ่านไม่ถูกต้อง
    เข้าสู่ระบบด้วยไอดีและรหัสผ่าน    correct@demo.com    WrongPassword
    กดปุ่ม Sign in
    แสดงข้อความแจ้งเตือน "Email หรือ password ไม่ถูกต้อง"

ID3: เข้าสู่ระบบด้วยอีเมลที่ไม่มีอยู่ในระบบ
    เข้าสู่ระบบด้วยไอดีและรหัสผ่าน    wrong@demo.com    CorrectPassword
    กดปุ่ม Sign in
    แสดงข้อความแจ้งเตือน "Email หรือ password ไม่ถูกต้อง"

*** Keywords ***
เปิด Browser
    Open Browser    ${url}    chrome
    Wait Until Page Contains    Login เข้าสู่ระบบ

เข้าสู่ระบบด้วยไอดีและรหัสผ่าน
    [Arguments]    ${email}    ${password}
    Input Text    id=user_email    ${email}
    Input Password    id=user_password    ${password}

กดปุ่ม Sign in
    Click Button    name=commit

เข้าสู่ระบบสำเร็จ
    Wait Until Page Contains    ประกาศของคุณ

แสดงข้อความแจ้งเตือน "Email หรือ password ไม่ถูกต้อง"
    Wait Until Page Contains    Email หรือ password ไม่ถูกต้อง
