drop table Exercise;

                
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
                