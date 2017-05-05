
/* *********************** Import script of Traffk for RedShift ********************************* 
client name		:	Traffk
client id		:	
File Type		:	Pharmacy 
Layout			:	Fixed Length
Create date		:	
Create by		:	Vijay Bahadur Kshetri	
****************************************************** */

drop table if exists raw_tfk.rtemp_traffk_20161108_uhaul_webtransport_TM010114_fixed;
create table raw_tfk.rtemp_traffk_20161108_uhaul_webtransport_TM010114_fixed
(  
    rawdata varchar(max)  
);
set query_group to 'copy_G';
COPY raw_tfk.rtemp_traffk_20161108_uhaul_webtransport_TM010114_fixed 
FROM 
--S3 Location
's3://incoming-das-scrub/traffk/20161108/uhaul/webtransport.caremark.com/FILE.JNT594.UHAUTRA.DT123114.TM100114/FILE.JNT594.UHAUTRA.DT123114.TM100114.TXT'
credentials 'aws_access_key_id=***************;aws_secret_access_key=**************************' 
delimiter '^'
IGNOREBLANKLINES
ACCEPTINVCHARS;
reset query_group; --108387
--select top 100 * from raw_tfk.rtemp_tfk_rx_claims_20161108_TM010116_fixed
--select * from stl_load_errors where filename like '%CSFC_CM_RXCLM_20150922134043_2%'


 -------------------------------HEADERRRRRRR----------------------------------------------------------------------------
drop table if exists raw_tfk.rstag_traffk_20161108_uhaul_webtransport_TM010114_fixed_header;
create table raw_tfk.rstag_traffk_20161108_uhaul_webtransport_TM010114_fixed_header
(
     Record_Type varchar(200)
    ,Version_Release_Number varchar(200)
    ,Sending_Entity_Identifier varchar(200)
    ,Batch_Number varchar(200)
    ,Creation_Date varchar(200)
    ,Creation_Time varchar(200)
    ,Receiver_ID varchar(200)
    ,Reporting_Period_Start_Date varchar(200)
    ,Reporting_Period_End_Date varchar(200)
    ,File_Type varchar(200)
    ,Transmission_Action varchar(200)
    ,Submission_Number varchar(5000)
    ,Filler varchar(4000)
    ,source	varchar(255)
);

	insert into raw_tfk.rstag_traffk_20161108_uhaul_webtransport_TM010114_fixed_header  
	(  
		 Record_Type
		,Version_Release_Number
		,Sending_Entity_Identifier
		,Batch_Number
		,Creation_Date
		,Creation_Time
		,Receiver_ID
		,Reporting_Period_Start_Date
		,Reporting_Period_End_Date
		,File_Type
		,Transmission_Action
		,Submission_Number
		,Filler
		,source  
	)  
	select 
		 rtrim(ltrim(substring(rawdata,1,2))) as Record_Type
		,rtrim(ltrim(substring(rawdata,3,2))) as Version_Release_Number
		,rtrim(ltrim(substring(rawdata,5,24))) as Sending_Entity_Identifier
		,rtrim(ltrim(substring(rawdata,29,7))) as Batch_Number
		,rtrim(ltrim(substring(rawdata,36,8))) as Creation_Date
		,rtrim(ltrim(substring(rawdata,44,4))) as Creation_Time
		,rtrim(ltrim(substring(rawdata,48,24))) as Receiver_ID
		,rtrim(ltrim(substring(rawdata,72,8))) as Reporting_Period_Start_Date
		,rtrim(ltrim(substring(rawdata,80,8))) as Reporting_Period_End_Date
		,rtrim(ltrim(substring(rawdata,88,1))) as File_Type
		,rtrim(ltrim(substring(rawdata,89,1))) as Transmission_Action
		,rtrim(ltrim(substring(rawdata,90,2))) as Submission_Number
		,rtrim(ltrim(substring(rawdata,92,3909))) as Filler
		,'FILE.JNT594.UHAUTRA.DT123114.TM010114.TXT'
	from  
		raw_tfk.rtemp_traffk_20161108_uhaul_webtransport_TM010114_fixed 
	where  
		substring(rawdata,1,2) = 'PA'	;
		
		
-------------------------------DETAILSSSSSS-------------------------------------------------

drop table if exists raw_tfk.rstag_traffk_20161108_uhaul_webtransport_TM010114_fixed;
  
CREATE TABLE raw_tfk.rstag_traffk_20161108_uhaul_webtransport_TM010114_fixed
(
    Record_Type varchar(200)                                      ,
    Record_Indicator varchar(200)                                  ,
    Filler1 varchar(200)                                           ,
    Filler2 varchar(200)                                           ,
    Filler3 varchar(200)                                           ,
    Filler4 varchar(200)                                           ,
    Filler5 varchar(200)                                           ,
    Filler6 varchar(200)                                           ,
    Filler7 varchar(200)                                           ,
    Filler8 varchar(200)                                           ,
    Cardholder_ID varchar(200)                                     ,
    Last_Name varchar(200)                                         ,
    First_Name varchar(200)                                        ,
    Middle_Initial varchar(200)                                    ,
    Filler9 varchar(200)                                           ,
    Filler10 varchar(200)                                          ,
    Filler11 varchar(200)                                          ,
    Filler12 varchar(200)                                          ,
    Filler13 varchar(200)                                          ,
    Filler14 varchar(200)                                          ,
    Cardholder_Date_of_Birth varchar(200)                          ,
    Filler15 varchar(200)                                          ,
    Filler16 varchar(200)                                          ,
    Filler17 varchar(200)                                          ,
    Filler18 varchar(200)                                          ,
    Filler19 varchar(200)                                          ,
    Patient_Last_Name varchar(200)                                 ,
    Patient_First_Name varchar(200)                                ,
    Patient_Middle_Initial varchar(200)                            ,
    Filler20 varchar(200)                                          ,
    Filler21 varchar(200)                                          ,
    Filler22 varchar(200)                                          ,
    Filler23 varchar(200)                                          ,
    Filler24 varchar(200)                                          ,
    Filler25 varchar(200)                                          ,
    Patient_Date_of_Birth varchar(200)                             ,
    Patient_Gender_Code varchar(200)                               ,
    Eligibililty_Patient_Relationship_Code varchar(200)            ,
    Patient_Age varchar(200)                                       ,
    Filler26 varchar(200)                                          ,
    Filler27 varchar(200)                                          ,
    Filler28 varchar(200)                                          ,
    Filler29 varchar(200)                                          ,
    Group_ID varchar(200)                                          ,
    Carrier_Number varchar(200)                                    ,
    Policy_Number varchar(200)                                     ,
    Billing_Account_Number varchar(200)                            ,
    Filler30 varchar(200)                                          ,
    Filler31 varchar(200)                                          ,
    Filler32 varchar(200)                                          ,
    Filler33 varchar(200)                                          ,
    Filler34 varchar(200)                                          ,
    Copay_Modifier_ID varchar(200)                                 ,
    Filler35 varchar(200)                                          ,
    Filler36 varchar(200)                                          ,
    Other_Coverage_Code varchar(200)                               ,
    Filler37 varchar(200)                                          ,
    Filler38 varchar(200)                                          ,
    Service_Provider_ID_Qualifier varchar(200)                     ,
    Service_Provider_ID varchar(200)                               ,
    Filler39 varchar(200)                                          ,
    Filler40 varchar(200)                                          ,
    Filler41 varchar(200)                                          ,
    Pharmacy_Name varchar(200)                                     ,
    Pharmacy_Address_Line_1 varchar(200)                           ,
    Pharmacy_Address_Line_2 varchar(200)                           ,
    City varchar(200)                                              ,
    State varchar(200)                                             ,
    Zip varchar(200)                                               ,
    Filler42 varchar(200)                                          ,
    Pharmacy_Telephone_Number varchar(200)                         ,
    Pharmacy_Dispenser_Type varchar(200)                           ,
    Filler43 varchar(200)                                          ,
    Filler44 varchar(200)                                          ,
    Network_Reimbursement_ID varchar(200)                          ,
    Prescriber_ID_Qualifier varchar(200)                           ,
    Prescriber_ID varchar(200)                                     ,
    Filler45 varchar(200)                                          ,
    Filler46 varchar(200)                                          ,
    Filler47 varchar(200)                                          ,
    Filler48 varchar(200)                                          ,
    Filler49 varchar(200)                                          ,
    Prescriber_Last_Name varchar(200)                              ,
    Prescriber_First_Name varchar(200)                             ,
    Filler50 varchar(200)                                          ,
    Filler51 varchar(200)                                          ,
    Filler52 varchar(200)                                          ,
    Filler53 varchar(200)                                          ,
    Filler54 varchar(200)                                          ,
    Filler55 varchar(200)                                          ,
    Record_Status_Code varchar(200)                                ,
    Claim_Media_Type varchar(200)                                  ,
    Processor_Payment_Clarification_Code varchar(200)              ,
    Prescription_Service_Reference_Number_Qualifier varchar(200)   ,
    PrescriberService_Reference_Number_Rx_Number varchar(200)      ,
    ProductService_ID_Qualifier varchar(200)                       ,
    ProductService_ID varchar(200)                                 ,
    Date_of_Service varchar(200)                                   ,
    Adjudication_Date varchar(200)                                 ,
    Filler56 varchar(200)                                          ,
    Filler57 varchar(200)                                          ,
    Filler58 varchar(200)                                          ,
    Billing_Cycle_End_Date varchar(200)                            ,
    Filler59 varchar(200)                                          ,
    Filler60 varchar(200)                                          ,
    Filler61 varchar(200)                                          ,
    Filler62 varchar(200)                                          ,
    Filler63 varchar(200)                                          ,
    Filler64 varchar(200)                                          ,
    Filler65 varchar(200)                                          ,
    Filler66 varchar(200)                                          ,
    Filler67 varchar(200)                                          ,
    Filler68 varchar(200)                                          ,
    Filler69 varchar(200)                                          ,
    Quantity_Dispensed varchar(200)                                ,
    Fill_Number varchar(200)                                       ,
    Days_Supply varchar(200)                                       ,
    Date_Prescription_Written varchar(200)                         ,
    Dispense_as_Written_Product_Selection_Code varchar(200)        ,
    Number_of_Refills_Authorized varchar(200)                      ,
    Filler70 varchar(200)                                          ,
    Unit_of_Measure varchar(200)                                   ,
    Filler71 varchar(200)                                          ,
    Filler72 varchar(200)                                          ,
    Original_Quantity varchar(200)                                 ,
    Filler73 varchar(200)                                          ,
    Original_Day_Supply varchar(200)                               ,
    Filler74 varchar(200)                                          ,
    Compound_Code varchar(200)                                     ,
    Filler75 varchar(200)                                          ,
    Filler76 varchar(200)                                          ,
    Filler77 varchar(200)                                          ,
    Filler78 varchar(200)                                          ,
    Filler79 varchar(200)                                          ,
    Filler80 varchar(200)                                          ,
    Filler81 varchar(200)                                          ,
    Filler82 varchar(200)                                          ,
    Filler83 varchar(200)                                          ,
    Filler84 varchar(200)                                          ,
    Filler85 varchar(200)                                          ,
    Filler86 varchar(200)                                          ,
    Filler87 varchar(200)                                          ,
    Filler88 varchar(200)                                          ,
    Filler89 varchar(200)                                          ,
    Filler90 varchar(200)                                          ,
    Filler91 varchar(200)                                          ,
    Filler92 varchar(200)                                          ,
    Filler93 varchar(200)                                          ,
    Filler94 varchar(200)                                          ,
    Filler95 varchar(200)                                          ,
    Filler96 varchar(200)                                          ,
    Filler97 varchar(200)                                          ,
    Filler98 varchar(200)                                          ,
    Filler99 varchar(200)                                          ,
    Filler100 varchar(200)                                         ,
    Filler101 varchar(200)                                         ,
    Filler102 varchar(200)                                         ,
    Filler103 varchar(200)                                         ,
    Filler104 varchar(200)                                         ,
    Filler105 varchar(200)                                         ,
    Filler106 varchar(200)                                         ,
    Filler107 varchar(200)                                         ,
    Filler108 varchar(200)                                         ,
    Filler109 varchar(200)                                         ,
    Filler110 varchar(200)                                         ,
    Filler111 varchar(200)                                         ,
    Filler112 varchar(200)                                         ,
    Filler113 varchar(200)                                         ,
    Filler114 varchar(200)                                         ,
    Filler115 varchar(200)                                         ,
    Filler116 varchar(200)                                         ,
    Filler117 varchar(200)                                         ,
    Filler118 varchar(200)                                         ,
    Filler119 varchar(200)                                         ,
    Filler120 varchar(200)                                         ,
    Filler121 varchar(200)                                         ,
    Filler122 varchar(200)                                         ,
    Filler123 varchar(200)                                         ,
    Filler124 varchar(200)                                         ,
    Reject_Code_1 varchar(200)                                     ,
    Reject_Code_2 varchar(200)                                     ,
    Reject_Code_3 varchar(200)                                     ,
    Filler125 varchar(200)                                         ,
    Filler126 varchar(200)                                         ,
    Filler127 varchar(200)                                         ,
    Filler128 varchar(200)                                         ,
    Database_Indicator varchar(200)                                ,
    ProductService_Name varchar(200)                               ,
    Generic_Name varchar(200)                                      ,
    Product_Strength varchar(200)                                  ,
    Dosage_Form_Code varchar(200)                                  ,
    Filler129 varchar(200)                                         ,
    Filler130 varchar(200)                                         ,
    Drug_Type varchar(200)                                         ,
    Maintenance_Drug_Indicator varchar(200)                        ,
    Drug_Category_Code varchar(200)                                ,
    Filler131 varchar(200)                                         ,
    Filler132 varchar(200)                                         ,
    Submission_Clarification_Code varchar(200)                     ,
    Filler133 varchar(200)                                         ,
    Filler134 varchar(200)                                         ,
    Filler135 varchar(200)                                         ,
    GCN_Number varchar(200)                                        ,
    Universal_System_Classification varchar(200)                   ,
    Generic_Product_Identifier varchar(200)                        ,
    Filler136 varchar(200)                                         ,
    Filler137 varchar(200)                                         ,
    Filler138 varchar(200)                                         ,
    Filler139 varchar(200)                                         ,
    Filler140 varchar(200)                                         ,
    Therapeutic_Class_Code_AHFS varchar(200)                       ,
    Formulary_Status varchar(200)                                  ,
    Filler141 varchar(200)                                         ,
    Filler142 varchar(200)                                         ,
    Filler143 varchar(200)                                         ,
    Filler144 varchar(200)                                         ,
    Ingredient_Cost_Paid varchar(200)                              ,
    Dispensing_Fee_Paid varchar(200)                               ,
    Total_Amount_Paid_by_all_Sources varchar(200)                  ,
    Amount_Attributed_To_Sales_Tax varchar(200)                    ,
    Patient_Pay_Amount varchar(200)                                ,
    Amount_of_Copay varchar(200)                                   ,
    Amount_of_Coinsurance varchar(200)                             ,
    Amount_Attributed_To_Product_Selection varchar(200)            ,
    Amount_Applied_to_Periodic_Deductible varchar(200)             ,
    Filler145 varchar(200)                                         ,
    MAC_Reduced_Indicator varchar(200)                             ,
    Client_Pricing_Basis_of_Cost varchar(200)                      ,
    Generic_Indicator varchar(200)                                 ,
    Out_of_Pocket_Apply_Amount varchar(200)                        ,
    Filler146 varchar(200)                                         ,
    Filler147 varchar(200)                                         ,
    AWPPAWP_Indicator varchar(200)                                 ,
    Average_Wholesale_Unit_Price varchar(200)                      ,
    Filler148 varchar(200)                                         ,
    Filler149 varchar(200)                                         ,
    Filler150 varchar(200)                                         ,
    Ingredient_Cost_Submitted varchar(200)                         ,
    Usual_And_Customary_Charge varchar(200)                        ,
    Flat_Sales_Tax_Amount_Paid varchar(200)                        ,
    Percentage_Sales_Tax_Amount_Paid varchar(200)                  ,
    Filler151 varchar(200)                                         ,
    Filler152 varchar(200)                                         ,
    Filler153 varchar(200)                                         ,
    Filler154 varchar(200)                                         ,
    Filler155 varchar(200)                                         ,
    Mail_Incentive_Fee varchar(200)                                ,
    Filler156 varchar(200)                                         ,
    Filler157 varchar(200)                                         ,
    Filler158 varchar(200)                                         ,
    Filler159 varchar(200)                                         ,
    Filler160 varchar(200)                                         ,
    Filler161 varchar(200)                                         ,
    Filler162 varchar(200)                                         ,
    Filler163 varchar(200)                                         ,
    Filler164 varchar(200)                                         ,
    Net_Amount_Due_Total_Amount_BilledPaid varchar(200)            ,
    Basis_of_Reimbursement_Determination varchar(200)              ,
    Accumulated_Deductible_Amount varchar(200)                     ,
    Filler165 varchar(200)                                         ,
    Filler166 varchar(200)                                         ,
    Filler167 varchar(200)                                         ,
    Filler168 varchar(200)                                         ,
    Filler169 varchar(200)                                         ,
    Filler170 varchar(200)                                         ,
    Amount_Exceeding_Periodic_Benefit_Maximum varchar(200)         ,
    Filler171 varchar(200)                                         ,
    Basis_of_Calculation_Copay varchar(200)                        ,
    Filler172 varchar(200)                                         ,
    Filler173 varchar(200)                                         ,
    Filler174 varchar(200)                                         ,
    Filler175 varchar(200)                                         ,
    Filler176 varchar(200)                                         ,
    Filler177 varchar(200)                                         ,
    Filler178 varchar(200)                                         ,
    Filler179 varchar(200)                                         ,
    Filler180 varchar(200)                                         ,
    Filler181 varchar(200)                                         ,
    Filler182 varchar(200)                                         ,
    Filler183 varchar(200)                                         ,
    Invoiced_Amount_PAFF_Amount varchar(200)                       ,
    Filler184 varchar(200)                                         ,
    Filler185 varchar(200)                                         ,
    Filler186 varchar(200)                                         ,
    Processor_Defined_Prior_Authorization_Reason_Code varchar(200) ,
    Adjustment_Reason_Code varchar(200)                            ,
    Adjustment_Type varchar(200)                                   ,
    Transaction_ID_Cross_Reference varchar(200)                    ,
    Filler187 varchar(200)                                         ,
    Eligibility_COB_Indicator varchar(200)                         ,
    Filler188 varchar(200)                                         ,
    Filler189 varchar(200)                                         ,
    Filler190 varchar(200)                                         ,
    COB_Primary_Payer_Amount_Paid varchar(200)                     ,
    OPAR varchar(200)                                              ,
    Filler191 varchar(200)                                         ,
    COB_Primary_Payer_Copay varchar(200)                           ,
    Filler192 varchar(200)                                         ,
    Filler193 varchar(200)                                         ,
    Filler194 varchar(200)                                         ,
    Filler195 varchar(200)                                         ,
    Filler196 varchar(200)                                         ,
    Filler197 varchar(200)                                         ,
    Transaction_ID varchar(200)                                    ,
    Filler198 varchar(200)                                         ,
    General_Purpose_1 varchar(200)                                 ,
    General_Purpose_2 varchar(200)                                 ,
    General_Purpose_3_Group_Extension_Code varchar(200)            ,
    General_Purpose_4 varchar(200)                                 ,
    Account_ID varchar(200)                                        ,
    Care_Facility varchar(200)                                     ,
    Specialty_RX_Claim varchar(200)                                ,
    PharmacyMedical_Indicator varchar(200)                         ,
    Billing_Reporting_Code varchar(200)                            ,
    Alternate_ID varchar(200)                                      ,
    Healthcare_Savings_Account_Exclusion_Flag varchar(200)         ,
    Deductible_Exclusion_Flag varchar(200)                         ,
    Stop_Loss_Exclusion_Flag varchar(200)                          ,
    Maximum_Benefit_Exclusion_Flag varchar(200)                    ,
    Lifetime_Maximum_Benefit_Exclusion_Flag varchar(200)           ,
    Processor_Defined_Data varchar(200)                            ,
    Plan_Code_and_Extension varchar(200)                           ,
    Vaccine_Administration_Fee_Paid varchar(200)                   ,
    Drug_Admin_Fee_Type_Code varchar(200)                          ,
    Maintenance_Choice_Indicator varchar(200)                      ,
    Filler199 varchar(200)                                         ,
    Filler200 varchar(4000)                                        ,
	source varchar(255)                                            ,
	Import_Date varchar(200)                                       
);


INSERT INTO raw_tfk.rstag_traffk_20161108_uhaul_webtransport_TM010114_fixed
 (
     Record_Type
    ,Record_Indicator
    ,Filler1
    ,Filler2
    ,Filler3
    ,Filler4
    ,Filler5
    ,Filler6
    ,Filler7
    ,Filler8
    ,Cardholder_ID
    ,Last_Name
    ,First_Name
    ,Middle_Initial
    ,Filler9
    ,Filler10
    ,Filler11
    ,Filler12
    ,Filler13
    ,Filler14
    ,Cardholder_Date_of_Birth
    ,Filler15
    ,Filler16
    ,Filler17
    ,Filler18
    ,Filler19
    ,Patient_Last_Name
    ,Patient_First_Name
    ,Patient_Middle_Initial
    ,Filler20
    ,Filler21
    ,Filler22
    ,Filler23
    ,Filler24
    ,Filler25
    ,Patient_Date_of_Birth
    ,Patient_Gender_Code
    ,Eligibililty_Patient_Relationship_Code
    ,Patient_Age
    ,Filler26
    ,Filler27
    ,Filler28
    ,Filler29
    ,Group_ID
    ,Carrier_Number
    ,Policy_Number
    ,Billing_Account_Number
    ,Filler30
    ,Filler31
    ,Filler32
    ,Filler33
    ,Filler34
    ,Copay_Modifier_ID
    ,Filler35
    ,Filler36
    ,Other_Coverage_Code
    ,Filler37
    ,Filler38
    ,Service_Provider_ID_Qualifier
    ,Service_Provider_ID
    ,Filler39
    ,Filler40
    ,Filler41
    ,Pharmacy_Name
    ,Pharmacy_Address_Line_1
    ,Pharmacy_Address_Line_2
    ,City
    ,State
    ,Zip
    ,Filler42
    ,Pharmacy_Telephone_Number
    ,Pharmacy_Dispenser_Type
    ,Filler43
    ,Filler44
    ,Network_Reimbursement_ID
    ,Prescriber_ID_Qualifier
    ,Prescriber_ID
    ,Filler45
    ,Filler46
    ,Filler47
    ,Filler48
    ,Filler49
    ,Prescriber_Last_Name
    ,Prescriber_First_Name
    ,Filler50
    ,Filler51
    ,Filler52
    ,Filler53
    ,Filler54
    ,Filler55
    ,Record_Status_Code
    ,Claim_Media_Type
    ,Processor_Payment_Clarification_Code
    ,Prescription_Service_Reference_Number_Qualifier
    ,PrescriberService_Reference_Number_Rx_Number
    ,ProductService_ID_Qualifier
    ,ProductService_ID
    ,Date_of_Service
    ,Adjudication_Date
    ,Filler56
    ,Filler57
    ,Filler58
    ,Billing_Cycle_End_Date
    ,Filler59
    ,Filler60
    ,Filler61
    ,Filler62
    ,Filler63
    ,Filler64
    ,Filler65
    ,Filler66
    ,Filler67
    ,Filler68
    ,Filler69
    ,Quantity_Dispensed
    ,Fill_Number
    ,Days_Supply
    ,Date_Prescription_Written
    ,Dispense_as_Written_Product_Selection_Code
    ,Number_of_Refills_Authorized
    ,Filler70
    ,Unit_of_Measure
    ,Filler71
    ,Filler72
    ,Original_Quantity
    ,Filler73
    ,Original_Day_Supply
    ,Filler74
    ,Compound_Code
    ,Filler75
    ,Filler76
    ,Filler77
    ,Filler78
    ,Filler79
    ,Filler80
    ,Filler81
    ,Filler82
    ,Filler83
    ,Filler84
    ,Filler85
    ,Filler86
    ,Filler87
    ,Filler88
    ,Filler89
    ,Filler90
    ,Filler91
    ,Filler92
    ,Filler93
    ,Filler94
    ,Filler95
    ,Filler96
    ,Filler97
    ,Filler98
    ,Filler99
    ,Filler100
    ,Filler101
    ,Filler102
    ,Filler103
    ,Filler104
    ,Filler105
    ,Filler106
    ,Filler107
    ,Filler108
    ,Filler109
    ,Filler110
    ,Filler111
    ,Filler112
    ,Filler113
    ,Filler114
    ,Filler115
    ,Filler116
    ,Filler117
    ,Filler118
    ,Filler119
    ,Filler120
    ,Filler121
    ,Filler122
    ,Filler123
    ,Filler124
    ,Reject_Code_1
    ,Reject_Code_2
    ,Reject_Code_3
    ,Filler125
    ,Filler126
    ,Filler127
    ,Filler128
    ,Database_Indicator
    ,ProductService_Name
    ,Generic_Name
    ,Product_Strength
    ,Dosage_Form_Code
    ,Filler129
    ,Filler130
    ,Drug_Type
    ,Maintenance_Drug_Indicator
    ,Drug_Category_Code
    ,Filler131
    ,Filler132
    ,Submission_Clarification_Code
    ,Filler133
    ,Filler134
    ,Filler135
    ,GCN_Number
    ,Universal_System_Classification
    ,Generic_Product_Identifier
    ,Filler136
    ,Filler137
    ,Filler138
    ,Filler139
    ,Filler140
    ,Therapeutic_Class_Code_AHFS
    ,Formulary_Status
    ,Filler141
    ,Filler142
    ,Filler143
    ,Filler144
    ,Ingredient_Cost_Paid
    ,Dispensing_Fee_Paid
    ,Total_Amount_Paid_by_all_Sources
    ,Amount_Attributed_To_Sales_Tax
    ,Patient_Pay_Amount
    ,Amount_of_Copay
    ,Amount_of_Coinsurance
    ,Amount_Attributed_To_Product_Selection
    ,Amount_Applied_to_Periodic_Deductible
    ,Filler145
    ,MAC_Reduced_Indicator
    ,Client_Pricing_Basis_of_Cost
    ,Generic_Indicator
    ,Out_of_Pocket_Apply_Amount
    ,Filler146
    ,Filler147
    ,AWPPAWP_Indicator
    ,Average_Wholesale_Unit_Price
    ,Filler148
    ,Filler149
    ,Filler150
    ,Ingredient_Cost_Submitted
    ,Usual_And_Customary_Charge
    ,Flat_Sales_Tax_Amount_Paid
    ,Percentage_Sales_Tax_Amount_Paid
    ,Filler151
    ,Filler152
    ,Filler153
    ,Filler154
    ,Filler155
    ,Mail_Incentive_Fee
    ,Filler156
    ,Filler157
    ,Filler158
    ,Filler159
    ,Filler160
    ,Filler161
    ,Filler162
    ,Filler163
    ,Filler164
    ,Net_Amount_Due_Total_Amount_BilledPaid
    ,Basis_of_Reimbursement_Determination
    ,Accumulated_Deductible_Amount
    ,Filler165
    ,Filler166
    ,Filler167
    ,Filler168
    ,Filler169
    ,Filler170
    ,Amount_Exceeding_Periodic_Benefit_Maximum
    ,Filler171
    ,Basis_of_Calculation_Copay
    ,Filler172
    ,Filler173
    ,Filler174
    ,Filler175
    ,Filler176
    ,Filler177
    ,Filler178
    ,Filler179
    ,Filler180
    ,Filler181
    ,Filler182
    ,Filler183
    ,Invoiced_Amount_PAFF_Amount
    ,Filler184
    ,Filler185
    ,Filler186
    ,Processor_Defined_Prior_Authorization_Reason_Code
    ,Adjustment_Reason_Code
    ,Adjustment_Type
    ,Transaction_ID_Cross_Reference
    ,Filler187
    ,Eligibility_COB_Indicator
    ,Filler188
    ,Filler189
    ,Filler190
    ,COB_Primary_Payer_Amount_Paid
    ,OPAR
    ,Filler191
    ,COB_Primary_Payer_Copay
    ,Filler192
    ,Filler193
    ,Filler194
    ,Filler195
    ,Filler196
    ,Filler197
    ,Transaction_ID
    ,Filler198
    ,General_Purpose_1
    ,General_Purpose_2
    ,General_Purpose_3_Group_Extension_Code
    ,General_Purpose_4
    ,Account_ID
    ,Care_Facility
    ,Specialty_RX_Claim
    ,PharmacyMedical_Indicator
    ,Billing_Reporting_Code
    ,Alternate_ID
    ,Healthcare_Savings_Account_Exclusion_Flag
    ,Deductible_Exclusion_Flag
    ,Stop_Loss_Exclusion_Flag
    ,Maximum_Benefit_Exclusion_Flag
    ,Lifetime_Maximum_Benefit_Exclusion_Flag
    ,Processor_Defined_Data
    ,Plan_Code_and_Extension
    ,Vaccine_Administration_Fee_Paid
    ,Drug_Admin_Fee_Type_Code
    ,Maintenance_Choice_Indicator
    ,Filler199
    ,Filler200
	,Source
	,Import_Date
 )
select 
 rtrim(ltrim(substring(rawdata,1,2))) as Record_Type
		,rtrim(ltrim(substring(rawdata,3,1))) as Record_Indicator
		,rtrim(ltrim(substring(rawdata,4,3))) as Filler1
		,rtrim(ltrim(substring(rawdata,7,10))) as Filler2
		,rtrim(ltrim(substring(rawdata,17,10))) as Filler3
		,rtrim(ltrim(substring(rawdata,27,15))) as Filler4
		,rtrim(ltrim(substring(rawdata,42,6))) as Filler5
		,rtrim(ltrim(substring(rawdata,48,20))) as Filler6
		,rtrim(ltrim(substring(rawdata,68,20))) as Filler7
		,rtrim(ltrim(substring(rawdata,88,200))) as Filler8
		,rtrim(ltrim(substring(rawdata,288,20))) as Cardholder_ID
		,rtrim(ltrim(substring(rawdata,308,35))) as Last_Name
		,rtrim(ltrim(substring(rawdata,343,25))) as First_Name
		,rtrim(ltrim(substring(rawdata,368,1))) as Middle_Initial
		,rtrim(ltrim(substring(rawdata,369,10))) as Filler9
		,rtrim(ltrim(substring(rawdata,379,55))) as Filler10
		,rtrim(ltrim(substring(rawdata,434,55))) as Filler11
		,rtrim(ltrim(substring(rawdata,489,30))) as Filler12
		,rtrim(ltrim(substring(rawdata,519,2))) as Filler13
		,rtrim(ltrim(substring(rawdata,521,15))) as Filler14
		,rtrim(ltrim(substring(rawdata,536,8))) as Cardholder_Date_of_Birth
		,rtrim(ltrim(substring(rawdata,544,1))) as Filler15
		,rtrim(ltrim(substring(rawdata,545,1))) as Filler16
		,rtrim(ltrim(substring(rawdata,546,1))) as Filler17
		,rtrim(ltrim(substring(rawdata,547,2))) as Filler18
		,rtrim(ltrim(substring(rawdata,549,20))) as Filler19
		,rtrim(ltrim(substring(rawdata,569,35))) as Patient_Last_Name
		,rtrim(ltrim(substring(rawdata,604,25))) as Patient_First_Name
		,rtrim(ltrim(substring(rawdata,629,1))) as Patient_Middle_Initial
		,rtrim(ltrim(substring(rawdata,630,10))) as Filler20
		,rtrim(ltrim(substring(rawdata,640,55))) as Filler21
		,rtrim(ltrim(substring(rawdata,695,55))) as Filler22
		,rtrim(ltrim(substring(rawdata,750,30))) as Filler23
		,rtrim(ltrim(substring(rawdata,780,2))) as Filler24
		,rtrim(ltrim(substring(rawdata,782,15))) as Filler25
		,rtrim(ltrim(substring(rawdata,797,8))) as Patient_Date_of_Birth
		,rtrim(ltrim(substring(rawdata,805,1))) as Patient_Gender_Code
		,rtrim(ltrim(substring(rawdata,806,2))) as Eligibililty_Patient_Relationship_Code
		,rtrim(ltrim(substring(rawdata,808,3))) as Patient_Age
		,rtrim(ltrim(substring(rawdata,811,3))) as Filler26
		,rtrim(ltrim(substring(rawdata,814,1))) as Filler27
		,rtrim(ltrim(substring(rawdata,815,1))) as Filler28
		,rtrim(ltrim(substring(rawdata,816,10))) as Filler29
		,rtrim(ltrim(substring(rawdata,826,15))) as Group_ID
		,rtrim(ltrim(substring(rawdata,841,9))) as Carrier_Number
		,rtrim(ltrim(substring(rawdata,850,15))) as Policy_Number
		,rtrim(ltrim(substring(rawdata,865,8))) as Billing_Account_Number
		,rtrim(ltrim(substring(rawdata,873,1))) as Filler30
		,rtrim(ltrim(substring(rawdata,874,1))) as Filler31
		,rtrim(ltrim(substring(rawdata,875,1))) as Filler32
		,rtrim(ltrim(substring(rawdata,876,1))) as Filler33
		,rtrim(ltrim(substring(rawdata,877,1))) as Filler34
		,rtrim(ltrim(substring(rawdata,878,10))) as Copay_Modifier_ID
		,rtrim(ltrim(substring(rawdata,888,1))) as Filler35
		,rtrim(ltrim(substring(rawdata,889,10))) as Filler36
		,rtrim(ltrim(substring(rawdata,899,2))) as Other_Coverage_Code
		,rtrim(ltrim(substring(rawdata,901,2))) as Filler37
		,rtrim(ltrim(substring(rawdata,903,4))) as Filler38
		,rtrim(ltrim(substring(rawdata,907,2))) as Service_Provider_ID_Qualifier
		,rtrim(ltrim(substring(rawdata,909,15))) as Service_Provider_ID
		,rtrim(ltrim(substring(rawdata,924,2))) as Filler39
		,rtrim(ltrim(substring(rawdata,926,15))) as Filler40
		,rtrim(ltrim(substring(rawdata,941,7))) as Filler41
		,rtrim(ltrim(substring(rawdata,948,35))) as Pharmacy_Name
		,rtrim(ltrim(substring(rawdata,983,55))) as Pharmacy_Address_Line_1
		,rtrim(ltrim(substring(rawdata,1038,55))) as Pharmacy_Address_Line_2
		,rtrim(ltrim(substring(rawdata,1093,30))) as City
		,rtrim(ltrim(substring(rawdata,1123,2))) as State
		,rtrim(ltrim(substring(rawdata,1125,15))) as Zip
		,rtrim(ltrim(substring(rawdata,1140,3))) as Filler42
		,rtrim(ltrim(substring(rawdata,1143,10))) as Pharmacy_Telephone_Number
		,rtrim(ltrim(substring(rawdata,1153,2))) as Pharmacy_Dispenser_Type
		,rtrim(ltrim(substring(rawdata,1155,1))) as Filler43
		,rtrim(ltrim(substring(rawdata,1156,1))) as Filler44
		,rtrim(ltrim(substring(rawdata,1157,10))) as Network_Reimbursement_ID
		,rtrim(ltrim(substring(rawdata,1167,2))) as Prescriber_ID_Qualifier
		,rtrim(ltrim(substring(rawdata,1169,15))) as Prescriber_ID
		,rtrim(ltrim(substring(rawdata,1184,2))) as Filler45
		,rtrim(ltrim(substring(rawdata,1186,15))) as Filler46
		,rtrim(ltrim(substring(rawdata,1201,3))) as Filler47
		,rtrim(ltrim(substring(rawdata,1204,10))) as Filler48
		,rtrim(ltrim(substring(rawdata,1214,2))) as Filler49
		,rtrim(ltrim(substring(rawdata,1216,35))) as Prescriber_Last_Name
		,rtrim(ltrim(substring(rawdata,1251,25))) as Prescriber_First_Name
		,rtrim(ltrim(substring(rawdata,1276,10))) as Filler50
		,rtrim(ltrim(substring(rawdata,1286,2))) as Filler51
		,rtrim(ltrim(substring(rawdata,1288,15))) as Filler52
		,rtrim(ltrim(substring(rawdata,1303,3))) as Filler53
		,rtrim(ltrim(substring(rawdata,1306,35))) as Filler54
		,rtrim(ltrim(substring(rawdata,1341,25))) as Filler55
		,rtrim(ltrim(substring(rawdata,1366,1))) as Record_Status_Code
		,rtrim(ltrim(substring(rawdata,1367,1))) as Claim_Media_Type
		,rtrim(ltrim(substring(rawdata,1368,2))) as Processor_Payment_Clarification_Code
		,rtrim(ltrim(substring(rawdata,1370,1))) as Prescription_Service_Reference_Number_Qualifier
		,rtrim(ltrim(substring(rawdata,1371,9))) as PrescriberService_Reference_Number_Rx_Number
		,rtrim(ltrim(substring(rawdata,1380,2))) as ProductService_ID_Qualifier
		,rtrim(ltrim(substring(rawdata,1382,19))) as ProductService_ID
		,rtrim(ltrim(substring(rawdata,1401,8))) as Date_of_Service
		,rtrim(ltrim(substring(rawdata,1409,8))) as Adjudication_Date
		,rtrim(ltrim(substring(rawdata,1417,6))) as Filler56
		,rtrim(ltrim(substring(rawdata,1423,8))) as Filler57
		,rtrim(ltrim(substring(rawdata,1431,5))) as Filler58
		,rtrim(ltrim(substring(rawdata,1436,8))) as Billing_Cycle_End_Date
		,rtrim(ltrim(substring(rawdata,1444,2))) as Filler59
		,rtrim(ltrim(substring(rawdata,1446,2))) as Filler60
		,rtrim(ltrim(substring(rawdata,1448,1))) as Filler61
		,rtrim(ltrim(substring(rawdata,1449,8))) as Filler62
		,rtrim(ltrim(substring(rawdata,1457,8))) as Filler63
		,rtrim(ltrim(substring(rawdata,1465,15))) as Filler64
		,rtrim(ltrim(substring(rawdata,1480,2))) as Filler65
		,rtrim(ltrim(substring(rawdata,1482,8))) as Filler66
		,rtrim(ltrim(substring(rawdata,1490,30))) as Filler67
		,rtrim(ltrim(substring(rawdata,1520,9))) as Filler68
		,rtrim(ltrim(substring(rawdata,1529,8))) as Filler69
		,rtrim(ltrim(substring(rawdata,1537,10))) as Quantity_Dispensed
		,rtrim(ltrim(substring(rawdata,1547,2))) as Fill_Number
		,rtrim(ltrim(substring(rawdata,1549,3))) as Days_Supply
		,rtrim(ltrim(substring(rawdata,1552,8))) as Date_Prescription_Written
		,rtrim(ltrim(substring(rawdata,1560,1))) as Dispense_as_Written_Product_Selection_Code
		,rtrim(ltrim(substring(rawdata,1561,2))) as Number_of_Refills_Authorized
		,rtrim(ltrim(substring(rawdata,1563,1))) as Filler70
		,rtrim(ltrim(substring(rawdata,1564,2))) as Unit_of_Measure
		,rtrim(ltrim(substring(rawdata,1566,2))) as Filler71
		,rtrim(ltrim(substring(rawdata,1568,1))) as Filler72
		,rtrim(ltrim(substring(rawdata,1569,10))) as Original_Quantity
		,rtrim(ltrim(substring(rawdata,1579,10))) as Filler73
		,rtrim(ltrim(substring(rawdata,1589,3))) as Original_Day_Supply
		,rtrim(ltrim(substring(rawdata,1592,2))) as Filler74
		,rtrim(ltrim(substring(rawdata,1594,1))) as Compound_Code
		,rtrim(ltrim(substring(rawdata,1595,2))) as Filler75
		,rtrim(ltrim(substring(rawdata,1597,2))) as Filler76
		,rtrim(ltrim(substring(rawdata,1599,15))) as Filler77
		,rtrim(ltrim(substring(rawdata,1614,2))) as Filler78
		,rtrim(ltrim(substring(rawdata,1616,15))) as Filler79
		,rtrim(ltrim(substring(rawdata,1631,2))) as Filler80
		,rtrim(ltrim(substring(rawdata,1633,15))) as Filler81
		,rtrim(ltrim(substring(rawdata,1648,2))) as Filler82
		,rtrim(ltrim(substring(rawdata,1650,15))) as Filler83
		,rtrim(ltrim(substring(rawdata,1665,2))) as Filler84
		,rtrim(ltrim(substring(rawdata,1667,15))) as Filler85
		,rtrim(ltrim(substring(rawdata,1682,2))) as Filler86
		,rtrim(ltrim(substring(rawdata,1684,2))) as Filler87
		,rtrim(ltrim(substring(rawdata,1686,2))) as Filler88
		,rtrim(ltrim(substring(rawdata,1688,2))) as Filler89
		,rtrim(ltrim(substring(rawdata,1690,2))) as Filler90
		,rtrim(ltrim(substring(rawdata,1692,2))) as Filler91
		,rtrim(ltrim(substring(rawdata,1694,2))) as Filler92
		,rtrim(ltrim(substring(rawdata,1696,2))) as Filler93
		,rtrim(ltrim(substring(rawdata,1698,2))) as Filler94
		,rtrim(ltrim(substring(rawdata,1700,2))) as Filler95
		,rtrim(ltrim(substring(rawdata,1702,2))) as Filler96
		,rtrim(ltrim(substring(rawdata,1704,2))) as Filler97
		,rtrim(ltrim(substring(rawdata,1706,2))) as Filler98
		,rtrim(ltrim(substring(rawdata,1708,2))) as Filler99
		,rtrim(ltrim(substring(rawdata,1710,2))) as Filler100
		,rtrim(ltrim(substring(rawdata,1712,2))) as Filler101
		,rtrim(ltrim(substring(rawdata,1714,2))) as Filler102
		,rtrim(ltrim(substring(rawdata,1716,2))) as Filler103
		,rtrim(ltrim(substring(rawdata,1718,2))) as Filler104
		,rtrim(ltrim(substring(rawdata,1720,2))) as Filler105
		,rtrim(ltrim(substring(rawdata,1722,2))) as Filler106
		,rtrim(ltrim(substring(rawdata,1724,2))) as Filler107
		,rtrim(ltrim(substring(rawdata,1726,2))) as Filler108
		,rtrim(ltrim(substring(rawdata,1728,2))) as Filler109
		,rtrim(ltrim(substring(rawdata,1730,2))) as Filler110
		,rtrim(ltrim(substring(rawdata,1732,2))) as Filler111
		,rtrim(ltrim(substring(rawdata,1734,2))) as Filler112
		,rtrim(ltrim(substring(rawdata,1736,2))) as Filler113
		,rtrim(ltrim(substring(rawdata,1738,2))) as Filler114
		,rtrim(ltrim(substring(rawdata,1740,2))) as Filler115
		,rtrim(ltrim(substring(rawdata,1742,2))) as Filler116
		,rtrim(ltrim(substring(rawdata,1744,2))) as Filler117
		,rtrim(ltrim(substring(rawdata,1746,2))) as Filler118
		,rtrim(ltrim(substring(rawdata,1748,2))) as Filler119
		,rtrim(ltrim(substring(rawdata,1750,2))) as Filler120
		,rtrim(ltrim(substring(rawdata,1752,2))) as Filler121
		,rtrim(ltrim(substring(rawdata,1754,2))) as Filler122
		,rtrim(ltrim(substring(rawdata,1756,19))) as Filler123
		,rtrim(ltrim(substring(rawdata,1775,1))) as Filler124
		,rtrim(ltrim(substring(rawdata,1776,3))) as Reject_Code_1
		,rtrim(ltrim(substring(rawdata,1779,3))) as Reject_Code_2
		,rtrim(ltrim(substring(rawdata,1782,3))) as Reject_Code_3
		,rtrim(ltrim(substring(rawdata,1785,3))) as Filler125
		,rtrim(ltrim(substring(rawdata,1788,3))) as Filler126
		,rtrim(ltrim(substring(rawdata,1791,30))) as Filler127
		,rtrim(ltrim(substring(rawdata,1821,8))) as Filler128
		,rtrim(ltrim(substring(rawdata,1829,1))) as Database_Indicator
		,rtrim(ltrim(substring(rawdata,1830,30))) as ProductService_Name
		,rtrim(ltrim(substring(rawdata,1860,30))) as Generic_Name
		,rtrim(ltrim(substring(rawdata,1890,15))) as Product_Strength
		,rtrim(ltrim(substring(rawdata,1905,4))) as Dosage_Form_Code
		,rtrim(ltrim(substring(rawdata,1909,6))) as Filler129
		,rtrim(ltrim(substring(rawdata,1915,2))) as Filler130
		,rtrim(ltrim(substring(rawdata,1917,1))) as Drug_Type
		,rtrim(ltrim(substring(rawdata,1918,1))) as Maintenance_Drug_Indicator
		,rtrim(ltrim(substring(rawdata,1919,1))) as Drug_Category_Code
		,rtrim(ltrim(substring(rawdata,1920,1))) as Filler131
		,rtrim(ltrim(substring(rawdata,1921,1))) as Filler132
		,rtrim(ltrim(substring(rawdata,1922,2))) as Submission_Clarification_Code
		,rtrim(ltrim(substring(rawdata,1924,2))) as Filler133
		,rtrim(ltrim(substring(rawdata,1926,2))) as Filler134
		,rtrim(ltrim(substring(rawdata,1928,1))) as Filler135
		,rtrim(ltrim(substring(rawdata,1929,6))) as GCN_Number
		,rtrim(ltrim(substring(rawdata,1935,6))) as Universal_System_Classification
		,rtrim(ltrim(substring(rawdata,1941,14))) as Generic_Product_Identifier
		,rtrim(ltrim(substring(rawdata,1955,1))) as Filler136
		,rtrim(ltrim(substring(rawdata,1956,3))) as Filler137
		,rtrim(ltrim(substring(rawdata,1959,2))) as Filler138
		,rtrim(ltrim(substring(rawdata,1961,3))) as Filler139
		,rtrim(ltrim(substring(rawdata,1964,2))) as Filler140
		,rtrim(ltrim(substring(rawdata,1966,6))) as Therapeutic_Class_Code_AHFS
		,rtrim(ltrim(substring(rawdata,1972,1))) as Formulary_Status
		,rtrim(ltrim(substring(rawdata,1973,1))) as Filler141
		,rtrim(ltrim(substring(rawdata,1974,8))) as Filler142
		,rtrim(ltrim(substring(rawdata,1982,15))) as Filler143
		,rtrim(ltrim(substring(rawdata,1997,1))) as Filler144
		,rtrim(ltrim(substring(rawdata,1998,8))) as Ingredient_Cost_Paid
		,rtrim(ltrim(substring(rawdata,2006,8))) as Dispensing_Fee_Paid
		,rtrim(ltrim(substring(rawdata,2014,8))) as Total_Amount_Paid_by_all_Sources
		,rtrim(ltrim(substring(rawdata,2022,8))) as Amount_Attributed_To_Sales_Tax
		,rtrim(ltrim(substring(rawdata,2030,8))) as Patient_Pay_Amount
		,rtrim(ltrim(substring(rawdata,2038,8))) as Amount_of_Copay
		,rtrim(ltrim(substring(rawdata,2046,8))) as Amount_of_Coinsurance
		,rtrim(ltrim(substring(rawdata,2054,8))) as Amount_Attributed_To_Product_Selection
		,rtrim(ltrim(substring(rawdata,2062,8))) as Amount_Applied_to_Periodic_Deductible
		,rtrim(ltrim(substring(rawdata,2070,8))) as Filler145
		,rtrim(ltrim(substring(rawdata,2078,1))) as MAC_Reduced_Indicator
		,rtrim(ltrim(substring(rawdata,2079,2))) as Client_Pricing_Basis_of_Cost
		,rtrim(ltrim(substring(rawdata,2081,1))) as Generic_Indicator
		,rtrim(ltrim(substring(rawdata,2082,8))) as Out_of_Pocket_Apply_Amount
		,rtrim(ltrim(substring(rawdata,2090,9))) as Filler146
		,rtrim(ltrim(substring(rawdata,2099,8))) as Filler147
		,rtrim(ltrim(substring(rawdata,2107,1))) as AWPPAWP_Indicator
		,rtrim(ltrim(substring(rawdata,2108,9))) as Average_Wholesale_Unit_Price
		,rtrim(ltrim(substring(rawdata,2117,9))) as Filler148
		,rtrim(ltrim(substring(rawdata,2126,8))) as Filler149
		,rtrim(ltrim(substring(rawdata,2134,9))) as Filler150
		,rtrim(ltrim(substring(rawdata,2143,8))) as Ingredient_Cost_Submitted
		,rtrim(ltrim(substring(rawdata,2151,8))) as Usual_And_Customary_Charge
		,rtrim(ltrim(substring(rawdata,2159,8))) as Flat_Sales_Tax_Amount_Paid
		,rtrim(ltrim(substring(rawdata,2167,8))) as Percentage_Sales_Tax_Amount_Paid
		,rtrim(ltrim(substring(rawdata,2175,7))) as Filler151
		,rtrim(ltrim(substring(rawdata,2182,2))) as Filler152
		,rtrim(ltrim(substring(rawdata,2184,8))) as Filler153
		,rtrim(ltrim(substring(rawdata,2192,8))) as Filler154
		,rtrim(ltrim(substring(rawdata,2200,2))) as Filler155
		,rtrim(ltrim(substring(rawdata,2202,8))) as Mail_Incentive_Fee
		,rtrim(ltrim(substring(rawdata,2210,2))) as Filler156
		,rtrim(ltrim(substring(rawdata,2212,8))) as Filler157
		,rtrim(ltrim(substring(rawdata,2220,2))) as Filler158
		,rtrim(ltrim(substring(rawdata,2222,8))) as Filler159
		,rtrim(ltrim(substring(rawdata,2230,8))) as Filler160
		,rtrim(ltrim(substring(rawdata,2238,1))) as Filler161
		,rtrim(ltrim(substring(rawdata,2239,10))) as Filler162
		,rtrim(ltrim(substring(rawdata,2249,1))) as Filler163
		,rtrim(ltrim(substring(rawdata,2250,10))) as Filler164
		,rtrim(ltrim(substring(rawdata,2260,8))) as Net_Amount_Due_Total_Amount_BilledPaid
		,rtrim(ltrim(substring(rawdata,2268,2))) as Basis_of_Reimbursement_Determination
		,rtrim(ltrim(substring(rawdata,2270,8))) as Accumulated_Deductible_Amount
		,rtrim(ltrim(substring(rawdata,2278,8))) as Filler165
		,rtrim(ltrim(substring(rawdata,2286,8))) as Filler166
		,rtrim(ltrim(substring(rawdata,2294,8))) as Filler167
		,rtrim(ltrim(substring(rawdata,2302,8))) as Filler168
		,rtrim(ltrim(substring(rawdata,2310,8))) as Filler169
		,rtrim(ltrim(substring(rawdata,2318,8))) as Filler170
		,rtrim(ltrim(substring(rawdata,2326,8))) as Amount_Exceeding_Periodic_Benefit_Maximum
		,rtrim(ltrim(substring(rawdata,2334,2))) as Filler171
		,rtrim(ltrim(substring(rawdata,2336,2))) as Basis_of_Calculation_Copay
		,rtrim(ltrim(substring(rawdata,2338,2))) as Filler172
		,rtrim(ltrim(substring(rawdata,2340,2))) as Filler173
		,rtrim(ltrim(substring(rawdata,2342,2))) as Filler174
		,rtrim(ltrim(substring(rawdata,2344,1))) as Filler175
		,rtrim(ltrim(substring(rawdata,2345,8))) as Filler176
		,rtrim(ltrim(substring(rawdata,2353,1))) as Filler177
		,rtrim(ltrim(substring(rawdata,2354,1))) as Filler178
		,rtrim(ltrim(substring(rawdata,2355,8))) as Filler179
		,rtrim(ltrim(substring(rawdata,2363,8))) as Filler180
		,rtrim(ltrim(substring(rawdata,2371,8))) as Filler181
		,rtrim(ltrim(substring(rawdata,2379,1))) as Filler182
		,rtrim(ltrim(substring(rawdata,2380,4))) as Filler183
		,rtrim(ltrim(substring(rawdata,2384,11))) as Invoiced_Amount_PAFF_Amount
		,rtrim(ltrim(substring(rawdata,2395,2))) as Filler184
		,rtrim(ltrim(substring(rawdata,2397,11))) as Filler185
		,rtrim(ltrim(substring(rawdata,2408,11))) as Filler186
		,rtrim(ltrim(substring(rawdata,2419,2))) as Processor_Defined_Prior_Authorization_Reason_Code
		,rtrim(ltrim(substring(rawdata,2421,3))) as Adjustment_Reason_Code
		,rtrim(ltrim(substring(rawdata,2424,1))) as Adjustment_Type
		,rtrim(ltrim(substring(rawdata,2425,30))) as Transaction_ID_Cross_Reference
		,rtrim(ltrim(substring(rawdata,2455,8))) as Filler187
		,rtrim(ltrim(substring(rawdata,2463,1))) as Eligibility_COB_Indicator
		,rtrim(ltrim(substring(rawdata,2464,1))) as Filler188
		,rtrim(ltrim(substring(rawdata,2465,10))) as Filler189
		,rtrim(ltrim(substring(rawdata,2475,8))) as Filler190
		,rtrim(ltrim(substring(rawdata,2483,8))) as COB_Primary_Payer_Amount_Paid
		,rtrim(ltrim(substring(rawdata,2491,8))) as OPAR
		,rtrim(ltrim(substring(rawdata,2499,8))) as Filler191
		,rtrim(ltrim(substring(rawdata,2507,8))) as COB_Primary_Payer_Copay
		,rtrim(ltrim(substring(rawdata,2515,10))) as Filler192
		,rtrim(ltrim(substring(rawdata,2525,8))) as Filler193
		,rtrim(ltrim(substring(rawdata,2533,8))) as Filler194
		,rtrim(ltrim(substring(rawdata,2541,8))) as Filler195
		,rtrim(ltrim(substring(rawdata,2549,8))) as Filler196
		,rtrim(ltrim(substring(rawdata,2557,8))) as Filler197
		,rtrim(ltrim(substring(rawdata,2565,30))) as Transaction_ID
		,rtrim(ltrim(substring(rawdata,2595,20))) as Filler198
		,rtrim(ltrim(substring(rawdata,2615,9))) as General_Purpose_1
		,rtrim(ltrim(substring(rawdata,2624,4))) as General_Purpose_2
		,rtrim(ltrim(substring(rawdata,2628,5))) as General_Purpose_3_Group_Extension_Code
		,rtrim(ltrim(substring(rawdata,2633,2))) as General_Purpose_4
		,rtrim(ltrim(substring(rawdata,2635,15))) as Account_ID
		,rtrim(ltrim(substring(rawdata,2650,10))) as Care_Facility
		,rtrim(ltrim(substring(rawdata,2660,1))) as Specialty_RX_Claim
		,rtrim(ltrim(substring(rawdata,2661,1))) as PharmacyMedical_Indicator
		,rtrim(ltrim(substring(rawdata,2662,3))) as Billing_Reporting_Code
		,rtrim(ltrim(substring(rawdata,2665,20))) as Alternate_ID
		,rtrim(ltrim(substring(rawdata,2685,1))) as Healthcare_Savings_Account_Exclusion_Flag
		,rtrim(ltrim(substring(rawdata,2686,1))) as Deductible_Exclusion_Flag
		,rtrim(ltrim(substring(rawdata,2687,1))) as Stop_Loss_Exclusion_Flag
		,rtrim(ltrim(substring(rawdata,2688,1))) as Maximum_Benefit_Exclusion_Flag
		,rtrim(ltrim(substring(rawdata,2689,1))) as Lifetime_Maximum_Benefit_Exclusion_Flag
		,rtrim(ltrim(substring(rawdata,2690,8))) as Processor_Defined_Data
		,rtrim(ltrim(substring(rawdata,2698,21))) as Plan_Code_and_Extension
		,rtrim(ltrim(substring(rawdata,2719,8))) as Vaccine_Administration_Fee_Paid
		,rtrim(ltrim(substring(rawdata,2727,1))) as Drug_Admin_Fee_Type_Code
		,rtrim(ltrim(substring(rawdata,2728,1))) as Maintenance_Choice_Indicator
		,rtrim(ltrim(substring(rawdata,2729,557))) as Filler199
		,rtrim(ltrim(substring(rawdata,3286,715))) as Filler200,
'FILE.JNT594.UHAUTRA.DT123114.TM010114.TXT',
getdate()

from raw_tfk.rtemp_traffk_20161108_uhaul_webtransport_TM010114_fixed
where  
		substring(rawdata,1,2) = 'DE' ;
--------------------------------------------------Trailer---------------------------------------------------------------------
drop table if exists raw_tfk.rstag_traffk_20161108_uhaul_webtransport_TM010114_fixed_trailer;
create table raw_tfk.rstag_traffk_20161108_uhaul_webtransport_TM010114_fixed_trailer
(
	 Record_Type varchar(200)
    ,Total_Record_Count varchar(200)
    ,Total_Net_Amount_Due varchar(200)
    ,Filler varchar(4000)
	,source	varchar(255)
);		

insert into raw_tfk.rstag_traffk_20161108_uhaul_webtransport_TM010114_fixed_trailer  
	(   
		 Record_Type
		,Total_Record_Count
		,Total_Net_Amount_Due
		,Filler
		,source
	)
	select top 100 distinct
		 rtrim(ltrim(substring(rawdata,1,2))) as Record_Type
		,rtrim(ltrim(substring(rawdata,3,10))) as Total_Record_Count
		,rtrim(ltrim(substring(rawdata,13,12))) as Total_Net_Amount_Due
		,rtrim(ltrim(substring(rawdata,25,3976))) as Filler
		,'FILE.JNT594.UHAUTRA.DT123114.TM010114.TXT'
	from  
		raw_tfk.rtemp_traffk_20161108_uhaul_webtransport_TM010114_fixed  
	where  
		substring(rawdata,1,2) like 'PT%'	;
		
		
---------------------------------------------------------------------------------------------------



	
	
------------------------------------RAW TABLE DETAILS-------------------------------------------------------------------------------------------
drop table if exists raw_tfk.raw_traffk_20161108_uhaul_webtransport_TM010114_fixed;
 
CREATE TABLE raw_tfk.raw_traffk_20161108_uhaul_webtransport_TM010114_fixed
(
 Record_Type varchar(2)
    ,Record_Indicator varchar(1)
    ,Filler1 varchar(3)
    ,Filler2 varchar(10)
    ,Filler3 varchar(10)
    ,Filler4 varchar(15)
    ,Filler5 varchar(6)
    ,Filler6 varchar(20)
    ,Filler7 varchar(20)
    ,Filler8 varchar(200)
    ,Cardholder_ID varchar(20)
    ,Last_Name varchar(35)
    ,First_Name varchar(25)
    ,Middle_Initial varchar(1)
    ,Filler9 varchar(10)
    ,Filler10 varchar(55)
    ,Filler11 varchar(55)
    ,Filler12 varchar(30)
    ,Filler13 varchar(2)
    ,Filler14 varchar(15)
    ,Cardholder_Date_of_Birth date
    ,Filler15 varchar(1)
    ,Filler16 varchar(1)
    ,Filler17 varchar(1)
    ,Filler18 varchar(2)
    ,Filler19 varchar(20)
    ,Patient_Last_Name varchar(35)
    ,Patient_First_Name varchar(25)
    ,Patient_Middle_Initial varchar(1)
    ,Filler20 varchar(10)
    ,Filler21 varchar(55)
    ,Filler22 varchar(55)
    ,Filler23 varchar(30)
    ,Filler24 varchar(2)
    ,Filler25 varchar(15)
    ,Patient_Date_of_Birth date
    ,Patient_Gender_Code varchar(1)
    ,Eligibililty_Patient_Relationship_Code varchar(2)
    ,Patient_Age varchar(10)
    ,Filler26 varchar(3)
    ,Filler27 varchar(1)
    ,Filler28 varchar(1)
    ,Filler29 varchar(10)
    ,Group_ID varchar(15)
    ,Carrier_Number varchar(9)
    ,Policy_Number varchar(15)
    ,Billing_Account_Number varchar(8)
    ,Filler30 varchar(1)
    ,Filler31 varchar(1)
    ,Filler32 varchar(1)
    ,Filler33 varchar(1)
    ,Filler34 varchar(1)
    ,Copay_Modifier_ID varchar(10)
    ,Filler35 varchar(1)
    ,Filler36 varchar(10)
    ,Other_Coverage_Code varchar(2)
    ,Filler37 varchar(2)
    ,Filler38 varchar(4)
    ,Service_Provider_ID_Qualifier varchar(2)
    ,Service_Provider_ID varchar(15)
    ,Filler39 varchar(2)
    ,Filler40 varchar(15)
    ,Filler41 varchar(7)
    ,Pharmacy_Name varchar(35)
    ,Pharmacy_Address_Line_1 varchar(55)
    ,Pharmacy_Address_Line_2 varchar(55)
    ,City varchar(30)
    ,State varchar(2)
    ,Zip varchar(15)
    ,Filler42 varchar(3)
    ,Pharmacy_Telephone_Number varchar(50)
    ,Pharmacy_Dispenser_Type varchar(2)
    ,Filler43 varchar(1)
    ,Filler44 varchar(1)
    ,Network_Reimbursement_ID varchar(10)
    ,Prescriber_ID_Qualifier varchar(2)
    ,Prescriber_ID varchar(15)
    ,Filler45 varchar(2)
    ,Filler46 varchar(15)
    ,Filler47 varchar(3)
    ,Filler48 varchar(10)
    ,Filler49 varchar(2)
    ,Prescriber_Last_Name varchar(35)
    ,Prescriber_First_Name varchar(25)
    ,Filler50 varchar(55)
    ,Filler51 varchar(2)
    ,Filler52 varchar(15)
    ,Filler53 varchar(3)
    ,Filler54 varchar(35)
    ,Filler55 varchar(25)
    ,Record_Status_Code varchar(1)
    ,Claim_Media_Type varchar(1)
    ,Processor_Payment_Clarification_Code varchar(2)
    ,Prescription_Service_Reference_Number_Qualifier varchar(1)
    ,PrescriberService_Reference_Number_Rx_Number varchar(9)
    ,ProductService_ID_Qualifier varchar(2)
    ,ProductService_ID varchar(19)
    ,Date_of_Service date
    ,Adjudication_Date date
    ,Filler56 varchar(55)
    ,Filler57 varchar(55)
    ,Filler58 varchar(55)
    ,Billing_Cycle_End_Date date
    ,Filler59 varchar(2)
    ,Filler60 varchar(55)
    ,Filler61 varchar(55)
    ,Filler62 varchar(55)
    ,Filler63 varchar(55)
    ,Filler64 varchar(15)
    ,Filler65 varchar(2)
    ,Filler66 varchar(55)
    ,Filler67 varchar(30)
    ,Filler68 varchar(55)
    ,Filler69 varchar(55)
    ,Quantity_Dispensed varchar(55)
    ,Fill_Number varchar(55)
    ,Days_Supply varchar(55)
    ,Date_Prescription_Written date
    ,Dispense_as_Written_Product_Selection_Code varchar(1)
    ,Number_of_Refills_Authorized varchar(25)
    ,Filler70 varchar(55)
    ,Unit_of_Measure varchar(2)
    ,Filler71 varchar(55)
    ,Filler72 varchar(1)
    ,Original_Quantity varchar(50)
    ,Filler73 varchar(55)
    ,Original_Day_Supply varchar(25)
    ,Filler74 varchar(55)
    ,Compound_Code varchar(25)
    ,Filler75 varchar(55)
    ,Filler76 varchar(2)
    ,Filler77 varchar(15)
    ,Filler78 varchar(2)
    ,Filler79 varchar(15)
    ,Filler80 varchar(2)
    ,Filler81 varchar(15)
    ,Filler82 varchar(2)
    ,Filler83 varchar(15)
    ,Filler84 varchar(2)
    ,Filler85 varchar(15)
    ,Filler86 varchar(2)
    ,Filler87 varchar(2)
    ,Filler88 varchar(2)
    ,Filler89 varchar(55)
    ,Filler90 varchar(2)
    ,Filler91 varchar(2)
    ,Filler92 varchar(2)
    ,Filler93 varchar(55)
    ,Filler94 varchar(2)
    ,Filler95 varchar(2)
    ,Filler96 varchar(2)
    ,Filler97 varchar(55)
    ,Filler98 varchar(2)
    ,Filler99 varchar(2)
    ,Filler100 varchar(2)
    ,Filler101 varchar(55)
    ,Filler102 varchar(2)
    ,Filler103 varchar(2)
    ,Filler104 varchar(2)
    ,Filler105 varchar(55)
    ,Filler106 varchar(2)
    ,Filler107 varchar(2)
    ,Filler108 varchar(2)
    ,Filler109 varchar(55)
    ,Filler110 varchar(2)
    ,Filler111 varchar(2)
    ,Filler112 varchar(2)
    ,Filler113 varchar(55)
    ,Filler114 varchar(2)
    ,Filler115 varchar(2)
    ,Filler116 varchar(2)
    ,Filler117 varchar(55)
    ,Filler118 varchar(2)
    ,Filler119 varchar(2)
    ,Filler120 varchar(2)
    ,Filler121 varchar(55)
    ,Filler122 varchar(2)
    ,Filler123 varchar(19)
    ,Filler124 varchar(1)
    ,Reject_Code_1 varchar(3)
    ,Reject_Code_2 varchar(3)
    ,Reject_Code_3 varchar(3)
    ,Filler125 varchar(3)
    ,Filler126 varchar(3)
    ,Filler127 varchar(30)
    ,Filler128 varchar(55)
    ,Database_Indicator varchar(1)
    ,ProductService_Name varchar(30)
    ,Generic_Name varchar(30)
    ,Product_Strength varchar(15)
    ,Dosage_Form_Code varchar(4)
    ,Filler129 varchar(6)
    ,Filler130 varchar(2)
    ,Drug_Type varchar(25)
    ,Maintenance_Drug_Indicator varchar(1)
    ,Drug_Category_Code varchar(1)
    ,Filler131 varchar(1)
    ,Filler132 varchar(1)
    ,Submission_Clarification_Code varchar(50)
    ,Filler133 varchar(55)
    ,Filler134 varchar(55)
    ,Filler135 varchar(1)
    ,GCN_Number varchar(6)
    ,Universal_System_Classification varchar(6)
    ,Generic_Product_Identifier varchar(14)
    ,Filler136 varchar(1)
    ,Filler137 varchar(55)
    ,Filler138 varchar(55)
    ,Filler139 varchar(3)
    ,Filler140 varchar(2)
    ,Therapeutic_Class_Code_AHFS varchar(6)
    ,Formulary_Status varchar(1)
    ,Filler141 varchar(1)
    ,Filler142 varchar(8)
    ,Filler143 varchar(15)
    ,Filler144 varchar(1)
    ,Ingredient_Cost_Paid numeric(19,2)
    ,Dispensing_Fee_Paid numeric(19,2)
    ,Total_Amount_Paid_by_all_Sources numeric(19,2)
    ,Amount_Attributed_To_Sales_Tax numeric(19,2)
    ,Patient_Pay_Amount numeric(19,2)
    ,Amount_of_Copay numeric(19,2)
    ,Amount_of_Coinsurance numeric(19,2)
    ,Amount_Attributed_To_Product_Selection numeric(19,2)
    ,Amount_Applied_to_Periodic_Deductible numeric(19,2)
    ,Filler145 varchar(55)
    ,MAC_Reduced_Indicator varchar(1)
    ,Client_Pricing_Basis_of_Cost varchar(2)
    ,Generic_Indicator varchar(1)
    ,Out_of_Pocket_Apply_Amount numeric(19,2)
    ,Filler146 varchar(55)
    ,Filler147 varchar(55)
    ,AWPPAWP_Indicator varchar(1)
    ,Average_Wholesale_Unit_Price numeric(19,2)
    ,Filler148 varchar(30)
    ,Filler149 varchar(55)
    ,Filler150 varchar(55)
    ,Ingredient_Cost_Submitted numeric(19,2)
    ,Usual_And_Customary_Charge numeric(19,2)
    ,Flat_Sales_Tax_Amount_Paid numeric(19,2)
    ,Percentage_Sales_Tax_Amount_Paid numeric(19,2)
    ,Filler151 varchar(55)
    ,Filler152 varchar(2)
    ,Filler153 varchar(55)
    ,Filler154 varchar(55)
    ,Filler155 varchar(2)
    ,Mail_Incentive_Fee numeric(19,2)
    ,Filler156 varchar(2)
    ,Filler157 varchar(55)
    ,Filler158 varchar(2)
    ,Filler159 varchar(55)
    ,Filler160 varchar(55)
    ,Filler161 varchar(1)
    ,Filler162 varchar(55)
    ,Filler163 varchar(1)
    ,Filler164 varchar(55)
    ,Net_Amount_Due_Total_Amount_BilledPaid numeric(19,2)
    ,Basis_of_Reimbursement_Determination varchar(50)
    ,Accumulated_Deductible_Amount numeric(19,2)
    ,Filler165 varchar(55)
    ,Filler166 varchar(55)
    ,Filler167 varchar(55)
    ,Filler168 varchar(55)
    ,Filler169 varchar(55)
    ,Filler170 varchar(55)
    ,Amount_Exceeding_Periodic_Benefit_Maximum numeric(19,2)
    ,Filler171 varchar(2)
    ,Basis_of_Calculation_Copay varchar(2)
    ,Filler172 varchar(2)
    ,Filler173 varchar(2)
    ,Filler174 varchar(2)
    ,Filler175 varchar(1)
    ,Filler176 varchar(55)
    ,Filler177 varchar(1)
    ,Filler178 varchar(1)
    ,Filler179 varchar(55)
    ,Filler180 varchar(55)
    ,Filler181 varchar(55)
    ,Filler182 varchar(1)
    ,Filler183 varchar(55)
    ,Invoiced_Amount_PAFF_Amount numeric(19,2)
    ,Filler184 varchar(55)
    ,Filler185 varchar(55)
    ,Filler186 varchar(55)
    ,Processor_Defined_Prior_Authorization_Reason_Code varchar(25)
    ,Adjustment_Reason_Code varchar(30)
    ,Adjustment_Type varchar(1)
    ,Transaction_ID_Cross_Reference varchar(30)
    ,Filler187 varchar(55)
    ,Eligibility_COB_Indicator varchar(1)
    ,Filler188 varchar(1)
    ,Filler189 varchar(10)
    ,Filler190 varchar(55)
    ,COB_Primary_Payer_Amount_Paid numeric(19,2)
    ,OPAR varchar(50)
    ,Filler191 varchar(55)
    ,COB_Primary_Payer_Copay numeric(19,2)
    ,Filler192 varchar(10)
    ,Filler193 varchar(8)
    ,Filler194 varchar(8)
    ,Filler195 varchar(8)
    ,Filler196 varchar(8)
    ,Filler197 varchar(8)
    ,Transaction_ID varchar(30)
    ,Filler198 varchar(20)
    ,General_Purpose_1 varchar(9)
    ,General_Purpose_2 varchar(4)
    ,General_Purpose_3_Group_Extension_Code varchar(5)
    ,General_Purpose_4 varchar(2)
    ,Account_ID varchar(15)
    ,Care_Facility varchar(10)
    ,Specialty_RX_Claim varchar(1)
    ,PharmacyMedical_Indicator varchar(1)
    ,Billing_Reporting_Code varchar(3)
    ,Alternate_ID varchar(20)
    ,Healthcare_Savings_Account_Exclusion_Flag varchar(1)
    ,Deductible_Exclusion_Flag varchar(1)
    ,Stop_Loss_Exclusion_Flag varchar(1)
    ,Maximum_Benefit_Exclusion_Flag varchar(1)
    ,Lifetime_Maximum_Benefit_Exclusion_Flag varchar(1)
    ,Processor_Defined_Data varchar(8)
    ,Plan_Code_and_Extension varchar(21)
    ,Vaccine_Administration_Fee_Paid numeric(19,2)
    ,Drug_Admin_Fee_Type_Code varchar(1)
    ,Maintenance_Choice_Indicator varchar(1)
    ,Filler199 varchar(557)
    ,Filler200 varchar(715)
	,Source varchar(255)
	,Import_Date date


);

insert into raw_tfk.raw_traffk_20161108_uhaul_webtransport_TM010114_fixed
(
     Record_Type
    ,Record_Indicator
    ,Filler1
    ,Filler2
    ,Filler3
    ,Filler4
    ,Filler5
    ,Filler6
    ,Filler7
    ,Filler8
    ,Cardholder_ID
    ,Last_Name
    ,First_Name
    ,Middle_Initial
    ,Filler9
    ,Filler10
    ,Filler11
    ,Filler12
    ,Filler13
    ,Filler14
    ,Cardholder_Date_of_Birth
    ,Filler15
    ,Filler16
    ,Filler17
    ,Filler18
    ,Filler19
    ,Patient_Last_Name
    ,Patient_First_Name
    ,Patient_Middle_Initial
    ,Filler20
    ,Filler21
    ,Filler22
    ,Filler23
    ,Filler24
    ,Filler25
    ,Patient_Date_of_Birth
    ,Patient_Gender_Code
    ,Eligibililty_Patient_Relationship_Code
    ,Patient_Age
    ,Filler26
    ,Filler27
    ,Filler28
    ,Filler29
    ,Group_ID
    ,Carrier_Number
    ,Policy_Number
    ,Billing_Account_Number
    ,Filler30
    ,Filler31
    ,Filler32
    ,Filler33
    ,Filler34
    ,Copay_Modifier_ID
    ,Filler35
    ,Filler36
    ,Other_Coverage_Code
    ,Filler37
    ,Filler38
    ,Service_Provider_ID_Qualifier
    ,Service_Provider_ID
    ,Filler39
    ,Filler40
    ,Filler41
    ,Pharmacy_Name
    ,Pharmacy_Address_Line_1
    ,Pharmacy_Address_Line_2
    ,City
    ,State
    ,Zip
    ,Filler42
    ,Pharmacy_Telephone_Number
    ,Pharmacy_Dispenser_Type
    ,Filler43
    ,Filler44
    ,Network_Reimbursement_ID
    ,Prescriber_ID_Qualifier
    ,Prescriber_ID
    ,Filler45
    ,Filler46
    ,Filler47
    ,Filler48
    ,Filler49
    ,Prescriber_Last_Name
    ,Prescriber_First_Name
    ,Filler50
    ,Filler51
    ,Filler52
    ,Filler53
    ,Filler54
    ,Filler55
    ,Record_Status_Code
    ,Claim_Media_Type
    ,Processor_Payment_Clarification_Code
    ,Prescription_Service_Reference_Number_Qualifier
    ,PrescriberService_Reference_Number_Rx_Number
    ,ProductService_ID_Qualifier
    ,ProductService_ID
    ,Date_of_Service
    ,Adjudication_Date
    ,Filler56
    ,Filler57
    ,Filler58
    ,Billing_Cycle_End_Date
    ,Filler59
    ,Filler60
    ,Filler61
    ,Filler62
    ,Filler63
    ,Filler64
    ,Filler65
    ,Filler66
    ,Filler67
    ,Filler68
    ,Filler69
    ,Quantity_Dispensed
    ,Fill_Number
    ,Days_Supply
    ,Date_Prescription_Written
    ,Dispense_as_Written_Product_Selection_Code
    ,Number_of_Refills_Authorized
    ,Filler70
    ,Unit_of_Measure
    ,Filler71
    ,Filler72
    ,Original_Quantity
    ,Filler73
    ,Original_Day_Supply
    ,Filler74
    ,Compound_Code
    ,Filler75
    ,Filler76
    ,Filler77
    ,Filler78
    ,Filler79
    ,Filler80
    ,Filler81
    ,Filler82
    ,Filler83
    ,Filler84
    ,Filler85
    ,Filler86
    ,Filler87
    ,Filler88
    ,Filler89
    ,Filler90
    ,Filler91
    ,Filler92
    ,Filler93
    ,Filler94
    ,Filler95
    ,Filler96
    ,Filler97
    ,Filler98
    ,Filler99
    ,Filler100
    ,Filler101
    ,Filler102
    ,Filler103
    ,Filler104
    ,Filler105
    ,Filler106
    ,Filler107
    ,Filler108
    ,Filler109
    ,Filler110
    ,Filler111
    ,Filler112
    ,Filler113
    ,Filler114
    ,Filler115
    ,Filler116
    ,Filler117
    ,Filler118
    ,Filler119
    ,Filler120
    ,Filler121
    ,Filler122
    ,Filler123
    ,Filler124
    ,Reject_Code_1
    ,Reject_Code_2
    ,Reject_Code_3
    ,Filler125
    ,Filler126
    ,Filler127
    ,Filler128
    ,Database_Indicator
    ,ProductService_Name
    ,Generic_Name
    ,Product_Strength
    ,Dosage_Form_Code
    ,Filler129
    ,Filler130
    ,Drug_Type
    ,Maintenance_Drug_Indicator
    ,Drug_Category_Code
    ,Filler131
    ,Filler132
    ,Submission_Clarification_Code
    ,Filler133
    ,Filler134
    ,Filler135
    ,GCN_Number
    ,Universal_System_Classification
    ,Generic_Product_Identifier
    ,Filler136
    ,Filler137
    ,Filler138
    ,Filler139
    ,Filler140
    ,Therapeutic_Class_Code_AHFS
    ,Formulary_Status
    ,Filler141
    ,Filler142
    ,Filler143
    ,Filler144
    ,Ingredient_Cost_Paid
    ,Dispensing_Fee_Paid
    ,Total_Amount_Paid_by_all_Sources
    ,Amount_Attributed_To_Sales_Tax
    ,Patient_Pay_Amount
    ,Amount_of_Copay
    ,Amount_of_Coinsurance
    ,Amount_Attributed_To_Product_Selection
    ,Amount_Applied_to_Periodic_Deductible
    ,Filler145
    ,MAC_Reduced_Indicator
    ,Client_Pricing_Basis_of_Cost
    ,Generic_Indicator
    ,Out_of_Pocket_Apply_Amount
    ,Filler146
    ,Filler147
    ,AWPPAWP_Indicator
    ,Average_Wholesale_Unit_Price
    ,Filler148
    ,Filler149
    ,Filler150
    ,Ingredient_Cost_Submitted
    ,Usual_And_Customary_Charge
    ,Flat_Sales_Tax_Amount_Paid
    ,Percentage_Sales_Tax_Amount_Paid
    ,Filler151
    ,Filler152
    ,Filler153
    ,Filler154
    ,Filler155
    ,Mail_Incentive_Fee
    ,Filler156
    ,Filler157
    ,Filler158
    ,Filler159
    ,Filler160
    ,Filler161
    ,Filler162
    ,Filler163
    ,Filler164
    ,Net_Amount_Due_Total_Amount_BilledPaid
    ,Basis_of_Reimbursement_Determination
    ,Accumulated_Deductible_Amount
    ,Filler165
    ,Filler166
    ,Filler167
    ,Filler168
    ,Filler169
    ,Filler170
    ,Amount_Exceeding_Periodic_Benefit_Maximum
    ,Filler171
    ,Basis_of_Calculation_Copay
    ,Filler172
    ,Filler173
    ,Filler174
    ,Filler175
    ,Filler176
    ,Filler177
    ,Filler178
    ,Filler179
    ,Filler180
    ,Filler181
    ,Filler182
    ,Filler183
    ,Invoiced_Amount_PAFF_Amount
    ,Filler184
    ,Filler185
    ,Filler186
    ,Processor_Defined_Prior_Authorization_Reason_Code
    ,Adjustment_Reason_Code
    ,Adjustment_Type
    ,Transaction_ID_Cross_Reference
    ,Filler187
    ,Eligibility_COB_Indicator
    ,Filler188
    ,Filler189
    ,Filler190
    ,COB_Primary_Payer_Amount_Paid
    ,OPAR
    ,Filler191
    ,COB_Primary_Payer_Copay
    ,Filler192
    ,Filler193
    ,Filler194
    ,Filler195
    ,Filler196
    ,Filler197
    ,Transaction_ID
    ,Filler198
    ,General_Purpose_1
    ,General_Purpose_2
    ,General_Purpose_3_Group_Extension_Code
    ,General_Purpose_4
    ,Account_ID
    ,Care_Facility
    ,Specialty_RX_Claim
    ,PharmacyMedical_Indicator
    ,Billing_Reporting_Code
    ,Alternate_ID
    ,Healthcare_Savings_Account_Exclusion_Flag
    ,Deductible_Exclusion_Flag
    ,Stop_Loss_Exclusion_Flag
    ,Maximum_Benefit_Exclusion_Flag
    ,Lifetime_Maximum_Benefit_Exclusion_Flag
    ,Processor_Defined_Data
    ,Plan_Code_and_Extension
    ,Vaccine_Administration_Fee_Paid
    ,Drug_Admin_Fee_Type_Code
    ,Maintenance_Choice_Indicator
    ,Filler199
    ,Filler200
	,Source
	,Import_Date
)

select 

      ltrim(rtrim(Record_Type ))        as Record_Type
    ,ltrim(rtrim(Record_Indicator ))   as Record_Indicator
    ,ltrim(rtrim(Filler1 ))            as Filler1
    ,ltrim(rtrim(Filler2 ))            as Filler2
    ,ltrim(rtrim(Filler3 ))            as Filler3
    ,ltrim(rtrim(Filler4 ))            as Filler4
    ,ltrim(rtrim(Filler5 ))            as Filler5
    ,ltrim(rtrim(Filler6 ))            as Filler6
    ,ltrim(rtrim(Filler7 ))            as Filler7
    ,ltrim(rtrim(Filler8 ))            as Filler8
    ,ltrim(rtrim(Cardholder_ID ))      as Cardholder_ID
    ,ltrim(rtrim(Last_Name ))          as Last_Name
    ,ltrim(rtrim(First_Name ))         as First_Name
    ,ltrim(rtrim(Middle_Initial ))     as Middle_Initial
    ,ltrim(rtrim(Filler9 ))            as Filler9
    ,ltrim(rtrim(Filler10 ))           as Filler10
    ,ltrim(rtrim(Filler11 ))           as Filler11
    ,ltrim(rtrim(Filler12 ))           as Filler12
    ,ltrim(rtrim(Filler13 ))           as Filler13
    ,ltrim(rtrim(Filler14 ))           as Filler14
	,case when Cardholder_Date_of_Birth is null or Cardholder_Date_of_Birth='' or Cardholder_Date_of_Birth='00000000' then null else cast(ltrim(rtrim(Cardholder_Date_of_Birth )) as date ) end as Cardholder_Date_of_Birth
    ,ltrim(rtrim(Filler15 ))           as Filler15
	,ltrim(rtrim(Filler16 ))           as Filler16
    ,ltrim(rtrim(Filler17 ))           as Filler17
    ,ltrim(rtrim(Filler18 ))           as Filler18
    ,ltrim(rtrim(Filler19 ))           as Filler19
    ,ltrim(rtrim(Patient_Last_Name ))  as Patient_Last_Name
    ,ltrim(rtrim(Patient_First_Name )) as Patient_First_Name
    ,ltrim(rtrim(Patient_Middle_Initial )) as Patient_Middle_Initial
    ,ltrim(rtrim(Filler20 ))           as Filler20
    ,ltrim(rtrim(Filler21 ))         as Filler21
    ,ltrim(rtrim(Filler22 ))         as Filler22
    ,ltrim(rtrim(Filler23 ))          as Filler23
    ,ltrim(rtrim(Filler24 ))          as Filler24
    ,ltrim(rtrim(Filler25 ))          as Filler25
	,case when Patient_Date_of_Birth is null or Patient_Date_of_Birth='' then null else cast(ltrim(rtrim(Patient_Date_of_Birth)) as date ) end as Patient_Date_of_Birth
    ,ltrim(rtrim(Patient_Gender_Code )) as Patient_Gender_Code
    ,ltrim(rtrim(Eligibililty_Patient_Relationship_Code )) as Eligibililty_Patient_Relationship_Code
    ,ltrim(rtrim(Patient_Age ))        as Patient_Age
    ,ltrim(rtrim(Filler26    ))        as Filler26
    ,ltrim(rtrim(Filler27    ))         as Filler27
    ,ltrim(rtrim(Filler28    ))          as Filler28
    ,ltrim(rtrim(Filler29    ))        as Filler29
    ,ltrim(rtrim(Group_ID    ))      as Group_ID
    ,ltrim(rtrim(Carrier_Number  )) as Carrier_Number
    ,ltrim(rtrim(Policy_Number  )) as Policy_Number
    ,ltrim(rtrim(Billing_Account_Number )) as Billing_Account_Number
    ,ltrim(rtrim(Filler30 )) as Filler30
    ,ltrim(rtrim(Filler31 )) as Filler31
    ,ltrim(rtrim(Filler32 )) as Filler32
    ,ltrim(rtrim(Filler33 )) as Filler33
    ,ltrim(rtrim(Filler34 )) as Filler34
    ,ltrim(rtrim(Copay_Modifier_ID )) as Copay_Modifier_ID
    ,ltrim(rtrim(Filler35 )) as Filler35
    ,ltrim(rtrim(Filler36 )) as Filler36
    ,ltrim(rtrim(Other_Coverage_Code )) as Other_Coverage_Code
    ,ltrim(rtrim(Filler37 )) as Filler37
    ,ltrim(rtrim(Filler38 )) as Filler38
    ,ltrim(rtrim(Service_Provider_ID_Qualifier )) as Service_Provider_ID_Qualifier
    ,ltrim(rtrim(Service_Provider_ID )) as Service_Provider_ID
    ,ltrim(rtrim(Filler39 )) as Filler39
    ,ltrim(rtrim(Filler40 )) as Filler40
    ,ltrim(rtrim(Filler41 )) as Filler41
    ,ltrim(rtrim(Pharmacy_Name )) as Pharmacy_Name
    ,ltrim(rtrim(Pharmacy_Address_Line_1 )) as Pharmacy_Address_Line_1
    ,ltrim(rtrim(Pharmacy_Address_Line_2 )) as Pharmacy_Address_Line_2
    ,ltrim(rtrim(City )) as City
    ,ltrim(rtrim(State )) as State
    ,ltrim(rtrim(Zip )) as Zip
    ,ltrim(rtrim(Filler42 )) as Filler42
    ,ltrim(rtrim(Pharmacy_Telephone_Number )) as Pharmacy_Telephone_Number
    ,ltrim(rtrim(Pharmacy_Dispenser_Type )) as Pharmacy_Dispenser_Type
    ,ltrim(rtrim(Filler43 )) as Filler43
    ,ltrim(rtrim(Filler44 )) as Filler44
    ,ltrim(rtrim(Network_Reimbursement_ID )) as Network_Reimbursement_ID
    ,ltrim(rtrim(Prescriber_ID_Qualifier )) as Prescriber_ID_Qualifier
    ,ltrim(rtrim(Prescriber_ID )) as Prescriber_ID
    ,ltrim(rtrim(Filler45 )) as Filler45
    ,ltrim(rtrim(Filler46 )) as Filler46
    ,ltrim(rtrim(Filler47 )) as Filler47
    ,ltrim(rtrim(Filler48 )) as Filler48
    ,ltrim(rtrim(Filler49 )) as Filler49
    ,ltrim(rtrim(Prescriber_Last_Name )) as Prescriber_Last_Name
    ,ltrim(rtrim(Prescriber_First_Name )) as Prescriber_First_Name
    ,ltrim(rtrim(Filler50 )) as Filler50
    ,ltrim(rtrim(Filler51 )) as Filler51
    ,ltrim(rtrim(Filler52 )) as Filler52
    ,ltrim(rtrim(Filler53 )) as Filler53
    ,ltrim(rtrim(Filler54 )) as Filler54
    ,ltrim(rtrim(Filler55 )) as Filler55
    ,ltrim(rtrim(Record_Status_Code )) as Record_Status_Code
    ,ltrim(rtrim(Claim_Media_Type )) as Claim_Media_Type
    ,ltrim(rtrim(Processor_Payment_Clarification_Code )) as Processor_Payment_Clarification_Code
    ,ltrim(rtrim(Prescription_Service_Reference_Number_Qualifier )) as Prescription_Service_Reference_Number_Qualifier
    ,ltrim(rtrim(PrescriberService_Reference_Number_Rx_Number )) as PrescriberService_Reference_Number_Rx_Number
    ,ltrim(rtrim(ProductService_ID_Qualifier )) as ProductService_ID_Qualifier
    ,ltrim(rtrim(ProductService_ID )) as ProductService_ID
	,case when Date_of_Service is null or Date_of_Service='' then null else cast(ltrim(rtrim(Date_of_Service )) as date ) end as Date_of_Service
    ,case when Adjudication_Date is null or Adjudication_Date='' then null else cast(ltrim(rtrim(Adjudication_Date )) as date ) end as Adjudication_Date
    ,ltrim(rtrim(Filler56 )) as Filler56
    ,ltrim(rtrim(Filler57 )) as Filler57
    ,ltrim(rtrim(Filler58 )) as Filler58
	,case when Billing_Cycle_End_Date is null or Billing_Cycle_End_Date='' then null else cast(ltrim(rtrim(Billing_Cycle_End_Date)) as date ) end as Billing_Cycle_End_Date
    ,ltrim(rtrim(Filler59)) as Filler59
    ,ltrim(rtrim(Filler60)) as Filler60
    ,ltrim(rtrim(Filler61)) as Filler61
    ,ltrim(rtrim(Filler62)) as Filler62
    ,ltrim(rtrim(Filler63)) as Filler63
    ,ltrim(rtrim(Filler64)) as Filler64
    ,ltrim(rtrim(Filler65)) as Filler65
    ,ltrim(rtrim(Filler66)) as Filler66
    ,ltrim(rtrim(Filler67)) as Filler67
    ,ltrim(rtrim(Filler68)) as Filler68
    ,ltrim(rtrim(Filler69 )) as Filler69
	
  	,cast(case when right(Quantity_Dispensed,1)='{' then replace(Quantity_Dispensed,right(Quantity_Dispensed,1),0)
			when right(Quantity_Dispensed,1)='A' then replace(Quantity_Dispensed,right(Quantity_Dispensed,1),1)
			when right(Quantity_Dispensed,1)='B' then replace(Quantity_Dispensed,right(Quantity_Dispensed,1),2)
			when right(Quantity_Dispensed,1)='C' then replace(Quantity_Dispensed,right(Quantity_Dispensed,1),3)
			when right(Quantity_Dispensed,1)='D' then replace(Quantity_Dispensed,right(Quantity_Dispensed,1),4)
			when right(Quantity_Dispensed,1)='E' then replace(Quantity_Dispensed,right(Quantity_Dispensed,1),5)
			when right(Quantity_Dispensed,1)='F' then replace(Quantity_Dispensed,right(Quantity_Dispensed,1),6)
			when right(Quantity_Dispensed,1)='G' then replace(Quantity_Dispensed,right(Quantity_Dispensed,1),7)
			when right(Quantity_Dispensed,1)='H' then replace(Quantity_Dispensed,right(Quantity_Dispensed,1),8)
			when right(Quantity_Dispensed,1)='I' then replace(Quantity_Dispensed,right(Quantity_Dispensed,1),9)
			when right(Quantity_Dispensed,1)='}' then '-' + replace(Quantity_Dispensed,right(Quantity_Dispensed,1),0)
			when right(Quantity_Dispensed,1)='J' then '-' + replace(Quantity_Dispensed,right(Quantity_Dispensed,1),1)
			when right(Quantity_Dispensed,1)='K' then '-' + replace(Quantity_Dispensed,right(Quantity_Dispensed,1),2)
			when right(Quantity_Dispensed,1)='L' then '-' + replace(Quantity_Dispensed,right(Quantity_Dispensed,1),3)
			when right(Quantity_Dispensed,1)='M' then '-' + replace(Quantity_Dispensed,right(Quantity_Dispensed,1),4)
			when right(Quantity_Dispensed,1)='N' then '-' + replace(Quantity_Dispensed,right(Quantity_Dispensed,1),5)
			when right(Quantity_Dispensed,1)='O' then '-' + replace(Quantity_Dispensed,right(Quantity_Dispensed,1),6)
			when right(Quantity_Dispensed,1)='P' then '-' + replace(Quantity_Dispensed,right(Quantity_Dispensed,1),7)
			when right(Quantity_Dispensed,1)='Q' then '-' + replace(Quantity_Dispensed,right(Quantity_Dispensed,1),8)
			when right(Quantity_Dispensed,1)='R' then '-' + replace(Quantity_Dispensed,right(Quantity_Dispensed,1),9)
		else Quantity_Dispensed end as numeric(18,2) )as Quantity_Dispensed 
   
	,ltrim(rtrim(Fill_Number)) as Fill_Number
    ,ltrim(rtrim(Days_Supply)) as Days_Supply
	,case when Date_Prescription_Written is null or Date_Prescription_Written='' or Date_Prescription_Written='00000000' then null else cast(ltrim(rtrim(Date_Prescription_Written)) as date ) end as Date_Prescription_Written
    ,ltrim(rtrim(Dispense_as_Written_Product_Selection_Code)) as Dispense_as_Written_Product_Selection_Code
    ,ltrim(rtrim(Number_of_Refills_Authorized)) as Number_of_Refills_Authorized
    ,ltrim(rtrim(Filler70)) as Filler70
    ,ltrim(rtrim(Unit_of_Measure)) as Unit_of_Measure
    ,ltrim(rtrim(Filler71)) as Filler71
    ,ltrim(rtrim(Filler72)) as Filler72
    ,ltrim(rtrim(Original_Quantity)) as Original_Quantity
    ,ltrim(rtrim(Filler73)) as Filler73
    ,ltrim(rtrim(Original_Day_Supply)) as Original_Day_Supply
    ,ltrim(rtrim(Filler74)) as Filler74
    ,ltrim(rtrim(Compound_Code)) as Compound_Code
    ,ltrim(rtrim(Filler75)) as Filler75
    ,ltrim(rtrim(Filler76)) as Filler76
    ,ltrim(rtrim(Filler77)) as Filler77
    ,ltrim(rtrim(Filler78)) as Filler78
    ,ltrim(rtrim(Filler79)) as Filler79
    ,ltrim(rtrim(Filler80)) as Filler80
    ,ltrim(rtrim(Filler81)) as Filler81
    ,ltrim(rtrim(Filler82)) as Filler82
    ,ltrim(rtrim(Filler83)) as Filler83
    ,ltrim(rtrim(Filler84)) as Filler84
    ,ltrim(rtrim(Filler85)) as Filler85
    ,ltrim(rtrim(Filler86)) as Filler86
    ,ltrim(rtrim(Filler87)) as Filler87
    ,ltrim(rtrim(Filler88)) as Filler88
    ,ltrim(rtrim(Filler89)) as Filler89
    ,ltrim(rtrim(Filler90)) as Filler90
    ,ltrim(rtrim(Filler91)) as Filler91
    ,ltrim(rtrim(Filler92)) as Filler92
    ,ltrim(rtrim(Filler93)) as Filler93
    ,ltrim(rtrim(Filler94)) as Filler94
    ,ltrim(rtrim(Filler95)) as Filler95
    ,ltrim(rtrim(Filler96)) as Filler96
    ,ltrim(rtrim(Filler97)) as Filler97
    ,ltrim(rtrim(Filler98)) as Filler98
    ,ltrim(rtrim(Filler99)) as Filler99
    ,ltrim(rtrim(Filler100)) as Filler100
    ,ltrim(rtrim(Filler101)) as Filler101
    ,ltrim(rtrim(Filler102)) as Filler102
    ,ltrim(rtrim(Filler103)) as Filler103
    ,ltrim(rtrim(Filler104)) as Filler104
    ,ltrim(rtrim(Filler105)) as Filler105
    ,ltrim(rtrim(Filler106)) as Filler106
    ,ltrim(rtrim(Filler107)) as Filler107
    ,ltrim(rtrim(Filler108)) as Filler108
    ,ltrim(rtrim(Filler109)) as Filler109
    ,ltrim(rtrim(Filler110)) as Filler110
    ,ltrim(rtrim(Filler111)) as Filler111
    ,ltrim(rtrim(Filler112)) as Filler112
    ,ltrim(rtrim(Filler113)) as Filler113
    ,ltrim(rtrim(Filler114)) as Filler114
    ,ltrim(rtrim(Filler115)) as Filler115
    ,ltrim(rtrim(Filler116)) as Filler116
    ,ltrim(rtrim(Filler117)) as Filler117
    ,ltrim(rtrim(Filler118)) as Filler118
    ,ltrim(rtrim(Filler119)) as Filler119
    ,ltrim(rtrim(Filler120)) as Filler120
    ,ltrim(rtrim(Filler121)) as Filler121
    ,ltrim(rtrim(Filler122)) as Filler122
    ,ltrim(rtrim(Filler123)) as Filler123
    ,ltrim(rtrim(Filler124)) as Filler124
    ,ltrim(rtrim(Reject_Code_1)) as Reject_Code_1
    ,ltrim(rtrim(Reject_Code_2)) as Reject_Code_2
    ,ltrim(rtrim(Reject_Code_3)) as Reject_Code_3
    ,ltrim(rtrim(Filler125)) as Filler125
    ,ltrim(rtrim(Filler126)) as Filler126
    ,ltrim(rtrim(Filler127)) as Filler127
    ,ltrim(rtrim(Filler128)) as Filler128
    ,ltrim(rtrim(Database_Indicator)) as Database_Indicator
    ,ltrim(rtrim(ProductService_Name)) as ProductService_Name
    ,ltrim(rtrim(Generic_Name)) as Generic_Name
    ,ltrim(rtrim(Product_Strength)) as Product_Strength
    ,ltrim(rtrim(Dosage_Form_Code)) as Dosage_Form_Code
    ,ltrim(rtrim(Filler129)) as Filler129
    ,ltrim(rtrim(Filler130)) as Filler130
    ,ltrim(rtrim(Drug_Type)) as Drug_Type
    ,ltrim(rtrim(Maintenance_Drug_Indicator)) as Maintenance_Drug_Indicator
    ,ltrim(rtrim(Drug_Category_Code)) as Drug_Category_Code
    ,ltrim(rtrim(Filler131)) as Filler131
    ,ltrim(rtrim(Filler132)) as Filler132
    ,ltrim(rtrim(Submission_Clarification_Code)) as Submission_Clarification_Code
    ,ltrim(rtrim(Filler133)) as Filler133
    ,ltrim(rtrim(Filler134)) as Filler134
    ,ltrim(rtrim(Filler135)) as Filler135
    ,ltrim(rtrim(GCN_Number)) as GCN_Number
    ,ltrim(rtrim(Universal_System_Classification)) as Universal_System_Classification
    ,ltrim(rtrim(Generic_Product_Identifier)) as Generic_Product_Identifier
    ,ltrim(rtrim(Filler136)) as Filler136
    ,ltrim(rtrim(Filler137)) as Filler137
    ,ltrim(rtrim(Filler138)) as Filler138
    ,ltrim(rtrim(Filler139)) as Filler139
    ,ltrim(rtrim(Filler140)) as Filler140
    ,ltrim(rtrim(Therapeutic_Class_Code_AHFS)) as Therapeutic_Class_Code_AHFS
    ,ltrim(rtrim(Formulary_Status)) as Formulary_Status
    ,ltrim(rtrim(Filler141)) as Filler141
    ,ltrim(rtrim(Filler142)) as Filler142
    ,ltrim(rtrim(Filler143)) as Filler143
    ,ltrim(rtrim(Filler144)) as Filler144,
	
	cast (case when right(Ingredient_Cost_Paid,1)='{' then replace(Ingredient_Cost_Paid,right(Ingredient_Cost_Paid,1),0)
			when right(Ingredient_Cost_Paid,1)='A' then replace(Ingredient_Cost_Paid,right(Ingredient_Cost_Paid,1),1)
			when right(Ingredient_Cost_Paid,1)='B' then replace(Ingredient_Cost_Paid,right(Ingredient_Cost_Paid,1),2)
			when right(Ingredient_Cost_Paid,1)='C' then replace(Ingredient_Cost_Paid,right(Ingredient_Cost_Paid,1),3)
			when right(Ingredient_Cost_Paid,1)='D' then replace(Ingredient_Cost_Paid,right(Ingredient_Cost_Paid,1),4)
			when right(Ingredient_Cost_Paid,1)='E' then replace(Ingredient_Cost_Paid,right(Ingredient_Cost_Paid,1),5)
			when right(Ingredient_Cost_Paid,1)='F' then replace(Ingredient_Cost_Paid,right(Ingredient_Cost_Paid,1),6)
			when right(Ingredient_Cost_Paid,1)='G' then replace(Ingredient_Cost_Paid,right(Ingredient_Cost_Paid,1),7)
			when right(Ingredient_Cost_Paid,1)='H' then replace(Ingredient_Cost_Paid,right(Ingredient_Cost_Paid,1),8)
			when right(Ingredient_Cost_Paid,1)='I' then replace(Ingredient_Cost_Paid,right(Ingredient_Cost_Paid,1),9)
			when right(Ingredient_Cost_Paid,1)='}' then '-' + replace(Ingredient_Cost_Paid,right(Ingredient_Cost_Paid,1),0)
			when right(Ingredient_Cost_Paid,1)='J' then '-' + replace(Ingredient_Cost_Paid,right(Ingredient_Cost_Paid,1),1)
			when right(Ingredient_Cost_Paid,1)='K' then '-' + replace(Ingredient_Cost_Paid,right(Ingredient_Cost_Paid,1),2)
			when right(Ingredient_Cost_Paid,1)='L' then '-' + replace(Ingredient_Cost_Paid,right(Ingredient_Cost_Paid,1),3)
			when right(Ingredient_Cost_Paid,1)='M' then '-' + replace(Ingredient_Cost_Paid,right(Ingredient_Cost_Paid,1),4)
			when right(Ingredient_Cost_Paid,1)='N' then '-' + replace(Ingredient_Cost_Paid,right(Ingredient_Cost_Paid,1),5)
			when right(Ingredient_Cost_Paid,1)='O' then '-' + replace(Ingredient_Cost_Paid,right(Ingredient_Cost_Paid,1),6)
			when right(Ingredient_Cost_Paid,1)='P' then '-' + replace(Ingredient_Cost_Paid,right(Ingredient_Cost_Paid,1),7)
			when right(Ingredient_Cost_Paid,1)='Q' then '-' + replace(Ingredient_Cost_Paid,right(Ingredient_Cost_Paid,1),8)
			when right(Ingredient_Cost_Paid,1)='R' then '-' + replace(Ingredient_Cost_Paid,right(Ingredient_Cost_Paid,1),9)
		when Ingredient_Cost_Paid is null or Ingredient_Cost_Paid='' then '0.0'
		else Ingredient_Cost_Paid end as numeric(18,2) )as Ingredient_Cost_Paid,
		--case when isnumeric(dbo.overpunch(Dispensing_Fee_Paid))=1 then cast(dbo.overpunch(Dispensing_Fee_Paid) as money)  else '0.00' end as Dispensing_Fee_Paid,
		cast (case when right(Dispensing_Fee_Paid,1)='{' then replace(Dispensing_Fee_Paid,right(Dispensing_Fee_Paid,1),0)
			when right(Dispensing_Fee_Paid,1)='A' then replace(Dispensing_Fee_Paid,right(Dispensing_Fee_Paid,1),1)
			when right(Dispensing_Fee_Paid,1)='B' then replace(Dispensing_Fee_Paid,right(Dispensing_Fee_Paid,1),2)
			when right(Dispensing_Fee_Paid,1)='C' then replace(Dispensing_Fee_Paid,right(Dispensing_Fee_Paid,1),3)
			when right(Dispensing_Fee_Paid,1)='D' then replace(Dispensing_Fee_Paid,right(Dispensing_Fee_Paid,1),4)
			when right(Dispensing_Fee_Paid,1)='E' then replace(Dispensing_Fee_Paid,right(Dispensing_Fee_Paid,1),5)
			when right(Dispensing_Fee_Paid,1)='F' then replace(Dispensing_Fee_Paid,right(Dispensing_Fee_Paid,1),6)
			when right(Dispensing_Fee_Paid,1)='G' then replace(Dispensing_Fee_Paid,right(Dispensing_Fee_Paid,1),7)
			when right(Dispensing_Fee_Paid,1)='H' then replace(Dispensing_Fee_Paid,right(Dispensing_Fee_Paid,1),8)
			when right(Dispensing_Fee_Paid,1)='I' then replace(Dispensing_Fee_Paid,right(Dispensing_Fee_Paid,1),9)
			when right(Dispensing_Fee_Paid,1)='}' then '-' + replace(Dispensing_Fee_Paid,right(Dispensing_Fee_Paid,1),0)
			when right(Dispensing_Fee_Paid,1)='J' then '-' + replace(Dispensing_Fee_Paid,right(Dispensing_Fee_Paid,1),1)
			when right(Dispensing_Fee_Paid,1)='K' then '-' + replace(Dispensing_Fee_Paid,right(Dispensing_Fee_Paid,1),2)
			when right(Dispensing_Fee_Paid,1)='L' then '-' + replace(Dispensing_Fee_Paid,right(Dispensing_Fee_Paid,1),3)
			when right(Dispensing_Fee_Paid,1)='M' then '-' + replace(Dispensing_Fee_Paid,right(Dispensing_Fee_Paid,1),4)
			when right(Dispensing_Fee_Paid,1)='N' then '-' + replace(Dispensing_Fee_Paid,right(Dispensing_Fee_Paid,1),5)
			when right(Dispensing_Fee_Paid,1)='O' then '-' + replace(Dispensing_Fee_Paid,right(Dispensing_Fee_Paid,1),6)
			when right(Dispensing_Fee_Paid,1)='P' then '-' + replace(Dispensing_Fee_Paid,right(Dispensing_Fee_Paid,1),7)
			when right(Dispensing_Fee_Paid,1)='Q' then '-' + replace(Dispensing_Fee_Paid,right(Dispensing_Fee_Paid,1),8)
			when right(Dispensing_Fee_Paid,1)='R' then '-' + replace(Dispensing_Fee_Paid,right(Dispensing_Fee_Paid,1),9)
		when Dispensing_Fee_Paid is null or Dispensing_Fee_Paid='' then '0.0'
			else Dispensing_Fee_Paid end as numeric(18,2) )as Dispensing_Fee_Paid,
		--case when isnumeric(dbo.overpunch(Total_Amount_Paid_by_all_Sources))=1 then cast(dbo.overpunch(Total_Amount_Paid_by_all_Sources) as money)  else '0.00' end as Total_Amount_Paid_by_all_Sources,
			cast(case when right(Total_Amount_Paid_by_all_Sources,1)='{' then replace(Total_Amount_Paid_by_all_Sources,right(Total_Amount_Paid_by_all_Sources,1),0)
			when right(Total_Amount_Paid_by_all_Sources,1)='A' then replace(Total_Amount_Paid_by_all_Sources,right(Total_Amount_Paid_by_all_Sources,1),1)
			when right(Total_Amount_Paid_by_all_Sources,1)='B' then replace(Total_Amount_Paid_by_all_Sources,right(Total_Amount_Paid_by_all_Sources,1),2)
			when right(Total_Amount_Paid_by_all_Sources,1)='C' then replace(Total_Amount_Paid_by_all_Sources,right(Total_Amount_Paid_by_all_Sources,1),3)
			when right(Total_Amount_Paid_by_all_Sources,1)='D' then replace(Total_Amount_Paid_by_all_Sources,right(Total_Amount_Paid_by_all_Sources,1),4)
			when right(Total_Amount_Paid_by_all_Sources,1)='E' then replace(Total_Amount_Paid_by_all_Sources,right(Total_Amount_Paid_by_all_Sources,1),5)
			when right(Total_Amount_Paid_by_all_Sources,1)='F' then replace(Total_Amount_Paid_by_all_Sources,right(Total_Amount_Paid_by_all_Sources,1),6)
			when right(Total_Amount_Paid_by_all_Sources,1)='G' then replace(Total_Amount_Paid_by_all_Sources,right(Total_Amount_Paid_by_all_Sources,1),7)
			when right(Total_Amount_Paid_by_all_Sources,1)='H' then replace(Total_Amount_Paid_by_all_Sources,right(Total_Amount_Paid_by_all_Sources,1),8)
			when right(Total_Amount_Paid_by_all_Sources,1)='I' then replace(Total_Amount_Paid_by_all_Sources,right(Total_Amount_Paid_by_all_Sources,1),9)
			when right(Total_Amount_Paid_by_all_Sources,1)='}' then '-' + replace(Total_Amount_Paid_by_all_Sources,right(Total_Amount_Paid_by_all_Sources,1),0)
			when right(Total_Amount_Paid_by_all_Sources,1)='J' then '-' + replace(Total_Amount_Paid_by_all_Sources,right(Total_Amount_Paid_by_all_Sources,1),1)
			when right(Total_Amount_Paid_by_all_Sources,1)='K' then '-' + replace(Total_Amount_Paid_by_all_Sources,right(Total_Amount_Paid_by_all_Sources,1),2)
			when right(Total_Amount_Paid_by_all_Sources,1)='L' then '-' + replace(Total_Amount_Paid_by_all_Sources,right(Total_Amount_Paid_by_all_Sources,1),3)
			when right(Total_Amount_Paid_by_all_Sources,1)='M' then '-' + replace(Total_Amount_Paid_by_all_Sources,right(Total_Amount_Paid_by_all_Sources,1),4)
			when right(Total_Amount_Paid_by_all_Sources,1)='N' then '-' + replace(Total_Amount_Paid_by_all_Sources,right(Total_Amount_Paid_by_all_Sources,1),5)
			when right(Total_Amount_Paid_by_all_Sources,1)='O' then '-' + replace(Total_Amount_Paid_by_all_Sources,right(Total_Amount_Paid_by_all_Sources,1),6)
			when right(Total_Amount_Paid_by_all_Sources,1)='P' then '-' + replace(Total_Amount_Paid_by_all_Sources,right(Total_Amount_Paid_by_all_Sources,1),7)
			when right(Total_Amount_Paid_by_all_Sources,1)='Q' then '-' + replace(Total_Amount_Paid_by_all_Sources,right(Total_Amount_Paid_by_all_Sources,1),8)
			when right(Total_Amount_Paid_by_all_Sources,1)='R' then '-' + replace(Total_Amount_Paid_by_all_Sources,right(Total_Amount_Paid_by_all_Sources,1),9)
	when Total_Amount_Paid_by_all_Sources is null or Total_Amount_Paid_by_all_Sources='' then '0.0'
		else Total_Amount_Paid_by_all_Sources end as numeric(18,2) )as Total_Amount_Paid_by_all_Sources,
		
		--case when isnumeric(dbo.overpunch(Amount_Attributed_To_Sales_Tax))=1 then cast(dbo.overpunch(Amount_Attributed_To_Sales_Tax) as money)  else '0.00' end as Amount_Attributed_To_Sales_Tax,
			cast (case when right(Amount_Attributed_To_Sales_Tax,1)='{' then replace(Amount_Attributed_To_Sales_Tax,right(Amount_Attributed_To_Sales_Tax,1),0)
			when right(Amount_Attributed_To_Sales_Tax,1)='A' then replace(Amount_Attributed_To_Sales_Tax,right(Amount_Attributed_To_Sales_Tax,1),1)
			when right(Amount_Attributed_To_Sales_Tax,1)='B' then replace(Amount_Attributed_To_Sales_Tax,right(Amount_Attributed_To_Sales_Tax,1),2)
			when right(Amount_Attributed_To_Sales_Tax,1)='C' then replace(Amount_Attributed_To_Sales_Tax,right(Amount_Attributed_To_Sales_Tax,1),3)
			when right(Amount_Attributed_To_Sales_Tax,1)='D' then replace(Amount_Attributed_To_Sales_Tax,right(Amount_Attributed_To_Sales_Tax,1),4)
			when right(Amount_Attributed_To_Sales_Tax,1)='E' then replace(Amount_Attributed_To_Sales_Tax,right(Amount_Attributed_To_Sales_Tax,1),5)
			when right(Amount_Attributed_To_Sales_Tax,1)='F' then replace(Amount_Attributed_To_Sales_Tax,right(Amount_Attributed_To_Sales_Tax,1),6)
			when right(Amount_Attributed_To_Sales_Tax,1)='G' then replace(Amount_Attributed_To_Sales_Tax,right(Amount_Attributed_To_Sales_Tax,1),7)
			when right(Amount_Attributed_To_Sales_Tax,1)='H' then replace(Amount_Attributed_To_Sales_Tax,right(Amount_Attributed_To_Sales_Tax,1),8)
			when right(Amount_Attributed_To_Sales_Tax,1)='I' then replace(Amount_Attributed_To_Sales_Tax,right(Amount_Attributed_To_Sales_Tax,1),9)
			when right(Amount_Attributed_To_Sales_Tax,1)='}' then '-' + replace(Amount_Attributed_To_Sales_Tax,right(Amount_Attributed_To_Sales_Tax,1),0)
			when right(Amount_Attributed_To_Sales_Tax,1)='J' then '-' + replace(Amount_Attributed_To_Sales_Tax,right(Amount_Attributed_To_Sales_Tax,1),1)
			when right(Amount_Attributed_To_Sales_Tax,1)='K' then '-' + replace(Amount_Attributed_To_Sales_Tax,right(Amount_Attributed_To_Sales_Tax,1),2)
			when right(Amount_Attributed_To_Sales_Tax,1)='L' then '-' + replace(Amount_Attributed_To_Sales_Tax,right(Amount_Attributed_To_Sales_Tax,1),3)
			when right(Amount_Attributed_To_Sales_Tax,1)='M' then '-' + replace(Amount_Attributed_To_Sales_Tax,right(Amount_Attributed_To_Sales_Tax,1),4)
			when right(Amount_Attributed_To_Sales_Tax,1)='N' then '-' + replace(Amount_Attributed_To_Sales_Tax,right(Amount_Attributed_To_Sales_Tax,1),5)
			when right(Amount_Attributed_To_Sales_Tax,1)='O' then '-' + replace(Amount_Attributed_To_Sales_Tax,right(Amount_Attributed_To_Sales_Tax,1),6)
			when right(Amount_Attributed_To_Sales_Tax,1)='P' then '-' + replace(Amount_Attributed_To_Sales_Tax,right(Amount_Attributed_To_Sales_Tax,1),7)
			when right(Amount_Attributed_To_Sales_Tax,1)='Q' then '-' + replace(Amount_Attributed_To_Sales_Tax,right(Amount_Attributed_To_Sales_Tax,1),8)
			when right(Amount_Attributed_To_Sales_Tax,1)='R' then '-' + replace(Amount_Attributed_To_Sales_Tax,right(Amount_Attributed_To_Sales_Tax,1),9)
	when Amount_Attributed_To_Sales_Tax is null or Amount_Attributed_To_Sales_Tax='' then '0.0'
		else Amount_Attributed_To_Sales_Tax end as numeric(18,2) )as Amount_Attributed_To_Sales_Tax,
		
		--case when isnumeric(dbo.overpunch(Patient_Pay_Amount))=1 then cast(dbo.overpunch(Patient_Pay_Amount) as money)  else '0.00' end as Patient_Pay_Amount,
		
		cast (case when right(Patient_Pay_Amount,1)='{' then replace(Patient_Pay_Amount,right(Patient_Pay_Amount,1),0)
			when right(Patient_Pay_Amount,1)='A' then replace(Patient_Pay_Amount,right(Patient_Pay_Amount,1),1)
			when right(Patient_Pay_Amount,1)='B' then replace(Patient_Pay_Amount,right(Patient_Pay_Amount,1),2)
			when right(Patient_Pay_Amount,1)='C' then replace(Patient_Pay_Amount,right(Patient_Pay_Amount,1),3)
			when right(Patient_Pay_Amount,1)='D' then replace(Patient_Pay_Amount,right(Patient_Pay_Amount,1),4)
			when right(Patient_Pay_Amount,1)='E' then replace(Patient_Pay_Amount,right(Patient_Pay_Amount,1),5)
			when right(Patient_Pay_Amount,1)='F' then replace(Patient_Pay_Amount,right(Patient_Pay_Amount,1),6)
			when right(Patient_Pay_Amount,1)='G' then replace(Patient_Pay_Amount,right(Patient_Pay_Amount,1),7)
			when right(Patient_Pay_Amount,1)='H' then replace(Patient_Pay_Amount,right(Patient_Pay_Amount,1),8)
			when right(Patient_Pay_Amount,1)='I' then replace(Patient_Pay_Amount,right(Patient_Pay_Amount,1),9)
			when right(Patient_Pay_Amount,1)='}' then '-' + replace(Patient_Pay_Amount,right(Patient_Pay_Amount,1),0)
			when right(Patient_Pay_Amount,1)='J' then '-' + replace(Patient_Pay_Amount,right(Patient_Pay_Amount,1),1)
			when right(Patient_Pay_Amount,1)='K' then '-' + replace(Patient_Pay_Amount,right(Patient_Pay_Amount,1),2)
			when right(Patient_Pay_Amount,1)='L' then '-' + replace(Patient_Pay_Amount,right(Patient_Pay_Amount,1),3)
			when right(Patient_Pay_Amount,1)='M' then '-' + replace(Patient_Pay_Amount,right(Patient_Pay_Amount,1),4)
			when right(Patient_Pay_Amount,1)='N' then '-' + replace(Patient_Pay_Amount,right(Patient_Pay_Amount,1),5)
			when right(Patient_Pay_Amount,1)='O' then '-' + replace(Patient_Pay_Amount,right(Patient_Pay_Amount,1),6)
			when right(Patient_Pay_Amount,1)='P' then '-' + replace(Patient_Pay_Amount,right(Patient_Pay_Amount,1),7)
			when right(Patient_Pay_Amount,1)='Q' then '-' + replace(Patient_Pay_Amount,right(Patient_Pay_Amount,1),8)
			when right(Patient_Pay_Amount,1)='R' then '-' + replace(Patient_Pay_Amount,right(Patient_Pay_Amount,1),9)
		when Patient_Pay_Amount is null or Patient_Pay_Amount='' then '0.0'
		else Patient_Pay_Amount end as numeric(18,2) )as Patient_Pay_Amount,
		
		--case when isnumeric(dbo.overpunch(Amount_of_Copay))=1 then cast(dbo.overpunch(Amount_of_Copay) as money)  else '0.00' end as Amount_of_Copay,
		
		cast(case when right(Amount_of_Copay,1)='{' then replace(Amount_of_Copay,right(Amount_of_Copay,1),0)
			when right(Amount_of_Copay,1)='A' then replace(Amount_of_Copay,right(Amount_of_Copay,1),1)
			when right(Amount_of_Copay,1)='B' then replace(Amount_of_Copay,right(Amount_of_Copay,1),2)
			when right(Amount_of_Copay,1)='C' then replace(Amount_of_Copay,right(Amount_of_Copay,1),3)
			when right(Amount_of_Copay,1)='D' then replace(Amount_of_Copay,right(Amount_of_Copay,1),4)
			when right(Amount_of_Copay,1)='E' then replace(Amount_of_Copay,right(Amount_of_Copay,1),5)
			when right(Amount_of_Copay,1)='F' then replace(Amount_of_Copay,right(Amount_of_Copay,1),6)
			when right(Amount_of_Copay,1)='G' then replace(Amount_of_Copay,right(Amount_of_Copay,1),7)
			when right(Amount_of_Copay,1)='H' then replace(Amount_of_Copay,right(Amount_of_Copay,1),8)
			when right(Amount_of_Copay,1)='I' then replace(Amount_of_Copay,right(Amount_of_Copay,1),9)
			when right(Amount_of_Copay,1)='}' then '-' + replace(Amount_of_Copay,right(Amount_of_Copay,1),0)
			when right(Amount_of_Copay,1)='J' then '-' + replace(Amount_of_Copay,right(Amount_of_Copay,1),1)
			when right(Amount_of_Copay,1)='K' then '-' + replace(Amount_of_Copay,right(Amount_of_Copay,1),2)
			when right(Amount_of_Copay,1)='L' then '-' + replace(Amount_of_Copay,right(Amount_of_Copay,1),3)
			when right(Amount_of_Copay,1)='M' then '-' + replace(Amount_of_Copay,right(Amount_of_Copay,1),4)
			when right(Amount_of_Copay,1)='N' then '-' + replace(Amount_of_Copay,right(Amount_of_Copay,1),5)
			when right(Amount_of_Copay,1)='O' then '-' + replace(Amount_of_Copay,right(Amount_of_Copay,1),6)
			when right(Amount_of_Copay,1)='P' then '-' + replace(Amount_of_Copay,right(Amount_of_Copay,1),7)
			when right(Amount_of_Copay,1)='Q' then '-' + replace(Amount_of_Copay,right(Amount_of_Copay,1),8)
			when right(Amount_of_Copay,1)='R' then '-' + replace(Amount_of_Copay,right(Amount_of_Copay,1),9)
	when Amount_of_Copay is null or Amount_of_Copay='' then '0.0'
		else Amount_of_Copay end as numeric(18,2) )as Amount_of_Copay,
		
		---case when isnumeric(dbo.overpunch(Amount_of_Coinsurance))=1 then cast(dbo.overpunch(Amount_of_Coinsurance) as money)  else '0.00' end as Amount_of_Coinsurance,
		
		cast (case when right(Amount_of_Coinsurance,1)='{' then replace(Amount_of_Coinsurance,right(Amount_of_Coinsurance,1),0)
			when right(Amount_of_Coinsurance,1)='A' then replace(Amount_of_Coinsurance,right(Amount_of_Coinsurance,1),1)
			when right(Amount_of_Coinsurance,1)='B' then replace(Amount_of_Coinsurance,right(Amount_of_Coinsurance,1),2)
			when right(Amount_of_Coinsurance,1)='C' then replace(Amount_of_Coinsurance,right(Amount_of_Coinsurance,1),3)
			when right(Amount_of_Coinsurance,1)='D' then replace(Amount_of_Coinsurance,right(Amount_of_Coinsurance,1),4)
			when right(Amount_of_Coinsurance,1)='E' then replace(Amount_of_Coinsurance,right(Amount_of_Coinsurance,1),5)
			when right(Amount_of_Coinsurance,1)='F' then replace(Amount_of_Coinsurance,right(Amount_of_Coinsurance,1),6)
			when right(Amount_of_Coinsurance,1)='G' then replace(Amount_of_Coinsurance,right(Amount_of_Coinsurance,1),7)
			when right(Amount_of_Coinsurance,1)='H' then replace(Amount_of_Coinsurance,right(Amount_of_Coinsurance,1),8)
			when right(Amount_of_Coinsurance,1)='I' then replace(Amount_of_Coinsurance,right(Amount_of_Coinsurance,1),9)
			when right(Amount_of_Coinsurance,1)='}' then '-' + replace(Amount_of_Coinsurance,right(Amount_of_Coinsurance,1),0)
			when right(Amount_of_Coinsurance,1)='J' then '-' + replace(Amount_of_Coinsurance,right(Amount_of_Coinsurance,1),1)
			when right(Amount_of_Coinsurance,1)='K' then '-' + replace(Amount_of_Coinsurance,right(Amount_of_Coinsurance,1),2)
			when right(Amount_of_Coinsurance,1)='L' then '-' + replace(Amount_of_Coinsurance,right(Amount_of_Coinsurance,1),3)
			when right(Amount_of_Coinsurance,1)='M' then '-' + replace(Amount_of_Coinsurance,right(Amount_of_Coinsurance,1),4)
			when right(Amount_of_Coinsurance,1)='N' then '-' + replace(Amount_of_Coinsurance,right(Amount_of_Coinsurance,1),5)
			when right(Amount_of_Coinsurance,1)='O' then '-' + replace(Amount_of_Coinsurance,right(Amount_of_Coinsurance,1),6)
			when right(Amount_of_Coinsurance,1)='P' then '-' + replace(Amount_of_Coinsurance,right(Amount_of_Coinsurance,1),7)
			when right(Amount_of_Coinsurance,1)='Q' then '-' + replace(Amount_of_Coinsurance,right(Amount_of_Coinsurance,1),8)
			when right(Amount_of_Coinsurance,1)='R' then '-' + replace(Amount_of_Coinsurance,right(Amount_of_Coinsurance,1),9)
	when Amount_of_Coinsurance is null or Amount_of_Coinsurance='' then '0.0'
		else Amount_of_Coinsurance end as numeric(18,2) )as Amount_of_Coinsurance,
		
		---case when isnumeric(dbo.overpunch(Amount_Attributed_To_Product_Selection))=1 then cast(dbo.overpunch(Amount_Attributed_To_Product_Selection) as money)  else '0.00' end as Amount_Attributed_To_Product_Selection,
		
		cast (case when right(Amount_Attributed_To_Product_Selection,1)='{' then replace(Amount_Attributed_To_Product_Selection,right(Amount_Attributed_To_Product_Selection,1),0)
			when right(Amount_Attributed_To_Product_Selection,1)='A' then replace(Amount_Attributed_To_Product_Selection,right(Amount_Attributed_To_Product_Selection,1),1)
			when right(Amount_Attributed_To_Product_Selection,1)='B' then replace(Amount_Attributed_To_Product_Selection,right(Amount_Attributed_To_Product_Selection,1),2)
			when right(Amount_Attributed_To_Product_Selection,1)='C' then replace(Amount_Attributed_To_Product_Selection,right(Amount_Attributed_To_Product_Selection,1),3)
			when right(Amount_Attributed_To_Product_Selection,1)='D' then replace(Amount_Attributed_To_Product_Selection,right(Amount_Attributed_To_Product_Selection,1),4)
			when right(Amount_Attributed_To_Product_Selection,1)='E' then replace(Amount_Attributed_To_Product_Selection,right(Amount_Attributed_To_Product_Selection,1),5)
			when right(Amount_Attributed_To_Product_Selection,1)='F' then replace(Amount_Attributed_To_Product_Selection,right(Amount_Attributed_To_Product_Selection,1),6)
			when right(Amount_Attributed_To_Product_Selection,1)='G' then replace(Amount_Attributed_To_Product_Selection,right(Amount_Attributed_To_Product_Selection,1),7)
			when right(Amount_Attributed_To_Product_Selection,1)='H' then replace(Amount_Attributed_To_Product_Selection,right(Amount_Attributed_To_Product_Selection,1),8)
			when right(Amount_Attributed_To_Product_Selection,1)='I' then replace(Amount_Attributed_To_Product_Selection,right(Amount_Attributed_To_Product_Selection,1),9)
			when right(Amount_Attributed_To_Product_Selection,1)='}' then '-' + replace(Amount_Attributed_To_Product_Selection,right(Amount_Attributed_To_Product_Selection,1),0)
			when right(Amount_Attributed_To_Product_Selection,1)='J' then '-' + replace(Amount_Attributed_To_Product_Selection,right(Amount_Attributed_To_Product_Selection,1),1)
			when right(Amount_Attributed_To_Product_Selection,1)='K' then '-' + replace(Amount_Attributed_To_Product_Selection,right(Amount_Attributed_To_Product_Selection,1),2)
			when right(Amount_Attributed_To_Product_Selection,1)='L' then '-' + replace(Amount_Attributed_To_Product_Selection,right(Amount_Attributed_To_Product_Selection,1),3)
			when right(Amount_Attributed_To_Product_Selection,1)='M' then '-' + replace(Amount_Attributed_To_Product_Selection,right(Amount_Attributed_To_Product_Selection,1),4)
			when right(Amount_Attributed_To_Product_Selection,1)='N' then '-' + replace(Amount_Attributed_To_Product_Selection,right(Amount_Attributed_To_Product_Selection,1),5)
			when right(Amount_Attributed_To_Product_Selection,1)='O' then '-' + replace(Amount_Attributed_To_Product_Selection,right(Amount_Attributed_To_Product_Selection,1),6)
			when right(Amount_Attributed_To_Product_Selection,1)='P' then '-' + replace(Amount_Attributed_To_Product_Selection,right(Amount_Attributed_To_Product_Selection,1),7)
			when right(Amount_Attributed_To_Product_Selection,1)='Q' then '-' + replace(Amount_Attributed_To_Product_Selection,right(Amount_Attributed_To_Product_Selection,1),8)
			when right(Amount_Attributed_To_Product_Selection,1)='R' then '-' + replace(Amount_Attributed_To_Product_Selection,right(Amount_Attributed_To_Product_Selection,1),9)
	when Amount_Attributed_To_Product_Selection is null or Amount_Attributed_To_Product_Selection='' then '0.0'
		else Amount_Attributed_To_Product_Selection end as numeric(18,2) )as Amount_Attributed_To_Product_Selection,
		
		--case when isnumeric(dbo.overpunch(Amount_Applied_to_Periodic_Deductible))=1 then cast(dbo.overpunch(Amount_Applied_to_Periodic_Deductible) as money)  else '0.00' end as Amount_Applied_to_Periodic_Deductible,
		
		cast (case when right(Amount_Applied_to_Periodic_Deductible,1)='{' then replace(Amount_Applied_to_Periodic_Deductible,right(Amount_Applied_to_Periodic_Deductible,1),0)
			when right(Amount_Applied_to_Periodic_Deductible,1)='A' then replace(Amount_Applied_to_Periodic_Deductible,right(Amount_Applied_to_Periodic_Deductible,1),1)
			when right(Amount_Applied_to_Periodic_Deductible,1)='B' then replace(Amount_Applied_to_Periodic_Deductible,right(Amount_Applied_to_Periodic_Deductible,1),2)
			when right(Amount_Applied_to_Periodic_Deductible,1)='C' then replace(Amount_Applied_to_Periodic_Deductible,right(Amount_Applied_to_Periodic_Deductible,1),3)
			when right(Amount_Applied_to_Periodic_Deductible,1)='D' then replace(Amount_Applied_to_Periodic_Deductible,right(Amount_Applied_to_Periodic_Deductible,1),4)
			when right(Amount_Applied_to_Periodic_Deductible,1)='E' then replace(Amount_Applied_to_Periodic_Deductible,right(Amount_Applied_to_Periodic_Deductible,1),5)
			when right(Amount_Applied_to_Periodic_Deductible,1)='F' then replace(Amount_Applied_to_Periodic_Deductible,right(Amount_Applied_to_Periodic_Deductible,1),6)
			when right(Amount_Applied_to_Periodic_Deductible,1)='G' then replace(Amount_Applied_to_Periodic_Deductible,right(Amount_Applied_to_Periodic_Deductible,1),7)
			when right(Amount_Applied_to_Periodic_Deductible,1)='H' then replace(Amount_Applied_to_Periodic_Deductible,right(Amount_Applied_to_Periodic_Deductible,1),8)
			when right(Amount_Applied_to_Periodic_Deductible,1)='I' then replace(Amount_Applied_to_Periodic_Deductible,right(Amount_Applied_to_Periodic_Deductible,1),9)
			when right(Amount_Applied_to_Periodic_Deductible,1)='}' then '-' + replace(Amount_Applied_to_Periodic_Deductible,right(Amount_Applied_to_Periodic_Deductible,1),0)
			when right(Amount_Applied_to_Periodic_Deductible,1)='J' then '-' + replace(Amount_Applied_to_Periodic_Deductible,right(Amount_Applied_to_Periodic_Deductible,1),1)
			when right(Amount_Applied_to_Periodic_Deductible,1)='K' then '-' + replace(Amount_Applied_to_Periodic_Deductible,right(Amount_Applied_to_Periodic_Deductible,1),2)
			when right(Amount_Applied_to_Periodic_Deductible,1)='L' then '-' + replace(Amount_Applied_to_Periodic_Deductible,right(Amount_Applied_to_Periodic_Deductible,1),3)
			when right(Amount_Applied_to_Periodic_Deductible,1)='M' then '-' + replace(Amount_Applied_to_Periodic_Deductible,right(Amount_Applied_to_Periodic_Deductible,1),4)
			when right(Amount_Applied_to_Periodic_Deductible,1)='N' then '-' + replace(Amount_Applied_to_Periodic_Deductible,right(Amount_Applied_to_Periodic_Deductible,1),5)
			when right(Amount_Applied_to_Periodic_Deductible,1)='O' then '-' + replace(Amount_Applied_to_Periodic_Deductible,right(Amount_Applied_to_Periodic_Deductible,1),6)
			when right(Amount_Applied_to_Periodic_Deductible,1)='P' then '-' + replace(Amount_Applied_to_Periodic_Deductible,right(Amount_Applied_to_Periodic_Deductible,1),7)
			when right(Amount_Applied_to_Periodic_Deductible,1)='Q' then '-' + replace(Amount_Applied_to_Periodic_Deductible,right(Amount_Applied_to_Periodic_Deductible,1),8)
			when right(Amount_Applied_to_Periodic_Deductible,1)='R' then '-' + replace(Amount_Applied_to_Periodic_Deductible,right(Amount_Applied_to_Periodic_Deductible,1),9)
		when Amount_Applied_to_Periodic_Deductible is null or Amount_Applied_to_Periodic_Deductible='' then '0.0'
		else Amount_Applied_to_Periodic_Deductible end as numeric(18,2) )as Amount_Applied_to_Periodic_Deductible,
	
	ltrim(rtrim(Filler145)) as Filler145
    ,ltrim(rtrim(MAC_Reduced_Indicator)) as MAC_Reduced_Indicator
    ,ltrim(rtrim(Client_Pricing_Basis_of_Cost)) as Client_Pricing_Basis_of_Cost 
    ,ltrim(rtrim(Generic_Indicator)) as Generic_Indicator,
		cast (case when right(Out_of_Pocket_Apply_Amount,1)='{' then replace(Out_of_Pocket_Apply_Amount,right(Out_of_Pocket_Apply_Amount,1),0)
			when right(Out_of_Pocket_Apply_Amount,1)='A' then replace(Out_of_Pocket_Apply_Amount,right(Out_of_Pocket_Apply_Amount,1),1)
			when right(Out_of_Pocket_Apply_Amount,1)='B' then replace(Out_of_Pocket_Apply_Amount,right(Out_of_Pocket_Apply_Amount,1),2)
			when right(Out_of_Pocket_Apply_Amount,1)='C' then replace(Out_of_Pocket_Apply_Amount,right(Out_of_Pocket_Apply_Amount,1),3)
			when right(Out_of_Pocket_Apply_Amount,1)='D' then replace(Out_of_Pocket_Apply_Amount,right(Out_of_Pocket_Apply_Amount,1),4)
			when right(Out_of_Pocket_Apply_Amount,1)='E' then replace(Out_of_Pocket_Apply_Amount,right(Out_of_Pocket_Apply_Amount,1),5)
			when right(Out_of_Pocket_Apply_Amount,1)='F' then replace(Out_of_Pocket_Apply_Amount,right(Out_of_Pocket_Apply_Amount,1),6)
			when right(Out_of_Pocket_Apply_Amount,1)='G' then replace(Out_of_Pocket_Apply_Amount,right(Out_of_Pocket_Apply_Amount,1),7)
			when right(Out_of_Pocket_Apply_Amount,1)='H' then replace(Out_of_Pocket_Apply_Amount,right(Out_of_Pocket_Apply_Amount,1),8)
			when right(Out_of_Pocket_Apply_Amount,1)='I' then replace(Out_of_Pocket_Apply_Amount,right(Out_of_Pocket_Apply_Amount,1),9)
			when right(Out_of_Pocket_Apply_Amount,1)='}' then '-' + replace(Out_of_Pocket_Apply_Amount,right(Out_of_Pocket_Apply_Amount,1),0)
			when right(Out_of_Pocket_Apply_Amount,1)='J' then '-' + replace(Out_of_Pocket_Apply_Amount,right(Out_of_Pocket_Apply_Amount,1),1)
			when right(Out_of_Pocket_Apply_Amount,1)='K' then '-' + replace(Out_of_Pocket_Apply_Amount,right(Out_of_Pocket_Apply_Amount,1),2)
			when right(Out_of_Pocket_Apply_Amount,1)='L' then '-' + replace(Out_of_Pocket_Apply_Amount,right(Out_of_Pocket_Apply_Amount,1),3)
			when right(Out_of_Pocket_Apply_Amount,1)='M' then '-' + replace(Out_of_Pocket_Apply_Amount,right(Out_of_Pocket_Apply_Amount,1),4)
			when right(Out_of_Pocket_Apply_Amount,1)='N' then '-' + replace(Out_of_Pocket_Apply_Amount,right(Out_of_Pocket_Apply_Amount,1),5)
			when right(Out_of_Pocket_Apply_Amount,1)='O' then '-' + replace(Out_of_Pocket_Apply_Amount,right(Out_of_Pocket_Apply_Amount,1),6)
			when right(Out_of_Pocket_Apply_Amount,1)='P' then '-' + replace(Out_of_Pocket_Apply_Amount,right(Out_of_Pocket_Apply_Amount,1),7)
			when right(Out_of_Pocket_Apply_Amount,1)='Q' then '-' + replace(Out_of_Pocket_Apply_Amount,right(Out_of_Pocket_Apply_Amount,1),8)
			when right(Out_of_Pocket_Apply_Amount,1)='R' then '-' + replace(Out_of_Pocket_Apply_Amount,right(Out_of_Pocket_Apply_Amount,1),9)
		when Out_of_Pocket_Apply_Amount is null or Out_of_Pocket_Apply_Amount='' then '0.0'
		else Out_of_Pocket_Apply_Amount end as numeric(18,2) )as Out_of_Pocket_Apply_Amount,
	ltrim(rtrim(Filler146)) as Filler146
    ,ltrim(rtrim(Filler147)) as Filler147
    ,ltrim(rtrim(AWPPAWP_Indicator)) as AWPPAWP_Indicator,
	
	cast(case when right(Average_Wholesale_Unit_Price,1)='{' then replace(Average_Wholesale_Unit_Price,right(Average_Wholesale_Unit_Price,1),0)
			when right(Average_Wholesale_Unit_Price,1)='A' then replace(Average_Wholesale_Unit_Price,right(Average_Wholesale_Unit_Price,1),1)
			when right(Average_Wholesale_Unit_Price,1)='B' then replace(Average_Wholesale_Unit_Price,right(Average_Wholesale_Unit_Price,1),2)
			when right(Average_Wholesale_Unit_Price,1)='C' then replace(Average_Wholesale_Unit_Price,right(Average_Wholesale_Unit_Price,1),3)
			when right(Average_Wholesale_Unit_Price,1)='D' then replace(Average_Wholesale_Unit_Price,right(Average_Wholesale_Unit_Price,1),4)
			when right(Average_Wholesale_Unit_Price,1)='E' then replace(Average_Wholesale_Unit_Price,right(Average_Wholesale_Unit_Price,1),5)
			when right(Average_Wholesale_Unit_Price,1)='F' then replace(Average_Wholesale_Unit_Price,right(Average_Wholesale_Unit_Price,1),6)
			when right(Average_Wholesale_Unit_Price,1)='G' then replace(Average_Wholesale_Unit_Price,right(Average_Wholesale_Unit_Price,1),7)
			when right(Average_Wholesale_Unit_Price,1)='H' then replace(Average_Wholesale_Unit_Price,right(Average_Wholesale_Unit_Price,1),8)
			when right(Average_Wholesale_Unit_Price,1)='I' then replace(Average_Wholesale_Unit_Price,right(Average_Wholesale_Unit_Price,1),9)
			when right(Average_Wholesale_Unit_Price,1)='}' then '-' + replace(Average_Wholesale_Unit_Price,right(Average_Wholesale_Unit_Price,1),0)
			when right(Average_Wholesale_Unit_Price,1)='J' then '-' + replace(Average_Wholesale_Unit_Price,right(Average_Wholesale_Unit_Price,1),1)
			when right(Average_Wholesale_Unit_Price,1)='K' then '-' + replace(Average_Wholesale_Unit_Price,right(Average_Wholesale_Unit_Price,1),2)
			when right(Average_Wholesale_Unit_Price,1)='L' then '-' + replace(Average_Wholesale_Unit_Price,right(Average_Wholesale_Unit_Price,1),3)
			when right(Average_Wholesale_Unit_Price,1)='M' then '-' + replace(Average_Wholesale_Unit_Price,right(Average_Wholesale_Unit_Price,1),4)
			when right(Average_Wholesale_Unit_Price,1)='N' then '-' + replace(Average_Wholesale_Unit_Price,right(Average_Wholesale_Unit_Price,1),5)
			when right(Average_Wholesale_Unit_Price,1)='O' then '-' + replace(Average_Wholesale_Unit_Price,right(Average_Wholesale_Unit_Price,1),6)
			when right(Average_Wholesale_Unit_Price,1)='P' then '-' + replace(Average_Wholesale_Unit_Price,right(Average_Wholesale_Unit_Price,1),7)
			when right(Average_Wholesale_Unit_Price,1)='Q' then '-' + replace(Average_Wholesale_Unit_Price,right(Average_Wholesale_Unit_Price,1),8)
			when right(Average_Wholesale_Unit_Price,1)='R' then '-' + replace(Average_Wholesale_Unit_Price,right(Average_Wholesale_Unit_Price,1),9)
		when Average_Wholesale_Unit_Price is null or Average_Wholesale_Unit_Price='' then '0.0'
		else Average_Wholesale_Unit_Price end as numeric(18,2) )as Average_Wholesale_Unit_Price,
	ltrim(rtrim(Filler148)) as Filler148
    ,ltrim(rtrim(Filler149)) as Filler149
    ,ltrim(rtrim(Filler150)) as Filler150,
		
		cast (case when right(Ingredient_Cost_Submitted,1)='{' then replace(Ingredient_Cost_Submitted,right(Ingredient_Cost_Submitted,1),0)
			when right(Ingredient_Cost_Submitted,1)='A' then replace(Ingredient_Cost_Submitted,right(Ingredient_Cost_Submitted,1),1)
			when right(Ingredient_Cost_Submitted,1)='B' then replace(Ingredient_Cost_Submitted,right(Ingredient_Cost_Submitted,1),2)
			when right(Ingredient_Cost_Submitted,1)='C' then replace(Ingredient_Cost_Submitted,right(Ingredient_Cost_Submitted,1),3)
			when right(Ingredient_Cost_Submitted,1)='D' then replace(Ingredient_Cost_Submitted,right(Ingredient_Cost_Submitted,1),4)
			when right(Ingredient_Cost_Submitted,1)='E' then replace(Ingredient_Cost_Submitted,right(Ingredient_Cost_Submitted,1),5)
			when right(Ingredient_Cost_Submitted,1)='F' then replace(Ingredient_Cost_Submitted,right(Ingredient_Cost_Submitted,1),6)
			when right(Ingredient_Cost_Submitted,1)='G' then replace(Ingredient_Cost_Submitted,right(Ingredient_Cost_Submitted,1),7)
			when right(Ingredient_Cost_Submitted,1)='H' then replace(Ingredient_Cost_Submitted,right(Ingredient_Cost_Submitted,1),8)
			when right(Ingredient_Cost_Submitted,1)='I' then replace(Ingredient_Cost_Submitted,right(Ingredient_Cost_Submitted,1),9)
			when right(Ingredient_Cost_Submitted,1)='}' then '-' + replace(Ingredient_Cost_Submitted,right(Ingredient_Cost_Submitted,1),0)
			when right(Ingredient_Cost_Submitted,1)='J' then '-' + replace(Ingredient_Cost_Submitted,right(Ingredient_Cost_Submitted,1),1)
			when right(Ingredient_Cost_Submitted,1)='K' then '-' + replace(Ingredient_Cost_Submitted,right(Ingredient_Cost_Submitted,1),2)
			when right(Ingredient_Cost_Submitted,1)='L' then '-' + replace(Ingredient_Cost_Submitted,right(Ingredient_Cost_Submitted,1),3)
			when right(Ingredient_Cost_Submitted,1)='M' then '-' + replace(Ingredient_Cost_Submitted,right(Ingredient_Cost_Submitted,1),4)
			when right(Ingredient_Cost_Submitted,1)='N' then '-' + replace(Ingredient_Cost_Submitted,right(Ingredient_Cost_Submitted,1),5)
			when right(Ingredient_Cost_Submitted,1)='O' then '-' + replace(Ingredient_Cost_Submitted,right(Ingredient_Cost_Submitted,1),6)
			when right(Ingredient_Cost_Submitted,1)='P' then '-' + replace(Ingredient_Cost_Submitted,right(Ingredient_Cost_Submitted,1),7)
			when right(Ingredient_Cost_Submitted,1)='Q' then '-' + replace(Ingredient_Cost_Submitted,right(Ingredient_Cost_Submitted,1),8)
			when right(Ingredient_Cost_Submitted,1)='R' then '-' + replace(Ingredient_Cost_Submitted,right(Ingredient_Cost_Submitted,1),9)
		when Ingredient_Cost_Submitted is null or Ingredient_Cost_Submitted='' then '0.0'
		else Ingredient_Cost_Submitted end as numeric(18,2) )as Ingredient_Cost_Submitted,
		
		--case when isnumeric(dbo.overpunch(Usual_And_Customary_Charge))=1 then cast(dbo.overpunch(Usual_And_Customary_Charge) as money) else '0.00' end as Usual_And_Customary_Charge,
		
		cast (case when right(Usual_And_Customary_Charge,1)='{' then replace(Usual_And_Customary_Charge,right(Usual_And_Customary_Charge,1),0)
			when right(Usual_And_Customary_Charge,1)='A' then replace(Usual_And_Customary_Charge,right(Usual_And_Customary_Charge,1),1)
			when right(Usual_And_Customary_Charge,1)='B' then replace(Usual_And_Customary_Charge,right(Usual_And_Customary_Charge,1),2)
			when right(Usual_And_Customary_Charge,1)='C' then replace(Usual_And_Customary_Charge,right(Usual_And_Customary_Charge,1),3)
			when right(Usual_And_Customary_Charge,1)='D' then replace(Usual_And_Customary_Charge,right(Usual_And_Customary_Charge,1),4)
			when right(Usual_And_Customary_Charge,1)='E' then replace(Usual_And_Customary_Charge,right(Usual_And_Customary_Charge,1),5)
			when right(Usual_And_Customary_Charge,1)='F' then replace(Usual_And_Customary_Charge,right(Usual_And_Customary_Charge,1),6)
			when right(Usual_And_Customary_Charge,1)='G' then replace(Usual_And_Customary_Charge,right(Usual_And_Customary_Charge,1),7)
			when right(Usual_And_Customary_Charge,1)='H' then replace(Usual_And_Customary_Charge,right(Usual_And_Customary_Charge,1),8)
			when right(Usual_And_Customary_Charge,1)='I' then replace(Usual_And_Customary_Charge,right(Usual_And_Customary_Charge,1),9)
			when right(Usual_And_Customary_Charge,1)='}' then '-' + replace(Usual_And_Customary_Charge,right(Usual_And_Customary_Charge,1),0)
			when right(Usual_And_Customary_Charge,1)='J' then '-' + replace(Usual_And_Customary_Charge,right(Usual_And_Customary_Charge,1),1)
			when right(Usual_And_Customary_Charge,1)='K' then '-' + replace(Usual_And_Customary_Charge,right(Usual_And_Customary_Charge,1),2)
			when right(Usual_And_Customary_Charge,1)='L' then '-' + replace(Usual_And_Customary_Charge,right(Usual_And_Customary_Charge,1),3)
			when right(Usual_And_Customary_Charge,1)='M' then '-' + replace(Usual_And_Customary_Charge,right(Usual_And_Customary_Charge,1),4)
			when right(Usual_And_Customary_Charge,1)='N' then '-' + replace(Usual_And_Customary_Charge,right(Usual_And_Customary_Charge,1),5)
			when right(Usual_And_Customary_Charge,1)='O' then '-' + replace(Usual_And_Customary_Charge,right(Usual_And_Customary_Charge,1),6)
			when right(Usual_And_Customary_Charge,1)='P' then '-' + replace(Usual_And_Customary_Charge,right(Usual_And_Customary_Charge,1),7)
			when right(Usual_And_Customary_Charge,1)='Q' then '-' + replace(Usual_And_Customary_Charge,right(Usual_And_Customary_Charge,1),8)
			when right(Usual_And_Customary_Charge,1)='R' then '-' + replace(Usual_And_Customary_Charge,right(Usual_And_Customary_Charge,1),9)
		when Usual_And_Customary_Charge is null or Usual_And_Customary_Charge='' then '0.0'
		else Usual_And_Customary_Charge end as numeric(18,2) )as Usual_And_Customary_Charge,
		
		--case when isnumeric(dbo.overpunch(Flat_Sales_Tax_Amount_Paid))=1 then cast(dbo.overpunch(Flat_Sales_Tax_Amount_Paid) as money) else '0.00' end as Flat_Sales_Tax_Amount_Paid,
		
		cast(case when right(Flat_Sales_Tax_Amount_Paid,1)='{' then replace(Flat_Sales_Tax_Amount_Paid,right(Flat_Sales_Tax_Amount_Paid,1),0)
			when right(Flat_Sales_Tax_Amount_Paid,1)='A' then replace(Flat_Sales_Tax_Amount_Paid,right(Flat_Sales_Tax_Amount_Paid,1),1)
			when right(Flat_Sales_Tax_Amount_Paid,1)='B' then replace(Flat_Sales_Tax_Amount_Paid,right(Flat_Sales_Tax_Amount_Paid,1),2)
			when right(Flat_Sales_Tax_Amount_Paid,1)='C' then replace(Flat_Sales_Tax_Amount_Paid,right(Flat_Sales_Tax_Amount_Paid,1),3)
			when right(Flat_Sales_Tax_Amount_Paid,1)='D' then replace(Flat_Sales_Tax_Amount_Paid,right(Flat_Sales_Tax_Amount_Paid,1),4)
			when right(Flat_Sales_Tax_Amount_Paid,1)='E' then replace(Flat_Sales_Tax_Amount_Paid,right(Flat_Sales_Tax_Amount_Paid,1),5)
			when right(Flat_Sales_Tax_Amount_Paid,1)='F' then replace(Flat_Sales_Tax_Amount_Paid,right(Flat_Sales_Tax_Amount_Paid,1),6)
			when right(Flat_Sales_Tax_Amount_Paid,1)='G' then replace(Flat_Sales_Tax_Amount_Paid,right(Flat_Sales_Tax_Amount_Paid,1),7)
			when right(Flat_Sales_Tax_Amount_Paid,1)='H' then replace(Flat_Sales_Tax_Amount_Paid,right(Flat_Sales_Tax_Amount_Paid,1),8)
			when right(Flat_Sales_Tax_Amount_Paid,1)='I' then replace(Flat_Sales_Tax_Amount_Paid,right(Flat_Sales_Tax_Amount_Paid,1),9)
			when right(Flat_Sales_Tax_Amount_Paid,1)='}' then '-' + replace(Flat_Sales_Tax_Amount_Paid,right(Flat_Sales_Tax_Amount_Paid,1),0)
			when right(Flat_Sales_Tax_Amount_Paid,1)='J' then '-' + replace(Flat_Sales_Tax_Amount_Paid,right(Flat_Sales_Tax_Amount_Paid,1),1)
			when right(Flat_Sales_Tax_Amount_Paid,1)='K' then '-' + replace(Flat_Sales_Tax_Amount_Paid,right(Flat_Sales_Tax_Amount_Paid,1),2)
			when right(Flat_Sales_Tax_Amount_Paid,1)='L' then '-' + replace(Flat_Sales_Tax_Amount_Paid,right(Flat_Sales_Tax_Amount_Paid,1),3)
			when right(Flat_Sales_Tax_Amount_Paid,1)='M' then '-' + replace(Flat_Sales_Tax_Amount_Paid,right(Flat_Sales_Tax_Amount_Paid,1),4)
			when right(Flat_Sales_Tax_Amount_Paid,1)='N' then '-' + replace(Flat_Sales_Tax_Amount_Paid,right(Flat_Sales_Tax_Amount_Paid,1),5)
			when right(Flat_Sales_Tax_Amount_Paid,1)='O' then '-' + replace(Flat_Sales_Tax_Amount_Paid,right(Flat_Sales_Tax_Amount_Paid,1),6)
			when right(Flat_Sales_Tax_Amount_Paid,1)='P' then '-' + replace(Flat_Sales_Tax_Amount_Paid,right(Flat_Sales_Tax_Amount_Paid,1),7)
			when right(Flat_Sales_Tax_Amount_Paid,1)='Q' then '-' + replace(Flat_Sales_Tax_Amount_Paid,right(Flat_Sales_Tax_Amount_Paid,1),8)
			when right(Flat_Sales_Tax_Amount_Paid,1)='R' then '-' + replace(Flat_Sales_Tax_Amount_Paid,right(Flat_Sales_Tax_Amount_Paid,1),9)
		when Flat_Sales_Tax_Amount_Paid is null or Flat_Sales_Tax_Amount_Paid='' then '0.0'
		else Flat_Sales_Tax_Amount_Paid end as numeric(18,2) )as Flat_Sales_Tax_Amount_Paid,
		
		--case when isnumeric(dbo.overpunch(Percentage_Sales_Tax_Amount_Paid))=1 then cast(dbo.overpunch(Percentage_Sales_Tax_Amount_Paid) as money) else '0.00' end as Percentage_Sales_Tax_Amount_Paid,
		
		cast (case when right(Percentage_Sales_Tax_Amount_Paid,1)='{' then replace(Percentage_Sales_Tax_Amount_Paid,right(Percentage_Sales_Tax_Amount_Paid,1),0)
			when right(Percentage_Sales_Tax_Amount_Paid,1)='A' then replace(Percentage_Sales_Tax_Amount_Paid,right(Percentage_Sales_Tax_Amount_Paid,1),1)
			when right(Percentage_Sales_Tax_Amount_Paid,1)='B' then replace(Percentage_Sales_Tax_Amount_Paid,right(Percentage_Sales_Tax_Amount_Paid,1),2)
			when right(Percentage_Sales_Tax_Amount_Paid,1)='C' then replace(Percentage_Sales_Tax_Amount_Paid,right(Percentage_Sales_Tax_Amount_Paid,1),3)
			when right(Percentage_Sales_Tax_Amount_Paid,1)='D' then replace(Percentage_Sales_Tax_Amount_Paid,right(Percentage_Sales_Tax_Amount_Paid,1),4)
			when right(Percentage_Sales_Tax_Amount_Paid,1)='E' then replace(Percentage_Sales_Tax_Amount_Paid,right(Percentage_Sales_Tax_Amount_Paid,1),5)
			when right(Percentage_Sales_Tax_Amount_Paid,1)='F' then replace(Percentage_Sales_Tax_Amount_Paid,right(Percentage_Sales_Tax_Amount_Paid,1),6)
			when right(Percentage_Sales_Tax_Amount_Paid,1)='G' then replace(Percentage_Sales_Tax_Amount_Paid,right(Percentage_Sales_Tax_Amount_Paid,1),7)
			when right(Percentage_Sales_Tax_Amount_Paid,1)='H' then replace(Percentage_Sales_Tax_Amount_Paid,right(Percentage_Sales_Tax_Amount_Paid,1),8)
			when right(Percentage_Sales_Tax_Amount_Paid,1)='I' then replace(Percentage_Sales_Tax_Amount_Paid,right(Percentage_Sales_Tax_Amount_Paid,1),9)
			when right(Percentage_Sales_Tax_Amount_Paid,1)='}' then '-' + replace(Percentage_Sales_Tax_Amount_Paid,right(Percentage_Sales_Tax_Amount_Paid,1),0)
			when right(Percentage_Sales_Tax_Amount_Paid,1)='J' then '-' + replace(Percentage_Sales_Tax_Amount_Paid,right(Percentage_Sales_Tax_Amount_Paid,1),1)
			when right(Percentage_Sales_Tax_Amount_Paid,1)='K' then '-' + replace(Percentage_Sales_Tax_Amount_Paid,right(Percentage_Sales_Tax_Amount_Paid,1),2)
			when right(Percentage_Sales_Tax_Amount_Paid,1)='L' then '-' + replace(Percentage_Sales_Tax_Amount_Paid,right(Percentage_Sales_Tax_Amount_Paid,1),3)
			when right(Percentage_Sales_Tax_Amount_Paid,1)='M' then '-' + replace(Percentage_Sales_Tax_Amount_Paid,right(Percentage_Sales_Tax_Amount_Paid,1),4)
			when right(Percentage_Sales_Tax_Amount_Paid,1)='N' then '-' + replace(Percentage_Sales_Tax_Amount_Paid,right(Percentage_Sales_Tax_Amount_Paid,1),5)
			when right(Percentage_Sales_Tax_Amount_Paid,1)='O' then '-' + replace(Percentage_Sales_Tax_Amount_Paid,right(Percentage_Sales_Tax_Amount_Paid,1),6)
			when right(Percentage_Sales_Tax_Amount_Paid,1)='P' then '-' + replace(Percentage_Sales_Tax_Amount_Paid,right(Percentage_Sales_Tax_Amount_Paid,1),7)
			when right(Percentage_Sales_Tax_Amount_Paid,1)='Q' then '-' + replace(Percentage_Sales_Tax_Amount_Paid,right(Percentage_Sales_Tax_Amount_Paid,1),8)
			when right(Percentage_Sales_Tax_Amount_Paid,1)='R' then '-' + replace(Percentage_Sales_Tax_Amount_Paid,right(Percentage_Sales_Tax_Amount_Paid,1),9)
		when Percentage_Sales_Tax_Amount_Paid is null or Percentage_Sales_Tax_Amount_Paid='' then '0.0'
		else Percentage_Sales_Tax_Amount_Paid end as numeric(18,2) )as Percentage_Sales_Tax_Amount_Paid,
	ltrim(rtrim(Filler151)) as Filler151
    ,ltrim(rtrim(Filler152)) as Filler152
    ,ltrim(rtrim(Filler153)) as Filler153
    ,ltrim(rtrim(Filler154)) as Filler154
    ,ltrim(rtrim(Filler155)) as Filler155,
		cast (case when right(Mail_Incentive_Fee,1)='{' then replace(Mail_Incentive_Fee,right(Mail_Incentive_Fee,1),0)
			when right(Mail_Incentive_Fee,1)='A' then replace(Mail_Incentive_Fee,right(Mail_Incentive_Fee,1),1)
			when right(Mail_Incentive_Fee,1)='B' then replace(Mail_Incentive_Fee,right(Mail_Incentive_Fee,1),2)
			when right(Mail_Incentive_Fee,1)='C' then replace(Mail_Incentive_Fee,right(Mail_Incentive_Fee,1),3)
			when right(Mail_Incentive_Fee,1)='D' then replace(Mail_Incentive_Fee,right(Mail_Incentive_Fee,1),4)
			when right(Mail_Incentive_Fee,1)='E' then replace(Mail_Incentive_Fee,right(Mail_Incentive_Fee,1),5)
			when right(Mail_Incentive_Fee,1)='F' then replace(Mail_Incentive_Fee,right(Mail_Incentive_Fee,1),6)
			when right(Mail_Incentive_Fee,1)='G' then replace(Mail_Incentive_Fee,right(Mail_Incentive_Fee,1),7)
			when right(Mail_Incentive_Fee,1)='H' then replace(Mail_Incentive_Fee,right(Mail_Incentive_Fee,1),8)
			when right(Mail_Incentive_Fee,1)='I' then replace(Mail_Incentive_Fee,right(Mail_Incentive_Fee,1),9)
			when right(Mail_Incentive_Fee,1)='}' then '-' + replace(Mail_Incentive_Fee,right(Mail_Incentive_Fee,1),0)
			when right(Mail_Incentive_Fee,1)='J' then '-' + replace(Mail_Incentive_Fee,right(Mail_Incentive_Fee,1),1)
			when right(Mail_Incentive_Fee,1)='K' then '-' + replace(Mail_Incentive_Fee,right(Mail_Incentive_Fee,1),2)
			when right(Mail_Incentive_Fee,1)='L' then '-' + replace(Mail_Incentive_Fee,right(Mail_Incentive_Fee,1),3)
			when right(Mail_Incentive_Fee,1)='M' then '-' + replace(Mail_Incentive_Fee,right(Mail_Incentive_Fee,1),4)
			when right(Mail_Incentive_Fee,1)='N' then '-' + replace(Mail_Incentive_Fee,right(Mail_Incentive_Fee,1),5)
			when right(Mail_Incentive_Fee,1)='O' then '-' + replace(Mail_Incentive_Fee,right(Mail_Incentive_Fee,1),6)
			when right(Mail_Incentive_Fee,1)='P' then '-' + replace(Mail_Incentive_Fee,right(Mail_Incentive_Fee,1),7)
			when right(Mail_Incentive_Fee,1)='Q' then '-' + replace(Mail_Incentive_Fee,right(Mail_Incentive_Fee,1),8)
			when right(Mail_Incentive_Fee,1)='R' then '-' + replace(Mail_Incentive_Fee,right(Mail_Incentive_Fee,1),9)
			when Mail_Incentive_Fee is null or Mail_Incentive_Fee='' then '0.0'
		else Mail_Incentive_Fee end as numeric(18,2) )as Mail_Incentive_Fee,
	ltrim(rtrim(Filler156)) as Filler156
    ,ltrim(rtrim(Filler157)) as Filler157
    ,ltrim(rtrim(Filler158)) as Filler158
    ,ltrim(rtrim(Filler159)) as Filler159
    ,ltrim(rtrim(Filler160)) as Filler160
    ,ltrim(rtrim(Filler161)) as Filler161
    ,ltrim(rtrim(Filler162)) as Filler162
    ,ltrim(rtrim(Filler163)) as Filler163
    ,ltrim(rtrim(Filler164)) as Filler164,
	
   cast (case when right(Net_Amount_Due_Total_Amount_BilledPaid,1)='{' then replace(Net_Amount_Due_Total_Amount_BilledPaid,right(Net_Amount_Due_Total_Amount_BilledPaid,1),0)
			when right(Net_Amount_Due_Total_Amount_BilledPaid,1)='A' then replace(Net_Amount_Due_Total_Amount_BilledPaid,right(Net_Amount_Due_Total_Amount_BilledPaid,1),1)
			when right(Net_Amount_Due_Total_Amount_BilledPaid,1)='B' then replace(Net_Amount_Due_Total_Amount_BilledPaid,right(Net_Amount_Due_Total_Amount_BilledPaid,1),2)
			when right(Net_Amount_Due_Total_Amount_BilledPaid,1)='C' then replace(Net_Amount_Due_Total_Amount_BilledPaid,right(Net_Amount_Due_Total_Amount_BilledPaid,1),3)
			when right(Net_Amount_Due_Total_Amount_BilledPaid,1)='D' then replace(Net_Amount_Due_Total_Amount_BilledPaid,right(Net_Amount_Due_Total_Amount_BilledPaid,1),4)
			when right(Net_Amount_Due_Total_Amount_BilledPaid,1)='E' then replace(Net_Amount_Due_Total_Amount_BilledPaid,right(Net_Amount_Due_Total_Amount_BilledPaid,1),5)
			when right(Net_Amount_Due_Total_Amount_BilledPaid,1)='F' then replace(Net_Amount_Due_Total_Amount_BilledPaid,right(Net_Amount_Due_Total_Amount_BilledPaid,1),6)
			when right(Net_Amount_Due_Total_Amount_BilledPaid,1)='G' then replace(Net_Amount_Due_Total_Amount_BilledPaid,right(Net_Amount_Due_Total_Amount_BilledPaid,1),7)
			when right(Net_Amount_Due_Total_Amount_BilledPaid,1)='H' then replace(Net_Amount_Due_Total_Amount_BilledPaid,right(Net_Amount_Due_Total_Amount_BilledPaid,1),8)
			when right(Net_Amount_Due_Total_Amount_BilledPaid,1)='I' then replace(Net_Amount_Due_Total_Amount_BilledPaid,right(Net_Amount_Due_Total_Amount_BilledPaid,1),9)
			when right(Net_Amount_Due_Total_Amount_BilledPaid,1)='}' then '-' + replace(Net_Amount_Due_Total_Amount_BilledPaid,right(Net_Amount_Due_Total_Amount_BilledPaid,1),0)
			when right(Net_Amount_Due_Total_Amount_BilledPaid,1)='J' then '-' + replace(Net_Amount_Due_Total_Amount_BilledPaid,right(Net_Amount_Due_Total_Amount_BilledPaid,1),1)
			when right(Net_Amount_Due_Total_Amount_BilledPaid,1)='K' then '-' + replace(Net_Amount_Due_Total_Amount_BilledPaid,right(Net_Amount_Due_Total_Amount_BilledPaid,1),2)
			when right(Net_Amount_Due_Total_Amount_BilledPaid,1)='L' then '-' + replace(Net_Amount_Due_Total_Amount_BilledPaid,right(Net_Amount_Due_Total_Amount_BilledPaid,1),3)
			when right(Net_Amount_Due_Total_Amount_BilledPaid,1)='M' then '-' + replace(Net_Amount_Due_Total_Amount_BilledPaid,right(Net_Amount_Due_Total_Amount_BilledPaid,1),4)
			when right(Net_Amount_Due_Total_Amount_BilledPaid,1)='N' then '-' + replace(Net_Amount_Due_Total_Amount_BilledPaid,right(Net_Amount_Due_Total_Amount_BilledPaid,1),5)
			when right(Net_Amount_Due_Total_Amount_BilledPaid,1)='O' then '-' + replace(Net_Amount_Due_Total_Amount_BilledPaid,right(Net_Amount_Due_Total_Amount_BilledPaid,1),6)
			when right(Net_Amount_Due_Total_Amount_BilledPaid,1)='P' then '-' + replace(Net_Amount_Due_Total_Amount_BilledPaid,right(Net_Amount_Due_Total_Amount_BilledPaid,1),7)
			when right(Net_Amount_Due_Total_Amount_BilledPaid,1)='Q' then '-' + replace(Net_Amount_Due_Total_Amount_BilledPaid,right(Net_Amount_Due_Total_Amount_BilledPaid,1),8)
			when right(Net_Amount_Due_Total_Amount_BilledPaid,1)='R' then '-' + replace(Net_Amount_Due_Total_Amount_BilledPaid,right(Net_Amount_Due_Total_Amount_BilledPaid,1),9)
		when Net_Amount_Due_Total_Amount_BilledPaid is null or Net_Amount_Due_Total_Amount_BilledPaid='' then '0.0'
		else Net_Amount_Due_Total_Amount_BilledPaid end as numeric(18,2) )as Net_Amount_Due_Total_Amount_BilledPaid,
	cast (case when right(Basis_of_Reimbursement_Determination,1)='{' then replace(Basis_of_Reimbursement_Determination,right(Basis_of_Reimbursement_Determination,1),0)
			when right(Basis_of_Reimbursement_Determination,1)='A' then replace(Basis_of_Reimbursement_Determination,right(Basis_of_Reimbursement_Determination,1),1)
			when right(Basis_of_Reimbursement_Determination,1)='B' then replace(Basis_of_Reimbursement_Determination,right(Basis_of_Reimbursement_Determination,1),2)
			when right(Basis_of_Reimbursement_Determination,1)='C' then replace(Basis_of_Reimbursement_Determination,right(Basis_of_Reimbursement_Determination,1),3)
			when right(Basis_of_Reimbursement_Determination,1)='D' then replace(Basis_of_Reimbursement_Determination,right(Basis_of_Reimbursement_Determination,1),4)
			when right(Basis_of_Reimbursement_Determination,1)='E' then replace(Basis_of_Reimbursement_Determination,right(Basis_of_Reimbursement_Determination,1),5)
			when right(Basis_of_Reimbursement_Determination,1)='F' then replace(Basis_of_Reimbursement_Determination,right(Basis_of_Reimbursement_Determination,1),6)
			when right(Basis_of_Reimbursement_Determination,1)='G' then replace(Basis_of_Reimbursement_Determination,right(Basis_of_Reimbursement_Determination,1),7)
			when right(Basis_of_Reimbursement_Determination,1)='H' then replace(Basis_of_Reimbursement_Determination,right(Basis_of_Reimbursement_Determination,1),8)
			when right(Basis_of_Reimbursement_Determination,1)='I' then replace(Basis_of_Reimbursement_Determination,right(Basis_of_Reimbursement_Determination,1),9)
			when right(Basis_of_Reimbursement_Determination,1)='}' then '-' + replace(Basis_of_Reimbursement_Determination,right(Basis_of_Reimbursement_Determination,1),0)
			when right(Basis_of_Reimbursement_Determination,1)='J' then '-' + replace(Basis_of_Reimbursement_Determination,right(Basis_of_Reimbursement_Determination,1),1)
			when right(Basis_of_Reimbursement_Determination,1)='K' then '-' + replace(Basis_of_Reimbursement_Determination,right(Basis_of_Reimbursement_Determination,1),2)
			when right(Basis_of_Reimbursement_Determination,1)='L' then '-' + replace(Basis_of_Reimbursement_Determination,right(Basis_of_Reimbursement_Determination,1),3)
			when right(Basis_of_Reimbursement_Determination,1)='M' then '-' + replace(Basis_of_Reimbursement_Determination,right(Basis_of_Reimbursement_Determination,1),4)
			when right(Basis_of_Reimbursement_Determination,1)='N' then '-' + replace(Basis_of_Reimbursement_Determination,right(Basis_of_Reimbursement_Determination,1),5)
			when right(Basis_of_Reimbursement_Determination,1)='O' then '-' + replace(Basis_of_Reimbursement_Determination,right(Basis_of_Reimbursement_Determination,1),6)
			when right(Basis_of_Reimbursement_Determination,1)='P' then '-' + replace(Basis_of_Reimbursement_Determination,right(Basis_of_Reimbursement_Determination,1),7)
			when right(Basis_of_Reimbursement_Determination,1)='Q' then '-' + replace(Basis_of_Reimbursement_Determination,right(Basis_of_Reimbursement_Determination,1),8)
			when right(Basis_of_Reimbursement_Determination,1)='R' then '-' + replace(Basis_of_Reimbursement_Determination,right(Basis_of_Reimbursement_Determination,1),9)
			when Basis_of_Reimbursement_Determination is null or Basis_of_Reimbursement_Determination='' then '0.0'
		else Basis_of_Reimbursement_Determination end as numeric(18,2) )as Basis_of_Reimbursement_Determination,
		cast (case when right(Accumulated_Deductible_Amount,1)='{' then replace(Accumulated_Deductible_Amount,right(Accumulated_Deductible_Amount,1),0)
			when right(Accumulated_Deductible_Amount,1)='A' then replace(Accumulated_Deductible_Amount,right(Accumulated_Deductible_Amount,1),1)
			when right(Accumulated_Deductible_Amount,1)='B' then replace(Accumulated_Deductible_Amount,right(Accumulated_Deductible_Amount,1),2)
			when right(Accumulated_Deductible_Amount,1)='C' then replace(Accumulated_Deductible_Amount,right(Accumulated_Deductible_Amount,1),3)
			when right(Accumulated_Deductible_Amount,1)='D' then replace(Accumulated_Deductible_Amount,right(Accumulated_Deductible_Amount,1),4)
			when right(Accumulated_Deductible_Amount,1)='E' then replace(Accumulated_Deductible_Amount,right(Accumulated_Deductible_Amount,1),5)
			when right(Accumulated_Deductible_Amount,1)='F' then replace(Accumulated_Deductible_Amount,right(Accumulated_Deductible_Amount,1),6)
			when right(Accumulated_Deductible_Amount,1)='G' then replace(Accumulated_Deductible_Amount,right(Accumulated_Deductible_Amount,1),7)
			when right(Accumulated_Deductible_Amount,1)='H' then replace(Accumulated_Deductible_Amount,right(Accumulated_Deductible_Amount,1),8)
			when right(Accumulated_Deductible_Amount,1)='I' then replace(Accumulated_Deductible_Amount,right(Accumulated_Deductible_Amount,1),9)
			when right(Accumulated_Deductible_Amount,1)='}' then '-' + replace(Accumulated_Deductible_Amount,right(Accumulated_Deductible_Amount,1),0)
			when right(Accumulated_Deductible_Amount,1)='J' then '-' + replace(Accumulated_Deductible_Amount,right(Accumulated_Deductible_Amount,1),1)
			when right(Accumulated_Deductible_Amount,1)='K' then '-' + replace(Accumulated_Deductible_Amount,right(Accumulated_Deductible_Amount,1),2)
			when right(Accumulated_Deductible_Amount,1)='L' then '-' + replace(Accumulated_Deductible_Amount,right(Accumulated_Deductible_Amount,1),3)
			when right(Accumulated_Deductible_Amount,1)='M' then '-' + replace(Accumulated_Deductible_Amount,right(Accumulated_Deductible_Amount,1),4)
			when right(Accumulated_Deductible_Amount,1)='N' then '-' + replace(Accumulated_Deductible_Amount,right(Accumulated_Deductible_Amount,1),5)
			when right(Accumulated_Deductible_Amount,1)='O' then '-' + replace(Accumulated_Deductible_Amount,right(Accumulated_Deductible_Amount,1),6)
			when right(Accumulated_Deductible_Amount,1)='P' then '-' + replace(Accumulated_Deductible_Amount,right(Accumulated_Deductible_Amount,1),7)
			when right(Accumulated_Deductible_Amount,1)='Q' then '-' + replace(Accumulated_Deductible_Amount,right(Accumulated_Deductible_Amount,1),8)
			when right(Accumulated_Deductible_Amount,1)='R' then '-' + replace(Accumulated_Deductible_Amount,right(Accumulated_Deductible_Amount,1),9)
			when Accumulated_Deductible_Amount is null or Accumulated_Deductible_Amount='' then '0.0'
		else Accumulated_Deductible_Amount end as numeric(18,2) )as Accumulated_Deductible_Amount,
	ltrim(rtrim(Filler165)) as Filler165
    ,ltrim(rtrim(Filler166)) as Filler166
    ,ltrim(rtrim(Filler167)) as Filler167
    ,ltrim(rtrim(Filler168)) as Filler168
    ,ltrim(rtrim(Filler169)) as Filler169
    ,ltrim(rtrim(Filler170)) as Filler170,
	cast (case when right(Amount_Exceeding_Periodic_Benefit_Maximum,1)='{' then replace(Amount_Exceeding_Periodic_Benefit_Maximum,right(Amount_Exceeding_Periodic_Benefit_Maximum,1),0)
			when right(Amount_Exceeding_Periodic_Benefit_Maximum,1)='A' then replace(Amount_Exceeding_Periodic_Benefit_Maximum,right(Amount_Exceeding_Periodic_Benefit_Maximum,1),1)
			when right(Amount_Exceeding_Periodic_Benefit_Maximum,1)='B' then replace(Amount_Exceeding_Periodic_Benefit_Maximum,right(Amount_Exceeding_Periodic_Benefit_Maximum,1),2)
			when right(Amount_Exceeding_Periodic_Benefit_Maximum,1)='C' then replace(Amount_Exceeding_Periodic_Benefit_Maximum,right(Amount_Exceeding_Periodic_Benefit_Maximum,1),3)
			when right(Amount_Exceeding_Periodic_Benefit_Maximum,1)='D' then replace(Amount_Exceeding_Periodic_Benefit_Maximum,right(Amount_Exceeding_Periodic_Benefit_Maximum,1),4)
			when right(Amount_Exceeding_Periodic_Benefit_Maximum,1)='E' then replace(Amount_Exceeding_Periodic_Benefit_Maximum,right(Amount_Exceeding_Periodic_Benefit_Maximum,1),5)
			when right(Amount_Exceeding_Periodic_Benefit_Maximum,1)='F' then replace(Amount_Exceeding_Periodic_Benefit_Maximum,right(Amount_Exceeding_Periodic_Benefit_Maximum,1),6)
			when right(Amount_Exceeding_Periodic_Benefit_Maximum,1)='G' then replace(Amount_Exceeding_Periodic_Benefit_Maximum,right(Amount_Exceeding_Periodic_Benefit_Maximum,1),7)
			when right(Amount_Exceeding_Periodic_Benefit_Maximum,1)='H' then replace(Amount_Exceeding_Periodic_Benefit_Maximum,right(Amount_Exceeding_Periodic_Benefit_Maximum,1),8)
			when right(Amount_Exceeding_Periodic_Benefit_Maximum,1)='I' then replace(Amount_Exceeding_Periodic_Benefit_Maximum,right(Amount_Exceeding_Periodic_Benefit_Maximum,1),9)
			when right(Amount_Exceeding_Periodic_Benefit_Maximum,1)='}' then '-' + replace(Amount_Exceeding_Periodic_Benefit_Maximum,right(Amount_Exceeding_Periodic_Benefit_Maximum,1),0)
			when right(Amount_Exceeding_Periodic_Benefit_Maximum,1)='J' then '-' + replace(Amount_Exceeding_Periodic_Benefit_Maximum,right(Amount_Exceeding_Periodic_Benefit_Maximum,1),1)
			when right(Amount_Exceeding_Periodic_Benefit_Maximum,1)='K' then '-' + replace(Amount_Exceeding_Periodic_Benefit_Maximum,right(Amount_Exceeding_Periodic_Benefit_Maximum,1),2)
			when right(Amount_Exceeding_Periodic_Benefit_Maximum,1)='L' then '-' + replace(Amount_Exceeding_Periodic_Benefit_Maximum,right(Amount_Exceeding_Periodic_Benefit_Maximum,1),3)
			when right(Amount_Exceeding_Periodic_Benefit_Maximum,1)='M' then '-' + replace(Amount_Exceeding_Periodic_Benefit_Maximum,right(Amount_Exceeding_Periodic_Benefit_Maximum,1),4)
			when right(Amount_Exceeding_Periodic_Benefit_Maximum,1)='N' then '-' + replace(Amount_Exceeding_Periodic_Benefit_Maximum,right(Amount_Exceeding_Periodic_Benefit_Maximum,1),5)
			when right(Amount_Exceeding_Periodic_Benefit_Maximum,1)='O' then '-' + replace(Amount_Exceeding_Periodic_Benefit_Maximum,right(Amount_Exceeding_Periodic_Benefit_Maximum,1),6)
			when right(Amount_Exceeding_Periodic_Benefit_Maximum,1)='P' then '-' + replace(Amount_Exceeding_Periodic_Benefit_Maximum,right(Amount_Exceeding_Periodic_Benefit_Maximum,1),7)
			when right(Amount_Exceeding_Periodic_Benefit_Maximum,1)='Q' then '-' + replace(Amount_Exceeding_Periodic_Benefit_Maximum,right(Amount_Exceeding_Periodic_Benefit_Maximum,1),8)
			when right(Amount_Exceeding_Periodic_Benefit_Maximum,1)='R' then '-' + replace(Amount_Exceeding_Periodic_Benefit_Maximum,right(Amount_Exceeding_Periodic_Benefit_Maximum,1),9)
			 when Amount_Exceeding_Periodic_Benefit_Maximum is null or Amount_Exceeding_Periodic_Benefit_Maximum='' then '0.0'
		else Amount_Exceeding_Periodic_Benefit_Maximum end as numeric(18,2) )as Amount_Exceeding_Periodic_Benefit_Maximum,
	ltrim(rtrim(Filler171 )) as Filler171
    ,ltrim(rtrim(Basis_of_Calculation_Copay)) as Basis_of_Calculation_Copay
    ,ltrim(rtrim(Filler172)) as Filler172
    ,ltrim(rtrim(Filler173)) as Filler173
    ,ltrim(rtrim(Filler174)) as Filler174
    ,ltrim(rtrim(Filler175)) as Filler175
    ,ltrim(rtrim(Filler176)) as Filler176
    ,ltrim(rtrim(Filler177)) as Filler177
    ,ltrim(rtrim(Filler178)) as Filler178
    ,ltrim(rtrim(Filler179)) as Filler179
    ,ltrim(rtrim(Filler180)) as Filler180
    ,ltrim(rtrim(Filler181)) as Filler181
    ,ltrim(rtrim(Filler182)) as Filler182
    ,ltrim(rtrim(Filler183)) as Filler183,
	cast (case when right(Invoiced_Amount_PAFF_Amount,1)='{' then replace(Invoiced_Amount_PAFF_Amount,right(Invoiced_Amount_PAFF_Amount,1),0)
			when right(Invoiced_Amount_PAFF_Amount,1)='A' then replace(Invoiced_Amount_PAFF_Amount,right(Invoiced_Amount_PAFF_Amount,1),1)
			when right(Invoiced_Amount_PAFF_Amount,1)='B' then replace(Invoiced_Amount_PAFF_Amount,right(Invoiced_Amount_PAFF_Amount,1),2)
			when right(Invoiced_Amount_PAFF_Amount,1)='C' then replace(Invoiced_Amount_PAFF_Amount,right(Invoiced_Amount_PAFF_Amount,1),3)
			when right(Invoiced_Amount_PAFF_Amount,1)='D' then replace(Invoiced_Amount_PAFF_Amount,right(Invoiced_Amount_PAFF_Amount,1),4)
			when right(Invoiced_Amount_PAFF_Amount,1)='E' then replace(Invoiced_Amount_PAFF_Amount,right(Invoiced_Amount_PAFF_Amount,1),5)
			when right(Invoiced_Amount_PAFF_Amount,1)='F' then replace(Invoiced_Amount_PAFF_Amount,right(Invoiced_Amount_PAFF_Amount,1),6)
			when right(Invoiced_Amount_PAFF_Amount,1)='G' then replace(Invoiced_Amount_PAFF_Amount,right(Invoiced_Amount_PAFF_Amount,1),7)
			when right(Invoiced_Amount_PAFF_Amount,1)='H' then replace(Invoiced_Amount_PAFF_Amount,right(Invoiced_Amount_PAFF_Amount,1),8)
			when right(Invoiced_Amount_PAFF_Amount,1)='I' then replace(Invoiced_Amount_PAFF_Amount,right(Invoiced_Amount_PAFF_Amount,1),9)
			when right(Invoiced_Amount_PAFF_Amount,1)='}' then '-' + replace(Invoiced_Amount_PAFF_Amount,right(Invoiced_Amount_PAFF_Amount,1),0)
			when right(Invoiced_Amount_PAFF_Amount,1)='J' then '-' + replace(Invoiced_Amount_PAFF_Amount,right(Invoiced_Amount_PAFF_Amount,1),1)
			when right(Invoiced_Amount_PAFF_Amount,1)='K' then '-' + replace(Invoiced_Amount_PAFF_Amount,right(Invoiced_Amount_PAFF_Amount,1),2)
			when right(Invoiced_Amount_PAFF_Amount,1)='L' then '-' + replace(Invoiced_Amount_PAFF_Amount,right(Invoiced_Amount_PAFF_Amount,1),3)
			when right(Invoiced_Amount_PAFF_Amount,1)='M' then '-' + replace(Invoiced_Amount_PAFF_Amount,right(Invoiced_Amount_PAFF_Amount,1),4)
			when right(Invoiced_Amount_PAFF_Amount,1)='N' then '-' + replace(Invoiced_Amount_PAFF_Amount,right(Invoiced_Amount_PAFF_Amount,1),5)
			when right(Invoiced_Amount_PAFF_Amount,1)='O' then '-' + replace(Invoiced_Amount_PAFF_Amount,right(Invoiced_Amount_PAFF_Amount,1),6)
			when right(Invoiced_Amount_PAFF_Amount,1)='P' then '-' + replace(Invoiced_Amount_PAFF_Amount,right(Invoiced_Amount_PAFF_Amount,1),7)
			when right(Invoiced_Amount_PAFF_Amount,1)='Q' then '-' + replace(Invoiced_Amount_PAFF_Amount,right(Invoiced_Amount_PAFF_Amount,1),8)
			when right(Invoiced_Amount_PAFF_Amount,1)='R' then '-' + replace(Invoiced_Amount_PAFF_Amount,right(Invoiced_Amount_PAFF_Amount,1),9)
			 when Invoiced_Amount_PAFF_Amount is null or Invoiced_Amount_PAFF_Amount='' then '0.0'
		else Invoiced_Amount_PAFF_Amount end as numeric(18,2) )as Invoiced_Amount_PAFF_Amount,
	ltrim(rtrim(Filler184 )) as Filler184
    ,ltrim(rtrim(Filler185 )) as Filler185
    ,ltrim(rtrim(Filler186 )) as Filler186
    ,ltrim(rtrim(Processor_Defined_Prior_Authorization_Reason_Code )) as Processor_Defined_Prior_Authorization_Reason_Code
    ,ltrim(rtrim(Adjustment_Reason_Code )) as Adjustment_Reason_Code
    ,ltrim(rtrim(Adjustment_Type )) as Adjustment_Type
    ,ltrim(rtrim(Transaction_ID_Cross_Reference )) as Transaction_ID_Cross_Reference
    ,ltrim(rtrim(Filler187 )) as Filler187
    ,ltrim(rtrim(Eligibility_COB_Indicator )) as Eligibility_COB_Indicator
    ,ltrim(rtrim(Filler188 )) as Filler188
    ,ltrim(rtrim(Filler189 )) as Filler189
    ,ltrim(rtrim(Filler190 )) as Filler190
	,cast (case when right(COB_Primary_Payer_Amount_Paid,1)='{' then replace(COB_Primary_Payer_Amount_Paid,right(COB_Primary_Payer_Amount_Paid,1),0)
			when right(COB_Primary_Payer_Amount_Paid,1)='A' then replace(COB_Primary_Payer_Amount_Paid,right(COB_Primary_Payer_Amount_Paid,1),1)
			when right(COB_Primary_Payer_Amount_Paid,1)='B' then replace(COB_Primary_Payer_Amount_Paid,right(COB_Primary_Payer_Amount_Paid,1),2)
			when right(COB_Primary_Payer_Amount_Paid,1)='C' then replace(COB_Primary_Payer_Amount_Paid,right(COB_Primary_Payer_Amount_Paid,1),3)
			when right(COB_Primary_Payer_Amount_Paid,1)='D' then replace(COB_Primary_Payer_Amount_Paid,right(COB_Primary_Payer_Amount_Paid,1),4)
			when right(COB_Primary_Payer_Amount_Paid,1)='E' then replace(COB_Primary_Payer_Amount_Paid,right(COB_Primary_Payer_Amount_Paid,1),5)
			when right(COB_Primary_Payer_Amount_Paid,1)='F' then replace(COB_Primary_Payer_Amount_Paid,right(COB_Primary_Payer_Amount_Paid,1),6)
			when right(COB_Primary_Payer_Amount_Paid,1)='G' then replace(COB_Primary_Payer_Amount_Paid,right(COB_Primary_Payer_Amount_Paid,1),7)
			when right(COB_Primary_Payer_Amount_Paid,1)='H' then replace(COB_Primary_Payer_Amount_Paid,right(COB_Primary_Payer_Amount_Paid,1),8)
			when right(COB_Primary_Payer_Amount_Paid,1)='I' then replace(COB_Primary_Payer_Amount_Paid,right(COB_Primary_Payer_Amount_Paid,1),9)
			when right(COB_Primary_Payer_Amount_Paid,1)='}' then '-' + replace(COB_Primary_Payer_Amount_Paid,right(COB_Primary_Payer_Amount_Paid,1),0)
			when right(COB_Primary_Payer_Amount_Paid,1)='J' then '-' + replace(COB_Primary_Payer_Amount_Paid,right(COB_Primary_Payer_Amount_Paid,1),1)
			when right(COB_Primary_Payer_Amount_Paid,1)='K' then '-' + replace(COB_Primary_Payer_Amount_Paid,right(COB_Primary_Payer_Amount_Paid,1),2)
			when right(COB_Primary_Payer_Amount_Paid,1)='L' then '-' + replace(COB_Primary_Payer_Amount_Paid,right(COB_Primary_Payer_Amount_Paid,1),3)
			when right(COB_Primary_Payer_Amount_Paid,1)='M' then '-' + replace(COB_Primary_Payer_Amount_Paid,right(COB_Primary_Payer_Amount_Paid,1),4)
			when right(COB_Primary_Payer_Amount_Paid,1)='N' then '-' + replace(COB_Primary_Payer_Amount_Paid,right(COB_Primary_Payer_Amount_Paid,1),5)
			when right(COB_Primary_Payer_Amount_Paid,1)='O' then '-' + replace(COB_Primary_Payer_Amount_Paid,right(COB_Primary_Payer_Amount_Paid,1),6)
			when right(COB_Primary_Payer_Amount_Paid,1)='P' then '-' + replace(COB_Primary_Payer_Amount_Paid,right(COB_Primary_Payer_Amount_Paid,1),7)
			when right(COB_Primary_Payer_Amount_Paid,1)='Q' then '-' + replace(COB_Primary_Payer_Amount_Paid,right(COB_Primary_Payer_Amount_Paid,1),8)
			when right(COB_Primary_Payer_Amount_Paid,1)='R' then '-' + replace(COB_Primary_Payer_Amount_Paid,right(COB_Primary_Payer_Amount_Paid,1),9)
		    when COB_Primary_Payer_Amount_Paid is null or COB_Primary_Payer_Amount_Paid='' then '0.0'
		else COB_Primary_Payer_Amount_Paid end as numeric(18,2) )as COB_Primary_Payer_Amount_Paid
	
	,cast (case when right(OPAR,1)='{' then replace(OPAR,right(OPAR,1),0)
			when right(OPAR,1)='A' then replace(OPAR,right(OPAR,1),1)
			when right(OPAR,1)='B' then replace(OPAR,right(OPAR,1),2)
			when right(OPAR,1)='C' then replace(OPAR,right(OPAR,1),3)
			when right(OPAR,1)='D' then replace(OPAR,right(OPAR,1),4)
			when right(OPAR,1)='E' then replace(OPAR,right(OPAR,1),5)
			when right(OPAR,1)='F' then replace(OPAR,right(OPAR,1),6)
			when right(OPAR,1)='G' then replace(OPAR,right(OPAR,1),7)
			when right(OPAR,1)='H' then replace(OPAR,right(OPAR,1),8)
			when right(OPAR,1)='I' then replace(OPAR,right(OPAR,1),9)
			when right(OPAR,1)='}' then '-' + replace(OPAR,right(OPAR,1),0)
			when right(OPAR,1)='J' then '-' + replace(OPAR,right(OPAR,1),1)
			when right(OPAR,1)='K' then '-' + replace(OPAR,right(OPAR,1),2)
			when right(OPAR,1)='L' then '-' + replace(OPAR,right(OPAR,1),3)
			when right(OPAR,1)='M' then '-' + replace(OPAR,right(OPAR,1),4)
			when right(OPAR,1)='N' then '-' + replace(OPAR,right(OPAR,1),5)
			when right(OPAR,1)='O' then '-' + replace(OPAR,right(OPAR,1),6)
			when right(OPAR,1)='P' then '-' + replace(OPAR,right(OPAR,1),7)
			when right(OPAR,1)='Q' then '-' + replace(OPAR,right(OPAR,1),8)
			when right(OPAR,1)='R' then '-' + replace(OPAR,right(OPAR,1),9)
			 when OPAR is null or OPAR='' then '0.0'
			else OPAR end as numeric(18,2) )as OPAR
    
	
	,ltrim(rtrim(Filler191 )) as Filler191,
	cast(case when right(COB_Primary_Payer_Copay,1)='{' then replace(COB_Primary_Payer_Copay,right(COB_Primary_Payer_Copay,1),0)
			when right(COB_Primary_Payer_Copay,1)='A' then replace(COB_Primary_Payer_Copay,right(COB_Primary_Payer_Copay,1),1)
			when right(COB_Primary_Payer_Copay,1)='B' then replace(COB_Primary_Payer_Copay,right(COB_Primary_Payer_Copay,1),2)
			when right(COB_Primary_Payer_Copay,1)='C' then replace(COB_Primary_Payer_Copay,right(COB_Primary_Payer_Copay,1),3)
			when right(COB_Primary_Payer_Copay,1)='D' then replace(COB_Primary_Payer_Copay,right(COB_Primary_Payer_Copay,1),4)
			when right(COB_Primary_Payer_Copay,1)='E' then replace(COB_Primary_Payer_Copay,right(COB_Primary_Payer_Copay,1),5)
			when right(COB_Primary_Payer_Copay,1)='F' then replace(COB_Primary_Payer_Copay,right(COB_Primary_Payer_Copay,1),6)
			when right(COB_Primary_Payer_Copay,1)='G' then replace(COB_Primary_Payer_Copay,right(COB_Primary_Payer_Copay,1),7)
			when right(COB_Primary_Payer_Copay,1)='H' then replace(COB_Primary_Payer_Copay,right(COB_Primary_Payer_Copay,1),8)
			when right(COB_Primary_Payer_Copay,1)='I' then replace(COB_Primary_Payer_Copay,right(COB_Primary_Payer_Copay,1),9)
			when right(COB_Primary_Payer_Copay,1)='}' then '-' + replace(COB_Primary_Payer_Copay,right(COB_Primary_Payer_Copay,1),0)
			when right(COB_Primary_Payer_Copay,1)='J' then '-' + replace(COB_Primary_Payer_Copay,right(COB_Primary_Payer_Copay,1),1)
			when right(COB_Primary_Payer_Copay,1)='K' then '-' + replace(COB_Primary_Payer_Copay,right(COB_Primary_Payer_Copay,1),2)
			when right(COB_Primary_Payer_Copay,1)='L' then '-' + replace(COB_Primary_Payer_Copay,right(COB_Primary_Payer_Copay,1),3)
			when right(COB_Primary_Payer_Copay,1)='M' then '-' + replace(COB_Primary_Payer_Copay,right(COB_Primary_Payer_Copay,1),4)
			when right(COB_Primary_Payer_Copay,1)='N' then '-' + replace(COB_Primary_Payer_Copay,right(COB_Primary_Payer_Copay,1),5)
			when right(COB_Primary_Payer_Copay,1)='O' then '-' + replace(COB_Primary_Payer_Copay,right(COB_Primary_Payer_Copay,1),6)
			when right(COB_Primary_Payer_Copay,1)='P' then '-' + replace(COB_Primary_Payer_Copay,right(COB_Primary_Payer_Copay,1),7)
			when right(COB_Primary_Payer_Copay,1)='Q' then '-' + replace(COB_Primary_Payer_Copay,right(COB_Primary_Payer_Copay,1),8)
			when right(COB_Primary_Payer_Copay,1)='R' then '-' + replace(COB_Primary_Payer_Copay,right(COB_Primary_Payer_Copay,1),9)
			 when COB_Primary_Payer_Copay is null or COB_Primary_Payer_Copay='' then '0.0'
			else COB_Primary_Payer_Copay end as numeric(18,2) ) as COB_Primary_Payer_Copay
    ,ltrim(rtrim(Filler192 )) as Filler192
    ,ltrim(rtrim(Filler193 )) as Filler193
    ,ltrim(rtrim(Filler194 )) as Filler194
    ,ltrim(rtrim(Filler195 )) as Filler195
    ,ltrim(rtrim(Filler196 )) as Filler196
    ,ltrim(rtrim(Filler197 )) as Filler197
    ,ltrim(rtrim(Transaction_ID )) as Transaction_ID
    ,ltrim(rtrim(Filler198 )) as Filler198
    ,ltrim(rtrim(General_Purpose_1)) as General_Purpose_1
    ,ltrim(rtrim(General_Purpose_2)) as General_Purpose_2
    ,ltrim(rtrim(General_Purpose_3_Group_Extension_Code)) as General_Purpose_3_Group_Extension_Code
    ,ltrim(rtrim(General_Purpose_4)) as General_Purpose_4
    ,ltrim(rtrim(Account_ID)) as Account_ID
    ,ltrim(rtrim(Care_Facility)) as Care_Facility
    ,ltrim(rtrim(Specialty_RX_Claim)) as Specialty_RX_Claim
    ,ltrim(rtrim(PharmacyMedical_Indicator)) as PharmacyMedical_Indicator
    ,ltrim(rtrim(Billing_Reporting_Code)) as Billing_Reporting_Code
    ,ltrim(rtrim(Alternate_ID )) as Alternate_ID
    ,ltrim(rtrim(Healthcare_Savings_Account_Exclusion_Flag )) as Healthcare_Savings_Account_Exclusion_Flag
    ,ltrim(rtrim(Deductible_Exclusion_Flag )) as Deductible_Exclusion_Flag
    ,ltrim(rtrim(Stop_Loss_Exclusion_Flag )) as Stop_Loss_Exclusion_Flag
    ,ltrim(rtrim(Maximum_Benefit_Exclusion_Flag )) as Maximum_Benefit_Exclusion_Flag
    ,ltrim(rtrim(Lifetime_Maximum_Benefit_Exclusion_Flag )) as Lifetime_Maximum_Benefit_Exclusion_Flag
    ,ltrim(rtrim(Processor_Defined_Data )) as Processor_Defined_Data
    ,ltrim(rtrim(Plan_Code_and_Extension )) as Plan_Code_and_Extension,
	--case when isnumeric(dbo.overpunch(Vaccine_Administration_Fee_Paid))=1 then cast(dbo.overpunch(Vaccine_Administration_Fee_Paid) as money) else '0.00' end as Vaccine_Administration_Fee_Paid,
		
		cast (case when right(Vaccine_Administration_Fee_Paid,1)='{' then replace(Vaccine_Administration_Fee_Paid,right(Vaccine_Administration_Fee_Paid,1),0)
			when right(Vaccine_Administration_Fee_Paid,1)='A' then replace(Vaccine_Administration_Fee_Paid,right(Vaccine_Administration_Fee_Paid,1),1)
			when right(Vaccine_Administration_Fee_Paid,1)='B' then replace(Vaccine_Administration_Fee_Paid,right(Vaccine_Administration_Fee_Paid,1),2)
			when right(Vaccine_Administration_Fee_Paid,1)='C' then replace(Vaccine_Administration_Fee_Paid,right(Vaccine_Administration_Fee_Paid,1),3)
			when right(Vaccine_Administration_Fee_Paid,1)='D' then replace(Vaccine_Administration_Fee_Paid,right(Vaccine_Administration_Fee_Paid,1),4)
			when right(Vaccine_Administration_Fee_Paid,1)='E' then replace(Vaccine_Administration_Fee_Paid,right(Vaccine_Administration_Fee_Paid,1),5)
			when right(Vaccine_Administration_Fee_Paid,1)='F' then replace(Vaccine_Administration_Fee_Paid,right(Vaccine_Administration_Fee_Paid,1),6)
			when right(Vaccine_Administration_Fee_Paid,1)='G' then replace(Vaccine_Administration_Fee_Paid,right(Vaccine_Administration_Fee_Paid,1),7)
			when right(Vaccine_Administration_Fee_Paid,1)='H' then replace(Vaccine_Administration_Fee_Paid,right(Vaccine_Administration_Fee_Paid,1),8)
			when right(Vaccine_Administration_Fee_Paid,1)='I' then replace(Vaccine_Administration_Fee_Paid,right(Vaccine_Administration_Fee_Paid,1),9)
			when right(Vaccine_Administration_Fee_Paid,1)='}' then '-' + replace(Vaccine_Administration_Fee_Paid,right(Vaccine_Administration_Fee_Paid,1),0)
			when right(Vaccine_Administration_Fee_Paid,1)='J' then '-' + replace(Vaccine_Administration_Fee_Paid,right(Vaccine_Administration_Fee_Paid,1),1)
			when right(Vaccine_Administration_Fee_Paid,1)='K' then '-' + replace(Vaccine_Administration_Fee_Paid,right(Vaccine_Administration_Fee_Paid,1),2)
			when right(Vaccine_Administration_Fee_Paid,1)='L' then '-' + replace(Vaccine_Administration_Fee_Paid,right(Vaccine_Administration_Fee_Paid,1),3)
			when right(Vaccine_Administration_Fee_Paid,1)='M' then '-' + replace(Vaccine_Administration_Fee_Paid,right(Vaccine_Administration_Fee_Paid,1),4)
			when right(Vaccine_Administration_Fee_Paid,1)='N' then '-' + replace(Vaccine_Administration_Fee_Paid,right(Vaccine_Administration_Fee_Paid,1),5)
			when right(Vaccine_Administration_Fee_Paid,1)='O' then '-' + replace(Vaccine_Administration_Fee_Paid,right(Vaccine_Administration_Fee_Paid,1),6)
			when right(Vaccine_Administration_Fee_Paid,1)='P' then '-' + replace(Vaccine_Administration_Fee_Paid,right(Vaccine_Administration_Fee_Paid,1),7)
			when right(Vaccine_Administration_Fee_Paid,1)='Q' then '-' + replace(Vaccine_Administration_Fee_Paid,right(Vaccine_Administration_Fee_Paid,1),8)
			when right(Vaccine_Administration_Fee_Paid,1)='R' then '-' + replace(Vaccine_Administration_Fee_Paid,right(Vaccine_Administration_Fee_Paid,1),9)
			 when Vaccine_Administration_Fee_Paid is null or Vaccine_Administration_Fee_Paid='' then '0.0'
			else Vaccine_Administration_Fee_Paid end as numeric(18,2) )as Vaccine_Administration_Fee_Paid,
    ltrim(rtrim(Drug_Admin_Fee_Type_Code )) as Drug_Admin_Fee_Type_Code
    ,ltrim(rtrim(Maintenance_Choice_Indicator )) as Maintenance_Choice_Indicator
    ,ltrim(rtrim(Filler199 )) as Filler199
    ,ltrim(rtrim(Filler200 )) as Filler200
	,source  
    ,getdate()
from raw_tfk.rstag_traffk_20161108_uhaul_webtransport_TM010114_fixed;


----------------Trailer---------------------------------------------------------------------

drop table if exists  raw_tfk.raw_traffk_20161108_uhaul_webtransport_TM010114_fixed_header;

create table raw_tfk.raw_traffk_20161108_uhaul_webtransport_TM010114_fixed_header
(
     Record_Type varchar(2)
    ,Version_Release_Number varchar(2)
    ,Sending_Entity_Identifier varchar(24)
    ,Batch_Number varchar(7)
    ,Creation_Date varchar(8)
    ,Creation_Time varchar(4)
    ,Receiver_ID varchar(24)
    ,Reporting_Period_Start_Date varchar(8)
    ,Reporting_Period_End_Date varchar(8)
    ,File_Type varchar(1)
    ,Transmission_Action varchar(1)
    ,Submission_Number varchar(2)
    ,Filler varchar(3909)
	,Source varchar(255)
	,import_date date
);

insert into raw_tfk.raw_traffk_20161108_uhaul_webtransport_TM010114_fixed_header
(
     Record_Type
    ,Version_Release_Number
    ,Sending_Entity_Identifier
    ,Batch_Number
    ,Creation_Date
    ,Creation_Time
    ,Receiver_ID
    ,Reporting_Period_Start_Date
    ,Reporting_Period_End_Date
    ,File_Type
    ,Transmission_Action
    ,Submission_Number
    ,Filler
	,Source
	,import_date
)
	select top 10
     ltrim(rtrim(Record_Type)) as Record_Type
    ,ltrim(rtrim(Version_Release_Number)) as Version_Release_Number
    ,ltrim(rtrim(Sending_Entity_Identifier)) as Sending_Entity_Identifier
    ,ltrim(rtrim(Batch_Number)) as Batch_Number
    ,ltrim(rtrim(Creation_Date)) as Creation_Date
    ,ltrim(rtrim(Creation_Time)) as Creation_Time
    ,ltrim(rtrim(Receiver_ID)) as Receiver_ID
    ,ltrim(rtrim(Reporting_Period_Start_Date)) as Reporting_Period_Start_Date
    ,ltrim(rtrim(Reporting_Period_End_Date)) as Reporting_Period_End_Date
    ,ltrim(rtrim(File_Type)) as File_Type
    ,ltrim(rtrim(Transmission_Action)) as Transmission_Action
    ,ltrim(rtrim(Submission_Number)) as Submission_Number
    ,ltrim(rtrim(Filler)) as Filler
	,source as Source
	,getdate()
from 
    raw_tfk.rstag_traffk_20161108_uhaul_webtransport_TM010114_fixed_header;
-------------------------------------------------------------------------------------------------  
drop table if exists  raw_tfk.raw_traffk_20161108_uhaul_webtransport_TM010114_fixed_trailer  ;
create table raw_tfk.raw_traffk_20161108_uhaul_webtransport_TM010114_fixed_trailer  
(
     Record_Type varchar(2)
    ,Total_Record_Count varchar(10)
    ,Total_Net_Amount_Due varchar(12)
    ,Filler varchar(3976)
    ,Source varchar(255)
	,import_date date
); 

insert into raw_tfk.raw_traffk_20161108_uhaul_webtransport_TM010114_fixed_trailer  
(	
     Record_Type
    ,Total_Record_Count
    ,Total_Net_Amount_Due
    ,Filler
	,Source
	,import_date
)
select 
     ltrim(rtrim(Record_Type)) as Record_Type
    ,ltrim(rtrim(Total_Record_Count)) as Total_Record_Count
    ,ltrim(rtrim(Total_Net_Amount_Due)) as Total_Net_Amount_Due
    ,ltrim(rtrim(Filler)) as Filler
	,Source as Source
	,getdate()
from 
    raw_tfk.rstag_traffk_20161108_uhaul_webtransport_TM010114_fixed_trailer  ;
	
	
	grant all on  raw_tfk.raw_traffk_20161108_uhaul_webtransport_TM010114_fixed        to public;
	grant all on  raw_tfk.raw_traffk_20161108_uhaul_webtransport_TM010114_fixed_trailer to public;
	grant all on  raw_tfk.raw_traffk_20161108_uhaul_webtransport_TM010114_fixed_header  to public;


