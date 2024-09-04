USE ELITE_KINGDOM_2;


-- -- TABLE for BRANCH_OFFICE
CREATE TABLE BRANCH_OFFICE (
    Branch_ID VARCHAR(50) PRIMARY KEY,
    Manager_ID VARCHAR(50),
    Street VARCHAR(100),
    City VARCHAR(50),
    Postcode VARCHAR(20),
  Phone_number_1 VARCHAR(20),
  Phone_number_2 VARCHAR(20),
  Phone_number_3 VARCHAR(20),
    FOREIGN KEY (Manager_ID) REFERENCES MANAGER(Manager_ID)
);
-- -- TABLE for MANAGER
CREATE TABLE MANAGER (
    Manager_ID VARCHAR(50) PRIMARY KEY,
    Branch_ID VARCHAR(50),
    Start_date DATE,
    Bonus INT
);

-- -- TABLE for SUPERVISOR
CREATE TABLE SUPERVISOR (
    Supervisor_ID VARCHAR(50) PRIMARY KEY,
    Date_assumed_position DATE,
    Number_of_staff INT
);

-- TABLE for STAFF
CREATE TABLE STAFF (
    Staff_ID VARCHAR(50) PRIMARY KEY,
    Name VARCHAR(100),
    Branch_ID VARCHAR(50),
    Address VARCHAR(100),
    Position VARCHAR(50),
    Salary INT,
    Supervisor_ID VARCHAR(50),
    FOREIGN KEY (Branch_ID) REFERENCES BRANCH_OFFICE(Branch_ID),
    FOREIGN KEY (Supervisor_ID) REFERENCES SUPERVISOR(Supervisor_id)
);
-- TABLE for PROPERTY_OWNER
CREATE TABLE PROPERTY_OWNER (
    Owner_ID VARCHAR(50) PRIMARY KEY,
    Name VARCHAR(100),
    Owner_Type VARCHAR(50),
    Address VARCHAR(100),
    Phone_number VARCHAR(15),
    Email VARCHAR(50)
);
-- -- TABLE for PROPERTY
CREATE TABLE PROPERTY (
    Property_ID VARCHAR(50) PRIMARY KEY,
    Owner_ID VARCHAR(50),
    Address VARCHAR(100),
    Number_of_rooms INT,
    Monthly_Rent INT,
    Property_type VARCHAR(50),
    Branch_ID VARCHAR(50),
    Staff_ID VARCHAR(50),
    FOREIGN KEY (Owner_ID) REFERENCES PROPERTY_OWNER(Owner_ID),
    FOREIGN KEY (Staff_ID) REFERENCES STAFF(Staff_ID),
    FOREIGN KEY (Branch_ID) REFERENCES BRANCH_OFFICE(Branch_ID)
);
-- -- TABLE for BUSINESS_OWNER
CREATE TABLE BUSINESS_OWNER (
    Owner_ID VARCHAR(50),
    Name VARCHAR(100),
    Business_Type VARCHAR(50),
    Contact VARCHAR(15),
    FOREIGN KEY (Owner_ID) REFERENCES PROPERTY_OWNER(Owner_ID)
);
-- -- TABLE for PRIVATE_OWNER
CREATE TABLE PRIVATE_OWNER (
    Owner_ID VARCHAR(50),
    Name VARCHAR(100),
    Property_Type VARCHAR(50),
    Contact VARCHAR(15),
    FOREIGN KEY (Owner_ID) REFERENCES PROPERTY_OWNER(Owner_ID)
);
-- -- TABLE for CLIENT
CREATE TABLE CLIENT (
    Client_ID VARCHAR(50) PRIMARY KEY,
    Name VARCHAR(100),
    Registration_Date DATE,
    Address VARCHAR(100),
    Phone_number VARCHAR(15),
    Maximum_rent INT,
    Email VARCHAR(50),
    Accommodation_type VARCHAR(50),
    Staff_ID VARCHAR(50),
    Branch_ID VARCHAR(50),
    FOREIGN KEY (Staff_ID) REFERENCES STAFF(Staff_ID),
    FOREIGN KEY (Branch_ID) REFERENCES BRANCH_OFFICE(Branch_ID)
);
-- -- TABLE for LEASE
CREATE TABLE LEASE (
    Lease_ID VARCHAR(50) PRIMARY KEY,
    Deposit_paid INT,
    Payment_method VARCHAR(50),
    Monthly_rent INT,
    Duration INT,
    Start_date DATE,
    End_date DATE,
    Property_ID VARCHAR(50),
    Client_ID VARCHAR(50),
    FOREIGN KEY (Property_ID) REFERENCES PROPERTY(Property_ID),
    FOREIGN KEY (Client_ID) REFERENCES CLIENT(Client_ID)
);
-- TABLE for PROPERTY_ADVERTISEMENT
CREATE TABLE PROPERTY_ADVERTISEMENT (
    Property_ID VARCHAR(50),
    Property_type VARCHAR(50),
    Cost INT,
    Listing_Date DATE,
    FOREIGN KEY (Property_ID) REFERENCES PROPERTY(Property_ID)
);
-- -- TABLE for NEWSPAPER
CREATE TABLE NEWSPAPER (
    Paper_name VARCHAR(50) PRIMARY KEY,
    Property_ID VARCHAR(50),
    Address VARCHAR(100),
    Phone_number VARCHAR(15),
    Contact_name VARCHAR(50),
    FOREIGN KEY (Property_ID) REFERENCES PROPERTY(Property_ID)
);
-- -- TABLE for WEBSITE
CREATE TABLE WEBSITE (
    Domain_name VARCHAR(50) PRIMARY KEY,
    Property_type VARCHAR(50),
    Property_ID VARCHAR(50),
    FOREIGN KEY (Property_ID) REFERENCES PROPERTY(Property_ID)
);



-- -- INSERTING DATA IN THIS SECTION 


INSERT INTO BRANCH_OFFICE (Branch_ID, Manager_ID, Street, City, Postcode, Phone_number_1, Phone_number_2, Phone_number_3)
VALUES
('BR001', 'MG001', 'Independence Avenue', 'Accra', 'GA-123-1234', '+233 20 123 4567', '+233 20 123 4568', '+233 20 123 4569'),
('BR002', 'MG002', 'Asafo Market Road', 'Kumasi', 'AK-234-2345', '+233 24 234 5678', '+233 24 234 5679', '+233 20 123 4569'),
('BR003', 'MG003', 'Harper Road', 'Takoradi', 'WR-345-3456', '+233 27 345 6789', '+233 20 234 5678', '+233 20 234 5678'),
('BR004', 'MG004', 'Tamale Stadium Road', 'Tamale', 'NR-456-4567', '+233 26 456 7890', '+233 26 456 7891', '+233 20 123 4569'),
('BR005', 'MG005', 'Oxford Street', 'Accra', 'GA-234-2345', '+233 20 234 5678', '+233 20 234 5679', '+233 20 5680'),
('BR006', 'MG006', 'Bantama High Street', 'Kumasi', 'AK-345-3456', '+233 24 345 6789', '+233 20 123 4569', '+233 20 423 4569'),
('BR007', 'MG007', 'Beach Road', 'Cape Coast', 'CR-567-5678', '+233 27 567 8901', '+233 27 567 8902', '+233 20 323 4569'),
('BR008', 'MG008', 'Bolgatanga Road', 'Bolgatanga', 'UE-678-6789', '+233 26 678 9012', '+233 20 123 4569', '+233 24 123 4569'),
('BR009', 'MG009', 'Keta Road', 'Ho', 'VR-789-7890', '+233 20 789 0123', '+233 20 789 0124', '+233 20 123 4569'),
('BR010', 'MG010', 'Sunyani Main Road', 'Sunyani', 'BR-890-8901', '+233 24 890 1234', '+233 20 234 5678', '+233 20 123 4569');
-- Inserting data into MANAGER
INSERT INTO MANAGER (Manager_ID, Branch_ID, Start_date, Bonus) VALUES
('MG001', 'BR001', '2022-01-15', 5000),
('MG002', 'BR002', '2022-02-01', 4500),
('MG003', 'BR003', '2022-03-10', 4000),
('MG004', 'BR004', '2022-04-05', 4200),
('MG005', 'BR005', '2022-05-20', 4800),
('MG006', 'BR006', '2022-06-15', 4300),
('MG007', 'BR007', '2022-07-01', 4100),
('MG008', 'BR008', '2022-08-10', 3900),
('MG009', 'BR009', '2022-09-05', 4000),
('MG010', 'BR010', '2022-10-01', 4200);
-- Inserting data into SUPERVISOR
INSERT INTO SUPERVISOR (Supervisor_id, Date_assumed_position, Number_of_staff) VALUES
('SU001', '2022-01-20', 5),
('SU002', '2022-02-15', 4),
('SU003', '2022-03-25', 3),
('SU004', '2022-04-10', 2),
('SU005', '2022-05-10', 2),
('SU006', '2022-06-20', 1),
('SU007', '2022-07-05', 3),
('SU008', '2022-08-15', 4),
('SU009', '2022-09-01', 2),
('SU010', '2022-10-10', 5);
-- Inserting data into STAFF
INSERT INTO STAFF (Staff_ID, Name, Branch_ID, Address, Position, Salary, Supervisor_ID) VALUES
('ST001', 'John Doe', 'BR001', '123 Main St, Accra', 'Agent', 3000, 'SU001'),
('ST002', 'Jane Smith', 'BR002', '456 High St, Kumasi', 'Agent', 3200, 'SU002'),
('ST003', 'Alice Johnson', 'BR003', '789 King St, Takoradi', 'Agent', 3100, 'SU003'),
('ST004', 'Bob Brown', 'BR004', '101 Prince St, Tamale', 'Agent', 3050, 'SU004'),
('ST005', 'Eve Davis', 'BR005', '202 Queen St, Accra', 'Agent', 3000, 'SU005'),
('ST006', 'Charlie Wilson', 'BR006', '303 Duke St, Kumasi', 'Agent', 2950, 'SU006'),
('ST007', 'Grace Lee', 'BR007', '404 Earl St, Cape Coast', 'Agent', 3100, 'SU007'),
('ST008', 'Henry Miller', 'BR008', '505 Baron St, Bolgatanga', 'Agent', 2900, 'SU008'),
('ST009', 'Laura Taylor', 'BR009', '606 Knight St, Ho', 'Agent', 3000, 'SU009'),
('ST010', 'David Moore', 'BR010', '707 Squire St, Sunyani', 'Agent', 3150, 'SU010');
-- Inserting data into PROPERTY_OWNER 
INSERT INTO PROPERTY_OWNER (Owner_ID, Name, Owner_Type, Address, Phone_number, Email) VALUES
('PO001', 'Global Properties Ltd', 'Business', '123 Market St, Accra', '0 20 123 4567', 'info@globalproperties.com'),
('PO002', 'Green Estate', 'Business', '456 Industry Rd, Kumasi', '0 24 234 5678', 'contact@greenestate.com'),
('PO003', 'Blue Skies Ltd', 'Business', '789 Business Park, Takoradi', '0 27 345 6789', 'sales@blueskies.com'),
('PO004', 'Realty World', 'Business', '321 Commercial St, Accra', '0 30 456 7890', 'info@realtyworld.com'),
('PO005', 'Prime Real Estate', 'Business', '654 Corporate Blvd, Kumasi', '0 24 567 8901', 'prime@estate.com'),
('PO006', 'Pinnacle Properties', 'Business', '987 Trade Rd, Takoradi', '0 20 678 9012', 'info@pinnacle.com'),
('PO007', 'Apex Realty', 'Business', '147 Office St, Tamale', '0 27 789 0123', 'contact@apexrealty.com'),
('PO008', 'Elite Homes', 'Business', '258 Enterprise Ave, Sunyani', '0 24 890 1234', 'info@elitehomes.com'),
('PO009', 'Sunrise Properties', 'Business', '369 Development St, Cape Coast', '0 26 901 2345', 'contact@sunriseproperties.com'),
('PO010', 'Superior Realty', 'Business', '159 Commerce St, Bolgatanga', '0 30 012 3456', 'info@superiorrealty.com'),
('PO011', 'John Owusu', 'Private', '101 Home Rd, Accra', '0 20 456 7890', 'john.owusu@gmail.com'),
('PO012', 'Ama Asantewaa', 'Private', '202 Garden St, Kumasi', '0 24 567 8901', 'ama.asantewaa@yahoo.com'),
('PO013', 'Kofi Mensah', 'Private', '303 Family Ln, Takoradi', '0 20 678 9012', 'kofi.mensah@hotmail.com'),
('PO014', 'Akosua Mensimah', 'Private', '404 Peace St, Tamale', '0 24 789 0123', 'akosua.mensimah@gmail.com'),
('PO015', 'Kwame Nkrumah', 'Private', '505 Heritage Ave, Sunyani', '0 27 890 1234', 'kwame.nkrumah@yahoo.com'),
('PO016', 'Sarah Baah', 'Private', '606 Victory Rd, Cape Coast', '0 26 901 2345', 'sarah.baah@gmail.com'),
('PO017', 'Yaw Adjei', 'Private', '707 Liberty St, Ho', '0 30 012 3456', 'yaw.adjei@yahoo.com'),
('PO018', 'Esi Amponsah', 'Private', '808 Harmony Ave, Bolgatanga', '0 24 123 4567', 'esi.amponsah@gmail.com'),
('PO019', 'Kwaku Appiah', 'Private', '909 Prosperity St, Koforidua', '0 26 234 5678', 'kwaku.appiah@gmail.com'),
('PO020', 'Aba Asamoah', 'Private', '010 Abundance Rd, Wa', '0 20 345 6789', 'aba.asamoah@hotmail.com');
-- Inserting data into PROPERTY (10 Business, 10 Private)
INSERT INTO PROPERTY (Property_ID, Owner_ID, Address, Number_of_rooms, Monthly_Rent, Property_type, Branch_ID, Staff_ID) 
VALUES
('PR001', 'PO001', '123 Market St, Accra', 10, 2000, 'Commercial', 'BR001', 'ST001'),
('PR002', 'PO002', '456 Industry Rd, Kumasi', 15, 2500, 'Commercial', 'BR002', 'ST002'),
('PR003', 'PO003', '789 Business Park, Takoradi', 8, 1500, 'Commercial', 'BR003', 'ST003'),
('PR004', 'PO004', '321 Commercial St, Accra', 20, 3000, 'Commercial', 'BR001', 'ST004'),
('PR005', 'PO005', '654 Corporate Blvd, Kumasi', 12, 2200, 'Commercial', 'BR002', 'ST005'),
('PR006', 'PO006', '987 Trade Rd, Takoradi', 9, 1600, 'Commercial', 'BR003', 'ST006'),
('PR007', 'PO007', '147 Office St, Tamale', 7, 1400, 'Commercial', 'BR004', 'ST007'),
('PR008', 'PO008', '258 Enterprise Ave, Sunyani', 18, 2800, 'Commercial', 'BR005', 'ST008'),
('PR009', 'PO009', '369 Development St, Cape Coast', 11, 2100, 'Commercial', 'BR006', 'ST009'),
('PR010', 'PO010', '159 Commerce St, Bolgatanga', 14, 2400, 'Commercial', 'BR008', 'ST010'),
('PR011', 'PO011', '101 Home Rd, Accra', 3, 800, 'Residential', 'BR001', 'ST001'),
('PR012', 'PO012', '202 Garden St, Kumasi', 4, 1200, 'Residential', 'BR002', 'ST002'),
('PR013', 'PO013', '303 Family Ln, Takoradi', 5, 1300, 'Residential', 'BR003', 'ST003'),
('PR014', 'PO014', '404 Peace St, Tamale', 6, 1400, 'Residential', 'BR004', 'ST004'),
('PR015', 'PO015', '505 Heritage Ave, Sunyani', 3, 900, 'Residential', 'BR005', 'ST005'),
('PR016', 'PO016', '606 Victory Rd, Cape Coast', 4, 1100, 'Residential', 'BR006', 'ST006'),
('PR017', 'PO017', '707 Liberty St, Ho', 5, 1300, 'Residential', 'BR007', 'ST007'),
('PR018', 'PO018', '808 Harmony Ave, Bolgatanga', 6, 1400, 'Residential', 'BR008', 'ST008'),
('PR019', 'PO019', '909 Prosperity St, Koforidua', 3, 900, 'Residential', 'BR009', 'ST009'),
('PR020', 'PO020', '010 Abundance Rd, Wa', 4, 1200, 'Residential', 'BR010', 'ST010');
-- Inserting data into CLIENT 
INSERT INTO CLIENT (Client_ID, Name, Registration_Date, Address, Phone_number, Maximum_rent, Email, Accommodation_type, Staff_ID, Branch_ID) 
VALUES
('CL001', 'Michael Green', '2023-01-10', '15 Palm St, Accra', '0 20 789 0123', 1000, 'michael.green@gmail.com', 'Residential', 'ST001', 'BR001'),
('CL002', 'Sophia Brown', '2023-02-15', '30 Maple St, Kumasi', '0 24 890 1234', 1500, 'sophia.brown@yahoo.com', 'Residential', 'ST002', 'BR002'),
('CL003', 'Daniel White', '2023-03-20', '45 Oak St, Takoradi', '0 27 901 2345', 2000, 'daniel.white@blueskies.com', 'Commercial', 'ST003', 'BR003'),
('CL004', 'Linda Owusu', '2023-04-12', '60 Cedar St, Tamale', '0 24 012 3456', 1800, 'linda.owusu@gmail.com', 'Commercial', 'ST004', 'BR004'),
('CL005', 'Kwame Mensah', '2023-05-30', '75 Pine St, Sunyani', '0 20 123 4567', 1300, 'kwame.mensah@gmail.com', 'Residential', 'ST005', 'BR005'),
('CL006', 'Abena Baah', '2023-06-25', '90 Willow St, Cape Coast', '0 26 234 5678', 1700, 'abena.baah@yahoo.com', 'Residential', 'ST006', 'BR006'),
('CL007', 'Yaw Adjei', '2023-07-18', '105 Maple St, Ho', '0 27 345 6789', 1600, 'yaw.adjei@gmail.com', 'Residential', 'ST007', 'BR007'),
('CL008', 'Esi Amponsah', '2023-08-05', '120 Birch St, Bolgatanga', '0 30 456 7890', 1400, 'esi.amponsah@yahoo.com', 'Residential', 'ST008', 'BR008'),
('CL009', 'Yaw Agyemang', '2023-08-15', '135 Oak St, Koforidua', '0 24 567 8901', 2000, 'yaw.agyemang@gmail.com', 'Commercial', 'ST009', 'BR009'),
('CL010', 'Sarah Antwi', '2023-09-01', '150 Elm St, Wa', '0 26 678 9012', 1200, 'sarah.antwi@gmail.com', 'Residential', 'ST010', 'BR010');
-- Inserting data into LEASE 
INSERT INTO LEASE (Lease_ID, Deposit_paid, Payment_method, Monthly_rent, Duration, Start_date, End_date, Property_ID, Client_ID)
\VALUES
('LE001', 2000, 'Bank Transfer', 2000, 12, '2023-02-01', '2024-01-31', 'PR001', 'CL003'),
('LE002', 1200, 'Cash', 1200, 6, '2023-03-15', '2023-09-14', 'PR002', 'CL002'),
('LE003', 800, 'Mobile Money', 800, 6, '2023-04-01', '2023-09-30', 'PR011', 'CL001'),
('LE004', 1400, 'Bank Transfer', 1400, 12, '2023-05-01', '2024-04-30', 'PR004', 'CL004'),
('LE005', 1300, 'Cash', 1300, 6, '2023-06-01', '2023-11-30', 'PR005', 'CL005'),
('LE006', 1700, 'Mobile Money', 1700, 12, '2023-07-01', '2024-06-30', 'PR006', 'CL006'),
('LE007', 1600, 'Bank Transfer', 1600, 12, '2023-08-01', '2024-07-31', 'PR007', 'CL007'),
('LE008', 1400, 'Cash', 1400, 6, '2023-09-01', '2024-02-28', 'PR008', 'CL008'),
('LE009', 2000, 'Mobile Money', 2000, 12, '2023-10-01', '2024-09-30', 'PR009', 'CL009'),
('LE010', 1200, 'Bank Transfer', 1200, 6, '2023-11-01', '2024-04-30', 'PR010', 'CL010');
-- Inserting data into PROPERTY_ADVERTISEMENT 
INSERT INTO PROPERTY_ADVERTISEMENT (Property_ID, Property_type, Cost, Listing_Date)
VALUES
('PR001', 'Commercial', 500, '2023-01-15'),
('PR002', 'Commercial', 400, '2023-02-01'),
('PR003', 'Commercial', 450, '2023-02-20'),
('PR004', 'Commercial', 600, '2023-03-10'),
('PR005', 'Commercial', 550, '2023-03-25'),
('PR006', 'Residential', 300, '2023-04-05'),
('PR007', 'Residential', 350, '2023-04-20'),
('PR008', 'Residential', 400, '2023-05-15'),
('PR009', 'Residential', 450, '2023-06-10'),
('PR010', 'Residential', 500, '2023-07-05');
-- Inserting data into NEWSPAPER 
INSERT INTO NEWSPAPER (Paper_name, Property_ID, Address, Phone_number, Contact_name) VALUES
('Daily Graphic', 'PR001', '123 Press Rd, Accra', '0 30 123 4567', 'Paul Mensah'),
('Ghanaian Times', 'PR002', '456 Print St, Kumasi', '0 30 234 5678', 'Nana Akuffo'),
('Chronicle', 'PR003', '789 Media Ave, Takoradi', '0 30 345 6789', 'Yaw Amankwah'),
('Daily Guide', 'PR004', '321 Report St, Accra', '0 30 456 7890', 'Kofi Asamoah'),
('Business & Financial Times', 'PR005', '654 Financial Rd, Kumasi', '0 24 567 8901', 'Ama Agyemang'),
('Today Newspaper', 'PR006', '987 News Ave, Takoradi', '0 20 678 9012', 'Yaw Osei'),
('The Spectator', 'PR007', '147 Observer St, Tamale', '0 27 789 0123', 'Esi Owusu'),
('The Ghanaian Observer', 'PR008', '258 Tribune Ave, Sunyani', '0 24 890 1234', 'Kwame Mensah'),
('The Finder', 'PR009', '369 View St, Cape Coast', '0 26 901 2345', 'Abena Adjei'),
('The Herald', 'PR010', '159 Echo Rd, Bolgatanga', '0 30 012 3456', 'Yaw Aboagye');
-- Inserting data into WEBSITE (10 entries)
INSERT INTO WEBSITE (Domain_name, Property_type, Property_ID) VALUES
('www.realestateghana.com', 'Commercial', 'PR001'),
('www.propertyfinder.com', 'Commercial', 'PR002'),
('www.homesghana.com', 'Residential', 'PR003'),
('www.ghanaproperties.com', 'Commercial', 'PR004'),
('www.estateghana.com', 'Commercial', 'PR005'),
('www.residentialghana.com', 'Residential', 'PR006'),
('www.luxuryghana.com', 'Residential', 'PR007'),
('www.affordablehomesghana.com', 'Residential', 'PR008'),
('www.capecoastproperties.com', 'Commercial', 'PR009'),
('www.sunyanirealty.com', 'Residential', 'PR010');
-- Business Owners
INSERT INTO BUSINESS_OWNER (Owner_ID, Name, Business_Type, Contact) VALUES
('PO001', 'Global Properties Ltd', 'Real Estate', '0 20 123 4567'),
('PO002', 'Green Estate', 'Property Management', '0 24 234 5678'),
('PO003', 'Blue Skies Ltd', 'Commercial Leasing', '0 27 345 6789'),
('PO006', 'Sunrise Ventures', 'Commercial Leasing', '0 20 678 9012'),
('PO007', 'City Developments', 'Property Management', '0 24 901 2345'),
('PO008', 'WestEnd Holdings', 'Real Estate', '0 27 012 3456'),
('PO009', 'Urban Realty', 'Property Management', '0 20 234 5678'),
('PO010', 'Prime Properties', 'Commercial Leasing', '0 24 345 6789'),
('PO011', 'North Star Estates', 'Real Estate', '0 27 456 7890'),
('PO012', 'Capital Developments', 'Commercial Leasing', '0 20 567 8901');
-- Private Owners
INSERT INTO PRIVATE_OWNER (Owner_ID, Name, Property_Type, Contact) VALUES
('PO004', 'John Owusu', 'Residential', '0 20 456 7890'),
('PO005', 'Ama Asantewaa', 'Residential', '0 24 567 8901'),
('PO013', 'Kwame Mensah', 'Residential', '0 20 678 9012'),
('PO014', 'Abena Kyei', 'Residential', '0 24 789 0123'),
('PO015', 'Kofi Adjei', 'Residential', '0 27 890 1234'),
('PO016', 'Afia Owusu', 'Residential', '0 20 901 2345'),
('PO017', 'Yaw Boateng', 'Residential', '0 24 012 3456'),
('PO018', 'Esi Amankwah', 'Residential', '0 27 123 4567'),
('PO019', 'Kojo Nkrumah', 'Residential', '0 20 234 5678'),
('PO020', 'Ama Dankwa', 'Residential', '0 24 345 6789');


     -- -- i.	List the details of properties provided by business owners at a given branch.
    SELECT p.*
    FROM PROPERTY p
    JOIN PROPERTY_OWNER po ON p.Owner_ID = po.Owner_ID
    JOIN BUSINESS_OWNER bo ON po.Owner_ID = bo.Owner_ID
    WHERE p.Branch_ID = 'BR001'; 

-- ii.	List the details of leases due to expire next month at a given branch.
SELECT l.*
FROM LEASE l
JOIN PROPERTY p ON l.Property_ID = p.Property_ID
WHERE p.Branch_ID = 'BR006'
AND l.End_date BETWEEN CURDATE() AND LAST_DAY(DATE_ADD(CURDATE(), INTERVAL 1 MONTH));


-- iii.	Identify the total number of properties assigned to each member of staff at a given branch.

SELECT s.Staff_ID, s.Name, COUNT(p.Property_ID) AS Total_Properties
FROM STAFF s
LEFT JOIN PROPERTY p ON s.Staff_ID = p.Staff_ID
WHERE s.Branch_ID = 'BR001' 
GROUP BY s.Staff_ID, s.Name;


--  iv.	Identify the total number of branches in each city.
SELECT City, COUNT(Branch_ID) AS Total_Branches
FROM BRANCH_OFFICE
GROUP BY City;

-- v.	List the details of branches in a given city.
SELECT *
FROM BRANCH_OFFICE
WHERE City = 'Accra'; 



-- b)	Write five (5) distinct interactive SQL query that can be executed on the database created for the given case study. 


-- -- 1. Find all properties that are available for rent below a specified price at a given branch.
SELECT p.Property_ID, p.Address, p.Monthly_Rent, po.Name AS Owner_Name, p.Property_type
FROM PROPERTY p
JOIN PROPERTY_OWNER po ON p.Owner_ID = po.Owner_ID
WHERE p.Branch_ID = 'BR001' 
AND p.Monthly_Rent < 1500; 


-- --  2. Find the most expensive property listed by a private owner at a specific branch.
SELECT p.Property_ID, p.Address, p.Monthly_Rent, po.Name AS Owner_Name
FROM PROPERTY p
JOIN PROPERTY_OWNER po ON p.Owner_ID = po.Owner_ID
JOIN PRIVATE_OWNER pr ON po.Owner_ID = pr.Owner_ID
WHERE p.Branch_ID = 'BR001' 
ORDER BY p.Monthly_Rent DESC
LIMIT 1;


-- -- 3.  List clients who are looking for properties with more than a specified number of rooms.
SELECT c.Client_ID, c.Name, c.Maximum_rent, p.Property_ID, p.Address, p.Number_of_rooms
FROM CLIENT c
JOIN LEASE l ON c.Client_ID = l.Client_ID
JOIN PROPERTY p ON l.Property_ID = p.Property_ID
WHERE p.Number_of_rooms > 4; 


-- -- 4.  Find properties that have never been leased.
SELECT p.Property_ID, p.Address, p.Monthly_Rent, po.Name AS Owner_Name
FROM PROPERTY p
LEFT JOIN LEASE l ON p.Property_ID = l.Property_ID
JOIN PROPERTY_OWNER po ON p.Owner_ID = po.Owner_ID
WHERE l.Lease_ID IS NULL;


-- -- 5. List all clients who have registered after a specified date.
SELECT Client_ID, Name, Registration_Date, Address, Phone_number, Email
FROM CLIENT
WHERE Registration_Date > '2023-01-01'; 

SELECT * FROM MANAGER

SHOW TABLES FROM ELITE_KINGDOM_2

SHOW DATABASES;

USE ELITE_KINGDOM_2;

SELECT * FROM MANAGER ;


