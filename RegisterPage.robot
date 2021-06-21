# ทดสอบหน้าสมัครสมาชิก Register Page
*** Settings ***
Library    SeleniumLibrary
Test Setup    เปิด Browser
Test Teardown    Close Browser

*** Variables ***
${url}    https://www.renthub.in.th/signup

***Test Cases***
ID1: สมัครสมาชิกโดยกรอกรหัสผ่านไม่ตรงกัน
    กรอกข้อมูลสมัครสมาชิก    สมใจ รักเดียว    somjai@demo.com    0812345678    somjai1234    somjai123    กระบี่    member
    กดปุ่มสมัครสมาชิก
    ต้องมีการแจ้งเตือนให้กรอกข้อมูลที่ถูกต้อง    การยืนยัน password ไม่ต้องตรงกับ password ใหม่

ID2: สมัครสมาชิกโดยไม่กรอกชื่อสมาชิก
    กรอกข้อมูลสมัครสมาชิก    ${EMPTY}    somjai@demo.com    0812345678    somjai1234    somjai1234    กระบี่    member
    กดปุ่มสมัครสมาชิก
    ต้องมีการแจ้งเตือนให้กรอกข้อมูลที่ถูกต้อง    กรุณาใส่ชื่อสมาชิก

ID3: สมัครสมาชิกโดยกรอกเบอร์โทรศัพท์ผิดรูปแบบ
    กรอกข้อมูลสมัครสมาชิก    สมใจ รักเดียว    somjai@demo.com    เบอร์สมใจเอง    somjai1234    somjai1234    กระบี่    member
    กดปุ่มสมัครสมาชิก
    ต้องมีการแจ้งเตือนให้กรอกข้อมูลที่ถูกต้อง    ข้อมูลต่อไปนี้ไม่ถูกต้อง

ID4: สมัครสมาชิกโดยไม่เลือกจังหวัด
    กรอกข้อมูลสมัครสมาชิก    สมใจ รักเดียว    somjai@demo.com    0812345678    somjai1234    somjai1234    ${EMPTY}    apartment_manager
    กดปุ่มสมัครสมาชิก
    ต้องมีการแจ้งเตือนให้กรอกข้อมูลที่ถูกต้อง    กรุณาเลือกจังหวัด

ID5: สมัครสมาชิกโดยใช้อีเมลที่มีอยู่ในระบบ
    กรอกข้อมูลสมัครสมาชิก    สมใจ รักเดียว    sisap40433@zcai77.com    0812345678    somjai1234    somjai1234    กระบี่    apartment_manager
    กดปุ่มสมัครสมาชิก
    ต้องมีการแจ้งเตือนให้กรอกข้อมูลที่ถูกต้อง    email ที่ระบุเป็นสมาชิกอยู่แล้ว

ID6: สมัครสมาชิกโดยกรอกอีเมลผิดรูปแบบ
    กรอกข้อมูลสมัครสมาชิก    สมใจ รักเดียว    somjai@demo_dot_com    0812345678    somjai1234    somjai1234    กระบี่    apartment_manager
    กดปุ่มสมัครสมาชิก
    ต้องมีการแจ้งเตือนให้กรอกข้อมูลที่ถูกต้อง    รูปแบบ อีเมลจะไม่ถูกต้อง (ตัวอย่างที่ถูกต้อง name@email.com)



*** Keywords ***
เปิด Browser
    Open Browser    ${url}    chrome
    Wait Until Page Contains    สมัครสมาชิก ฟรี!

กรอกข้อมูลสมัครสมาชิก
    [Arguments]    ${name}    ${email}    ${phone}    ${password}    ${confirmPasscord}    ${province}    ${role}
    Input Text    id=user_name    ${name}
    Input Text    id=user_email    ${email}
    Input Text    id=user_phone    ${phone}
    Input Password    id=user_password    ${password}
    Input Password    id=user_password_confirmation    ${confirmPasscord}
    Select From List By Label    id=user_province_code   ${province}
    Select Radio Button    user[roles]    ${role}

กดปุ่มสมัครสมาชิก
    Click Button    name=commit

ต้องมีการแจ้งเตือนให้กรอกข้อมูลที่ถูกต้อง
    [Arguments]    ${text}
    Wait Until Page Contains    ${text}  
