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
    url text NOT NULL,
    name text NOT NULL,
    product_id integer NOT NULL, 
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
    product_id integer NOT NULL,
    graphics text,
    other text,
    FOREIGN KEY (product_id) REFERENCES product(id) ON DELETE CASCADE
);

CREATE TABLE specs_rec (
    id SERIAL PRIMARY KEY,
    os text NOT NULL,
    processor text NOT NULL,
    memory text NOT NULL,
    storage text NOT NULL,
    directx text NOT NULL,
    logins text,
    language_supported text,
    product_id integer NOT NULL,
    graphics text,
    other text,
    FOREIGN KEY (product_id) REFERENCES product(id) ON DELETE CASCADE
);