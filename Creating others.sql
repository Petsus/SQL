use petsus;

# Insert query - Join clinic with veterinary
SELECT @clinicId := id FROM clinic ORDER BY id DESC LIMIT 1;
SELECT @veterinaryId := id FROM veterinary_user ORDER BY id DESC LIMIT 1;

INSERT INTO veterinary_clinic(created_at, updated_at, veterinary_id, clinic_id)
	VALUES (NOW(), NOW(), @veterinaryId, @clinicId);
    
# Insert specialities
INSERT INTO specialities(created_at, updated_at, name)
	VALUES (NOW(), NOW(), 'Cachorro');

INSERT INTO specialities(created_at, updated_at, name)
	VALUES (NOW(), NOW(), 'Gatos');

# Insert Join specialities with veterinary
SELECT @specialitiesId := id FROM specialities ORDER BY id DESC LIMIT 1;
SELECT @veterinaryId := authorization_id FROM veterinary_user ORDER BY id DESC LIMIT 1;

INSERT INTO veterinary_specialities(created_at, updated_at, veterinary_id, specialities_id)
	VALUES (NOW(), NOW(), @veterinaryId, @specialitiesId);
    
# Insert join veterinary with address
SET @postalCode = '18020264';
SET @lat = -23.5071855;
SET @lng = -47.4400107;
SET @neighborhood = 'Vila Hortência';
SET @number = 547;
SET @address = 'Rua Comandante Salgado';

SELECT @cityId := id FROM city ORDER BY id DESC LIMIT 1;
SELECT @veterinaryUserId := au.id 
			  FROM veterinary_user cu 
        INNER JOIN authorization_user au
				ON au.id = cu.authorization_id
          ORDER BY cu.id DESC 
			 LIMIT 1;

INSERT INTO address(created_at, updated_at, address, number, neighborhood, lat, lng, city_id, user_id, postal_code)
	VALUES (NOW(), NOW(), @address, @number, @neighborhood, @lat, @lng, @cityId, @veterinaryUserId, @postalCode);