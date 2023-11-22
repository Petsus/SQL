USE petsus;

# Inserts query - state
INSERT INTO state(created_at, updated_at, name, initials, ibge_id)
	VALUES (NOW(), NOW(), 'São Paulo', 'SP', 1);
    
# Inserts query - city
SELECT @stateId := id FROM state ORDER BY id DESC LIMIT 1;

INSERT INTO city(created_at, updated_at, name, ibge_id, state_id)
	VALUES (NOW(), NOW(), 'Sorocaba', 3552205, @stateId);
    
# Inserts join city - town hall user
SELECT @cityId := id FROM city ORDER BY id DESC LIMIT 1;
SELECT @townHallUserId := id FROM town_hall_user ORDER BY id DESC LIMIT 1;

INSERT INTO town_hall(created_at, updated_at, city_id, user_id)
	VALUES (NOW(), NOW(), @cityId, @townHallUserId);