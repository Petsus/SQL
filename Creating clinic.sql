USE petsus;

# Insert query - Creating address
SET @postalCode = '18020264';
SET @lat = -23.5071855;
SET @lng = -47.4400107;
SET @neighborhood = 'Vila Hortência';
SET @number = 547;
SET @address = 'Rua Comandante Salgado';

SELECT @cityId := id FROM city ORDER BY id DESC LIMIT 1;
SELECT @clinicAuthorizationUserId := au.id 
			  FROM clinic_user cu 
        INNER JOIN authorization_user au
				ON au.id = cu.authorization_id
          ORDER BY cu.id DESC 
			 LIMIT 1;

INSERT INTO address(created_at, updated_at, address, number, neighborhood, lat, lng, city_id, user_id, postal_code)
	VALUES (NOW(), NOW(), @address, @number, @neighborhood, @lat, @lng, @cityId, @clinicAuthorizationUserId, @postalCode);

# Insert query - Creating clinic

SET @name = 'Clinic name sample';
SET @phone = '15987654321';
SET @site = 'https://p3re.jp/en/';

SELECT @addressId := id FROM address ORDER BY id DESC LIMIT 1;
SELECT @clinicUserId := id FROM clinic_user ORDER BY id DESC LIMIT 1;

INSERT INTO clinic(created_at, updated_at, name, phone, site, address_id, adm_user)
	VALUES (NOW(), NOW(), @name, @phone, @site, @addressId, @clinicUserId);