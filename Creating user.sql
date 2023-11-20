USE petsus;

# Inserts query - roles

INSERT INTO roles(name) VALUES ('ADM');
INSERT INTO roles(name) VALUES ('USER');
INSERT INTO roles(name) VALUES ('CLINIC');
INSERT INTO roles(name) VALUES ('TOWNHALL');
INSERT INTO roles(name) VALUES ('VETERINARY');

# Inserts query

### ADM ALL
#### $2a$10$cAKJHdTTPwCAW1Q55.oNreKFOAx64x3GdOEVD.ZoHfcOTept9JZ7C == adashino.benio
INSERT INTO authorization_user (email, password, name)
	 VALUES ('adashino.benio@gmail.com', '$2a$10$cAKJHdTTPwCAW1Q55.oNreKFOAx64x3GdOEVD.ZoHfcOTept9JZ7C', 'Adashino Benio');

SELECT @admUser := id FROM authorization_user ORDER BY id DESC LIMIT 1; 
SELECT @admRole := id FROM roles WHERE name = 'ADM';

INSERT INTO user_roles (created_at, roles_id, authorization_id)
	 VALUES (NOW(), @admRole, @admUser);

INSERT INTO adm_user (created_at, updated_at, authorization_id)
	 VALUES (NOW(), NOW(), @admUser);

SELECT adu.authorization_id, r.name as roles, au.* FROM adm_user adu
	INNER JOIN authorization_user au
		    ON adu.authorization_id = au.id
	INNER JOIN user_roles ur
		    ON ur.authorization_id = au.id
	INNER JOIN roles r
		    ON ur.roles_id = r.id
	     WHERE au.id = @admUser;
            
### User
#### $2a$10$JqDFn.1kfsBHIu2ZDTxRJO9bjxVPKbQyt2p5zNdZM2M.Cu/7fP7eS == makoto.nijjima
INSERT INTO authorization_user (email, password, name)
	 VALUES ('makoto.nijjima@email.com', '$2a$10$JqDFn.1kfsBHIu2ZDTxRJO9bjxVPKbQyt2p5zNdZM2M.Cu/7fP7eS', 'Makoto Nijiima');

SELECT @user := id FROM authorization_user ORDER BY id DESC LIMIT 1; 
SELECT @userRole := id FROM roles WHERE name = 'USER';

INSERT INTO user_roles (created_at, roles_id, authorization_id)
	 VALUES (NOW(), @userRole, @user);

INSERT INTO user (created_at, updated_at, authorization_id)
	 VALUES (NOW(), NOW(), @user);

SELECT adu.authorization_id, r.name as roles, au.* FROM user adu
	INNER JOIN authorization_user au
		    ON adu.authorization_id = au.id
	INNER JOIN user_roles ur
		    ON ur.authorization_id = au.id
	INNER JOIN roles r
		    ON ur.roles_id = r.id
		 WHERE au.id = @user;
            
### Clinic ADM
#### $2a$10$8nNCjAPUTvbGLLacgcn5AekGUVvzoYKRLr/UVyQwysJm95f1t63xK == yukari.takeba
INSERT INTO authorization_user (email, password, name)
	 VALUES ('yukari.takeba@email.com', '$2a$10$8nNCjAPUTvbGLLacgcn5AekGUVvzoYKRLr/UVyQwysJm95f1t63xK', 'Yukari Takeba');

SELECT @admClinic := id FROM authorization_user ORDER BY id DESC LIMIT 1; 
SELECT @admRole := id FROM roles WHERE name = 'ADM';
SELECT @clinicRole := id FROM roles WHERE name = 'CLINIC';

INSERT INTO user_roles (created_at, roles_id, authorization_id)
	 VALUES (NOW(), @admRole, @admClinic);
     
INSERT INTO user_roles (created_at, roles_id, authorization_id)
	 VALUES (NOW(), @clinicRole, @admClinic);

INSERT INTO clinic_user (created_at, updated_at, authorization_id)
	 VALUES (NOW(), NOW(), @admClinic);

SELECT adu.authorization_id, r.name as roles, au.* FROM clinic_user adu
	INNER JOIN authorization_user au
		    ON adu.authorization_id = au.id
	INNER JOIN user_roles ur
		    ON ur.authorization_id = au.id
	INNER JOIN roles r
		    ON ur.roles_id = r.id
		 WHERE au.id = @admClinic;
         
### Townhall ADM
#### $2a$10$PQW9mGfVmHtmkroSH1Ln1udZeytAyQdJom1AAY3fqF6ksdRLM/vSK == elizabeth.p3
INSERT INTO authorization_user (email, password, name)
	 VALUES ('elizabeth.p3@email.com', '$2a$10$PQW9mGfVmHtmkroSH1Ln1udZeytAyQdJom1AAY3fqF6ksdRLM/vSK', 'Elizabeth');

SELECT @admTownHall := id FROM authorization_user ORDER BY id DESC LIMIT 1; 
SELECT @admRole := id FROM roles WHERE name = 'ADM';
SELECT @cityRole := id FROM roles WHERE name = 'TOWNHALL';

INSERT INTO user_roles (created_at, roles_id, authorization_id)
	 VALUES (NOW(), @admRole, @admTownHall);
     
INSERT INTO user_roles (created_at, roles_id, authorization_id)
	 VALUES (NOW(), @cityRole, @admTownHall);

INSERT INTO town_hall_user (created_at, updated_at, authorization_id)
	 VALUES (NOW(), NOW(), @admTownHall);

SELECT adu.authorization_id, r.name as roles, au.* FROM town_hall_user adu
	INNER JOIN authorization_user au
		    ON adu.authorization_id = au.id
	INNER JOIN user_roles ur
		    ON ur.authorization_id = au.id
	INNER JOIN roles r
		    ON ur.roles_id = r.id
		 WHERE au.id = @admTownHall;

### Veterinary
#### $2a$10$S1HccnDToT29WhwD3/C51eUEKiMizlUQOsC4tPEDfK8FfxQRq9AZG == margaret.p4
INSERT INTO authorization_user (email, password, name)
	 VALUES ('margaret.p4@email.com', '$2a$10$S1HccnDToT29WhwD3/C51eUEKiMizlUQOsC4tPEDfK8FfxQRq9AZG', 'Margaret');

SELECT @veterinary := id FROM authorization_user ORDER BY id DESC LIMIT 1; 
SELECT @cityRole := id FROM roles WHERE name = 'VETERINARY';
     
INSERT INTO user_roles (created_at, roles_id, authorization_id)
	 VALUES (NOW(), @cityRole, @veterinary);

INSERT INTO veterinary_user (created_at, updated_at, authorization_id, crm)
	 VALUES (NOW(), NOW(), @veterinary, '12342423');

SELECT adu.authorization_id, r.name as roles, au.* FROM veterinary_user adu
	INNER JOIN authorization_user au
		    ON adu.authorization_id = au.id
	INNER JOIN user_roles ur
		    ON ur.authorization_id = au.id
	INNER JOIN roles r
		    ON ur.roles_id = r.id
		 WHERE au.id = @veterinary;
# Selects query