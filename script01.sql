---Speaker

CREATE TABLE Speaker (id_speaker INTEGER PRIMARY KEY,pathImage TEXT,firstName TEXT,lastName TEXT,jobTitle TEXT,countyName TEXT,twitterUSer TEXT,linkedinPath TEXT, isExpert INTEGER, about TEXT);

INSERT INTO Speaker (id_speaker, pathImage, firstName,lastName,jobTitle,countyName,twitterUSer,linkedinPath, isExpert, about) 
VALUES (1, 'https://pbs.twimg.com/profile_images/986420674435563520/VL1e9Ldp_400x400.jpg', 'Gunar', 'Ortiz', 'Desarrollador Movil y diseñador UX', 'La Paz, Bolivia', '@Pendiente', 'https://bo.linkedin.com/in/gunar-ortiz', 0,'Gunar es CTO en Parkin, Mobile developer, Node.js developer and UX designer, ganador de primer lugar en el HackBo 2018, participo como expositor en diferentes eventos de comunidades tecnológicas.');

INSERT INTO Speaker (id_speaker, pathImage, firstName,lastName,jobTitle,countyName,twitterUSer,linkedinPath, isExpert, about) 
VALUES (2, 'https://pbs.twimg.com/profile_images/1019713543657086976/sHuPNy5Q_400x400.jpg', 'Luis', 'Aviles', 'Google Developer Expert en Web y Angular', 'Cochabamba, Bolivia', '@luixaviles', 'https://www.linkedin.com/in/luixaviles/', 1,'Luis Aviles es un Google Developer Expert en tecnologías Web y Angular y un entusiasta del Software Código Abierto y diferentes comunidades, es un entrenador de tecnologías y un autor de cursos y articulos tecnicos');

INSERT INTO Speaker (id_speaker, pathImage, firstName,lastName,jobTitle,countyName,twitterUSer,linkedinPath, isExpert, about) 
VALUES (3, 'https://pbs.twimg.com/profile_images/986420674435563520/VL1e9Ldp_400x400.jpg', 'Nathaly', 'Alarcon', 'Data Scientist, Ingeniera de Sistemas', 'La Paz, Bolivia', '@nathalyalarcont', 'https://www.linkedin.com/in/nathalyalarcon/', 0,'Ingeniera de Sistemas de la EMI, cuenta con un master en Data Science en la Universidad de Granada en España. Ambassador local en las comunidades de Women in Data Science, WiMLDS y R-Ladies.');

INSERT INTO Speaker (id_speaker, pathImage, firstName,lastName,jobTitle,countyName,twitterUSer,linkedinPath, isExpert, about) 
VALUES (4, 'https://pbs.twimg.com/profile_ima   ges/1019713543657086976/sHuPNy5Q_400x400.jpg', 'Esteban', 'Saavedra', 'Presidente de la Fundacion AtixLibre', 'Oruro, Bolivia', 'Pendiente', 'https://www.linkedin.com/in/essaavedra/', 0,'Es un ingeniero de sistemas, cuenta con PhD en TICs y Telecomunicaciones. Presidente de la fundacion AtixLibre, es docente de postgrado, consultor senior y asesor de Tecnologias de informacion');

INSERT INTO Speaker (id_speaker, pathImage, firstName,lastName,jobTitle,countyName,twitterUSer,linkedinPath, isExpert, about) 
VALUES (5, 'https://pbs.twimg.com/profile_images/986420674435563520/VL1e9Ldp_400x400.jpg', 'Leandro', 'Guardia', 'Desarrollador Web y miembro de Cochabamba AI', 'Cochabamba, Bolivia', '@lean_guardia', 'https://bo.linkedin.com/in/leandro-guardia', 1,'Artesano de Software, partidario de agilidad y actividad en Inteligencia Artificial. Freelancer en desarrollo web, speaker, miembro de Cochabamba AI, Ingeniero de Sistemas(UCB Cochabamba)');

INSERT INTO Speaker (id_speaker, pathImage, firstName,lastName,jobTitle,countyName,twitterUSer,linkedinPath, isExpert, about) 
VALUES (6, 'https://pbs.twimg.com/profile_images/1019713543657086976/sHuPNy5Q_400x400.jpg', 'Andres', 'Vasquez', 'Desarrollador Movil, docente y emprendedor.', 'La Paz, Bolivia', '@Pendiente', 'https://www.linkedin.com/in/andres-vasquez-161a73110/', 0,' Apasionado por el trabajo en equipo, aprendizaje de nuevas tecnologias y la participacion en comunidades de desarrollo.');

INSERT INTO Speaker (id_speaker, pathImage, firstName,lastName,jobTitle,countyName,twitterUSer,linkedinPath, isExpert, about)
VALUES (7, 'https://pbs.twimg.com/profile_images/1019713543657086976/sHuPNy5Q_400x400.jpg', 'Edwin', 'Salcedo', 'Data Scientist, Ingeniero de Software.', 'La Paz, Bolivia', '@Pendiente', 'https://www.linkedin.com/in/edwinsalcedo/', 0,' Edwin Salcedo es un Data Scientist, Ingeniero de Software y Docente Investigador, Recientemente retorno al pais despues de estudiar en The University of Sheffield (Inglaterra).');

INSERT INTO Speaker (id_speaker, pathImage, firstName,lastName,jobTitle,countyName,twitterUSer,linkedinPath, isExpert, about)
VALUES (8, 'https://pbs.twimg.com/profile_images/1019713543657086976/sHuPNy5Q_400x400.jpg', 'Luis', 'Mantilla', 'Pendiente.', 'La Paz, Bolivia', '@Pendiente', 'linkedinPendiente', 0,' Descripcion Pendiente');

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

-- INSERT INTO Session (id_session,title,description,date,time,type) VALUES (1, 'What is new in Angular', 'A palette is a collection of colors, i.e. hues and their shades. Material-UI provides all colors from the Material Design guidelines. This color palette have been designed to work harmoniously with each other.', '01/06/2019', '09:00', 'T');
-- INSERT INTO Session (id_session,title,description,date,time,type) VALUES (2, 'What is new in Android', 'A palette is a collection of colors, i.e. hues and their shades. Material-UI provides all colors from the Material Design guidelines. This color palette have been designed to work harmoniously with each other.', '01/06/2019', '09:45', 'T');
INSERT INTO Session (id_session,title,description,date,time,type) VALUES (3, 'Como Kotlin cambio la arquitectura de mi aplicacion Android', 'A palette is a collection of colors, i.e. hues and their shades. Material-UI provides all colors from the Material Design guidelines. This color palette have been designed to work harmoniously with each other.', '01/06/2019', '9:30', 'T');
INSERT INTO Session (id_session,title,description,date,time,type) VALUES (4, 'Tensorflow Lite: AI para mobile y dispositivos IoT', 'A palette is a collection of colors, i.e. hues and their shades. Material-UI provides all colors from the Material Design guidelines. This color palette have been designed to work harmoniously with each other.', '01/06/2019', '9:30', 'C');
INSERT INTO Session (id_session,title,description,date,time,type) VALUES (5, 'Lo nuevo de Chrome y la Web', 'A palette is a collection of colors, i.e. hues and their shades. Material-UI provides all colors from the Material Design guidelines. This color palette have been designed to work harmoniously with each other.', '01/06/2019', '10:15', 'T');
-- INSERT INTO Session (id_session,title,description,date,time,type) VALUES (6, 'Mejores practicas en la seguridad informática y la seguridad de la información', 'A palette is a collection of colors, i.e. hues and their shades. Material-UI provides all colors from the Material Design guidelines. This color palette have been designed to work harmoniously with each other.', '01/06/2019', '13:00', 'T');
-- -- INSERT INTO Session (id_session,title,description,date,time,type) VALUES (7, 'What is new in Firebase', 'A palette is a collection of colors, i.e. hues and their shades. Material-UI provides all colors from the Material Design guidelines. This color palette have been designed to work harmoniously with each other.', '01/06/2019', '13:00', 'T');
-- -- INSERT INTO Session (id_session,title,description,date,time,type) VALUES (8, 'What is new in Firebase', 'A palette is a collection of colors, i.e. hues and their shades. Material-UI provides all colors from the Material Design guidelines. This color palette have been designed to work harmoniously with each other.', '01/06/2019', '13:00', 'T');
-- -- INSERT INTO Session (id_session,title,description,date,time,type) VALUES (9, 'What is new in Firebase', 'A palette is a collection of colors, i.e. hues and their shades. Material-UI provides all colors from the Material Design guidelines. This color palette have been designed to work harmoniously with each other.', '01/06/2019', '13:00', 'T');
-- INSERT INTO Session (id_session,title,description,date,time,type) VALUES (10, 'What is new in Firebase', 'A palette is a collection of colors, i.e. hues and their shades. Material-UI provides all colors from the Material Design guidelines. This color palette have been designed to work harmoniously with each other.', '01/06/2019', '13:00', 'T');
INSERT INTO Session (id_session,title,description,date,time,type) VALUES (11, 'Developing amazing apps with Flutter', 'A palette is a collection of colors, i.e. hues and their shades. Material-UI provides all colors from the Material Design guidelines. This color palette have been designed to work harmoniously with each other.', '01/06/2019', '14:00', 'C');
INSERT INTO Session (id_session,title,description,date,time,type) VALUES (12, 'Pendiente', 'A palette is a collection of colors, i.e. hues and their shades. Material-UI provides all colors from the Material Design guidelines. This color palette have been designed to work harmoniously with each other.', '01/06/2019', '14:15', 'T');
INSERT INTO Session (id_session,title,description,date,time,type) VALUES (13, 'Google Cloud Platform: Hacia una nueva forma de implementar plataformas empresariales', 'En esta charla hablaremos de cómo GCP (Google Cloud Plataform) nos provee los productos, servicios y herramientas para poder diseñar, crear, probar, desplegar y monitorear aplicaciones y/servicios. Con la ayuda de GCP, veremos cómo las empresas podrán crear fácilmente entornos con capacidad de computo, almacenamiento, networking y mucho más', '01/06/2019', '15:00', 'T');
INSERT INTO Session (id_session,title,description,date,time,type) VALUES (14, 'Desarrollo Fullstack con Angular', 'A palette is a collection of colors, i.e. hues and their shades. Material-UI provides all colors from the Material Design guidelines. This color palette have been designed to work harmoniously with each other.', '01/06/2019', '15:30', 'C');
INSERT INTO Session (id_session,title,description,date,time,type) VALUES (15, 'TensorFlow bajo el microscopio', 'A palette is a collection of colors, i.e. hues and their shades. Material-UI provides all colors from the Material Design guidelines. This color palette have been designed to work harmoniously with each other.', '01/06/2019', '15:30', 'T');
INSERT INTO Session (id_session,title,description,date,time,type) VALUES (16, 'First steps with Android Coroutines', 'Primeros pasos con Kotlin coroutines y las principales diferencias de usar otras opciones para funciones asíncronas.', '01/06/2019', '15:30', 'T');
-- INSERT INTO Session (id_session,title,description,date,time,type) VALUES (17, 'Entrega de souvenirs y premios', 'A palette is a collection of colors, i.e. hues and their shades. Material-UI provides all colors from the Material Design guidelines. This color palette have been designed to work harmoniously with each other.', '01/06/2019', '15:30', 'C');

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

INSERT INTO Session_Speaker (id_session, id_speaker) VALUES (3,1);
INSERT INTO Session_Speaker (id_session, id_speaker) VALUES (4,7);
INSERT INTO Session_Speaker (id_session, id_speaker) VALUES (5,2);
INSERT INTO Session_Speaker (id_session, id_speaker) VALUES (11,8);
INSERT INTO Session_Speaker (id_session, id_speaker) VALUES (12,3);
INSERT INTO Session_Speaker (id_session, id_speaker) VALUES (13,4);
INSERT INTO Session_Speaker (id_session, id_speaker) VALUES (14,2);
INSERT INTO Session_Speaker (id_session, id_speaker) VALUES (15,5);
INSERT INTO Session_Speaker (id_session, id_speaker) VALUES (16,6);

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

INSERT INTO Session_Category (id_session, id_category) VALUES (3, 1);
INSERT INTO Session_Category (id_session, id_category) VALUES (3, 11);
INSERT INTO Session_Category (id_session, id_category) VALUES (4, 1);
INSERT INTO Session_Category (id_session, id_category) VALUES (4, 10);
INSERT INTO Session_Category (id_session, id_category) VALUES (5, 2);
INSERT INTO Session_Category (id_session, id_category) VALUES (11, 1);
INSERT INTO Session_Category (id_session, id_category) VALUES (11, 7);
INSERT INTO Session_Category (id_session, id_category) VALUES (12, 9);
INSERT INTO Session_Category (id_session, id_category) VALUES (13, 4);
INSERT INTO Session_Category (id_session, id_category) VALUES (14, 2);
INSERT INTO Session_Category (id_session, id_category) VALUES (14, 5);
INSERT INTO Session_Category (id_session, id_category) VALUES (15, 10);
INSERT INTO Session_Category (id_session, id_category) VALUES (16, 1);
INSERT INTO Session_Category (id_session, id_category) VALUES (16, 11);
