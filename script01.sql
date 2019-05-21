---Speaker

CREATE TABLE Speaker (id_speaker INTEGER PRIMARY KEY,pathImage TEXT,firstName TEXT,lastName TEXT,jobTitle TEXT,countyName TEXT,twitterUSer TEXT,linkedinPath TEXT, isExpert INTEGER, about TEXT);

INSERT INTO Speaker (id_speaker, pathImage, firstName,lastName,jobTitle,countyName,twitterUSer,linkedinPath, isExpert, about) 
VALUES (1, 'https://pbs.twimg.com/profile_images/986420674435563520/VL1e9Ldp_400x400.jpg', 'Luis', 'Aviles', 'Google Developer Expert en Web y Angular', 'Cochabamba, Bolivia', '@luixaviles', 'https://www.linkedin.com/in/luixaviles/', 1,'Luis Aviles is a Google Developer Expert in Web Technologies and Angular and an enthusiast of Open Source software and communities, as well as being a public speaker, a technology trainer and an author of courses and technical articles.');

INSERT INTO Speaker (id_speaker, pathImage, firstName,lastName,jobTitle,countyName,twitterUSer,linkedinPath, isExpert, about) 
VALUES (2, 'https://pbs.twimg.com/profile_images/1019713543657086976/sHuPNy5Q_400x400.jpg', 'Matt', 'Sullivan', 'Googler', 'Mountain View, California', '@mjohnsullivan', 'http://www.rustedbrute.com/', 0,'Parte del equipo de Flutter en Google.');

INSERT INTO Speaker (id_speaker, pathImage, firstName,lastName,jobTitle,countyName,twitterUSer,linkedinPath, isExpert, about) 
VALUES (3, 'https://pbs.twimg.com/profile_images/986420674435563520/VL1e9Ldp_400x400.jpg', 'Luis', 'Aviles', 'Google Developer Expert en Web y Angular', 'Cochabamba, Bolivia', '@luixaviles', 'https://www.linkedin.com/in/luixaviles/', 1,'Luis Aviles is a Google Developer Expert in Web Technologies and Angular and an enthusiast of Open Source software and communities, as well as being a public speaker, a technology trainer and an author of courses and technical articles.');

INSERT INTO Speaker (id_speaker, pathImage, firstName,lastName,jobTitle,countyName,twitterUSer,linkedinPath, isExpert, about) 
VALUES (4, 'https://pbs.twimg.com/profile_images/1019713543657086976/sHuPNy5Q_400x400.jpg', 'Matt', 'Sullivan', 'Googler', 'Mountain View, California', '@mjohnsullivan', 'http://www.rustedbrute.com/', 0,'Parte del equipo de Flutter en Google.');

INSERT INTO Speaker (id_speaker, pathImage, firstName,lastName,jobTitle,countyName,twitterUSer,linkedinPath, isExpert, about) 
VALUES (5, 'https://pbs.twimg.com/profile_images/986420674435563520/VL1e9Ldp_400x400.jpg', 'Luis', 'Aviles', 'Google Developer Expert en Web y Angular', 'Cochabamba, Bolivia', '@luixaviles', 'https://www.linkedin.com/in/luixaviles/', 1,'Luis Aviles is a Google Developer Expert in Web Technologies and Angular and an enthusiast of Open Source software and communities, as well as being a public speaker, a technology trainer and an author of courses and technical articles.');

INSERT INTO Speaker (id_speaker, pathImage, firstName,lastName,jobTitle,countyName,twitterUSer,linkedinPath, isExpert, about) 
VALUES (6, 'https://pbs.twimg.com/profile_images/1019713543657086976/sHuPNy5Q_400x400.jpg', 'Matt', 'Sullivan', 'Googler', 'Mountain View, California', '@mjohnsullivan', 'http://www.rustedbrute.com/', 0,'Parte del equipo de Flutter en Google.');

---Categories
CREATE TABLE Category (id_category INTEGER PRIMARY KEY, nameTechnology TEXT, color TEXT);

INSERT INTO Category (id_category, nameTechnology, color) VALUES (1, 'Android', '0xFF64dd17');
INSERT INTO Category (id_category, nameTechnology, color) VALUES (2, 'Angular', '0xFFe53935');
INSERT INTO Category (id_category, nameTechnology, color) VALUES (3, 'Assistant', '0xFFffd600');
INSERT INTO Category (id_category, nameTechnology, color) VALUES (4, 'Cloud', '0xFF304ffe');
INSERT INTO Category (id_category, nameTechnology, color) VALUES (5, 'Design', '0xFF6200ea');
INSERT INTO Category (id_category, nameTechnology, color) VALUES (6, 'Firebase', '0xFFffab00');
INSERT INTO Category (id_category, nameTechnology, color) VALUES (7, 'Flutter', '0xFF2979ff');
INSERT INTO Category (id_category, nameTechnology, color) VALUES (8, 'Keynote', '0xFFff4081');
INSERT INTO Category (id_category, nameTechnology, color) VALUES (9, 'Maps', '0xFF00e676');
INSERT INTO Category (id_category, nameTechnology, color) VALUES (10, 'ML/AI', '0xFFff3d00');
INSERT INTO Category (id_category, nameTechnology, color) VALUES (11, 'Kotlin', '0xFF651fff');

---Sessions

CREATE TABLE Session (
    id_session INTEGER PRIMARY KEY, 
    title TEXT,
    description TEXT, 
    date TEXT,
    time TEXT, 
    type TEXT
);

INSERT INTO Session (id_session,title,description,date,time,type) VALUES (1, 'What is new in Angular', 'A palette is a collection of colors, i.e. hues and their shades. Material-UI provides all colors from the Material Design guidelines. This color palette have been designed to work harmoniously with each other.', '01/06/2019', '09:00', 'T');
INSERT INTO Session (id_session,title,description,date,time,type) VALUES (2, 'What is new in Android', 'A palette is a collection of colors, i.e. hues and their shades. Material-UI provides all colors from the Material Design guidelines. This color palette have been designed to work harmoniously with each other.', '01/06/2019', '09:45', 'T');
INSERT INTO Session (id_session,title,description,date,time,type) VALUES (3, 'What is new in Kotlin', 'A palette is a collection of colors, i.e. hues and their shades. Material-UI provides all colors from the Material Design guidelines. This color palette have been designed to work harmoniously with each other.', '01/06/2019', '10:30', 'C');
INSERT INTO Session (id_session,title,description,date,time,type) VALUES (4, 'What is new in Flutter', 'A palette is a collection of colors, i.e. hues and their shades. Material-UI provides all colors from the Material Design guidelines. This color palette have been designed to work harmoniously with each other.', '01/06/2019', '11:00', 'C');
INSERT INTO Session (id_session,title,description,date,time,type) VALUES (5, 'What is new in Cloud', 'A palette is a collection of colors, i.e. hues and their shades. Material-UI provides all colors from the Material Design guidelines. This color palette have been designed to work harmoniously with each other.', '01/06/2019', '12:00', 'T');
INSERT INTO Session (id_session,title,description,date,time,type) VALUES (6, 'What is new in Firebase', 'A palette is a collection of colors, i.e. hues and their shades. Material-UI provides all colors from the Material Design guidelines. This color palette have been designed to work harmoniously with each other.', '01/06/2019', '13:00', 'T');

---Session - Speaker

CREATE TABLE Session_Speaker (
    id_ss INTEGER PRIMARY KEY AUTOINCREMENT, 
    id_session INTEGER, 
    id_speaker INTEGER,
    CONSTRAINT fk_Session
        FOREIGN KEY (id_session)
        REFERENCES Session(id_session),
    CONSTRAINT fk_Speaker
        FOREIGN KEY (id_speaker)
        REFERENCES Speaker(id_speaker)
);

INSERT INTO Session_Speaker (id_session, id_speaker) VALUES (1,1);
INSERT INTO Session_Speaker (id_session, id_speaker) VALUES (1,2);
INSERT INTO Session_Speaker (id_session, id_speaker) VALUES (2,2);
INSERT INTO Session_Speaker (id_session, id_speaker) VALUES (3,3);
INSERT INTO Session_Speaker (id_session, id_speaker) VALUES (4,4);
INSERT INTO Session_Speaker (id_session, id_speaker) VALUES (5,5);
INSERT INTO Session_Speaker (id_session, id_speaker) VALUES (6,6);

---Session - Categories

CREATE TABLE Session_Category (
    id_sc INTEGER PRIMARY KEY AUTOINCREMENT, 
    id_session INTEGER, 
    id_category INTEGER,
    CONSTRAINT fk_Session
        FOREIGN KEY (id_session)
        REFERENCES Session(id_session),
    CONSTRAINT fk_Category
        FOREIGN KEY (id_category)
        REFERENCES Category(id_category)
);

INSERT INTO Session_Category (id_session, id_category) VALUES (1, 2);
INSERT INTO Session_Category (id_session, id_category) VALUES (1, 6);
INSERT INTO Session_Category (id_session, id_category) VALUES (2, 1);
INSERT INTO Session_Category (id_session, id_category) VALUES (2, 3);
INSERT INTO Session_Category (id_session, id_category) VALUES (3, 1);
INSERT INTO Session_Category (id_session, id_category) VALUES (3, 4);
INSERT INTO Session_Category (id_session, id_category) VALUES (3, 5);
INSERT INTO Session_Category (id_session, id_category) VALUES (4, 6);
INSERT INTO Session_Category (id_session, id_category) VALUES (5, 7);
INSERT INTO Session_Category (id_session, id_category) VALUES (5, 8);
INSERT INTO Session_Category (id_session, id_category) VALUES (6, 9);
INSERT INTO Session_Category (id_session, id_category) VALUES (6, 11);



