create sequence hibernate_sequence start 1 increment 1;
create table cart
(
    id int8 not null,
    total_items int4,
    count_prise int4,
    user_id int8,
    primary key (id)
);

create table cart_item
(
    id int8 not null,
    amount int4,
    cart_id int8 not null,
    product_id int8 not null,
    primary key (id)
);

create table category
(
    id int8 not null,
    title varchar(255) not null,
    category_id int8,
    primary key (id)
);

create table news
(
    id int8 not null,
    date_created timestamp,
    imageurl     varchar(255),
    text         varchar(8096) not null,
    title        varchar(255)  not null,
    user_id int8,
    primary key (id)
);

create table order_table
(
    id int8 not null,
    address         varchar(255),
    execution_stage varchar(255),
    phone           varchar(255),
    products_prise int4 not null,
    user_id int8,
    primary key (id)
);

create table ordered_product
(
    id int8 not null,
    amount int4,
    order_id int8 not null,
    product_id int8 not null,
    primary key (id)
);

create table product
(
    id bigserial not null,
    available   boolean,
    description varchar(8096) not null,
    image_url   varchar(255),
    name        varchar(255)  not null,
    price int4 not null,
    warranty_months int4,
    category_id int8 not null,
    primary key (id)
);

create table user_contacts
(
    id int8 not null,
    address varchar(255),
    city    varchar(255),
    country varchar(255),
    phone   varchar(255),
    user_id int8,
    primary key (id)
);

create table user_role
(
    user_id int8 not null,
    roles varchar(255)
);

create table usr
(
    id int8 not null,
    activation_code varchar(255),
    active          boolean,
    email           varchar(50)  not null,
    first_name      varchar(50)  not null,
    password        varchar(255) not null,
    second_name     varchar(50)  not null,
    token           varchar(255),
    primary key (id)
);
alter table if exists usr add constraint email_key unique (email);

alter table if exists cart add constraint cart_user foreign key (user_id) references usr;
alter table if exists cart_item add constraint cart_item_cart foreign key (cart_id) references cart;
alter table if exists cart_item add constraint cart_item_product foreign key (product_id) references product;
alter table if exists category add constraint cotegory_parent foreign key (category_id) references category;
alter table if exists news add constraint news_user foreign key (user_id) references usr;
alter table if exists order_table add constraint order_user foreign key (user_id) references usr;
alter table if exists ordered_product add constraint ordered_product_order_table foreign key (order_id) references order_table;
alter table if exists ordered_product add constraint ordered_product_product foreign key (product_id) references product;
alter table if exists product add constraint product_category foreign key (category_id) references category;
alter table if exists user_contacts add constraint user_contacts_user foreign key (user_id) references usr;
alter table if exists user_role add constraint user_role_usr foreign key (user_id) references usr;