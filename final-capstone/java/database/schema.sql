BEGIN TRANSACTION;

DROP TABLE IF EXISTS users;
DROP SEQUENCE IF EXISTS seq_user_id;

CREATE SEQUENCE seq_user_id
  INCREMENT BY 1
  NO MAXVALUE
  NO MINVALUE
  CACHE 1;


CREATE TABLE users (
	user_id int DEFAULT nextval('seq_user_id'::regclass) NOT NULL,
	username varchar(50) NOT NULL,
	password_hash varchar(200) NOT NULL,
	role varchar(50) NOT NULL,
	CONSTRAINT PK_user PRIMARY KEY (user_id)
);

INSERT INTO users (username,password_hash,role) VALUES ('user','$2a$08$UkVvwpULis18S19S5pZFn.YHPZt3oaqHZnDwqbCW9pft6uFtkXKDC','ROLE_USER');
INSERT INTO users (username,password_hash,role) VALUES ('admin','$2a$08$UkVvwpULis18S19S5pZFn.YHPZt3oaqHZnDwqbCW9pft6uFtkXKDC','ROLE_ADMIN');


drop table Exercise;
drop table body_target;

                
create table body_target ( 
                body_target_id serial PRIMARY KEY unique,
                body_target varchar(64) NOT NULL);


CREATE table Exercise ( 
                id serial PRIMARY KEY unique,
                exercise_name varchar(64) NOT NULL,
                description varchar(1000) NOT NULL,
                suggested_weight int,
                exercise_reps int,
                exercise_sets int,
                expected_time int NOT NULL,
                body_target_id int NOT NULL,
                constraint fk_body_target FOREIGN KEY (body_target_id) references body_target(body_target_id) );
                

                
INSERT INTO body_target(body_target)
VALUES('legs'), ('back'), ('chest'), ('arms'), ('cardio'), ('full body');
                        
INSERT INTO Exercise(exercise_name, description, suggested_weight, exercise_reps, exercise_sets, expected_time, body_target_id)
VALUES('chest press', 'Lie face up on a flat bench, and grip a barbell with the hands slightly wider than shoulder-width. Press the feet into the ground and the hips into the bench while lifting the bar off the rack. Slowly lower the bar to the chest by allowing the elbows to bend out to the side. Stop when the elbows are just below the bench, and press feet into the floor to press the weight straight up to return to the starting position.',
45, 10, 3, 10, 3);  


COMMIT TRANSACTION;
