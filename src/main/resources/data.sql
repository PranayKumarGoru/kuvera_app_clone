
CREATE TABLE Users (
    user_id varchar(255) PRIMARY KEY,
    Password varchar(255),
    Name varchar(255),
    Email varchar(255),
    Phone varchar(255),	
    Address varchar(255)
);

INSERT INTO Users (user_id, Password, Name, Email, Phone, Address)  
   VALUES ('ram123', 'dummyP', 'Ram Charan', 'ram.cherry@relevel.com', '7777000055', 'Plot No 5/A, Pedemma Temple Lane, Madhapur, Hyderabad');
INSERT INTO Users (user_id, Password, Name, Email, Phone, Address)  
   VALUES ('prakhar.g', 'dummyP', 'Prakhar', 'prakhar.gupta@relevel.com', '8877459854', 'Plot No 5/A, Bagyalatha Colony, Hayatnagar, Hyderabad - 500032');

CREATE TABLE Categories (
    category varchar(255) primary key
);
INSERT INTO Categories (category) VALUES ('Ultra_Short_Funds');
INSERT INTO Categories (category) VALUES ('Gilt_Funds_Funds');
INSERT INTO Categories (category) VALUES ('Banking_and_PSU_Funds');
INSERT INTO Categories (category) VALUES ('Index_Funds');

CREATE TABLE Funds (
    fund_id INTEGER,
    as_of_date date,
    category varchar(255) references Categories(category),
    fund_name varchar(255),
    nav DECIMAL,
    aum varchar(255),
    ter DECIMAL,
    risk varchar(255),
    one_day_returns DECIMAL,
    one_year_returns DECIMAL,
    three_year_returns DECIMAL,
    PRIMARY KEY(fund_id,as_of_date,category)
);

INSERT INTO Funds (fund_id, as_of_date, category, fund_name, nav, aum,
ter, risk, one_day_returns, one_year_returns)
	VALUES (1, '2021-10-15', 'Index_Funds', 'Motilal Oswal Nifty Smallcap 250 Index', 21.8846,
	'221 Cr', 0.3,'Very High Risk', 0.63, 93.20);
	
INSERT INTO Funds (fund_id, as_of_date, category, fund_name, nav, aum, ter, risk, one_day_returns, 
one_year_returns, three_year_returns)
    VALUES (2, '2021-10-15', 'Index_Funds', 'DPS Equal Nifty 50', 16.3596,
	'128 Cr', 0.39, 'Very High Risk' ,0.54, 70.22, 20.93);
	
INSERT INTO Funds (fund_id, as_of_date, category, fund_name, nav, aum, ter, risk, one_day_returns, 
one_year_returns, three_year_returns)
    VALUES (3, '2021-10-15', 'Index_Funds', 'UTI Nifty Next 50 Index', 15.8585,
	'1330 Cr', 0.32,'Very High Risk', 0.28,58.83, 19.58);
	
INSERT INTO Funds (fund_id, as_of_date, category, fund_name, nav, aum, ter, risk, one_day_returns, one_year_returns, three_year_returns)
    VALUES (4, '2021-10-15', 'Ultra_Short_Funds', 'Nippon India UST', 3453.7484,
	'2872 Cr', 0.25, 'Moderate Risk', 0.63, 9.15, 5.70);
	
INSERT INTO Funds (fund_id, as_of_date, category, fund_name, nav, aum, ter, risk, one_day_returns, one_year_returns, three_year_returns)
    VALUES (5, '2021-10-15', 'Ultra_Short_Funds', 'UTI UST', 3581,
	'1933 Cr', 0.3,'Moderate Risk',0.28, 7, 5.85);


CREATE TABLE Cart (
    cart_id INTEGER AUTO_INCREMENT PRIMARY KEY,
    user_id varchar(255) references Users(user_id),
    fund_id varchar(255) references Funds(fund_id)
);

INSERT INTO Cart (user_id, fund_id)  
   VALUES ('prakhar.g', 1);
INSERT INTO Cart (user_id, fund_id)
   VALUES ('prakhar.g', 2);


CREATE TABLE PORTFOLIO (
   user_id varchar(255) references Users(user_id),
   fund_id varchar(255) references Funds(fund_id),
   as_of_date date,
   initial_lumsum DECIMAL,
   monthly_contribution DECIMAL,
   SIP_date varchar(255),
   invested DECIMAL,
   current_value DECIMAL,
   PRIMARY KEY(user_id,fund_id,as_of_date)
);
     
INSERT INTO PORTFOLIO (user_id, fund_id, as_of_date, initial_lumsum, monthly_contribution, SIP_date, invested, current_value)
   values ('prakhar.g', 1,'2021-10-15', 5000, 2000, '5th of every month', 10000, 15000);

INSERT INTO PORTFOLIO (user_id, fund_id, as_of_date, initial_lumsum, monthly_contribution, SIP_date, invested, current_value)
   values ('prakhar.g', 2,'2021-10-15', 5000, 2000, '7th of every month', 10000, 15000);

