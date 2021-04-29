insert into user(id, email, name, surname, password)
values ( 1 ,'wiktor@op.pl', 'Wiktor', 'Jackowski', 'student'),
( 2, 'axel@op.pl', 'Axel', 'Mitura', 'student'),
( 3, 'robert@op.pl', 'Robert', 'Lewandowski', 'student'),
( 4, 'jerry@op.pl', 'Jerry', 'Tom', 'student');

insert into chat(id, name)
values ( 1, 'Wiadomości'),
( 2, 'Chat');

insert into user_chat(user_id, chat_id)
values( 1, 2),
( 2, 2),
( 3, 1),
( 4, 1);

insert into message(text, created_at, chat_id, sender_id, receiver_id)
values('Cześć', '2020-11-05 10:00:00', 2, 1, 2),
('Cześć. Co tam ?', '2020-11-05 10:01:00', 2, 2,1),
('Świetnie właśnie programuję', '2020-11-05 10:02:00', 2, 1, 2),
('O to super to nie przeszkadzam :)', '2020-11-05 10:03:00', 2,2, 1),

('Hej Ty jesteś tym sławnym Jerrym z bajki Tom i Jerry ?', '2020-11-05 23:50:00', 1, 3,2),
('Hej, tak to ja. A czy Ty jesteś tym znanym piłkarzem ?', '2020-11-05 23:51:00', 1, 4, 1),
('Wow, pozdrawiam Was jestem Waszym wielkim fanem', '2020:11:05 23:52:00', 1, 3, 2),
('Dziękujemy my Ciebie też pozdrawiamy', '2020:11:05 23:52:00', 1, 4, 1);
