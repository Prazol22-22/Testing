--incoming-das-scrub/traffk/20170224/Enervest/BCBSTX/

drop table if exists raw_tfk.raw_eligibility;

create table raw_tfk.raw_eligibility
(
rawdata varchar(max)
,sourcefilename varchar(200)
);

set query_group to 'copy_G';
copy raw_tfk.raw_eligibility(rawdata)
from 's3://incoming-das-scrub/traffk/20170224/Enervest/BCBSTX/dEnervestTraffkEligibility.txt' 
CREDENTIALS 'aws_access_key_id=AKIAITGBWJRTKONRK4XQ;aws_secret_access_key=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'
delimiter '~'
acceptinvchars
null as '\000';
reset query_group;

update raw_tfk.raw_eligibility
set sourcefilename = 'dEnervestTraffkEligibility.txt'
where sourcefilename is null;

drop table if exists raw_tfk.raw_eligibility_eneverest;
create table raw_tfk.raw_eligibility_eneverest(
Member_Key varchar(200),
Account_Number varchar(200),
Group_Number varchar(200),
Section_Number varchar(200),
Contract_Type varchar(200),
Product_Line varchar(200),
Product_Type varchar(200),
Subscriber_ID varchar(200),
Subscriber_SSN varchar(200),
Member_SSN varchar(200),
Member_Number varchar(200),
Claim_Member_ID varchar(200),
Member_DOB varchar(200),
Member_Gender varchar(200),
Member_Relationship_Code varchar(200),
Member_Status varchar(200),
Member_Medicare_Status_Code varchar(200),
Member_First_Name varchar(200),
Member_Last_Name varchar(200),
Member_Original_Effective_Date varchar(200),
Member_Phone varchar(200),
Member_Email varchar(200),
Subscriber_Address varchar(200),
Subscriber_City varchar(200),
Subscriber_State varchar(200),
Subscriber_Zip varchar(200),
Member_Effective_Date varchar(200),
Member_Cancel_Date varchar(200),
Benefit_Agreement varchar(200),
Characteristic_Code_1 varchar(200),
Characteristic_Description_1 varchar(200),
Characteristic_Code_2 varchar(200),
Characteristic_Description_2 varchar(200),
Characteristic_Code_3 varchar(200),
Characteristic_Description_3 varchar(200),
Characteristic_Code_4 varchar(200),
Characteristic_Description_4 varchar(200),
Characteristic_Code_5 varchar(200),
Characteristic_Description_5 varchar(200),
Characteristic_Code_6 varchar(200),
Characteristic_Description_6 varchar(200),
Filler varchar(200),
Filler1 varchar(200),
Filler2 varchar(200),
Filler3 varchar(200),
Filler4 varchar(200),
sourcefilename varchar(200)
);

insert into raw_tfk.raw_eligibility_eneverest(
Member_Key,
Account_Number,
Group_Number,
Section_Number,
Contract_Type,
Product_Line,
Product_Type,
Subscriber_ID,
Subscriber_SSN,
Member_SSN,
Member_Number,
Claim_Member_ID,
Member_DOB,
Member_Gender,
Member_Relationship_Code,
Member_Status,
Member_Medicare_Status_Code,
Member_First_Name,
Member_Last_Name,
Member_Original_Effective_Date,
Member_Phone,
Member_Email,
Subscriber_Address,
Subscriber_City,
Subscriber_State,
Subscriber_Zip,
Member_Effective_Date,
Member_Cancel_Date,
Benefit_Agreement,
Characteristic_Code_1,
Characteristic_Description_1,
Characteristic_Code_2,
Characteristic_Description_2,
Characteristic_Code_3,
Characteristic_Description_3,
Characteristic_Code_4,
Characteristic_Description_4,
Characteristic_Code_5,
Characteristic_Description_5,
Characteristic_Code_6,
Characteristic_Description_6,
Filler,
Filler1,
Filler2,
Filler3,
Filler4,
sourcefilename
)
select 
split_part(rawdata, '\t', 1) as Member_Key,
split_part(rawdata, '\t', 2) as Account_Number,
split_part(rawdata, '\t', 3) as Group_Number,
split_part(rawdata, '\t', 4) as Section_Number,
split_part(rawdata, '\t', 5) as Contract_Type,
split_part(rawdata, '\t', 6) as Product_Line,
split_part(rawdata, '\t', 7) as Product_Type,
split_part(rawdata, '\t', 8) as Subscriber_ID,
split_part(rawdata, '\t', 9) as Subscriber_SSN,
split_part(rawdata, '\t', 10) as Member_SSN,
split_part(rawdata, '\t', 11) as Member_Number,
split_part(rawdata, '\t', 12) as Claim_Member_ID,
split_part(rawdata, '\t', 13) as Member_DOB,
split_part(rawdata, '\t', 14) as Member_Gender,
split_part(rawdata, '\t', 15) as Member_Relationship_Code,
split_part(rawdata, '\t', 16) as Member_Status,
split_part(rawdata, '\t', 17) as Member_Medicare_Status_Code,
split_part(rawdata, '\t', 18) as Member_First_Name,
split_part(rawdata, '\t', 19) as Member_Last_Name,
split_part(rawdata, '\t', 20) as Member_Original_Effective_Date,
split_part(rawdata, '\t', 21) as Member_Phone,
split_part(rawdata, '\t', 22) as Member_Email,
split_part(rawdata, '\t', 23) as Subscriber_Address,
split_part(rawdata, '\t', 24) as Subscriber_City,
split_part(rawdata, '\t', 25) as Subscriber_State,
split_part(rawdata, '\t', 26) as Subscriber_Zip,
split_part(rawdata, '\t', 27) as Member_Effective_Date,
split_part(rawdata, '\t', 28) as Member_Cancel_Date,
split_part(rawdata, '\t', 29) as Benefit_Agreement,
split_part(rawdata, '\t', 30) as Characteristic_Code_1,
split_part(rawdata, '\t', 31) as Characteristic_Description_1,
split_part(rawdata, '\t', 32) as Characteristic_Code_2,
split_part(rawdata, '\t', 33) as Characteristic_Description_2,
split_part(rawdata, '\t', 34) as Characteristic_Code_3,
split_part(rawdata, '\t', 35) as Characteristic_Description_3,
split_part(rawdata, '\t', 36) as Characteristic_Code_4,
split_part(rawdata, '\t', 37) as Characteristic_Description_4,
split_part(rawdata, '\t', 38) as Characteristic_Code_5,
split_part(rawdata, '\t', 39) as Characteristic_Description_5,
split_part(rawdata, '\t', 40) as Characteristic_Code_6,
split_part(rawdata, '\t', 41) as Characteristic_Description_6,
split_part(rawdata, '\t', 42) as Filler,
split_part(rawdata, '\t', 43) as Filler1,
split_part(rawdata, '\t', 44) as Filler2,
split_part(rawdata, '\t', 45) as Filler3,
split_part(rawdata, '\t', 46) as Filler4,
sourcefilename
from raw_tfk.raw_eligibility;

select top 100 * from raw_tfk.raw_eligibility_eneverest;

select distinct account_number, group_number, section_number, product_type, benefit_agreement,product_line from raw_tfk.raw_eligibility_eneverest

select distinct account_number,'Enervest','BCBSTX','Blue Cross Blue Shield Texas','U','Unknown','U','Unknown',Subscriber_State,Subscriber_State,group_number||section_number,group_number||section_number,'U','Unknown'
from raw_tfk.raw_eligibility_eneverest