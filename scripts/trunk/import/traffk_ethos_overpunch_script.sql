select distinct 
sum (cast (PROFESSIONAL_FEE as float)) as PROFESSIONAL_FEE  ,
sum (cast (GROSS_COST as float)) 		as  GROSS_COST,
sum (cast (COPAY_COINSURANCE as float)) as  COPAY_COINSURANCE,
sum (cast (DEDUCTIBLE as float))		as  DEDUCTIBLE,
sum (cast (DISPENSING_FEE as float))	as  DISPENSING_FEE,
sum (cast (INGREDIENT_COST as float))	as  INGREDIENT_COST,
sum (cast (TOTAL_SALES_TAX as float))	as  TOTAL_SALES_TAX,
sum (cast (USUAL_CUSTOMARY as float))	as  USUAL_CUSTOMARY,
sum (cast (CLIENT_AMOUNT_DUE as float)) as CLIENT_AMOUNT_DUE
from raw_tfk.tfk_ethos_express_Pharmacy
where record_code='4';

-- CLIENT_AMOUNT_DUE
------------------------------------------------------------------------
update raw_tfk.tfk_ethos_express_Pharmacy
SET CLIENT_AMOUNT_DUE =case right(CLIENT_AMOUNT_DUE ,1)
when '{' then replace(CLIENT_AMOUNT_DUE ,right(CLIENT_AMOUNT_DUE ,1),0) 
when 'A' then replace(CLIENT_AMOUNT_DUE ,right(CLIENT_AMOUNT_DUE ,1),1) 
when 'B' then replace(CLIENT_AMOUNT_DUE ,right(CLIENT_AMOUNT_DUE ,1),2) 
when 'C' then replace(CLIENT_AMOUNT_DUE ,right(CLIENT_AMOUNT_DUE ,1),3) 
when 'D' then replace(CLIENT_AMOUNT_DUE ,right(CLIENT_AMOUNT_DUE ,1),4) 
when 'E' then replace(CLIENT_AMOUNT_DUE ,right(CLIENT_AMOUNT_DUE ,1),5) 
when 'F' then replace(CLIENT_AMOUNT_DUE ,right(CLIENT_AMOUNT_DUE ,1),6) 
when 'G' then replace(CLIENT_AMOUNT_DUE ,right(CLIENT_AMOUNT_DUE ,1),7) 
when 'H' then replace(CLIENT_AMOUNT_DUE ,right(CLIENT_AMOUNT_DUE ,1),8) 
when 'I' then replace(CLIENT_AMOUNT_DUE ,right(CLIENT_AMOUNT_DUE ,1),9) 
when '}' then '-'+replace(CLIENT_AMOUNT_DUE ,right(CLIENT_AMOUNT_DUE ,1),0) 
when 'J' then '-'+replace(CLIENT_AMOUNT_DUE ,right(CLIENT_AMOUNT_DUE ,1),1) 
when 'K' then '-'+replace(CLIENT_AMOUNT_DUE ,right(CLIENT_AMOUNT_DUE ,1),2) 
when 'L' then '-'+replace(CLIENT_AMOUNT_DUE ,right(CLIENT_AMOUNT_DUE ,1),3) 
when 'M' then '-'+replace(CLIENT_AMOUNT_DUE ,right(CLIENT_AMOUNT_DUE ,1),4) 
when 'N' then '-'+replace(CLIENT_AMOUNT_DUE ,right(CLIENT_AMOUNT_DUE ,1),5) 
when 'O' then '-'+replace(CLIENT_AMOUNT_DUE ,right(CLIENT_AMOUNT_DUE ,1),6) 
when 'P' then '-'+replace(CLIENT_AMOUNT_DUE ,right(CLIENT_AMOUNT_DUE ,1),7) 
when 'Q' then '-'+replace(CLIENT_AMOUNT_DUE ,right(CLIENT_AMOUNT_DUE ,1),8) 
when 'R' then '-'+replace(CLIENT_AMOUNT_DUE ,right(CLIENT_AMOUNT_DUE ,1),9) 
else CLIENT_AMOUNT_DUE  end;


--USUAL_CUSTOMARY
-------------------------------------------------------------------------
update raw_tfk.tfk_ethos_express_Pharmacy
SET USUAL_CUSTOMARY =case right(USUAL_CUSTOMARY ,1)
when '{' then replace(USUAL_CUSTOMARY ,right(USUAL_CUSTOMARY ,1),0) 
when 'A' then replace(USUAL_CUSTOMARY ,right(USUAL_CUSTOMARY ,1),1) 
when 'B' then replace(USUAL_CUSTOMARY ,right(USUAL_CUSTOMARY ,1),2) 
when 'C' then replace(USUAL_CUSTOMARY ,right(USUAL_CUSTOMARY ,1),3) 
when 'D' then replace(USUAL_CUSTOMARY ,right(USUAL_CUSTOMARY ,1),4) 
when 'E' then replace(USUAL_CUSTOMARY ,right(USUAL_CUSTOMARY ,1),5) 
when 'F' then replace(USUAL_CUSTOMARY ,right(USUAL_CUSTOMARY ,1),6) 
when 'G' then replace(USUAL_CUSTOMARY ,right(USUAL_CUSTOMARY ,1),7) 
when 'H' then replace(USUAL_CUSTOMARY ,right(USUAL_CUSTOMARY ,1),8) 
when 'I' then replace(USUAL_CUSTOMARY ,right(USUAL_CUSTOMARY ,1),9) 
when '}' then '-'+replace(USUAL_CUSTOMARY ,right(USUAL_CUSTOMARY ,1),0) 
when 'J' then '-'+replace(USUAL_CUSTOMARY ,right(USUAL_CUSTOMARY ,1),1) 
when 'K' then '-'+replace(USUAL_CUSTOMARY ,right(USUAL_CUSTOMARY ,1),2) 
when 'L' then '-'+replace(USUAL_CUSTOMARY ,right(USUAL_CUSTOMARY ,1),3) 
when 'M' then '-'+replace(USUAL_CUSTOMARY ,right(USUAL_CUSTOMARY ,1),4) 
when 'N' then '-'+replace(USUAL_CUSTOMARY ,right(USUAL_CUSTOMARY ,1),5) 
when 'O' then '-'+replace(USUAL_CUSTOMARY ,right(USUAL_CUSTOMARY ,1),6) 
when 'P' then '-'+replace(USUAL_CUSTOMARY ,right(USUAL_CUSTOMARY ,1),7) 
when 'Q' then '-'+replace(USUAL_CUSTOMARY ,right(USUAL_CUSTOMARY ,1),8) 
when 'R' then '-'+replace(USUAL_CUSTOMARY ,right(USUAL_CUSTOMARY ,1),9) 
else USUAL_CUSTOMARY  end;


--TOTAL_SALES_TAX
------------------------------------------------------------------------------
update raw_tfk.tfk_ethos_express_Pharmacy
SET TOTAL_SALES_TAX =case right(TOTAL_SALES_TAX ,1)
when '{' then replace(TOTAL_SALES_TAX ,right(TOTAL_SALES_TAX ,1),0) 
when 'A' then replace(TOTAL_SALES_TAX ,right(TOTAL_SALES_TAX ,1),1) 
when 'B' then replace(TOTAL_SALES_TAX ,right(TOTAL_SALES_TAX ,1),2) 
when 'C' then replace(TOTAL_SALES_TAX ,right(TOTAL_SALES_TAX ,1),3) 
when 'D' then replace(TOTAL_SALES_TAX ,right(TOTAL_SALES_TAX ,1),4) 
when 'E' then replace(TOTAL_SALES_TAX ,right(TOTAL_SALES_TAX ,1),5) 
when 'F' then replace(TOTAL_SALES_TAX ,right(TOTAL_SALES_TAX ,1),6) 
when 'G' then replace(TOTAL_SALES_TAX ,right(TOTAL_SALES_TAX ,1),7) 
when 'H' then replace(TOTAL_SALES_TAX ,right(TOTAL_SALES_TAX ,1),8) 
when 'I' then replace(TOTAL_SALES_TAX ,right(TOTAL_SALES_TAX ,1),9) 
when '}' then '-'+replace(TOTAL_SALES_TAX ,right(TOTAL_SALES_TAX ,1),0) 
when 'J' then '-'+replace(TOTAL_SALES_TAX ,right(TOTAL_SALES_TAX ,1),1) 
when 'K' then '-'+replace(TOTAL_SALES_TAX ,right(TOTAL_SALES_TAX ,1),2) 
when 'L' then '-'+replace(TOTAL_SALES_TAX ,right(TOTAL_SALES_TAX ,1),3) 
when 'M' then '-'+replace(TOTAL_SALES_TAX ,right(TOTAL_SALES_TAX ,1),4) 
when 'N' then '-'+replace(TOTAL_SALES_TAX ,right(TOTAL_SALES_TAX ,1),5) 
when 'O' then '-'+replace(TOTAL_SALES_TAX ,right(TOTAL_SALES_TAX ,1),6) 
when 'P' then '-'+replace(TOTAL_SALES_TAX ,right(TOTAL_SALES_TAX ,1),7) 
when 'Q' then '-'+replace(TOTAL_SALES_TAX ,right(TOTAL_SALES_TAX ,1),8) 
when 'R' then '-'+replace(TOTAL_SALES_TAX ,right(TOTAL_SALES_TAX ,1),9) 
else TOTAL_SALES_TAX  end;


--INGREDIENT_COST
-------------------------------------------------------------------------------
update raw_tfk.tfk_ethos_express_Pharmacy
SET INGREDIENT_COST =case right(INGREDIENT_COST ,1)
when '{' then replace(INGREDIENT_COST ,right(INGREDIENT_COST ,1),0) 
when 'A' then replace(INGREDIENT_COST ,right(INGREDIENT_COST ,1),1) 
when 'B' then replace(INGREDIENT_COST ,right(INGREDIENT_COST ,1),2) 
when 'C' then replace(INGREDIENT_COST ,right(INGREDIENT_COST ,1),3) 
when 'D' then replace(INGREDIENT_COST ,right(INGREDIENT_COST ,1),4) 
when 'E' then replace(INGREDIENT_COST ,right(INGREDIENT_COST ,1),5) 
when 'F' then replace(INGREDIENT_COST ,right(INGREDIENT_COST ,1),6) 
when 'G' then replace(INGREDIENT_COST ,right(INGREDIENT_COST ,1),7) 
when 'H' then replace(INGREDIENT_COST ,right(INGREDIENT_COST ,1),8) 
when 'I' then replace(INGREDIENT_COST ,right(INGREDIENT_COST ,1),9) 
when '}' then '-'+replace(INGREDIENT_COST ,right(INGREDIENT_COST ,1),0) 
when 'J' then '-'+replace(INGREDIENT_COST ,right(INGREDIENT_COST ,1),1) 
when 'K' then '-'+replace(INGREDIENT_COST ,right(INGREDIENT_COST ,1),2) 
when 'L' then '-'+replace(INGREDIENT_COST ,right(INGREDIENT_COST ,1),3) 
when 'M' then '-'+replace(INGREDIENT_COST ,right(INGREDIENT_COST ,1),4) 
when 'N' then '-'+replace(INGREDIENT_COST ,right(INGREDIENT_COST ,1),5) 
when 'O' then '-'+replace(INGREDIENT_COST ,right(INGREDIENT_COST ,1),6) 
when 'P' then '-'+replace(INGREDIENT_COST ,right(INGREDIENT_COST ,1),7) 
when 'Q' then '-'+replace(INGREDIENT_COST ,right(INGREDIENT_COST ,1),8) 
when 'R' then '-'+replace(INGREDIENT_COST ,right(INGREDIENT_COST ,1),9) 
else INGREDIENT_COST  end;


--DISPENSING_FEE
---------------------------------------------------------------------------
update raw_tfk.tfk_ethos_express_Pharmacy
SET DISPENSING_FEE =case right(DISPENSING_FEE ,1)
when '{' then replace(DISPENSING_FEE ,right(DISPENSING_FEE ,1),0) 
when 'A' then replace(DISPENSING_FEE ,right(DISPENSING_FEE ,1),1) 
when 'B' then replace(DISPENSING_FEE ,right(DISPENSING_FEE ,1),2) 
when 'C' then replace(DISPENSING_FEE ,right(DISPENSING_FEE ,1),3) 
when 'D' then replace(DISPENSING_FEE ,right(DISPENSING_FEE ,1),4) 
when 'E' then replace(DISPENSING_FEE ,right(DISPENSING_FEE ,1),5) 
when 'F' then replace(DISPENSING_FEE ,right(DISPENSING_FEE ,1),6) 
when 'G' then replace(DISPENSING_FEE ,right(DISPENSING_FEE ,1),7) 
when 'H' then replace(DISPENSING_FEE ,right(DISPENSING_FEE ,1),8) 
when 'I' then replace(DISPENSING_FEE ,right(DISPENSING_FEE ,1),9) 
when '}' then '-'+replace(DISPENSING_FEE ,right(DISPENSING_FEE ,1),0) 
when 'J' then '-'+replace(DISPENSING_FEE ,right(DISPENSING_FEE ,1),1) 
when 'K' then '-'+replace(DISPENSING_FEE ,right(DISPENSING_FEE ,1),2) 
when 'L' then '-'+replace(DISPENSING_FEE ,right(DISPENSING_FEE ,1),3) 
when 'M' then '-'+replace(DISPENSING_FEE ,right(DISPENSING_FEE ,1),4) 
when 'N' then '-'+replace(DISPENSING_FEE ,right(DISPENSING_FEE ,1),5) 
when 'O' then '-'+replace(DISPENSING_FEE ,right(DISPENSING_FEE ,1),6) 
when 'P' then '-'+replace(DISPENSING_FEE ,right(DISPENSING_FEE ,1),7) 
when 'Q' then '-'+replace(DISPENSING_FEE ,right(DISPENSING_FEE ,1),8) 
when 'R' then '-'+replace(DISPENSING_FEE ,right(DISPENSING_FEE ,1),9) 
else DISPENSING_FEE  end;


--DEDUCTIBLE
--------------------------------------------------------------------------
update raw_tfk.tfk_ethos_express_Pharmacy
SET DEDUCTIBLE =case right(DEDUCTIBLE ,1)
when '{' then replace(DEDUCTIBLE ,right(DEDUCTIBLE ,1),0) 
when 'A' then replace(DEDUCTIBLE ,right(DEDUCTIBLE ,1),1) 
when 'B' then replace(DEDUCTIBLE ,right(DEDUCTIBLE ,1),2) 
when 'C' then replace(DEDUCTIBLE ,right(DEDUCTIBLE ,1),3) 
when 'D' then replace(DEDUCTIBLE ,right(DEDUCTIBLE ,1),4) 
when 'E' then replace(DEDUCTIBLE ,right(DEDUCTIBLE ,1),5) 
when 'F' then replace(DEDUCTIBLE ,right(DEDUCTIBLE ,1),6) 
when 'G' then replace(DEDUCTIBLE ,right(DEDUCTIBLE ,1),7) 
when 'H' then replace(DEDUCTIBLE ,right(DEDUCTIBLE ,1),8) 
when 'I' then replace(DEDUCTIBLE ,right(DEDUCTIBLE ,1),9) 
when '}' then '-'+replace(DEDUCTIBLE ,right(DEDUCTIBLE ,1),0) 
when 'J' then '-'+replace(DEDUCTIBLE ,right(DEDUCTIBLE ,1),1) 
when 'K' then '-'+replace(DEDUCTIBLE ,right(DEDUCTIBLE ,1),2) 
when 'L' then '-'+replace(DEDUCTIBLE ,right(DEDUCTIBLE ,1),3) 
when 'M' then '-'+replace(DEDUCTIBLE ,right(DEDUCTIBLE ,1),4) 
when 'N' then '-'+replace(DEDUCTIBLE ,right(DEDUCTIBLE ,1),5) 
when 'O' then '-'+replace(DEDUCTIBLE ,right(DEDUCTIBLE ,1),6) 
when 'P' then '-'+replace(DEDUCTIBLE ,right(DEDUCTIBLE ,1),7) 
when 'Q' then '-'+replace(DEDUCTIBLE ,right(DEDUCTIBLE ,1),8) 
when 'R' then '-'+replace(DEDUCTIBLE ,right(DEDUCTIBLE ,1),9) 
else DEDUCTIBLE  end;

--COPAY_COINSURANCE
-----------------------------------------------------------------------------
update raw_tfk.tfk_ethos_express_Pharmacy
SET COPAY_COINSURANCE =case right(COPAY_COINSURANCE ,1)
when '{' then replace(COPAY_COINSURANCE ,right(COPAY_COINSURANCE ,1),0) 
when 'A' then replace(COPAY_COINSURANCE ,right(COPAY_COINSURANCE ,1),1) 
when 'B' then replace(COPAY_COINSURANCE ,right(COPAY_COINSURANCE ,1),2) 
when 'C' then replace(COPAY_COINSURANCE ,right(COPAY_COINSURANCE ,1),3) 
when 'D' then replace(COPAY_COINSURANCE ,right(COPAY_COINSURANCE ,1),4) 
when 'E' then replace(COPAY_COINSURANCE ,right(COPAY_COINSURANCE ,1),5) 
when 'F' then replace(COPAY_COINSURANCE ,right(COPAY_COINSURANCE ,1),6) 
when 'G' then replace(COPAY_COINSURANCE ,right(COPAY_COINSURANCE ,1),7) 
when 'H' then replace(COPAY_COINSURANCE ,right(COPAY_COINSURANCE ,1),8) 
when 'I' then replace(COPAY_COINSURANCE ,right(COPAY_COINSURANCE ,1),9) 
when '}' then '-'+replace(COPAY_COINSURANCE ,right(COPAY_COINSURANCE ,1),0) 
when 'J' then '-'+replace(COPAY_COINSURANCE ,right(COPAY_COINSURANCE ,1),1) 
when 'K' then '-'+replace(COPAY_COINSURANCE ,right(COPAY_COINSURANCE ,1),2) 
when 'L' then '-'+replace(COPAY_COINSURANCE ,right(COPAY_COINSURANCE ,1),3) 
when 'M' then '-'+replace(COPAY_COINSURANCE ,right(COPAY_COINSURANCE ,1),4) 
when 'N' then '-'+replace(COPAY_COINSURANCE ,right(COPAY_COINSURANCE ,1),5) 
when 'O' then '-'+replace(COPAY_COINSURANCE ,right(COPAY_COINSURANCE ,1),6) 
when 'P' then '-'+replace(COPAY_COINSURANCE ,right(COPAY_COINSURANCE ,1),7) 
when 'Q' then '-'+replace(COPAY_COINSURANCE ,right(COPAY_COINSURANCE ,1),8) 
when 'R' then '-'+replace(COPAY_COINSURANCE ,right(COPAY_COINSURANCE ,1),9) 
else COPAY_COINSURANCE  end;


update raw_tfk.tfk_ethos_express_Pharmacy
SET GROSS_COST =case right(GROSS_COST ,1)
when '{' then replace(GROSS_COST ,right(GROSS_COST ,1),0) 
when 'A' then replace(GROSS_COST ,right(GROSS_COST ,1),1) 
when 'B' then replace(GROSS_COST ,right(GROSS_COST ,1),2) 
when 'C' then replace(GROSS_COST ,right(GROSS_COST ,1),3) 
when 'D' then replace(GROSS_COST ,right(GROSS_COST ,1),4) 
when 'E' then replace(GROSS_COST ,right(GROSS_COST ,1),5) 
when 'F' then replace(GROSS_COST ,right(GROSS_COST ,1),6) 
when 'G' then replace(GROSS_COST ,right(GROSS_COST ,1),7) 
when 'H' then replace(GROSS_COST ,right(GROSS_COST ,1),8) 
when 'I' then replace(GROSS_COST ,right(GROSS_COST ,1),9) 
when '}' then '-'+replace(GROSS_COST ,right(GROSS_COST ,1),0) 
when 'J' then '-'+replace(GROSS_COST ,right(GROSS_COST ,1),1) 
when 'K' then '-'+replace(GROSS_COST ,right(GROSS_COST ,1),2) 
when 'L' then '-'+replace(GROSS_COST ,right(GROSS_COST ,1),3) 
when 'M' then '-'+replace(GROSS_COST ,right(GROSS_COST ,1),4) 
when 'N' then '-'+replace(GROSS_COST ,right(GROSS_COST ,1),5) 
when 'O' then '-'+replace(GROSS_COST ,right(GROSS_COST ,1),6) 
when 'P' then '-'+replace(GROSS_COST ,right(GROSS_COST ,1),7) 
when 'Q' then '-'+replace(GROSS_COST ,right(GROSS_COST ,1),8) 
when 'R' then '-'+replace(GROSS_COST ,right(GROSS_COST ,1),9) 
else GROSS_COST  end;


update raw_tfk.tfk_ethos_express_Pharmacy
SET PROFESSIONAL_FEE =case right(PROFESSIONAL_FEE ,1)
when '{' then replace(PROFESSIONAL_FEE ,right(PROFESSIONAL_FEE ,1),0) 
when 'A' then replace(PROFESSIONAL_FEE ,right(PROFESSIONAL_FEE ,1),1) 
when 'B' then replace(PROFESSIONAL_FEE ,right(PROFESSIONAL_FEE ,1),2) 
when 'C' then replace(PROFESSIONAL_FEE ,right(PROFESSIONAL_FEE ,1),3) 
when 'D' then replace(PROFESSIONAL_FEE ,right(PROFESSIONAL_FEE ,1),4) 
when 'E' then replace(PROFESSIONAL_FEE ,right(PROFESSIONAL_FEE ,1),5) 
when 'F' then replace(PROFESSIONAL_FEE ,right(PROFESSIONAL_FEE ,1),6) 
when 'G' then replace(PROFESSIONAL_FEE ,right(PROFESSIONAL_FEE ,1),7) 
when 'H' then replace(PROFESSIONAL_FEE ,right(PROFESSIONAL_FEE ,1),8) 
when 'I' then replace(PROFESSIONAL_FEE ,right(PROFESSIONAL_FEE ,1),9) 
when '}' then '-'+replace(PROFESSIONAL_FEE ,right(PROFESSIONAL_FEE ,1),0) 
when 'J' then '-'+replace(PROFESSIONAL_FEE ,right(PROFESSIONAL_FEE ,1),1) 
when 'K' then '-'+replace(PROFESSIONAL_FEE ,right(PROFESSIONAL_FEE ,1),2) 
when 'L' then '-'+replace(PROFESSIONAL_FEE ,right(PROFESSIONAL_FEE ,1),3) 
when 'M' then '-'+replace(PROFESSIONAL_FEE ,right(PROFESSIONAL_FEE ,1),4) 
when 'N' then '-'+replace(PROFESSIONAL_FEE ,right(PROFESSIONAL_FEE ,1),5) 
when 'O' then '-'+replace(PROFESSIONAL_FEE ,right(PROFESSIONAL_FEE ,1),6) 
when 'P' then '-'+replace(PROFESSIONAL_FEE ,right(PROFESSIONAL_FEE ,1),7) 
when 'Q' then '-'+replace(PROFESSIONAL_FEE ,right(PROFESSIONAL_FEE ,1),8) 
when 'R' then '-'+replace(PROFESSIONAL_FEE ,right(PROFESSIONAL_FEE ,1),9) 
else PROFESSIONAL_FEE  end;

