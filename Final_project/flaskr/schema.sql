DROP TABLE IF EXISTS user;
DROP TABLE IF EXISTS Customers;
DROP TABLE IF EXISTS Products;
DROP TABLE IF EXISTS Transactions;
DROP TABLE IF EXISTS Salespersons;
DROP TABLE IF EXISTS Store;
DROP TABLE IF EXISTS Region;

CREATE TABLE user (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  username TEXT UNIQUE NOT NULL,
  password TEXT NOT NULL,
  role TEXT NOT NULL,
  infodone TEXT NOT NULL
);

CREATE TABLE Customers (
    customerID INT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    street VARCHAR(255) NOT NULL,
    city VARCHAR(255) NOT NULL,
    state VARCHAR(255) NOT NULL,
    zipCode VARCHAR(10) NOT NULL,
    kind VARCHAR(10), -- "home" or "business"
    marriageStatus VARCHAR(10), -- Only if kind is "home"
    gender VARCHAR(10), -- Only if kind is "home"
    age INT, -- Only if kind is "home"
    income DECIMAL(10,2), -- Only if kind is "home"
    businessCategory VARCHAR(255), -- Only if kind is "business"
    companyGrossAnnualIncome DECIMAL(15,2), -- Only if kind is "business"
    FOREIGN KEY (customerID) REFERENCES user(id) ON DELETE SET NULL
);

CREATE TABLE Products (
    productID INT PRIMARY KEY,
    title VARCHAR(255),
    author VARCHAR(255),
    inventoryAmount INT,
    price DECIMAL(10,2),
    genreClassification VARCHAR(255)
);

CREATE TABLE Transactions (
    orderNumber INTEGER PRIMARY KEY AUTOINCREMENT,
    date DATE,
    salespersonName VARCHAR(255),
    productID INT, 
    customerID INT, 
    price DECIMAL(10,2),
    quantity INT,
    FOREIGN KEY (productID) REFERENCES Products(productID),
    FOREIGN KEY (customerID) REFERENCES Customers(customerID)
);

CREATE TABLE Salespersons (
    employeeID INT PRIMARY KEY,
    name VARCHAR(255),
    address VARCHAR(255),
    email VARCHAR(255),
    jobTitle VARCHAR(255),
    storeAssigned INT, -- Foreign key referencing Store table
    salary DECIMAL(12,2),
    FOREIGN KEY (storeAssigned) REFERENCES Store(storeID) ON DELETE SET NULL
);

CREATE TABLE Store (
    storeID INT PRIMARY KEY,
    address VARCHAR(255),
    manager INT, -- Foreign key referencing Salespersons table
    numberOfSalespersons INT,
    regionID INT, -- Foreign key referencing Region table
    FOREIGN KEY (manager) REFERENCES Salespersons(employeeID),
    FOREIGN KEY (regionID) REFERENCES Region(regionID)
);

CREATE TABLE Region (
    regionID INT PRIMARY KEY,
    regionName VARCHAR(255),
    regionManager INT, -- Foreign key referencing Salespersons table
    FOREIGN KEY (regionManager) REFERENCES Salespersons(employeeID)
);


INSERT INTO Products VALUES
(1, 'Pineapple Street', 'Jenny Jackson', 50, 20.99, 'Fiction'),
(2, 'Tom Lake', 'Ann Patchett', 30, 15.99, 'Fiction'),
(3, 'None of This Is True', 'Lisa Jewell', 40, 25.99, 'Mystery'),
(4, 'Bright Young Women', 'Jessica Knoll', 50, 24.99, 'Mystery'),
(5, 'The Seven Year Slip', 'Ashley Poston', 30, 15.99, 'Romance'),
(6, 'Fourth Wing', 'Rebecca Yarros', 60, 26.00, 'Romantasy'),
(7, 'The Unmaking of June Farrow', 'Adrienne Young', 40, 16.99, 'Fantasy'),
(8, 'The Deluge', 'Stephen Markley', 20, 15.99, 'Science Fiction'),
(9, 'Bridge', 'Lauren Beukes', 30, 17.99, 'Science Fiction'),
(10, 'Holly', 'Stephen Kind', 50, 25.99, 'Horror'),
(11, 'Rouge', 'Mona Awad', 35, 19.99, 'Horror'),
(12, 'Divine Rivals', 'Rebecca Ross', 40, 22.99, 'Young Adult Fantasy'),
(13, 'Five Survive', 'Holly Jackson', 30, 15.99, 'Young Adult Fiction'),
(14, 'Doppelganger: A Trip into the Mirror World', 'Naomi Klein', 30, 15.99, 'Nonfiction'),
(15, 'The Art Thief', 'Michael Finkel', 40, 18.99, 'Nonfiction');

INSERT INTO Store VALUES
(1, '123 Market St', 'Cole Curry', 1, 1),
(2, '456 Retail St', 'Alex Wade', 2, 2);
(3, 'online', 'Alex Wade', 2, 2);

INSERT INTO Salespersons VALUES
(1,'Cole Curry', '111 Sales St', 'colecurry@bookstore.com', 'Manager', 1, 60000),
(2,'Abbi Kline', '444 Sales St', 'abbikline@bookstore.com', 'Manager', 2, 60000),
(3,'Alex Wade', '222 Sales St', 'alexwade@bookstore.com', 'Associate', 1, 45000),
(4,'June Byers', '333 Sales St', 'junebyers@bookstore.com', 'Associate', 1, 45000),
(5,'Linda Buck', '555 Sales St', 'lindabuck@bookstore.com', 'Associate', 2, 45000),
(6, 'Maddie K', 'online', 'maddiek@bookstore.com', 'Manager', 3, 0);

INSERT INTO Region VALUES
(1, 'East', 'Cole Curry'),
(2, 'West', 'Alex Wade');






