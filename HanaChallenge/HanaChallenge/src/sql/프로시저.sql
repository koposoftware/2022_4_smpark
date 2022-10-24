-- 계좌이체 프로시저 
DROP PROCEDURE TRANSFER;

CREATE OR REPLACE PROCEDURE transfer (
     V_TOACCNUM IN VARCHAR2 -- 상대 계좌번호
    ,V_TRMONEY IN NUMBER -- 상대 이체금액 (마이너스 포함))
    ,V_TOACCBANKCODE IN VARCHAR2 -- 상대 은행코드
    ,V_TONAME IN VARCHAR2 -- 상대 이름
    ,V_MYACCNUM IN VARCHAR2 -- 내 계좌번호
)IS
    --V_MY_NAME              member.name%TYPE;
    V_MY_BALANCE            account.balance%TYPE;
    --V_TARGET_NAME         member.name%TYPE;
    V_TRTYPE                TRANSACTION.TRANS_TYPE%TYPE; -- 입금 or 출금
BEGIN
    BEGIN 
        -- 1. 내 계좌 이름 매핑
        --SELECT NAME INTO V_MY_NAME from hn_account a, hn_member b where a.member_id = b.id and a.account = V_MYACCNUM;
        --DBMS_OUTPUT.PUT_LINE('V_MY_NAME => ' || V_MY_NAME);    
        
        -- 2. 입금인지 출금인지 판단
        IF V_TRMONEY < 0 THEN 
            V_TRTYPE := '출금';
        ELSIF V_TRMONEY > 0 THEN 
            V_TRTYPE := '입금';
        END IF;
    
        -- 3. 잔액 UPDATE
        update account set balance = balance + V_TRMONEY where account_num = V_MYACCNUM;
        
        -- 4. 내 잔액 변수에 저장
        select balance INTO V_MY_BALANCE from account where account_num = V_MYACCNUM;
        
        -- 5. 거래 내역 INSERT
        insert into transaction(
            TRANS_NO, MY_ACCOUNT, TARGET_ACCOUNT, MY_BALANCE, target_bankcode, TARGET_NAME, TRANS_AMOUNT, TRANS_TYPE) 
        values(
            seq_transaction.nextval -- 거래 식별 코드
            , V_MYACCNUM -- 내계좌
            , V_TOACCNUM -- 상대계좌
            , V_MY_BALANCE -- 내 변경된 잔액
            , V_TOACCBANKCODE -- 상대 은행
            , V_TONAME -- 상대 이름
            , V_TRMONEY -- 거래 금액
            , V_TRTYPE -- 거래 유형
        ); 
   END;
    EXCEPTION
        WHEN OTHERS THEN
    rollback;
END;
/


-- 통합 프로시저
DROP PROCEDURE executePro;

CREATE OR REPLACE PROCEDURE executePro(
     V_TOACCNUM IN VARCHAR2 -- 상대 계좌번호
    ,V_TRMONEY IN NUMBER -- 이체 금액
    ,V_TOACCBANKCODE IN VARCHAR2 -- 상대 은행코드
    ,V_TONAME IN VARCHAR2 -- 상대 이름
    ,V_MYACCNUM IN VARCHAR2 -- 내 계좌번호
    ,V_RESULT OUT NUMBER -- 결과 (0이면 성공!)
)IS
   V_MY_NAME               member.name%TYPE;              -- 내 이름
   V_MY_BANK_CODE          account.BANK_CODE%TYPE := 0004; -- 내은행 코드
BEGIN
BEGIN
    -- 0. 결과 0으로 초기화하기
     V_RESULT := 0;

    -- 1. 내 이름 변수에 매핑하기 
    SELECT NAME INTO V_MY_NAME from account a, member b where a.id = b.id and a.account = V_MYACCNUM;
    
    -- 2. 내 계좌에서 출금시키기 + 내 거래내역 업데이트
   BEGIN
          -- 상대 계좌 , 출금금액, 상대 은행코드, 상대 이름, 내 계좌
        transfer(V_TOACCNUM, -1 * V_TRMONEY, V_TOACCBANKCODE, V_TONAME,V_MYACCNUM);
   EXCEPTION
    WHEN OTHERS THEN
     V_RESULT:=1;
    ROLLBACK;
    END;
    -- 3. 상대 계좌에 입금시키기 + 상대 거래내역 업데이트 
    BEGIN
        -- 상대 계좌 , 출금금액, 상대 은행코드, 상대 이름, 내 계좌
        CASE 
        --WHEN V_TOACCBANKCODE = '0001' THEN
            --update jbank_account@jk_link set balance = balance+V_TRMONEY where account_number = V_TOACCNUM;
        WHEN V_TOACCBANKCODE = '0002' THEN
            p_withdraw_tr@LINK_SUN2(V_TOACCBANKCODE, V_MYACCNUM, V_TOACCNUM, 'ID1', V_TRMONEY, '타행이체');  
        WHEN V_TOACCBANKCODE = '0003' THEN
            update pjt_account@LINK_CHOI set balance= balance+V_TRMONEY where accountno = to_char(V_TOACCNUM);
        --ELSE
        WHEN V_TOACCBANKCODE = '0004' THEN
            transfer(V_MYACCNUM, V_TRMONEY, V_MY_BANK_CODE, V_MY_NAME, V_TOACCNUM); 
        end CASE;
        --END CASE;
        
   EXCEPTION
    WHEN OTHERS THEN
    V_RESULT :=2;
    ROLLBACK;
    END;
   COMMIT;
END;
EXCEPTION
    WHEN OTHERS THEN
    V_RESULT := 3;
    ROLLBACK;
END;
/


--              받는 계좌                                 보내는계좌
exec transfer('1230-901-0613-01', -1000, '001', '박수민','1230-912-1013-01'); 
exec transfer('1230-912-1013-01', 1000, '001', '박수민','1230-901-0613-01');
commit;