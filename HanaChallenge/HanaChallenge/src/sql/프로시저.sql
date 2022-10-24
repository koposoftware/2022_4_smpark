-- ������ü ���ν��� 
DROP PROCEDURE TRANSFER;

CREATE OR REPLACE PROCEDURE transfer (
     V_TOACCNUM IN VARCHAR2 -- ��� ���¹�ȣ
    ,V_TRMONEY IN NUMBER -- ��� ��ü�ݾ� (���̳ʽ� ����))
    ,V_TOACCBANKCODE IN VARCHAR2 -- ��� �����ڵ�
    ,V_TONAME IN VARCHAR2 -- ��� �̸�
    ,V_MYACCNUM IN VARCHAR2 -- �� ���¹�ȣ
)IS
    --V_MY_NAME              member.name%TYPE;
    V_MY_BALANCE            account.balance%TYPE;
    --V_TARGET_NAME         member.name%TYPE;
    V_TRTYPE                TRANSACTION.TRANS_TYPE%TYPE; -- �Ա� or ���
BEGIN
    BEGIN 
        -- 1. �� ���� �̸� ����
        --SELECT NAME INTO V_MY_NAME from hn_account a, hn_member b where a.member_id = b.id and a.account = V_MYACCNUM;
        --DBMS_OUTPUT.PUT_LINE('V_MY_NAME => ' || V_MY_NAME);    
        
        -- 2. �Ա����� ������� �Ǵ�
        IF V_TRMONEY < 0 THEN 
            V_TRTYPE := '���';
        ELSIF V_TRMONEY > 0 THEN 
            V_TRTYPE := '�Ա�';
        END IF;
    
        -- 3. �ܾ� UPDATE
        update account set balance = balance + V_TRMONEY where account_num = V_MYACCNUM;
        
        -- 4. �� �ܾ� ������ ����
        select balance INTO V_MY_BALANCE from account where account_num = V_MYACCNUM;
        
        -- 5. �ŷ� ���� INSERT
        insert into transaction(
            TRANS_NO, MY_ACCOUNT, TARGET_ACCOUNT, MY_BALANCE, target_bankcode, TARGET_NAME, TRANS_AMOUNT, TRANS_TYPE) 
        values(
            seq_transaction.nextval -- �ŷ� �ĺ� �ڵ�
            , V_MYACCNUM -- ������
            , V_TOACCNUM -- ������
            , V_MY_BALANCE -- �� ����� �ܾ�
            , V_TOACCBANKCODE -- ��� ����
            , V_TONAME -- ��� �̸�
            , V_TRMONEY -- �ŷ� �ݾ�
            , V_TRTYPE -- �ŷ� ����
        ); 
   END;
    EXCEPTION
        WHEN OTHERS THEN
    rollback;
END;
/


-- ���� ���ν���
DROP PROCEDURE executePro;

CREATE OR REPLACE PROCEDURE executePro(
     V_TOACCNUM IN VARCHAR2 -- ��� ���¹�ȣ
    ,V_TRMONEY IN NUMBER -- ��ü �ݾ�
    ,V_TOACCBANKCODE IN VARCHAR2 -- ��� �����ڵ�
    ,V_TONAME IN VARCHAR2 -- ��� �̸�
    ,V_MYACCNUM IN VARCHAR2 -- �� ���¹�ȣ
    ,V_RESULT OUT NUMBER -- ��� (0�̸� ����!)
)IS
   V_MY_NAME               member.name%TYPE;              -- �� �̸�
   V_MY_BANK_CODE          account.BANK_CODE%TYPE := 0004; -- ������ �ڵ�
BEGIN
BEGIN
    -- 0. ��� 0���� �ʱ�ȭ�ϱ�
     V_RESULT := 0;

    -- 1. �� �̸� ������ �����ϱ� 
    SELECT NAME INTO V_MY_NAME from account a, member b where a.id = b.id and a.account = V_MYACCNUM;
    
    -- 2. �� ���¿��� ��ݽ�Ű�� + �� �ŷ����� ������Ʈ
   BEGIN
          -- ��� ���� , ��ݱݾ�, ��� �����ڵ�, ��� �̸�, �� ����
        transfer(V_TOACCNUM, -1 * V_TRMONEY, V_TOACCBANKCODE, V_TONAME,V_MYACCNUM);
   EXCEPTION
    WHEN OTHERS THEN
     V_RESULT:=1;
    ROLLBACK;
    END;
    -- 3. ��� ���¿� �Աݽ�Ű�� + ��� �ŷ����� ������Ʈ 
    BEGIN
        -- ��� ���� , ��ݱݾ�, ��� �����ڵ�, ��� �̸�, �� ����
        CASE 
        --WHEN V_TOACCBANKCODE = '0001' THEN
            --update jbank_account@jk_link set balance = balance+V_TRMONEY where account_number = V_TOACCNUM;
        WHEN V_TOACCBANKCODE = '0002' THEN
            p_withdraw_tr@LINK_SUN2(V_TOACCBANKCODE, V_MYACCNUM, V_TOACCNUM, 'ID1', V_TRMONEY, 'Ÿ����ü');  
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


--              �޴� ����                                 �����°���
exec transfer('1230-901-0613-01', -1000, '001', '�ڼ���','1230-912-1013-01'); 
exec transfer('1230-912-1013-01', 1000, '001', '�ڼ���','1230-901-0613-01');
commit;