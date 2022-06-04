Problems
Now write and execute SQL queries to solve assignment problems

Problem 1
Find the total number of crimes recorded in the CRIME table
# Rows in Crime table
%sql select count(*) from CHICAGO_CRIME_DATA;
 * ibm_db_sa://rjz07540:***@dashdb-txn-sbox-yp-dal09-04.services.dal.bluemix.net:50000/BLUDB
Done.
1
533
Problem 2
Retrieve first 10 rows from the CRIME table
%sql select * from CHICAGO_CRIME_DATA fetch first 10 rows only;
 * ibm_db_sa://rjz07540:***@dashdb-txn-sbox-yp-dal09-04.services.dal.bluemix.net:50000/BLUDB
Done.
id	case_number	DATE	block	iucr	primary_type	description	location_description	arrest	domestic	beat	district	ward	community_area_number	fbicode	x_coordinate	y_coordinate	YEAR	updatedon	latitude	longitude	location
3512276	HK587712	08/28/2004 05:50:56 PM	047XX S KEDZIE AVE	890	THEFT	FROM BUILDING	SMALL RETAIL STORE	FALSE	FALSE	911	9	14	58	6	1155838	1873050	2004	02/10/2018 03:50:01 PM	41.80744050	-87.70395585	(41.8074405, -87.703955849)
3406613	HK456306	06/26/2004 12:40:00 PM	009XX N CENTRAL PARK AVE	820	THEFT	$500 AND UNDER	OTHER	FALSE	FALSE	1112	11	27	23	6	1152206	1906127	2004	02/28/2018 03:56:25 PM	41.89827996	-87.71640551	(41.898279962, -87.716405505)
8002131	HT233595	04/04/2011 05:45:00 AM	043XX S WABASH AVE	820	THEFT	$500 AND UNDER	NURSING HOME/RETIREMENT HOME	FALSE	FALSE	221	2	3	38	6	1177436	1876313	2011	02/10/2018 03:50:01 PM	41.81593313	-87.62464213	(41.815933131, -87.624642127)
7903289	HT133522	12/30/2010 04:30:00 PM	083XX S KINGSTON AVE	840	THEFT	FINANCIAL ID THEFT: OVER $300	RESIDENCE	FALSE	FALSE	423	4	7	46	6	1194622	1850125	2010	02/10/2018 03:50:01 PM	41.74366532	-87.56246276	(41.743665322, -87.562462756)
10402076	HZ138551	02/02/2016 07:30:00 PM	033XX W 66TH ST	820	THEFT	$500 AND UNDER	ALLEY	FALSE	FALSE	831	8	15	66	6	1155240	1860661	2016	02/10/2018 03:50:01 PM	41.77345530	-87.70648047	(41.773455295, -87.706480471)
7732712	HS540106	09/29/2010 07:59:00 AM	006XX W CHICAGO AVE	810	THEFT	OVER $500	PARKING LOT/GARAGE(NON.RESID.)	FALSE	FALSE	1323	12	27	24	6	1171668	1905607	2010	02/10/2018 03:50:01 PM	41.89644677	-87.64493868	(41.896446772, -87.644938678)
10769475	HZ534771	11/30/2016 01:15:00 AM	050XX N KEDZIE AVE	810	THEFT	OVER $500	STREET	FALSE	FALSE	1713	17	33	14	6	1154133	1933314	2016	02/10/2018 03:50:01 PM	41.97284491	-87.70860008	(41.972844913, -87.708600079)
4494340	HL793243	12/16/2005 04:45:00 PM	005XX E PERSHING RD	860	THEFT	RETAIL THEFT	GROCERY FOOD STORE	TRUE	FALSE	213	2	3	38	6	1180448	1879234	2005	02/28/2018 03:56:25 PM	41.82387989	-87.61350386	(41.823879885, -87.613503857)
3778925	HL149610	01/28/2005 05:00:00 PM	100XX S WASHTENAW AVE	810	THEFT	OVER $500	STREET	FALSE	FALSE	2211	22	19	72	6	1160129	1838040	2005	02/28/2018 03:56:25 PM	41.71128051	-87.68917910	(41.711280513, -87.689179097)
3324217	HK361551	05/13/2004 02:15:00 PM	033XX W BELMONT AVE	820	THEFT	$500 AND UNDER	SMALL RETAIL STORE	FALSE	FALSE	1733	17	35	21	6	1153590	1921084	2004	02/28/2018 03:56:25 PM	41.93929582	-87.71092344	(41.939295821, -87.710923442)
Problem 3
How many crimes involve an arrest?
%sql select count(ARREST) from CHICAGO_CRIME_DATA WHERE ARREST=TRUE; 
 * ibm_db_sa://rjz07540:***@dashdb-txn-sbox-yp-dal09-04.services.dal.bluemix.net:50000/BLUDB
Done.
1
163
Problem 4
Which unique types of crimes have been recorded at GAS STATION locations?
%sql select DISTINCT(PRIMARY_TYPE) from CHICAGO_CRIME_DATA WHERE LOCATION_DESCRIPTION ='GAS STATION'; 
 * ibm_db_sa://rjz07540:***@dashdb-txn-sbox-yp-dal09-04.services.dal.bluemix.net:50000/BLUDB
Done.
primary_type
CRIMINAL TRESPASS
NARCOTICS
ROBBERY
THEFT
Hint: Which column lists types of crimes e.g. THEFT?

Problem 5
In the CENUS_DATA table list all Community Areas whose names start with the letter ‘B’.
%sql select COMMUNITY_AREA_NAME from CENSUS_DATA WHERE COMMUNITY_AREA_NAME LIKE 'B%';
 * ibm_db_sa://rjz07540:***@dashdb-txn-sbox-yp-dal09-04.services.dal.bluemix.net:50000/BLUDB
Done.
community_area_name
Belmont Cragin
Burnside
Brighton Park
Bridgeport
Beverly
Problem 6
Which schools in Community Areas 10 to 15 are healthy school certified?
%sql select S.NAME_OF_SCHOOL,C.COMMUNITY_AREA_NUMBER,C.COMMUNITY_AREA_NAME,S.healthy_school_certified from CENSUS_DATA as  C \
LEFT OUTER JOIN CHICAGO_PUBLIC_SCHOOLS as S \
on UPPER(C.COMMUNITY_AREA_NAME) = UPPER(S.community_area_name) \
where C.COMMUNITY_AREA_NUMBER between 10 and 15 AND \
S.healthy_school_certified = 'Yes';
 * ibm_db_sa://rjz07540:***@dashdb-txn-sbox-yp-dal09-04.services.dal.bluemix.net:50000/BLUDB
Done.
name_of_school	community_area_number	community_area_name	healthy_school_certified
Rufus M Hitch Elementary School	10	Norwood Park	Yes
Problem 7
What is the average school Safety Score?
%sql select AVG(safety_score) as AVERAGE_SCRORE from CHICAGO_PUBLIC_SCHOOLS;
 * ibm_db_sa://rjz07540:***@dashdb-txn-sbox-yp-dal09-04.services.dal.bluemix.net:50000/BLUDB
Done.
average_scrore
49.504873
Problem 8
List the top 5 Community Areas by average College Enrollment [number of students]
%sql select COMMUNITY_AREA_NAME,AVG(COLLEGE_ENROLLMENT) as COLLEGE_ENROLLMENT_AVG \
from CHICAGO_PUBLIC_SCHOOLS GROUP BY COMMUNITY_AREA_NAME order by COLLEGE_ENROLLMENT_AVG desc LIMIT 5;
 * ibm_db_sa://rjz07540:***@dashdb-txn-sbox-yp-dal09-04.services.dal.bluemix.net:50000/BLUDB
Done.
community_area_name	college_enrollment_avg
ARCHER HEIGHTS	2411.500000
MONTCLARE	1317.000000
WEST ELSDON	1233.333333
BRIGHTON PARK	1205.875000
BELMONT CRAGIN	1198.833333
Problem 9
Use a sub-query to determine which Community Area has the least value for school Safety Score?
%sql select COMMUNITY_AREA_NAME,SAFETY_SCORE from CHICAGO_PUBLIC_SCHOOLS \
WHERE SAFETY_SCORE = (SELECT MIN(SAFETY_SCORE) FROM CHICAGO_PUBLIC_SCHOOLS);
 * ibm_db_sa://rjz07540:***@dashdb-txn-sbox-yp-dal09-04.services.dal.bluemix.net:50000/BLUDB
Done.
community_area_name	safety_score
WASHINGTON PARK	1
Problem 10
[Without using an explicit JOIN operator] Find the Per Capita Income of the Community Area which has a school Safety Score of 1.
%sql select  COMMUNITY_AREA_NAME,per_capita_income \
from CENSUS_DATA \
where community_area_number = (select community_area_number from CHICAGO_PUBLIC_SCHOOLS where safety_score = 1);
 * ibm_db_sa://rjz07540:***@dashdb-txn-sbox-yp-dal09-04.services.dal.bluemix.net:50000/BLUDB
Done.
community_area_name	per_capita_income
Washington Park	13785
