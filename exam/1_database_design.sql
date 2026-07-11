CREATE TABLE brands(
    id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    name VARCHAR(50) UNIQUE NOT NULL
);
CREATE TABLE classifications(
    id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    name VARCHAR(30) UNIQUE NOT NULL
);
CREATE TABLE customers(
    id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    first_name VARCHAR(30) NOT NULL,
    last_name VARCHAR(30) NOT NULL,
    address VARCHAR(150) NOT NULL,
    phone VARCHAR(30) UNIQUE NOT NULL,
    loyalty_card BOOLEAN NOT NULL DEFAULT FALSE
);
CREATE TABLE items(
    id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    quantity INT CHECK(quantity >= 0) NOT NULL,
    price NUMERIC(12, 2) CHECK (price > 0.00) NOT NULL,
    description TEXT,
    brand_id INT NOT NULL REFERENCES brands(id)
                    ON DELETE CASCADE
                    ON UPDATE CASCADE,
    classification_id INT NOT NULL REFERENCES classifications(id)
                    ON DELETE CASCADE
                    ON UPDATE CASCADE
);
CREATE TABLE orders(
    id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    created_at TIMESTAMP NOT NULL DEFAULT NOW(),
    customer_id INT NOT NULL REFERENCES customers(id)
                    ON DELETE CASCADE
                    ON UPDATE CASCADE
);
CREATE TABLE reviews(
    customer_id INT NOT NULL REFERENCES customers(id)
                    ON DELETE CASCADE
                    ON UPDATE CASCADE,
    item_id INT NOT NULL REFERENCES items(id)
                    ON DELETE CASCADE
                    ON UPDATE CASCADE,
    created_at TIMESTAMP NOT NULL DEFAULT NOW(),
    rating NUMERIC(3, 1) DEFAULT 0.0 CHECK (rating <= 10.0) NOT NULL,
    CONSTRAINT pk_reviews
                    PRIMARY KEY (customer_id, item_id)

);
CREATE TABLE orders_items(
    order_id INT NOT NULL REFERENCES orders(id)
                         ON DELETE CASCADE
                         ON UPDATE CASCADE,
    item_id INT NOT NULL REFERENCES items(id)
                         ON DELETE CASCADE
                         ON UPDATE CASCADE,
    quantity INT CHECK (quantity >= 0) NOT NULL,
    CONSTRAINT pk_orders_items
                         PRIMARY KEY (order_id, item_id)
);