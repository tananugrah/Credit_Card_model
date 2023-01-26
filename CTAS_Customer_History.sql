
-- create table as select customer data fact
with customer_data as (
 select distinct cast(cdh.CLIENTNUM as varchar) clientnum,
		sd.status,
		cdh.Customer_Age,
		cdh.Gender,
		cdh.Dependent_count,
		ed.Education_Level,
		md.Marital_Status,
		cdh.Income_Category,
		cd.Card_Category ,
		cdh.Months_on_book,
		cdh.Total_Relationship_Count,
		cdh.Months_Inactive_12_mon,
		cdh.Contacts_Count_12_mon,
		cdh.Credit_Limit,
		cdh.Total_Revolving_Bal,
		cdh.Avg_Open_To_Buy,
		cdh.Total_Trans_Amt,
		cdh.Total_Trans_Ct,
		cdh.Avg_Utilization_Ratio
 from dbo.customer_data_history cdh
	 left join status_db sd on cdh.idstatus = sd.id 
	 left join marital_db md on cdh.Maritalid = md.id 
	 left join education_db ed on cdh.Educationid = ed.id 
 	left join category_db cd on cdh.card_categoryid = cd.id 
 )
 select distinct clientnum,
		status,
		Customer_Age,
		Gender,
		Dependent_count,
		Education_Level,
		Marital_Status,
		Income_Category,
		Card_Category ,
		Months_on_book,
		Total_Relationship_Count,
		Months_Inactive_12_mon,
		Contacts_Count_12_mon,
		Credit_Limit,
		Total_Revolving_Bal,
		Avg_Open_To_Buy,
		Total_Trans_Amt,
		Total_Trans_Ct,
		Avg_Utilization_Ratio,
		count(clientnum) total_client
into customer_data_fact
from customer_data
group by clientnum,
		status,
		Customer_Age,
		Gender,
		Dependent_count,
		Education_Level,
		Marital_Status,
		Income_Category,
		Card_Category ,
		Months_on_book,
		Total_Relationship_Count,
		Months_Inactive_12_mon,
		Contacts_Count_12_mon,
		Credit_Limit,
		Total_Revolving_Bal,
		Avg_Open_To_Buy,
		Total_Trans_Amt,
		Total_Trans_Ct,
		Avg_Utilization_Ratio
