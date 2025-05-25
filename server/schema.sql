-- Create the table first if it doesn't exist
CREATE TABLE IF NOT EXISTS land_records (
    ID INT PRIMARY KEY AUTO_INCREMENT,
    PARCEL_ID VARCHAR(255),
    PLOT_NUMBER VARCHAR(255),
    OWNER_NAME VARCHAR(255),
    AREA VARCHAR(255),
    LOCATION TEXT,
    REGISTERATION_DATE DATE
);

-- Insert 30 dummy records
INSERT INTO land_records (
    PARCEL_ID, PLOT_NUMBER, OWNER_NAME, AREA, LOCATION, REGISTERATION_DATE
) VALUES
('LPID001', 'P-101', 'Ravi Sharma', '1200 sq.ft', '123 Green Street, Delhi', '2020-01-15'),
('LPID002', 'P-102', 'Sita Devi', '1500 sq.ft', '456 Blue Street, Mumbai', '2019-06-10'),
('LPID003', 'P-103', 'Arjun Mehta', '900 sq.ft', '789 Yellow Road, Chennai', '2021-03-20'),
('LPID004', 'P-104', 'Pooja Patel', '1100 sq.ft', '321 Red Avenue, Kolkata', '2018-11-05'),
('LPID005', 'P-105', 'Amit Verma', '1000 sq.ft', '654 White Blvd, Hyderabad', '2022-02-28'),
('LPID006', 'P-106', 'Neha Gupta', '1800 sq.ft', '888 Sunset Blvd, Bangalore', '2021-08-14'),
('LPID007', 'P-107', 'Rahul Khanna', '950 sq.ft', '234 Sunrise Lane, Pune', '2019-12-01'),
('LPID008', 'P-108', 'Divya Singh', '1050 sq.ft', '543 Dreamland, Jaipur', '2020-07-22'),
('LPID009', 'P-109', 'Karan Yadav', '1350 sq.ft', '222 Harmony Rd, Lucknow', '2022-01-11'),
('LPID010', 'P-110', 'Priya Iyer', '1250 sq.ft', '777 Peace Park, Ahmedabad', '2020-04-09'),
('LPID011', 'P-111', 'Mohit Rathi', '1400 sq.ft', '1 Galaxy Apartments, Surat', '2021-05-18'),
('LPID012', 'P-112', 'Anjali Deshmukh', '1600 sq.ft', '98 Orchid Towers, Nagpur', '2019-09-23'),
('LPID013', 'P-113', 'Rohit Jain', '1300 sq.ft', '44 Skyline Heights, Bhopal', '2020-10-16'),
('LPID014', 'P-114', 'Sneha Kulkarni', '850 sq.ft', '19 Lakeview Road, Indore', '2021-11-07'),
('LPID015', 'P-115', 'Vikas Choudhary', '1450 sq.ft', '302 Palm Residency, Ranchi', '2022-03-05'),
('LPID016', 'P-116', 'Meera Nair', '1550 sq.ft', '77 Ocean View, Goa', '2020-12-13'),
('LPID017', 'P-117', 'Deepak Thakur', '1000 sq.ft', '188 Lotus Park, Patna', '2019-08-29'),
('LPID018', 'P-118', 'Tanvi Shah', '1700 sq.ft', '909 Coral Street, Chandigarh', '2022-04-22'),
('LPID019', 'P-119', 'Aditya Sinha', '950 sq.ft', '65 Garden Valley, Noida', '2018-06-30'),
('LPID020', 'P-120', 'Kritika Agarwal', '1050 sq.ft', '17 Heritage City, Ghaziabad', '2021-09-01'),
('LPID021', 'P-121', 'Harshit Saxena', '1150 sq.ft', '34 Rose Villa, Dehradun', '2020-05-12'),
('LPID022', 'P-122', 'Jaya Menon', '1250 sq.ft', '80 Silver Residency, Trivandrum', '2019-07-15'),
('LPID023', 'P-123', 'Sandeep Joshi', '1100 sq.ft', '102 Emerald Enclave, Kochi', '2021-01-30'),
('LPID024', 'P-124', 'Ishita Bansal', '1350 sq.ft', '29 Ruby Gardens, Visakhapatnam', '2018-10-25'),
('LPID025', 'P-125', 'Tushar Desai', '1450 sq.ft', '63 Platinum Circle, Mysore', '2022-05-17'),
('LPID026', 'P-126', 'Avni Mishra', '1200 sq.ft', '5 Maple Greens, Vadodara', '2020-03-19'),
('LPID027', 'P-127', 'Rohan Bhatia', '1000 sq.ft', '14 Sunset Hill, Udaipur', '2021-06-10'),
('LPID028', 'P-128', 'Shreya Kapoor', '1600 sq.ft', '3 Garden Estate, Jodhpur', '2019-01-02'),
('LPID029', 'P-129', 'Yuvraj Rana', '900 sq.ft', '61 Blue Lagoon, Amritsar', '2020-08-08'),
('LPID030', 'P-130', 'Nikita Reddy', '1400 sq.ft', '7 Royal Meadows, Vijayawada', '2021-10-04');
