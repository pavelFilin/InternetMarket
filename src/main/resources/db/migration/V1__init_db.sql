create table user
(
    id              bigint       not null,
    email           varchar(50)  not null,
    password        varchar(255) not null,
    first_name      varchar(50)  not null,
    second_name     varchar(50)  not null,
    activation_code varchar(255),
    active          bit,
    token           varchar(255),
    primary key (id)
) engine = InnoDB;

create table cart
(
    id          bigint not null,
    total_items integer,
    count_prise integer,
    user_id     bigint,
    primary key (id)
) engine = InnoDB;

create table cart_item
(
    id         bigint not null,
    amount     integer,
    cart_id    bigint not null,
    product_id bigint not null,
    primary key (id)
) engine = InnoDB;

create table category
(
    id          bigint       not null,
    title       varchar(255) not null,
    category_id bigint,
    primary key (id)
) engine = InnoDB;

create table news
(
    id           bigint        not null,
    date_created datetime,
    imageurl     varchar(255),
    text         varchar(8096) not null,
    title        varchar(255)  not null,
    user_id      bigint,
    primary key (id)
) engine = InnoDB;

create table order_table
(
    id              bigint  not null,
    address         varchar(255),
    execution_stage varchar(255),
    phone           varchar(255),
    products_prise  integer not null,
    user_id         bigint,
    primary key (id)
) engine = InnoDB;

create table ordered_product
(
    id         bigint not null,
    amount     integer,
    order_id   bigint not null,
    product_id bigint not null,
    primary key (id)
) engine = InnoDB;

create table product
(
    id              bigint        not null auto_increment,
    available       bit,
    description     varchar(8096) not null,
    image_url       varchar(255),
    name            varchar(255)  not null,
    price           integer       not null,
    warranty_months integer,
    category_id     bigint        not null,
    primary key (id)
) engine = InnoDB;

create table user_contacts
(
    id      bigint not null,
    address varchar(255),
    city    varchar(255),
    country varchar(255),
    phone   varchar(255),
    user_id bigint,
    primary key (id)
) engine = InnoDB;

create table user_role
(
    user_id bigint not null,
    roles   varchar(255)
) engine = InnoDB;

alter table user
    add constraint UK_ob8kqyqqgmefl0aco34akdtpe unique (email);

alter table cart
    add constraint FKl70asp4l4w0jmbm1tqyofho4o foreign key (user_id) references user (id);

alter table cart_item
    add constraint FK1uobyhgl1wvgt1jpccia8xxs3 foreign key (cart_id) references cart (id);

alter table cart_item
    add constraint FKjcyd5wv4igqnw413rgxbfu4nv foreign key (product_id) references product (id);

alter table category
    add constraint FKap0cnk1255oj4bwam7in1hxxv foreign key (category_id) references category (id);

alter table news
    add constraint FK4538gbwfa03nwr9edl3fdloo9 foreign key (user_id) references user (id);

alter table order_table
    add constraint FKnmdjo6oaf01ow2reubtrhl6ev foreign key (user_id) references user (id);

alter table ordered_product
    add constraint FK1me38f635rnieslow7t4htl72 foreign key (order_id) references order_table (id);

alter table ordered_product
    add constraint FKcbk8xvg3o4s3ard6hv25p4jqc foreign key (product_id) references product (id);

alter table product
    add constraint FK1mtsbur82frn64de7balymq9s foreign key (category_id) references category (id);

alter table user_contacts
    add constraint FKmo0c5ro6kunnfq71x4bcwb9eh foreign key (user_id) references user (id);

alter table user_role
    add constraint FK859n2jvi8ivhui0rl0esws6o foreign key (user_id) references user (id);

create table hibernate_sequence
(
    next_val bigint
) engine = InnoDB;
insert into hibernate_sequence
values (1);
insert into hibernate_sequence
values (1);
insert into hibernate_sequence
values (1);
insert into hibernate_sequence
values (1);
insert into hibernate_sequence
values (1);
insert into hibernate_sequence
values (1);
insert into hibernate_sequence
values (1);
insert into hibernate_sequence
values (1);