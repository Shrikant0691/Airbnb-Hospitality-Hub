create database airbnb;

show databases;

use airbnb;

# importing data

drop table listing ;
drop table booking;

show tables;


select * from listing l ;

create view v1 as select * from listing l ;

select * from bookinga b ;

# We have 2 tables here in which listing id from bookinga b and id from listing l are common columns for the jons. ftetch
# data accordingly.

#Q1. Import data from tables.

select * from listing l ;

select * from bookinga b ;

#Q2. Q2 Write a query to show names from Listings table

select name   from listing l ;

#q3 Write a query to fetch total listings from the listings table

select count(id) total_listing from listing l ;

#Q4 Write a query to fetch total listing_id from the booking_details table

select count(listing_id) total_listingid    from bookinga b ;

#Q5 Write a query to fetch host ids from listings table

select host_id  from listing l ;

#Q6 Write a query to fetch all unique host name from listings table

select  distinct(upper(host_name))   from listing l  ;

#Q7. Write a query to show all unique neighbourhood_group from listings table

select distinct(neighbourhood_group )  from listing l;

#Q8.Write a query to show all unique neighbourhood from listings table

select distinct(neighbourhood )  from listing l;

#Q9 Write a query to fetch unique room_type from listings tables

select distinct(room_type)   from listing l;

#q10 Write a query to show all values of Brooklyn & Manhattan from listings tables

select *from listing l where neighbourhood_group in ('Brooklyn','Manhattan');

#Q11 Write a query to show maximum price from booking_details table

select max(price)  from bookinga b;

#Q12 Write a query to show minimum price fron booking_details table

select MIN(price)  from bookinga b;

#Q13 Write a query to show average price from booking_details table

select avg(price) from bookinga b ;

#Q14 Write a query to show minimum value of minimum_nights from booking_details table


select min(minimum_nights)   from bookinga b;
#Q15 Write a query to show maxiumum value of minimum_nights from booking_details table

select MAX(minimum_nights)   from bookinga b;

select l.host_name ,b.minimum_nights , l.room_type ,b.price 
from listing l join bookinga b
on l.id =b.listing_id 
where b.minimum_nights in (select MAX(minimum_nights)   from bookinga b);

#Q16 Write a query to show average availability_365

select avg(availability_365)    from bookinga b;

#Q17 Write a query to show id , availability_365 and all availability_365 values greater than 300

select listing_id , availability_365    from bookinga b where availability_365 > 300 ;

#Q18 Write a query to show count of id where minimum_nights spend is less than 5

select count(listing_id) less_than_5_minimum_nights_ids from bookinga b where minimum_nights <5; 

#Q19. Write a query to show count of id where price is in between 300 to 400

select count(listing_id) bw300_to_400_price from bookinga b where price between 300 and 400 ;

#Q20. Write a query to show count where minimum_nights spend is greater than 100

select count(listing_id) from bookinga b where minimum_nights > 100 ;

#Q21. Write a query to show all data of listings & booking_details

select l.* , b.*
from listing l join bookinga b 
on l.id =b.listing_id ;

#Q22 Write a query to show host name and price

select l.host_name , b.price 
from listing l join bookinga b
on l.id =b.listing_id ;

#Q23 Write a query to show room_type and price


select l.room_type  , b.price 
from listing l join bookinga b
on l.id =b.listing_id ;
#Q24 Write a query to show neighbourhood_group & minimum_nights spend


select l.neighbourhood_group  , b.minimum_nights 
from listing l join bookinga b
on l.id =b.listing_id ;

#25. Write a query to show neighbourhood & availability_365

select l.neighbourhood , b.minimum_nights 
from listing l inner join bookinga b 
on l.id =b.listing_id ;

#26 .Write a query to show total price by neighbourhood_group

select l.neighbourhood_group ,sum(b.price) as total_price
from listing l join bookinga b 
on l.id =b.listing_id 
group by neighbourhood_group ;

#27.Write a query to show maximum price by neighbourhood_group

select l.neighbourhood_group , max(b.price) maxprice
from listing l join bookinga b 
on l.id =b.listing_id 
group by neighbourhood_group ;

#28.Write a query to show maximum night spend by neighbourhood_group

select l.neighbourhood_group , max(b.minimum_nights) as maximum_nights_spend
from listing l join bookinga b 
on l.id =b.listing_id 
group by neighbourhood_group ;

#29. Write a query to show maximum reviews_per_month spend by neighbourhood

select l.neighbourhood , max(b.number_of_reviews) max_reviews
from listing l join bookinga b 
on l.id = b.listing_id 
group by neighbourhood ;

#30. Write a query to show maximum price by room type
select l.room_type , max(b.price) max_price
from listing l join bookinga b 
on l.id =b.listing_id 
group by room_type ;

#31 Write a query to show average number_of_reviews by room_type

select l.room_type , avg(b.number_of_reviews) avg_reviews
from listing l join bookinga b 
on l.id =b.listing_id 
group by room_type ;

#32. Write a query to show average price by room type

select l.room_type , avg(b.price) avg_price
from listing l join bookinga b 
on l.id =b.listing_id 
group by room_type ;

#33. Write a query to show average night spend by room type

select l.room_type  , avg(b.minimum_nights) as avg_nights_spend
from listing l join bookinga b 
on l.id =b.listing_id 
group by room_type  ;

#34. Write a query to show average price by room type but average price is less than 100

select l.room_type , avg(b.price) avg_price
from listing l join bookinga b 
on l.id =b.listing_id 
group by room_type 
having avg(b.price) < 100;

#35. Write a query to show average night by neighbourhood and average_nights is greater than 5

select l.neighbourhood  , avg(b.minimum_nights) as avg_nights_spend
from listing l join bookinga b 
on l.id =b.listing_id 
group by neighbourhood  
having avg(b.minimum_nights) > 5;

#36. Write a query to show all data from listings where price is greater than 200 using sub-query.

select price from bookinga b where price > 200 ;

select l.* , b.price 
from listing l join bookinga b
on l.id = b.listing_id 
where price in(select price from bookinga b where price > 200 );

#37. Write a query to show all values from booking_details table where host id is 314941 using sub-query.




#38 Find all pairs of id having the same host id, each pair coming once only.

select distinct(b.listing_id) , l.host_id 
from bookinga b  left join listing l  
on l.host_id  =b.listing_id ;

#39 Write an sql query to show fetch all records that have the term cozy in name

select l.* , b.*
from listing l join bookinga b 
on l.id = b.listing_id 
where name like "%cozy%";

#40 Write an sql query to show price, host id, neighbourhood_group of manhattan neighbourhood_group

select l.host_id ,l.neighbourhood_group , b.price 
from listing l join bookinga b 
on l.id = b.listing_id 
where neighbourhood_group = 'Manhattan' ;

#41 Write a query to show id , host name, neighbourhood and price but only for Upper West Side & Williamsburg neighbourhood, also make sure price is greater than 100

select l.id ,l.host_name ,l.neighbourhood ,b.price 
from listing l join bookinga b 
on l.id = b.listing_id 
where price > 100 and neighbourhood in ("Upper West Side","Williamsburg");

#42 Write a query to show id , host name, neighbourhood and price for host name Elise and neighbourhood is Bedford-Stuyvesant

select l.id ,l.host_name ,l.neighbourhood ,b.price 
from listing l join bookinga b 
on l.id = b.listing_id 
where host_name ="Elise" and neighbourhood in ("Bedford-Stuyvesant");

#43 Write a query to show host_name, availability_365,minimum_nights only for 100+ availability_365 and minimum_nights

select l.host_name , b.availability_365 , b.minimum_nights  
from listing l join bookinga b 
on l.id = b.listing_id 
where b.availability_365 > 100 and b.minimum_nights > 100 ;

#44. Write a query to show to fetch id , host_name , number_of_reviews, and reviews_per_month but show only that
#records where number of reviews are 500+ and review per
#month is 5+

select l.id , l.host_name , b.number_of_reviews ,b.reviews_per_month 
from listing l join bookinga b 
on l.id = b.listing_id 
where b.number_of_reviews > 500 and b.reviews_per_month >5;

#45. Write a query to show neighbourhood_group which have most total number of review



select l.neighbourhood_group ,max(b.number_of_reviews) 
from listing l join bookinga b 
on l.id =b.listing_id 
group by neighbourhood_group; 

#46.Write a query to show host name which have most cheaper total price


select l.host_name  ,min(b.price) 
from listing l join bookinga b 
on l.id =b.listing_id 
group by host_name 
order by min(b.price) asc;
#47 Write a query to show host name which have most costly total price


select l.host_name  ,max(b.price) 
from listing l join bookinga b 
on l.id =b.listing_id 
group by host_name 
order by max(b.price) desc;

#48. Write a query to show host name which have max price using sub-query 

select l.host_name  ,b.price 
from listing l join bookinga b 
on l.id =b.listing_id 
where b.price in (select max(price) from bookinga b );

select max(price) from bookinga b ;

#49 Write a query to show neighbourhood_group where price is less than 100

select l.neighbourhood_group , b.price 
from listing l join bookinga b 
on l.id =b.listing_id 
where b.price < 100;

#50 Write a query to find max price, average availability_365 for each room type and order in ascending by maximum price.

select avg(b.availability_365) , max(b.price) , l.room_type 
from listing l join bookinga b 
on l.id = b.listing_id 
group by l.room_type 
order by max(b.price) asc;

















