USE petsus;

# Inserts query - News

SET @imageUrlYukari = 'https://p3re.jp/en/resources/img/top/character2_1bbd90394affdfba42aba331abb840d3.png';
SET @imageUrlBenio = 'https://images4.alphacoders.com/941/941989.png';
SET @imageUrlMargaret = 'https://images4.alphacoders.com/941/941989.png';
SET @imageUrlElizabeth = 'https://i.redd.it/m3h2glzme1b51.jpg';
SET @imageUrlSumire = 'https://images7.alphacoders.com/121/thumb-1920-1210980.png';

## Creating global news
INSERT INTO news(created_at, updated_at, content, image, date_event, name)
		VALUES(NOW(), NOW(), 'Creating news', @imageUrlYukari, NOW(), 'Global News');
        
## Creating city news
SELECT @cityIdNews := id FROM city ORDER BY id DESC LIMIT 1;

INSERT INTO news(created_at, updated_at, content, image, date_event, name, city_id)
		VALUES(NOW(), NOW(), 'Creating news', @imageUrlBenio, NOW(), 'City News', @cityIdNews);

# Inserts query - Schedule

## Creating schedule news
INSERT INTO news(created_at, updated_at, content, image, name)
		VALUES(NOW(), NOW(), 'Creating schedule', @imageUrlMargaret, 'Global schedule');
        
## Creating schedule news
SELECT @cityIdSchedule := id FROM city ORDER BY id DESC LIMIT 1;

INSERT INTO news(created_at, updated_at, content, image, name, city_id)
		VALUES(NOW(), NOW(), 'Creating schedule', @imageUrlElizabeth, 'Schedule', @cityIdSchedule);

INSERT INTO news(created_at, updated_at, content, image, name, city_id)
		VALUES(NOW(), NOW(), 'Creating schedule', @imageUrlSumire, 'Schedule', @cityIdSchedule);
