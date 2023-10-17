insert into "CATEGORY" (category_id, category_name) values ( 0,'미분류' );
insert into "CATEGORY" (category_name) values ( 'SET' );
insert into "CATEGORY" (category_name) values ('HAMBURGER');
insert into "CATEGORY" (category_name) values ('DRINK' );
insert into "CATEGORY" (category_name) values ('SIDE' );
insert into "CATEGORY" (category_name) values ('OPTION' );


insert into "PRODUCT" (product_name, product_description, product_status, product_count, product_price, category_id, product_image) values ('새우','오동통 새우버거','PRODUCT_STOP',3,1000,2,'/image/shrimp.jpg');
insert into "PRODUCT" (product_name, product_description, product_status, product_count, product_price, category_id) values ('더블와퍼','2겹 와퍼','PRODUCT_ING',10,2000,2);
insert into "PRODUCT" (product_name, product_description, product_status, product_count, product_price, category_id) values ('와퍼','1겹 와퍼','PRODUCT_ING',10,1500,2);
insert into "PRODUCT" (product_name, product_count, product_price, category_id, product_image) values ('불고기',10,2000,2,'/image/bulgogi.jpg');
insert into "PRODUCT" (product_name, product_count, product_price, category_id, product_image) values ('콜라',10,1000,3, '/image/cola.jpeg');
insert into "PRODUCT" (product_name, product_count, product_price, category_id) values ('감튀',10,1000,4);
insert into "PRODUCT" (product_name, product_count, product_price, category_id) values ('새우튀김',10,1000,5);
insert into "PRODUCT" (product_name, product_description, product_count, product_price, category_id, product_image) values ('새우버거 세트','새우버거단품 + 음료 + 감자튀김',10,5000,1,'/image/shrimpSet.jpeg' );
insert into "PRODUCT" (product_name, product_description, product_count, product_price, category_id, product_image,product_status) values ('와퍼 세트','와퍼 단품 + 음료 + 감자튀김',10,7000,1, '/image/wapperSet.jpeg','PRODUCT_STOP');



insert into "PROMOTION" (promotion_name, promotion_description, amount, discount_type, promotion_status, category_id) values ('세트할인 프로모션','세트상품 20% 할인 진행 중', 20,'DISCOUNT_RATE','PROMOTION_ING',1);
insert into "PROMOTION" (promotion_name, promotion_description, amount, discount_type, promotion_status, category_id) values ('햄버거 단품할인 프로모션','햄버거 300원 할인 진행 중', 300,'DISCOUNT_AMOUNT','PROMOTION_ING',2);
update "CATEGORY" SET promotion_id=1 WHERE category_name='SET';
update "CATEGORY" SET promotion_id=2 WHERE category_name='HAMBURGER';

insert into "MEMBER" (EMAIL, user_name, password, grade, stamp, address1, address2, address3, phone) values ('test1@test.com','테스트사용자','$2a$10$azfYLb9QxNhdIUaokehxlufvl3nomaLVIXpPVCVsEpf.WVrTFzc4i','GRADE_VIP',0,'서울시 강서구 마곡중앙8로','마곡사이언스파크 LG유플러스', '07795','02-6987-8282');
insert into "MEMBER" (EMAIL, user_name, password, grade, stamp, address1, address2, address3, phone) values ('test2@test.com','테스트사용자','$2a$10$owLoHstGPxzPk8WLtbSP3ucKrWewyWHSRphSLsjnhyePOOPVW8C.u','GRADE_VIP',0,'서울시 강서구 마곡중앙8로','마곡사이언스파크 LG유플러스', '07795','02-6987-8282');


insert into "CART" (MEMBER_ID, TOTAL_COUNT, total_price) values (1,12, 18900);
insert into "CART" (MEMBER_ID, TOTAL_COUNT, total_price) values (2,1, 2000);

insert into "CART_PRODUCT" (QUANTITY,CART_ID,PRODUCT_ID ) values (1,1,1);
insert into "CART_PRODUCT" (QUANTITY,CART_ID,PRODUCT_ID ) values (1,1,2);
insert into "CART_PRODUCT" (QUANTITY,CART_ID,PRODUCT_ID ) values (1,2,3);



-- insert into "ORDER" (ORDER_ID,ORDER_STATUS,TOTAL_COUNT,TOTAL_DISCOUNT_PRICE,TOTAL_PRICE,MEMBER_ID) values (1,'ORDER_REQUEST',1,200,2000,1);
-- insert into "ORDER" (ORDER_ID,ORDER_STATUS,TOTAL_COUNT,TOTAL_DISCOUNT_PRICE,TOTAL_PRICE,MEMBER_ID) values (2,'ORDER_REQUEST',1,200,2000,1);
-- insert into "ORDER" (ORDER_ID,ORDER_STATUS,TOTAL_COUNT,TOTAL_DISCOUNT_PRICE,TOTAL_PRICE,MEMBER_ID) values (3,'ORDER_REQUEST',1,200,2000,1);
-- insert into "ORDER" (ORDER_ID,ORDER_STATUS,TOTAL_COUNT,TOTAL_DISCOUNT_PRICE,TOTAL_PRICE,MEMBER_ID) values (4,'ORDER_REQUEST',1,200,2000,2);
-- insert into "ORDER" (ORDER_ID,ORDER_STATUS,TOTAL_COUNT,TOTAL_DISCOUNT_PRICE,TOTAL_PRICE,MEMBER_ID) values (5,'ORDER_REQUEST',1,200,2000,2);
--

-- insert into "ORDER_PRODUCT" (ORDER_PRODUCT_ID,QUANTITY,ORDER_ID,PRODUCT_ID ) values (1,1,1,1);
-- insert into "ORDER_PRODUCT" (ORDER_PRODUCT_ID,QUANTITY,ORDER_ID,PRODUCT_ID ) values (2,1,2,2);
-- insert into "ORDER_PRODUCT" (ORDER_PRODUCT_ID,QUANTITY,ORDER_ID,PRODUCT_ID ) values (3,1,3,2);
-- insert into "ORDER_PRODUCT" (ORDER_PRODUCT_ID,QUANTITY,ORDER_ID,PRODUCT_ID ) values (4,1,4,2);
-- insert into "ORDER_PRODUCT" (ORDER_PRODUCT_ID,QUANTITY,ORDER_ID,PRODUCT_ID ) values (5,1,5,2);
--
-- insert into "DELIVERY" (DELIVERY_ID,DELIVERY_STATUS,ORDER_ID) values (1,'DELIVERY_READY',1);
-- insert into "DELIVERY" (DELIVERY_ID,DELIVERY_STATUS,ORDER_ID) values (2,'DELIVERY_START',2);
-- insert into "DELIVERY" (DELIVERY_ID,DELIVERY_STATUS,ORDER_ID) values (3,'DELIVERY_SUCCESS',3);
-- insert into "DELIVERY" (DELIVERY_ID,DELIVERY_STATUS,ORDER_ID) values (4,'DELIVERY_SUCCESS',4);
-- insert into "DELIVERY" (DELIVERY_ID,DELIVERY_STATUS,ORDER_ID) values (5,'DELIVERY_SUCCESS',5);


