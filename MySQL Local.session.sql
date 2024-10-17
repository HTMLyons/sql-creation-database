DROP TABLE IF EXISTS photographs;
DROP TABLE IF EXISTS locations;
DROP TABLE IF EXISTS users;

CREATE TABLE `finalproject`.`users` ( 
  `userid` INT NOT NULL AUTO_INCREMENT, 
  `name` VARCHAR(45) NOT NULL, 
  `username` VARCHAR(20) NOT NULL, 
  `address` VARCHAR(45) NULL, 
  `city` VARCHAR(45) NULL, 
  `state` VARCHAR(2) NULL, 
  `zip` VARCHAR(5) NULL, 
  PRIMARY KEY (`userid`)
);

CREATE TABLE `finalproject`.`locations` ( 
  `itemid` INT NOT NULL AUTO_INCREMENT, 
  `type` INT NOT NULL, 
  `description` VARCHAR(45) NOT NULL, 
  `lng` FLOAT NOT NULL, 
  `lat` FLOAT NOT NULL, 
  PRIMARY KEY (`itemid`)
);

CREATE TABLE `finalproject`.`photographs` ( 
  `photoid` INT NOT NULL AUTO_INCREMENT, 
  `locationid` INT NOT NULL, 
  `photographerid` INT NOT NULL, 
  PRIMARY KEY (`photoid`)
);

CREATE UNIQUE INDEX id ON users (userid);
CREATE UNIQUE INDEX pics ON photographs (photoid);

INSERT INTO users (name, username, address, city, state, zip)
VALUES
('Bonnie Buntcake', 'bbunt', '6709 Wonder Street', 'Wonderbread', 'OH', '46106'),
('Sam Smarf', 'ssmarf', '356 A Street', 'Beefy', 'PA', '19943'),
('Wendy Grog', 'wgrog', '900 Star Street', 'Mary', 'MD', '21340'),
('Joe Jogger', 'jjogger', '183713 N North Street', 'Norther', 'WV', '51423');

INSERT INTO locations (type, description, lng, lat)
VALUES
(1, 'Independence Hall', 794.35, 651.43),
(2, '6709 Wonder Street', 323.41, 412.22),
(1, 'Sunrise', 221.45, 132.43),
(2, '356 A Street', 123.32, 222.43),
(1, 'Mountains', 34.12, 87.99),
(2, '900 Star Street', 1071.9, 206.45),
(1, 'Moonrise', 816.2, 111.2),
(2, '183714 N North Street', 176.11, 11.176);

INSERT INTO photographs (locationid, photographerid)
VALUES
(2, 1), -- 6709 Wonder Street
(2, 1), -- 6709 Wonder Street
(2, 3), -- 900 Star Street
(2, 4); -- 183714 N North Street

SELECT DISTINCT u.name 
FROM users u
JOIN photographs p ON u.userid = p.photographerid
WHERE p.locationid = 2;


-- SELECT * FROM users;
-- SELECT * FROM locations;
-- SELECT * FROM photographs;