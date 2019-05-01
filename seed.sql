CREATE TABLE post (

 id SERIAL PRIMARY KEY,
 title VARCHAR(255),
 author TEXT,
 synopsis TEXT

);

INSERT INTO post (title , author, synopsis ) VALUES ('Fear and Loathing in Las Vegas' , 'hunter s thompson', 'A Savage Journey to the Heart of the American Dream is a novel');

INSERT INTO post (title , author, synopsis ) VALUES ('A Clockwork Orange' , 'Anthony Burgess',  'It is set in a near future English society featuring a subculture of extreme youth violence. The teenage protagonist, Alex, narrates his violent exploits and his experiences with state authorities intent on reforming him.');

INSERT INTO post (title , author, synopsis ) VALUES ('Nineteen Eighty-Four' , 'George Orwell', 'The novel is set in Airstrip One, formerly Great Britain, a province of the superstate Oceania, whose residents are victims of perpetual war, omnipresent government surveillance and public manipulation.');
