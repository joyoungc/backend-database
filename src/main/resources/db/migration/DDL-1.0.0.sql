CREATE TABLE member
  (
     id          BIGINT auto_increment PRIMARY KEY,
     name        VARCHAR(255) NOT NULL,
     grade       VARCHAR(255) comment '[VIP,BASIC]',
     city        VARCHAR(255),
     street      VARCHAR(255),
     zip_code    VARCHAR(255),
     created_by  VARCHAR(255),
     created_at  DATETIME comment '생성일',
     modified_by VARCHAR(255),
     modified_at DATETIME comment '수정일'
  );

CREATE TABLE orders
  (
     id             BIGINT auto_increment PRIMARY KEY,
     discount_price BIGINT,
     order_date     DATETIME,
     status         VARCHAR(255) comment '[ORDER,CANCEL]',
     member_id      BIGINT,
     product_id     BIGINT UNIQUE,
     created_by     VARCHAR(255),
     created_at     DATETIME,
     modified_by    VARCHAR(255),
     modified_at    DATETIME
  );

CREATE TABLE product
  (
     id          BIGINT auto_increment PRIMARY KEY,
     price       BIGINT,
     created_by  VARCHAR(255),
     modified_by VARCHAR(255),
     name        VARCHAR(255),
     created_at  DATETIME,
     modified_at DATETIME
  );

ALTER TABLE orders
  ADD CONSTRAINT fk_orders_01 FOREIGN KEY (member_id) REFERENCES member (id);

ALTER TABLE orders
  ADD CONSTRAINT fk_orders_02 FOREIGN KEY (product_id) REFERENCES product (id);