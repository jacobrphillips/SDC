DROP DATABASE IF EXISTS epic;
CREATE DATABASE epic;
\c epic

CREATE TABLE product(
    id SERIAL PRIMARY KEY,
    title text NOT NULL,
    esrb_desc text NOT NULL,
    esrb text NOT NULL,
    price numeric NOT NULL,
    developer text NOT NULL,
    publisher text NOT NULL,
    releasedate date NOT NULL,
    platform text NOT NULL,
    description text NOT NULL,
    refundtype text NOT NULL,
    storyboard text NOT NULL,
    refund_link text NOT NULL,
    picture text NOT NULL,
    color text,
    esrb_img text NOT NULL,
    add_ons boolean NOT NULL,
    achievements boolean,
    description_img boolean,
    overall_rating numeric NOT NULL,
    total_achievements numeric
);

CREATE TABLE achievements (
    id SERIAL PRIMARY KEY,
    product_id integer NOT NULL,
    name text NOT NULL,
    xp numeric NOT NULL,
    image text NOT NULL,
    trophy_type text NOT NULL,
    FOREIGN KEY (product_id) REFERENCES product(id) ON DELETE CASCADE
);

CREATE TABLE addons (
    id SERIAL PRIMARY KEY,
    name text NOT NULL,
    price numeric NOT NULL,
    description text NOT NULL,
    product_id integer NOT NULL,
    image text NOT NULL,
    pageurl text NOT NULL,
    FOREIGN KEY (product_id) REFERENCES product(id) ON DELETE CASCADE
);

CREATE TABLE critics (
    id SERIAL PRIMARY KEY,
    product_id integer NOT NULL,
    name text NOT NULL,
    rating text NOT NULL,
    created_at timestamp with time zone NOT NULL DEFAULT now(),
    FOREIGN KEY (product_id) REFERENCES product(id) ON DELETE CASCADE
);

CREATE TABLE editions (
    id SERIAL PRIMARY KEY,
    price numeric NOT NULL,
    name text NOT NULL,
    description text NOT NULL,
    product_id integer NOT NULL,
    image text NOT NULL,
    pageurl text NOT NULL,
    FOREIGN KEY (product_id) REFERENCES product(id) ON DELETE CASCADE
);

CREATE TABLE epicratings (
    id SERIAL PRIMARY KEY,
    product_id integer NOT NULL,
    title text NOT NULL,
    icon text NOT NULL,
    created_at timestamp with time zone NOT NULL DEFAULT now(),
    FOREIGN KEY (product_id) REFERENCES product(id) ON DELETE CASCADE
);

CREATE TABLE features (
    id SERIAL PRIMARY KEY,
    name text NOT NULL,
    product_id integer NOT NULL,
    url text NOT NULL,
    FOREIGN KEY (product_id) REFERENCES product(id) ON DELETE CASCADE
);

CREATE TABLE genres (
    id SERIAL PRIMARY KEY,
    name text NOT NULL,
    product_id integer NOT NULL,
    url text NOT NULL,
    FOREIGN KEY (product_id) REFERENCES product(id) ON DELETE CASCADE
);

CREATE TABLE media (
    id SERIAL PRIMARY KEY,
    url text NOT NULL,
    alt text NOT NULL,
    product_id integer NOT NULL,
    mediatype text NOT NULL,
    img text NOT NULL,
    FOREIGN KEY (product_id) REFERENCES product(id) ON DELETE CASCADE
);

CREATE TABLE ratings (
    id SERIAL PRIMARY KEY,
    title text NOT NULL,
    review text NOT NULL,
    rating text NOT NULL,
    author text NOT NULL,
    product_id integer NOT NULL,
    url text,
    FOREIGN KEY (product_id) REFERENCES product(id) ON DELETE CASCADE
);

CREATE TABLE socials (
    id SERIAL PRIMARY KEY,
    url text,
    name text,
    product_id integer, 
    FOREIGN KEY (product_id) REFERENCES product(id) ON DELETE CASCADE
);

CREATE TABLE specs_min (
    id SERIAL PRIMARY KEY,
    section_header text NOT NULL,
    languages text NOT NULL,
    os text NOT NULL,
    processor text NOT NULL,
    memory text NOT NULL,
    storage text NOT NULL,
    directx text NOT NULL,
    logins text,
    product_id integer,
    graphics text,
    other text,
    FOREIGN KEY (product_id) REFERENCES product(id) ON DELETE CASCADE
);

CREATE TABLE specs_rec (
    id SERIAL PRIMARY KEY,
    os text,
    processor text,
    memory text,
    storage text,
    directx text,
    logins text,
    language_supported text,
    product_id integer,
    graphics text,
    other text,
    FOREIGN KEY (product_id) REFERENCES product(id) ON DELETE CASCADE
);

INSERT INTO product (title, esrb_desc, esrb, price, developer, publisher, releasedate, platform, description, refundtype, storyboard, refund_link, picture, color, esrb_img, add_ons, achievements, description_img, overall_rating, total_achievements) VALUES ('STAR WARS Jedi: Survivor™', 'Violence, Mild Language', 'Teen', 69.99,'Respawn Entertainment', 'Electronic Arts', '2023-04-27', 'Windows', 'The story of Cal Kestis continues in Star Wars Jedi: Survivor™, a third-person galaxy-spanning action-adventure game from Respawn Entertainment and Lucasfilm Games.', 'Self-Refundable', 'https://cdn2.unrealengine.com/egs-starwarsjedisurvivordeluxeedition-respawn-editions-g2-01-900x2254-5aeba6af2a69.jpg','https://www.epicgames.com/site/en-US/store-refund-policy','https://cdn2.unrealengine.com/egs-starwarsjedisurvivorstandardedition-respawnentertainment-ic1-400x400-9ff568e5738d.png?h=270&quality=medium&resize=1&w=480',null , 'https://cdn1.epicgames.com/gameRating/gameRating/ESRB_T_192_192x192-a0885066a34083cd647dc10db21717f1', true, null, true,4.4,null);
INSERT INTO product (title, esrb_desc, esrb, price, developer, publisher, releasedate, platform, description, refundtype, storyboard, refund_link, picture, color, esrb_img, add_ons, achievements, description_img, overall_rating, total_achievements) VALUES ('God of War', 'Intense Violence, Blood and Gore, Strong Language', 'Mature', 49.99,'Santa Monica Studio Entertainment', 'PlayStation PC LLC', '2022-10-14', 'Windows', 'His vengeance against the Gods of Olympus years behind him, Kratos now lives as a man in the realm of Norse Gods and monsters. It is in this harsh, unforgiving world that he must fight to survive… and teach his son to do the same.', 'Self-Refundable', '<div id=about-long-description" class="css-i6bazn" data-testid="expand-collapse-content"><span class="css-119zqif"><div class="css-1lwib6p"><h2 class="css-1bemwa4">God of War</h2><h2 class="css-1bemwa4">Enter the Norse realm</h2><div class="css-1o9l22h">His vengeance against the Gods of Olympus years behind him  Kratos now lives as a man in the realm of Norse Gods and monsters. It is in this harsh  unforgiving world that he must fight to survive… and teach his son to do the same. </div><h2 class="css-1bemwa4">Grasp a second chance</h2><div class="css-1o9l22h">Kratos is a father again. As mentor and protector to Atreus a son determined to earn his respect he is forced to deal with and control the rage that has long defined him while out in a very dangerous world with his son. </div><h2 class="css-1bemwa4">Journey to a dark  elemental world of fearsome creatures</h2><div class="css-1o9l22h">From the marble and columns of ornate Olympus to the gritty forests mountains and caves of pre-Viking Norse lore this is a distinctly new realm with its own pantheon of creatures monsters and gods. </div><h2 class="css-1bemwa4">Engage in visceral physical combat</h2><div class="css-1o9l22h">With an over the shoulder camera that brings the player closer to the action than ever before fights in God of War™ mirror the pantheon of Norse creatures Kratos will face: grand gritty and grueling. A new main weapon and new abilities retain the defining spirit of the God of War series while presenting a vision of conflict that forges new ground in the genre. </div><h2 class="css-1bemwa4">PC FEATURES</h2><h2 class="css-1bemwa4">High Fidelity Graphics</h2><div class="css-1o9l22h">Striking visuals enhanced on PC. Enjoy true 4K resolution on supported devices with unlocked framerates for peak performance. Dial in your settings via a wide range of graphical presets and options including higher resolution shadows improved screen space reflections the addition of GTAO and SSDO and much more.</div><h2 class="css-1bemwa4">NVIDIA® DLSS and Reflex Support</h2><div class="css-1o9l22h">Quality meets performance. Harness the AI power of NVIDIA Deep Learning Super Sampling (DLSS) to boost frame rates and generate beautiful sharp images on select Nvidia GPUs. Utilize NVIDIA Reflex low latency technology allowing you to react quicker and hit harder combos with the responsive gameplay you crave on GeForce GPUs.</div><h2 class="css-1bemwa4">Controls Customization</h2><div class="css-1o9l22h">Play your way. With support for the DUALSHOCK®4 and DUALSENSE® wireless controllers a wide range of other gamepads and fully customizable bindings for mouse and keyboard you have the power to fine-tune every action to match your playstyle.</div><h2 class="css-1bemwa4">Ultra-wide Support</h2><div class="css-1o9l22h">Immerse yourself like never before. Journey through the Norse realms taking in breathtaking vistas in panoramic widescreen. With 21:9 ultra-widescreen support God of War™ presents a cinema quality experience that further expands the original seamless theatrical vision.</div></div></span></div>','https://www.epicgames.com/site/en-US/store-refund-policy','https://cdn2.unrealengine.com/egs-godofwar-santamonicastudio-ic1-400x400-5819bbf696c5.png?h=270&quality=medium&resize=1&w=480',null , 'https://cdn1.epicgames.com/gameRating/gameRating/ESRB_M_192_192x192-1984f5076d6fb905bba422c8700c663e', false, false, false,4.9,null);
INSERT INTO product (title, esrb_desc, esrb, price, developer, publisher, releasedate, platform, description, refundtype, storyboard, refund_link, picture, color, esrb_img, add_ons, achievements, description_img, overall_rating, total_achievements) VALUES ('Redfall', 'Violence, Blood, Strong Language, Drug Reference', 'Mature', 69.99,'Arkane Studio', 'Bethesda Softworks', '2023-04-27', 'Windows', 'The town of Redfall is under siege by a legion of vampires who have cut the island off from the outside world. Trapped with a handful of survivors, slay alone or squad up in open-world FPS action.', 'Self-Refundable', '<div id=about-long-description" class="css-i6bazn" data-testid="expand-collapse-content"><span class="css-119zqif"><div class="css-1lwib6p"><h2 class="css-1bemwa4">Redfall</h2><h2 class="css-1bemwa4">Upgrade to the Bite Back Edition to receive:</h2><div class="css-1o9l22h"> Redfall Hero Pass with Two Future Heroes<br> Laser Beam Multi-Weapon Skin<br> Tactical Knife Stake Weapon Attachment<br> Throwback Outfit Pack (Unique Outfit for Each Hero)</div><h2 class="css-1bemwa4">FEATURES:</h2><h2 class="css-1bemwa4">Uncover the Truth Take Back Redfall</h2><div class="css-1o9l22h">The island town of Redfall Massachusetts is under siege by a legion of vampires who have blocked out the sun and cut the citizens off from the outside world. Explore the open world and immerse yourself in a deep story campaign as you unravel the mystery behind the vampires appearance. Ally with a handful of survivors against the creatures threatening to bleed the town dry.</div><h2 class="css-1bemwa4">Slay Alone or Squad Up</h2><div class="css-1o9l22h">Redfall blends single- and multiplayer options seamlessly allowing the player to venture into the darkness alone or to squad-up for up to four player co-op. Teammates can try different hero loadouts and combine their strengths to find creative solutions to the vampire apocalypse. You will collect an arsenal of specialized weaponry and customize your character with unique upgrades and abilities to suit your playstyle for guns blazing stealth combat and everything in-between.</div><h2 class="css-1bemwa4">Unconventional Heroes Vs. The Night</h2><div class="css-1o9l22h">Created by science experiments gone wrong and gifted with psychic abilities Redfalls vampires will challenge you and your squad to get creative. You will choose from a team of diverse heroes each with their own character-specific abilities to overcome the vampire legion and their brood of maniacal followers.<br> DEVINDER CROUSLEY The Verified Cryptid Hunter: A cryptozoologist and aspiring inventor. Armed with weapons of his own creation hes on a mission to prove himself.<br> LAYLA ELLISON The Telekinetic Threat: A biomedical engineering student who volunteered for a medical trial where something went very wrong leaving her with intense telekinetic abilities.<br> REMI DE LA ROSA The Ingenious Ingeniera: A brilliant combat engineer who has spent her life on the frontlines. With the help of her robot cohort Bribón shes determined to help rescue Redfalls survivors.<br> JACOB BOYER The Deadeye with an Undead Eye: An ex-military sharpshooter turned private contractor. Strange happenings on Redfall have left Jacob with a mysterious vampiric eye and a spectral raven thats never far from his side.</div><h2 class="css-1bemwa4">The Open World of Redfall</h2><div class="css-1o9l22h">Redfall is a true Arkane experience set in a rich world that blends the familiar with the extraordinary.  Redfalls open world is handcrafted by the master level designers behind Preys Talos I space station and Dishonoreds Dunwall. From the towns once-bustling downtown and the haunted forest to the decimated seaside boardwalk and beyond you will fight through cultist outposts and supernatural psychic spaces as you piece together Redfalls many mysteries.</div></div></span></div>
','https://www.epicgames.com/site/en-US/store-refund-policy','https://cdn2.unrealengine.com/egs-redfall-arkanestudios-ic1-400x400-bfaf31c41fb3.png?h=270&quality=medium&resize=1&w=480','rgb(202, 53, 27)', 'https://cdn1.epicgames.com/gameRating/gameRating/ESRB_M_192_192x192-1984f5076d6fb905bba422c8700c663e', true, true, false,3.5,66);

INSERT INTO achievements (product_id,name,xp,image, trophy_type) VALUES (3,'Neighborhood Revitalization',20,'https://shared-static-prod.epicgames.com/epic-achievements/ae861b70e4ce4f96aa60be2506db200b/48e20c81667c4ff49c85dd79ac3a01b0/icons/1ad44b0d3328a89cc967688597f940ee','bronze');
INSERT INTO achievements (product_id,name,xp,image, trophy_type) VALUES (3,'Revelations',10,'https://shared-static-prod.epicgames.com/epic-achievements/ae861b70e4ce4f96aa60be2506db200b/48e20c81667c4ff49c85dd79ac3a01b0/icons/e2129b40302dbef22ed01a54d1fd8c95','bronze');
INSERT INTO achievements (product_id,name,xp,image, trophy_type) VALUES (3,'Home is Where the Heart Is',10,'https://shared-static-prod.epicgames.com/epic-achievements/ae861b70e4ce4f96aa60be2506db200b/48e20c81667c4ff49c85dd79ac3a01b0/icons/4fe3cec183aecdb0bcd9cc62a44491a5','bronze');
INSERT INTO achievements (product_id,name,xp,image, trophy_type) VALUES (3,'Enter of Your Own Free Will',10,'https://shared-static-prod.epicgames.com/epic-achievements/ae861b70e4ce4f96aa60be2506db200b/48e20c81667c4ff49c85dd79ac3a01b0/icons/7bb2596d3a0fa7c4e6f1554187d7c605','bronze');
INSERT INTO achievements (product_id,name,xp,image, trophy_type) VALUES (3,'Contingency Plans',20,'https://shared-static-prod.epicgames.com/epic-achievements/ae861b70e4ce4f96aa60be2506db200b/48e20c81667c4ff49c85dd79ac3a01b0/icons/a455f0aeb0452dbb8b7ebc8168f6bf9f','bronze');

INSERT INTO critics (product_id,name,rating,created_at) VALUES (3,'Critics Recommend','14%','2023-05-19 14:06:49.128675+00');
INSERT INTO critics (product_id,name,rating,created_at) VALUES (3,'Top Critic Average','58','2023-05-19 14:07:18.071814+00');
INSERT INTO critics (product_id,name,rating,created_at) VALUES (3,'OpenCritic Rating','Weak','2023-05-19 14:07:56.8291+00');
INSERT INTO critics (product_id,name,rating,created_at) VALUES (1,'Critics Recommend','89%','2023-05-19 14:09:21.506327+00');
INSERT INTO critics (product_id,name,rating,created_at) VALUES (1,'Top Critic Average','85','2023-05-19 14:09:42.062231+00');
INSERT INTO critics (product_id,name,rating,created_at) VALUES (1,'OpenCritic Rating','Mighty','2023-05-19 14:10:05.354062+00');
INSERT INTO critics (product_id,name,rating,created_at) VALUES (2,'Critics Recommend','98%','2023-05-19 14:10:32.288747+00');
INSERT INTO critics (product_id,name,rating,created_at) VALUES (2,'Top Critic Average','94','2023-05-19 14:10:50.558212+00');
INSERT INTO critics (product_id,name,rating,created_at) VALUES (2,'OpenCritic Rating','Mighty','2023-05-19 14:11:17.65111+00');

INSERT INTO specs_rec (os, processor, memory, storage, directx, language_supported, logins, product_id, graphics, other) VALUES ('Windows 10 64-bit','4 core / 8 threads | Intel Core i5 11600K | Ryzen 5 5600X','16 GB','155 GB','12','Requires EA Origin account','AUDIO: English, Italian, French, German, Spanish - Spain, Spanish - Latin America, Polish, Japanese, Portuguese - Brazil TEXT: English, French, Italian, German, Spanish - Latin America, Spanish - Spain, Portuguese - Brazil, Polish, Japanese, Korean, Chinese - Simplified, Chinese - Traditional',1,null,null);
INSERT INTO specs_rec (os, processor, memory, storage, directx, language_supported,logins,  product_id, graphics, other) VALUES ('Windows 10 64-bit','Intel i5-6600k (4 core 3.5 GHz) or AMD Ryzen 5 2400 G (4 core 3.6 GHz)','8 GB DDR','70 GB SSD','DirectX 11 (feature level 11_1)',null,'AUDIO: English, French, German, Italian, Japanese, Polish, Portuguese, Portuguese - Brazil, Russian, Spanish - Spain, Spanish - Latin America TEXT: English, Dutch, French, German, Italian, Japanese, Korean, Polish, Portuguese, Portuguese - Brazil, Russian, Spanish - Spain, Spanish - Latin America, Turkish, Chinese - Traditional, Hungarian, Czech, Greek',2,'NVIDIA GTX 1060 (6 GB) or AMD RX 570 (4 GB)',null);
INSERT INTO specs_rec (os, processor, memory, storage, directx, language_supported, logins, product_id, graphics, other) VALUES ('Windows 10 64-bit','Intel Core i7-9700K @ 3.60GHz or AMD Ryzen 7 2700X','16 GB','100 GB','Version 12',null, null,3,'AMD 5700 / NVIDIA RTX 2080 / Intel ARC / 8 GB VRAM','Broadband required, SSD recommended');

INSERT INTO epicratings (product_id,title,icon,created_at) VALUES (1,'Great Boss Battles','https://cdn2.epicgames.com/static/fonts/joypixel/1f996.svg','2023-05-16 18:58:44.990013+00');
INSERT INTO epicratings (product_id,title,icon,created_at) VALUES (1,'Highly Recommended','https://cdn2.epicgames.com/static/fonts/joypixel/1f4e2.svg','2023-05-16 19:05:43.771802+00');
INSERT INTO epicratings (product_id,title,icon,created_at) VALUES (1,'Relaxing','https://cdn2.epicgames.com/static/fonts/joypixel/1f6c1.svg','2023-05-16 19:22:20.767053+00');
INSERT INTO epicratings (product_id,title,icon,created_at) VALUES (1,'Quickly Understood Controls','https://cdn2.epicgames.com/static/fonts/joypixel/1f5b1.svg','2023-05-16 19:23:27.008938+00');
INSERT INTO epicratings (product_id,title,icon,created_at) VALUES (1,'Extremely Fun','https://cdn2.epicgames.com/static/fonts/joypixel/1f60d.svg','2023-05-18 19:23:09.966657+00');
INSERT INTO epicratings (product_id,title,icon,created_at) VALUES (1,'Amazing Storytelling','https://cdn2.epicgames.com/static/fonts/joypixel/1f4dd.svg','2023-05-18 19:23:09.966657+00');
INSERT INTO epicratings (product_id,title,icon,created_at) VALUES (2,'Character Customization','https://cdn2.epicgames.com/static/fonts/joypixel/1f3a8.svg','2023-05-18 19:25:59.349813+00');
INSERT INTO epicratings (product_id,title,icon,created_at) VALUES (2,'Great Boss Battles','https://cdn2.epicgames.com/static/fonts/joypixel/1f996.svg','2023-05-18 19:26:32.054176+00');
INSERT INTO epicratings (product_id,title,icon,created_at) VALUES (2,'Extremely Fun','https://cdn2.epicgames.com/static/fonts/joypixel/1f60d.svg','2023-05-18 19:27:07.740177+00');
INSERT INTO epicratings (product_id,title,icon,created_at) VALUES (2,'Amazing Characters','https://cdn2.epicgames.com/static/fonts/joypixel/1f3ad.svg','2023-05-18 19:27:36.717359+00');
INSERT INTO epicratings (product_id,title,icon,created_at) VALUES (2,'Amazing Storytelling ','https://cdn2.epicgames.com/static/fonts/joypixel/1f4dd.svg','2023-05-18 19:28:34.323646+00');
INSERT INTO epicratings (product_id,title,icon,created_at) VALUES (2,'Competitive Players ','https://cdn2.epicgames.com/static/fonts/joypixel/1f3c6.svg','2023-05-18 19:29:28.516261+00');

INSERT INTO media (url,alt,product_id,mediatype,img) VALUES ('https://drive.google.com/uc?export=view&id=1f8u6z6E2pO3LBIV6eDRfVY8a_vkwBnm3','GOW - PC Announce Trailer',2,'video','https://cdn2.unrealengine.com/egs-godofwar-santamonicastudio-g1c-00-1920x1080-e34808c28444.jpg?h=270&quality=medium&resize=1&w=480');
INSERT INTO media (url,alt,product_id,mediatype,img) VALUES ('https://drive.google.com/uc?export=view&id=1wSfqdrCyeTC7pY8IasAG3wVJ5JLVWN1t','Jedi Survivor - Official Story Trailer',1,'video','https://cdn2.unrealengine.com/egs-starwarsjedisurvivor-respawnentertainment-g1c-01-1920x1080-3bf10b244ad7.jpg?h=270&quality=medium&resize=1&w=480');
INSERT INTO media (url,alt,product_id,mediatype,img) VALUES ('https://drive.google.com/uc?export=view&id=1sBvdUlq3aDSci4-bAUnOHKtd5a2T2W8W','Jedi Survivor - Final Gameplay Trailer',1,'video','https://cdn2.unrealengine.com/egs-starwarsjedisurvivor-respawnentertainment-g1c-00-1920x1080-49c0c943d65d.jpg?h=270&quality=medium&resize=1&w=480');
INSERT INTO media (url,alt,product_id,mediatype,img) VALUES ('https://drive.google.com/uc?export=view&id=1N1BZGVRibzrYujdCfSuAxeuVIwbu89G8','Jedi Survivor - Official Teaser',3,'video','https://cdn2.unrealengine.com/egs-starwarsjedisurvivor-respawnentertainment-g1c-02-1920x1080-98a548ae89a6.jpg?h=270&quality=medium&resize=1&w=480');
INSERT INTO media (url,alt,product_id,mediatype,img) VALUES ('https://drive.google.com/uc?export=view&id=1rcFWKUCTNwd8CkyC9Y2BXNEmahZ0Ko23','Redfall - "Welcome to Redfall" Official Trailer',3,'video','https://cdn2.unrealengine.com/egs-redfall-arkanestudios-g1c-00-1920x1080-2bd8e5e91335.jpg?h=270&quality=medium&resize=1&w=480');
INSERT INTO media (url,alt,product_id,mediatype,img) VALUES ('https://drive.google.com/uc?export=view&id=1gkITco0Jl_7DrCaIHI9HCR_4erL1lcCF','Redfall - Official Story Trailer',3,'video','https://cdn2.unrealengine.com/egs-redfall-arkanestudios-notec-00-1920x1080-0e2e63e917e5.jpg?h=270&quality=medium&resize=1&w=480');
INSERT INTO media (url,alt,product_id,mediatype,img) VALUES ('https://drive.google.com/uc?export=view&id=1fVsxlf8vhCzSPqm0aJnv_7gKsjMpbfx5','Redfall - Official Pre-Order Trailer',3,'video','https://cdn2.unrealengine.com/egs-redfall-arkanestudios-g1c-01-1920x1080-74ec31c1e9eb.jpg?h=270&quality=medium&resize=1&w=480');
INSERT INTO media (url,alt,product_id,mediatype,img) VALUES ('https://drive.google.com/uc?export=view&id=1HoU2OQd6VNiG19W2Jx6epnmLFpXVGKgl','Redfall - Official Launch Trailer',3,'video','https://cdn2.unrealengine.com/egs-redfall-arkanestudios-g1c-00-launch-1920x1080-54b0ac28d013.jpg?h=270&quality=medium&resize=1&w=480');
INSERT INTO media (url,alt,product_id,mediatype,img) VALUES ('https://drive.google.com/uc?export=view&id=1o1TiuxjHJ7jd_IctGAOh0GuiSRlFpMEV','Redfall - Official Gameplay Reveal',3,'video','https://cdn2.unrealengine.com/egs-redfall-arkanestudios-g1c-02-1920x1080-a504c37e57e1.jpg?h=270&quality=medium&resize=1&w=480');
INSERT INTO media (url,alt,product_id,mediatype,img) VALUES ('https://drive.google.com/uc?export=view&id=1zPKP3zDVeFNJpDUciqmyoDT8oli5_5JA','Redfall - Official Announce Trailer',3,'video','https://cdn2.unrealengine.com/egs-redfall-arkanestudios-g1c-03-1920x1080-e95ff6c58402.jpg?h=270&quality=medium&resize=1&w=480');
INSERT INTO media (url,alt,product_id,mediatype,img) VALUES ('https://cdn2.unrealengine.com/egs-starwarsjedisurvivorstandardedition-respawnentertainment-g1a-06-1920x1080-b99be4d196d2.jpg','Cal and Bode',1,'pic','https://drive.google.com/uc?export=view&id=1y3XwAuDWyywvEoMTC9b-KD32bMV4qD5c');
INSERT INTO media (url,alt,product_id,mediatype,img) VALUES ('https://cdn2.unrealengine.com/egs-starwarsjedisurvivorstandardedition-respawnentertainment-g1a-05-1920x1080-f000623431c5.jpg','Cal and Sere',1,'pic','https://drive.google.com/uc?export=view&id=14efnOVzSY9tSBtkW4t-VlkJjWePng0Gt');
INSERT INTO media (url,alt,product_id,mediatype,img) VALUES ('https://cdn2.unrealengine.com/egs-starwarsjedisurvivorstandardedition-respawnentertainment-g1a-04-1920x1080-113398136c5d.jpg','Cal and Vista',1,'pic','https://drive.google.com/uc?export=view&id=1g2TVr_8p7Y7MexxMmI_3bVXqXd4EZ2Dq');
INSERT INTO media (url,alt,product_id,mediatype,img) VALUES ('https://cdn2.unrealengine.com/egs-starwarsjedisurvivorstandardedition-respawnentertainment-g1a-03-1920x1080-c06e159917e5.jpg','Cal - Fight Pic',1,'pic','https://drive.google.com/uc?export=view&id=16QzCD6BsKrx7XBtcXtc7wHV4sZqpok8L');
INSERT INTO media (url,alt,product_id,mediatype,img) VALUES ('https://cdn2.unrealengine.com/egs-starwarsjedisurvivorstandardedition-respawnentertainment-g1a-02-1920x1080-38fea19a3d1b.jpg','Cal - Bacta Tank',1,'pic','https://drive.google.com/uc?export=view&id=10nrDiZZXdn45E2aHqDjCfRm9WYDBWtyR');
INSERT INTO media (url,alt,product_id,mediatype,img) VALUES ('https://cdn2.unrealengine.com/egs-starwarsjedisurvivorstandardedition-respawnentertainment-g1a-07-1920x1080-320afddfd9ab.jpg','Cal and BD',1,'pic','https://drive.google.com/uc?export=view&id=1hgRmHvVIuGFGKThctC9xKpPxE6UeIEVr');
INSERT INTO media (url,alt,product_id,mediatype,img) VALUES ('https://cdn2.unrealengine.com/egs-starwarsjedisurvivorstandardedition-respawnentertainment-g1a-08-1920x1080-111903cee010.jpg','Bosses',1,'pic','https://cdn2.unrealengine.com/egs-starwarsjedisurvivorstandardedition-respawnentertainment-g1a-08-1920x1080-111903cee010.jpg?h=270&quality=medium&resize=1&w=480');
INSERT INTO media (url,alt,product_id,mediatype,img) VALUES ('https://cdn2.unrealengine.com/egs-godofwar-santamonicastudio-g1a-01-1920x1080-c84d2a96aea3.jpg','God of War PC',2,'pic','https://cdn2.unrealengine.com/egs-godofwar-santamonicastudio-g1a-01-1920x1080-c84d2a96aea3.jpg?h=270&quality=medium&resize=1&w=480');
INSERT INTO media (url,alt,product_id,mediatype,img) VALUES ('https://cdn2.unrealengine.com/egs-godofwar-santamonicastudio-g1a-02-1920x1080-f7c6fef5c876.jpg','God of War Enemies',2,'pic','https://cdn2.unrealengine.com/egs-godofwar-santamonicastudio-g1a-02-1920x1080-f7c6fef5c876.jpg?h=270&quality=medium&resize=1&w=480');
INSERT INTO media (url,alt,product_id,mediatype,img) VALUES ('https://cdn2.unrealengine.com/egs-godofwar-santamonicastudio-g1a-03-1920x1080-65b80475ae32.jpg','Download God of War',2,'pic','https://cdn2.unrealengine.com/egs-godofwar-santamonicastudio-g1a-03-1920x1080-65b80475ae32.jpg?h=270&quality=medium&resize=1&w=480');
INSERT INTO media (url,alt,product_id,mediatype,img) VALUES ('https://cdn2.unrealengine.com/egs-godofwar-santamonicastudio-g1a-04-1920x1080-2c217f1dd0a4.jpg','God of War Game Download',2,'pic','https://cdn2.unrealengine.com/egs-godofwar-santamonicastudio-g1a-04-1920x1080-2c217f1dd0a4.jpg?h=270&quality=medium&resize=1&w=480');
INSERT INTO media (url,alt,product_id,mediatype,img) VALUES ('https://cdn2.unrealengine.com/egs-godofwar-santamonicastudio-g1a-05-1920x1080-cf82550ed6f4.jpg','God of War Offering',2,'pic','https://cdn2.unrealengine.com/egs-godofwar-santamonicastudio-g1a-05-1920x1080-cf82550ed6f4.jpg?h=270&quality=medium&resize=1&w=480');

INSERT INTO specs_min (section_header,languages,os,processor,memory,storage,directx,logins,product_id,graphics,other) VALUES ('Windows','AUDIO: English, Italian, French, German, Spanish - Spain, Spanish - Latin America, Polish, Japanese, Portuguese - Brazil
TEXT: English, French, Italian, German, Spanish - Latin America, Spanish - Spain, Portuguese - Brazil, Polish, Japanese, Korean, Chinese - Simplified, Chinese - Traditional
', 'Windows 10 64-bit','4 core / 8 threads | Intel Core i7-7700 | Ryzen 5 1400','8 GB', '155 GB', '12' ,'Requires EA Origin account' ,1,null, null);
INSERT INTO specs_min (section_header,languages,os,processor,memory,storage,directx,logins,product_id,graphics,other) VALUES ('Windows','AUDIO: English, French, German, Italian, Japanese, Polish, Portuguese, Portuguese - Brazil, Russian, Spanish - Spain, Spanish - Latin America
TEXT: English, Dutch, French, German, Italian, Japanese, Korean, Polish, Portuguese, Portuguese - Brazil, Russian, Spanish - Spain, Spanish - Latin America, Turkish, Chinese - Traditional, Hungarian, Czech, Greek', 'Windows 10 64-bit','Intel i5-2500k (4 core 3.3 GHz) or AMD Ryzen 3 1200 (4 core 3.1 GHz)','8 GB DDR', '70 GB HDD (SSD Recommended)', 'DirectX 11 (feature level 11_1)' ,null ,2,'NVIDIA GTX 960 (4 GB) or AMD R9 290X (4 GB)', null);
INSERT INTO specs_min (section_header,languages,os,processor,memory,storage,directx,logins,product_id,graphics,other) VALUES ('Windows','AUDIO: English, French, German, Italian, Japanese, Polish, Portuguese - Brazil, Russian, Spanish - Spain, Spanish - Latin America
TEXT: Arabic, English, Chinese - Simplified, Chinese - Traditional, French, German, Italian, Japanese, Korean, Polish, Portuguese - Brazil, Russian, Spanish - Spain, Spanish - Latin America', 'Windows 10 64-bit','Intel Core i5-8400 @ 2.80GHz or AMD Ryzen 5 1600','16 GB', '100 GB', 'Version 12' ,'Requires Epic Games account' ,3,'AMD 580 / NV GTX 1070 / 6 GB VRAM', 'Broadband required');

INSERT INTO addons (name, price, description, product_id, image, pageurl)
VALUES ('STAR WARS Jedi: Survivor™ - Deluxe Upgrade', 20, 'Upgrade to unlock exclusive cosmetic items!', 1, 'https://cdn1.epicgames.com/offer/5a2ea5980ac147c195775039195a3081/EGS_STARWARSJediSurvivorDeluxeUpgrade_Respawn_DLC_S1_2560x1440-7c9c63aa494f15aa1d277540e60306bf?h=270&quality=medium&resize=1&w=480', 'https://store.epicgames.com/en-US/p/star-wars-jedi-survivor--deluxe-upgrade'),
       ('Redfall Bite Back Upgrade', 29.99, 'The Bite Back Edition Upgrade includes the Redfall Hero Pass, Throwback Outfit Pack, Laser Beam multi-weapon skin, and the Tactical Knife Stake attachment. Base game required to play.', 3, 'https://cdn1.epicgames.com/offer/48e20c81667c4ff49c85dd79ac3a01b0/EGS_RedfallBiteBackUpgrade_ArkaneStudios_Packs_S1_2560x1440-4ec1f30f6646986987d35707da2c0d4c?h=270&quality=medium&resize=1&w=480', 'https://store.epicgames.com/en-US/p/redfall--bite-back-edition-upgrade'),
       ('Redfall Original Game Soundtrack', 9.99, 'The Redfall Original Game Soundtrack includes 29 tracks to hype you up as you take back Redfall. Immerse yourself in the rich narrative with a signature spooky hip hop sound that enhances the games atmosphere, composed by...', 3, 'https://cdn1.epicgames.com/offer/48e20c81667c4ff49c85dd79ac3a01b0/EGS_RedfallOriginalGameSoundtrack_ArkaneStudios_DigitalExtras_S1_2560x1440-88f8a096c68997d2b37909fd785321d4?h=270&quality=medium&resize=1&w=480', 'https://store.epicgames.com/en-US/p/redfall--original-game-soundtrack');

INSERT INTO editions (price, name, description, product_id, image, pageurl)
VALUES (69.99, 'STAR WARS Jedi: Survivor™ Standard Edition ', 'The story of Cal Kestis continues in Star Wars Jedi: Survivor™, a third-person galaxy-spanning action-adventure game from Respawn Entertainment and Lucasfilm Games.', 1, 'https://cdn2.unrealengine.com/egs-starwarsjedisurvivorstandardedition-respawnentertainment-s1-2560x1440-9475e1c6c933.jpg?h=270&quality=medium&resize=1&w=480', 'https://store.epicgames.com/en-US/p/star-wars-jedi-survivor'),
       (89.99, 'STAR WARS Jedi: Survivor™ Deluxe Edition', 'Unlock exclusive cosmetic items inspired by Han Solo™ and Luke Skywalker™, as seen in STAR WARS: A New Hope, with Star Wars Jedi: Survivor Deluxe Edition*!', 1, 'https://cdn2.unrealengine.com/egs-starwarsjedisurvivordeluxeedition-respawn-editions-s1-2560x1440-d3eeb6db2b78.jpg?h=270&quality=medium&resize=1&w=480', 'https://store.epicgames.com/en-US/p/star-wars-jedi-survivor--deluxe-edition'),
       (69.99, 'Standard Edition', 'The town of Redfall is under siege by a legion of vampires who have cut the island off from the outside world. Trapped with a handful of survivors, slay alone or squad up in open-world FPS action.', 3, 'https://cdn2.unrealengine.com/egs-redfall-arkanestudios-s1-2560x1440-30441284f018.jpg?h=270&quality=medium&resize=1&w=480', 'https://store.epicgames.com/en-US/p/redfall'),
       (99.99, 'Bite Back Edition', 'The Bite Back Edition includes the Base Game, Redfall Hero Pass, Throwback Outfit Pack, Laser Beam multi-weapon skin and the Tactical Knife Stake attachment.', 3, 'https://cdn2.unrealengine.com/egs-redfallbitebackedition-arkanestudios-editions-s1-2560x1440-086406daa020.jpg?h=270&quality=medium&resize=1&w=480', 'https://store.epicgames.com/en-US/p/redfall--bite-back-edition');

INSERT INTO features (name, product_id, url)
VALUES ('Cloud Saves', 2, 'https://store.epicgames.com/en-US/browse?sortBy=releaseDate&sortDir=DESC&tag=Cloud%20Saves&count=40&start=0'),
       ('Competitive', 2, 'https://store.epicgames.com/en-US/browse?sortBy=releaseDate&sortDir=DESC&tag=Competitive&count=40'),
       ('Single Player', 1, 'https://store.epicgames.com/en-US/c/single-player-games?sortBy=releaseDate&sortDir=DESC&count=40'),
       ('Multiplayer', 3, 'https://store.epicgames.com/en-US/c/multiplayer-games?sortBy=releaseDate&sortDir=DESC&count=40'),
       ('Achievements', 3, 'https://store.epicgames.com/en-US/browse?tag=Achievements'),
       ('Co-op', 3, 'https://store.epicgames.com/en-US/c/co-op-games'),
       ('Single Player', 2, 'https://store.epicgames.com/en-US/c/single-player-games?sortBy=releaseDate&sortDir=DESC&count=40');

INSERT INTO genres (name, product_id, url)
VALUES ('Action', 1, 'https://store.epicgames.com/en-US/c/action-games?sortBy=releaseDate&sortDir=DESC&count=40'),
       ('Adventure', 1, 'https://store.epicgames.com/en-US/c/adventure-games?sortBy=releaseDate&sortDir=DESC&count=40'),
       ('RPG', 1, 'https://store.epicgames.com/en-US/c/rpg-games?sortBy=releaseDate&sortDir=DESC&count=40'),
       ('Action', 2, 'https://store.epicgames.com/en-US/c/action-games?sortBy=releaseDate&sortDir=DESC&count=40'),
       ('Adventure', 2, 'https://store.epicgames.com/en-US/c/adventure-games?sortBy=releaseDate&sortDir=DESC&count=40'),
       ('RPG', 2, 'https://store.epicgames.com/en-US/c/rpg-games?sortBy=releaseDate&sortDir=DESC&count=40');

INSERT INTO ratings (title, review, rating, author, product_id, url)
VALUES ('Game Informer', '“Developer Respawn Entertainment clearly took a measured and thoughtful approach to analyze what worked and what didn’t in its last Star Wars game, and Jedi: Survivor feels like a worthy attempt at evolution. It captures the magic of Star Wars as well as anything in the current canon, and it’s a stellar adventure in its own right.”
', '9.3/10', 'Matt Miller', 1, 'https://www.gameinformer.com/review/star-wars-jedi-survivor/capturing-the-fantasy'),
       ('IGN', '“If Respawn makes one more like this itll complete the best Star Wars trilogy in 30 years, hands down.”
', '9/10', 'Dan Stapleton', 1, 'https://www.ign.com/articles/star-wars-jedi-survivor-review'),
       ('GamesRadar+', '“Jedi: Survivor sets itself up as a benchmark for what new Star Wars stories can look like.”
', '4.5/5', 'Ali Jones', 1, 'https://www.gamesradar.com/star-wars-jedi-survivor-review/'),
       ('IGN', '“God of Wars outstanding characters, world, and combat come together to form an unforgettable adventure.”', '10/10', 'Jonathan Dornbush', 2, 'https://www.ign.com/articles/2018/04/12/god-of-war-review'),
       ('Eurogamer', '“Despite eye-catching changes, the heart of this series remains gloriously unaltered.”', 'Recommended', 'Christian Donlan', 2, 'https://www.eurogamer.net/god-of-war-review-astonishing-technological-craft-in-the-service-of-simple-pleasures'),
       ('Giant bomb', '“Sony Santa Monica makes us care about Kratos in this stunning revival of the series.”', '5 stars', 'Dan Ryckert', 2, 'https://www.giantbomb.com/reviews/god-of-war-review/1900-782/'),
       ('We Got This Covered', '“With rich, beautiful open worlds, a multitude of weapons, and a wide variety of enemies to square off against, Redfall amazes. Players wont regret staking their claim on Arkanes latest masterpiece.”', '4.5 stars', 'Christian Bognar', 3, NULL),
       ('VideoGamer', '“Frankly, its a relief to see real neck-biters treated with the proper pulp care. Arkane Austin gets right to it: teeth, claws, and clear agendas.”
', '7/10', 'Josh Wise', 3, NULL);

INSERT INTO socials (url, name, product_id)
VALUES ('https://redirect.epicgames.com/?redirectTo=https%3A%2F%2Fwww.facebook.com%2FEAStarWars
', 'Facebook', 1),
       ('https://redirect.epicgames.com/?redirectTo=https%3A%2F%2Fwww.facebook.com%2FEAStarWars', 'Website', 1),
       ('https://redirect.epicgames.com/?redirectTo=https%3A%2F%2Ftwitter.com%2FEAStarWars', 'Twitter', 1),
       ('https://redirect.epicgames.com/?redirectTo=https%3A%2F%2Fwww.youtube.com%2Fuser%2FEAStarWars', 'Youtube', 1),
       ('https://www.facebook.com/santamonicastudio', 'Facebook', 2),
       ('https://twitter.com/sonysantamonica', 'Twitter', 2),
       ('https://www.instagram.com/santamonicastudio/', 'Instagram', 2),
       (' https://www.playstation.com/en-us/god-of-war/', 'Website', 2),
       ('https://www.facebook.com/playRedfall', 'Facebook', 3),
       (' https://bethesda.net/en/game/redfall', 'Website', 3),
       ('https://www.instagram.com/playRedfall/', 'Instagram', 3),
       ('https://twitter.com/playRedfall', 'Twitter', 3);
