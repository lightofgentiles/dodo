CREATE TABLE ORDERS(
oCode VARCHAR2(50) NOT NULL, 
gdsCode NUMBER NOT NULL, 
userId VARCHAR2(50) NOT NULL, 
oDate DATE DEFAULT SYSDATE, 
oName VARCHAR2(20) NOT NULL, 
oPhon NUMBER NOT NULL, 
oAddr1 VARCHAR2(500) NOT NULL, 
oRequests VARCHAR2(100) NULL, 
oPayment NUMBER NOT NULL,
amount NUMBER NOT NULL,
delivery VARCHAR2(20) default '배송준비',
oAddr2 VARCHAR2(500) NOT NULL, 
oAddr3 VARCHAR2(500) NOT NULL, 
CONSTRAINT ORDERS_PK PRIMARY KEY (oCode)
);


COMMENT ON COLUMN ORDERS.oCode IS '오더코드';
COMMENT ON COLUMN ORDERS.gdsCode IS '상품코드';
COMMENT ON COLUMN ORDERS.userId IS '고객 아이디';
COMMENT ON COLUMN ORDERS.oDate IS '주문일';
COMMENT ON COLUMN ORDERS.oName IS '수령자';
COMMENT ON COLUMN ORDERS.oPhon IS '수령자 연락처';
COMMENT ON COLUMN ORDERS.oAddr IS '수령자 주소';
COMMENT ON COLUMN ORDERS.oRequests IS '배송 요청사항';
COMMENT ON COLUMN ORDERS.oPayment IS '결제수단(1.현금 2.카드 3.카카오페이)';
COMMENT ON COLUMN ORDERS.amount IS ' 총 결제 금액';


ALTER TABLE ORDERS
ADD CONSTRAINT FK_ORDERS_userId_MEMBER_userId FOREIGN KEY (userId)
REFERENCES MEMBER (userId) on delete cascade;


CREATE SEQUENCE seq_ORDERS
START WITH 1
INCREMENT BY 1;
-----------------------------------------------------------------------------------------------
CREATE TABLE ORDERS_DETAIL(
odCode NUMBER NOT NULL, 
oCode VARCHAR2(50) NOT NULL, 
gdsCode NUMBER NOT NULL, 
odQt NUMBER NOT NULL, 
CONSTRAINT ORDERS_DETAIL_PK PRIMARY KEY (odCode)
);


COMMENT ON COLUMN ORDERS_DETAIL.odCode IS '오더 상세 코드';
COMMENT ON COLUMN ORDERS_DETAIL.oCode IS '오더코드';
COMMENT ON COLUMN ORDERS_DETAIL.gdsCode IS '상품코드';
COMMENT ON COLUMN ORDERS_DETAIL.odQt IS '상품별 구매수량';


ALTER TABLE ORDERS_DETAIL
ADD CONSTRAINT ORDERS_DE_oCode_ORDERS_oCode FOREIGN KEY (oCode)
REFERENCES ORDERS (oCode) on delete cascade;


ALTER TABLE ORDERS_DETAIL
ADD CONSTRAINT OD_DE_gdsCode_GOODS_gdsCode FOREIGN KEY (gdsCode)
REFERENCES GOODS (gdsCode) on delete cascade;


CREATE SEQUENCE seq_ORDERS_DETAIL
START WITH 1
INCREMENT BY 1;

-----------------------------------------------------------------------------------------------
CREATE TABLE MEMBER(
userId VARCHAR2(50) NOT NULL, 
userPw VARCHAR2(50) NOT NULL, 
userName VARCHAR2(20) NOT NULL, 
userPhon NUMBER NOT NULL, 
userEmail VARCHAR2(100) NOT NULL, 
userAddr VARCHAR2(500) NOT NULL, 
RegDate DATEDEFAULT SYSDATE, 
CONSTRAINT MEMBER_PK PRIMARY KEY (userId)
);


COMMENT ON COLUMN MEMBER.userId IS '아이디';
COMMENT ON COLUMN MEMBER.userPw IS '비밀번호';
COMMENT ON COLUMN MEMBER.userName IS '이름';
COMMENT ON COLUMN MEMBER.userPhon IS '휴대폰 번호';
COMMENT ON COLUMN MEMBER.userEmail IS '이메일';
COMMENT ON COLUMN MEMBER.userAddr IS '주소';
COMMENT ON COLUMN MEMBER.RegDate IS '가입날짜';

-----------------------------------------------------------------------------------------------
CREATE TABLE GOODS(
gdsCode NUMBER NOT NULL, 
gdsCate VARCHAR2(100) NOT NULL, 
gdsName VARCHAR2(100) NOT NULL, 
gdsPrice VARCHAR2(100) NOT NULL, 
gdsStock NUMBER NOT NULL, 
gdsImg VARCHAR2(10000) NULL, 
gdsDetail VARCHAR2(10000) NOT NULL, 
gdsDate DATE DEFAULT SYSDATE, 
gdsSell NUMBER NULL, 
gdsThumbImg VARCHAR(200) NULL,
CONSTRAINT GOODS_PK PRIMARY KEY (gdsCode)
);


COMMENT ON COLUMN GOODS.gdsCode IS '상품코드';
COMMENT ON COLUMN GOODS.gdsCate IS '상품 분류';
COMMENT ON COLUMN GOODS.gdsName IS '상품이름';
COMMENT ON COLUMN GOODS.gdsPrice IS '가격';
COMMENT ON COLUMN GOODS.gdsStock IS '재고량';
COMMENT ON COLUMN GOODS.gdsImg IS '대표 이미지';
COMMENT ON COLUMN GOODS.gdsImg1 IS '추가 이미지1';
COMMENT ON COLUMN GOODS.gdsImg2 IS '추가 이미지2';
COMMENT ON COLUMN GOODS.gdsDetail IS '상세설명';
COMMENT ON COLUMN GOODS.gdsDate IS '등록일';
COMMENT ON COLUMN GOODS.gdsSell IS '구매 수';


CREATE SEQUENCE seq_GOODS
START WITH 1
INCREMENT BY 1;
-----------------------------------------------------------------------------------------------
CREATE TABLE CART(
cCode NUMBER NOT NULL, 
userId VARCHAR2(50) NOT NULL, 
gdsCode NUMBER NOT NULL, 
cQt NUMBER NOT NULL, 
cDate date default sysdate,
PRIMARY KEY (cCode,userId)
);


COMMENT ON COLUMN CART.cCode IS '장바구니 코드';
COMMENT ON COLUMN CART.userId IS '고객 아이디';
COMMENT ON COLUMN CART.gdsCode IS '상품코드';
COMMENT ON COLUMN CART.cQt IS '구매수량';
COMMENT ON COLUMN CART.cDate IS '카트 담은 날짜';


alter table cart
    add constraint cart_userId foreign key(userId)
    references member(userId) on delete cascade;

alter table cart
    add constraint cart_gdsCode foreign key(gdsCode)
    references goods(gdsCode) on delete cascade;

CREATE SEQUENCE seq_CART
START WITH 1
INCREMENT BY 1;
-----------------------------------------------------------------------------------------------
CREATE TABLE WISH_LIST(
wCode NUMBER NOT NULL, 
userId VARCHAR2(50) NOT NULL, 
gdsCode NUMBER NOT NULL, 
CONSTRAINT WISH_LIST_PK PRIMARY KEY (wCode)
);


COMMENT ON COLUMN WISH_LIST.wCode IS '찜 코드';
COMMENT ON COLUMN WISH_LIST.userId IS '고객 아이디';
COMMENT ON COLUMN WISH_LIST.gdsCode IS '상품코드';



alter table WISH_LIST
add CONSTRAINT FK_W_L_USERID_M_USERID
FOREIGN KEY(USERID) REFERENCES MEMBER(USERID)
ON DELETE CASCADE;


ALTER TABLE WISH_LIST
ADD CONSTRAINT FK_WISH_LIST_gdsCode_GOODS_gdsCode FOREIGN KEY (gdsCode)
REFERENCES GOODS (gdsCode)  on delete cascade;


CREATE SEQUENCE seq_WISH_LIST
START WITH 1
INCREMENT BY 1;
-----------------------------------------------------------------------------------------------
CREATE TABLE BOARD(
bCode NUMBER NOT NULL, 
bTitle VARCHAR2(100) NOT NULL, 
bWriter VARCHAR2(50) NOT NULL, 
bContent VARCHAR2(1000) NOT NULL, 
bSecret CHAR(1) NULL, 
bRegdate DATE DEFAULT SYSDATE, 
bPw VARCHAR2(20) NOT NULL, 
bImg VARCHAR2(10000) NULL, 
bHit NUMBER DEFAULT 0, 
CONSTRAINT BOARD_PK PRIMARY KEY (bCode)
);


COMMENT ON COLUMN BOARD.bCode IS '게시물 코드';
COMMENT ON COLUMN BOARD.bTitle IS '글 제목';
COMMENT ON COLUMN BOARD.bWriter IS '작성자';
COMMENT ON COLUMN BOARD.bContent IS '내용';
COMMENT ON COLUMN BOARD.bSecret IS '비밀글 여부(Y,N)';
COMMENT ON COLUMN BOARD.bRegdate IS '작성일';
COMMENT ON COLUMN BOARD.bPw IS '비밀번호';
COMMENT ON COLUMN BOARD.bImg IS '이미지';
COMMENT ON COLUMN BOARD.bHit IS '조회수';


ALTER TABLE BOARD
ADD CONSTRAINT FK_BOARD_bWriter_MEMBER_userId FOREIGN KEY (bWriter)
REFERENCES MEMBER (userId)  on delete cascade;


CREATE SEQUENCE seq_BOARD
START WITH 1
INCREMENT BY 1;

CREATE OR REPLACE TRIGGER BOARD_TRG
BEFORE INSERT ON BOARD 
REFERENCING NEW AS NEW FOR EACH ROW 
BEGIN 
    SELECT seq_BOARD.NEXTVAL
    INTO :NEW.BCODE
    FROM DUAL;
END;
-----------------------------------------------------------------------------------------------
CREATE TABLE B_FILE
(
    fCode NUMBER,                         --파일 번호
    bCode NUMBER NOT NULL,                    --게시판 번호
    orgFileName VARCHAR2(260) NOT NULL,   --원본 파일 이름
    storedFileName VARCHAR2(360) NOT NULL, --변경된 파일 이름
    fileSize NUMBER,                       --파일 크기
    regDate DATE DEFAULT SYSDATE NOT NULL,  --파일등록일
    delGb VARCHAR2(1) DEFAULT 'N' NOT NULL,--삭제구분
    PRIMARY KEY(fCode)                    --기본키 fCode
);



CREATE SEQUENCE seq_B_FILE
START WITH 1 
INCREMENT BY 1 
NOMAXVALUE NOCACHE;


ALTER TABLE B_FILE
ADD CONSTRAINT FK_B_F_bCode_B_bCode FOREIGN KEY (bCode)
REFERENCES BOARD (bCode)  on delete cascade;
-----------------------------------------------------------------------------------------------
CREATE TABLE COMMENT(
coCode NUMBER NOT NULL, 
bCode NUMBER NOT NULL, 
coWriter VARCHAR2(50) NOT NULL, 
coContent VARCHAR2(1000) NOT NULL, 
coRegdate DATE DEFAULT SYSDATE, 
CONSTRAINT COMMENT_PK PRIMARY KEY (coCode)
);


COMMENT ON COLUMN COMMENT.coCode IS '댓글 코드';
COMMENT ON COLUMN COMMENT.bCode IS '게시물 코드';
COMMENT ON COLUMN COMMENT.coWriter IS '작성자';
COMMENT ON COLUMN COMMENT.coContent IS '내용';
COMMENT ON COLUMN COMMENT.coRegdate IS '작성일';


ALTER TABLE COMMENT
ADD CONSTRAINT FK_COMMENT_bCode_BOARD_bCode FOREIGN KEY (bCode)
REFERENCES BOARD (bCode) on delete cascade;




CREATE SEQUENCE seq_COMMENT
START WITH 1
INCREMENT BY 1;