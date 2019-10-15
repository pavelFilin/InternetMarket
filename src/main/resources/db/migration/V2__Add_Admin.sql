insert into usr (id, email, password, first_name, second_name, active)
values (1, 'a@a.c', '$2a$08$nWfZPCZ2HgO37f336y..IOj/2VlQTsq3eoTWV3kU7wsAgBpwtKfLq', 'admin', 'admin', true);

insert into user_role (user_id, roles)
values (1, 'USER'),
       (1, 'ADMIN');