use new_schema;
#1.Import the csv file to a table in the database.
#ans: CSV file converted to json and succefully imported in the name of 'name'.
show tables;
select * from name;
#2.Remove the column 'Player Profile' from the table.
alter table name drop column `player profile` ;
desc name;
alter table name  change  `0` `zeros` varchar(3);
alter table name  change  `50` `fifties` varchar(3);
alter table name  change  `100` `hundreds` varchar(3);
#3.Extract the country name and player names from the given data and store it in separate columns for further usage.
#4From the column 'Span' extract the start_year and end_year and store them in separate columns for further usage.
create table new (select zeros,fifties,hundreds,hs,mat,inn,no,runs,avg, substring(player,1,instr(player,'('or '/')-1) `name` , 
(substring_index(player,'(',-1)) country, 
substring(Span,1,instr(Span,'-')-1) start_year, substring_index(Span,'-',-1) 
end_year  from name );
#5.The column 'HS' has the highest score scored by the player so far in any given match. The column also has 
#details if the player had completed the match in a NOT OUT status. Extract the data and store the highest runs 
#and the NOT OUT status in different columns.
# in the below code i have cleared all '-' values and replaced them with null values, so that we can extract 
#the numerical and varchar not out values into seperate column
update new 
set zeros=case
when zeros like '-'
then zeros=null
else 
zeros
end;
update new 
set fifties=case
when fifties like '-'
then fifties=null
else 
fifties
end;
update new 
set hundreds=case
when hundreds like '-'
then hundreds=null
else 
hundreds
end;
update new 
set avg=case
when avg like '-'
then avg=null
else 
avg
end;
update new 
set zeros=case
when zeros like '-'
then zeros=null
else 
zeros
end;
update new 
set hs=case
when hs like '-'
then hs=null
else 
hs
end;
update new 
set inn=case
when inn like '-'
then inn=null
else 
inn
end;
update new 
set no=case
when no like '-'
then no=null
else 
no
end;
update new 
set runs=case
when runs like '-'
then runs=null
else 
runs
end;
update new 
set high_score=case
when high_score like '-'
then high_score=null
else 
high_score
end;
alter table new modify column zeros int(10);
alter table new modify column fifties int(10);
alter table new modify column hundreds int(10);
alter table new modify column high_score int(10);
alter table new modify column hs int(10);
alter table new modify column mat int(10);
alter table new modify column inn int(10);
alter table new modify column not_out int(10);
alter table new modify column no int(10);
alter table new modify column runs int(10);
alter table new modify column avg int(10);
desc new;
select * from new;
alter table new add column high_score int;
alter table new add column not_out varchar(10);
update new 
set high_score=case 
when
hs not like '%*'
then hs
else
null
end;
update new 
set not_out=case 
when
hs  like '%*'
then hs
else
null
end; 
#6. Using the data given, considering the players who were active in the year of 2019, create a set of batting 
#order of best 6 players using the selection criteria of those who have a good average score across all matches 
#for India.
select name,avg,end_year,start_year,country from new where (end_year>=2019 or start_year=2019) and country like('%IND%')  order by avg desc limit 6;
#7. Using the data given, considering the players who were active in the year of 2019, create a set of batting 
#order of best 6 players using the selection criteria of those who have the highest number of 100s across all 
#matches for India.
select name,country,end_year,start_year,hundreds from new where (end_year>=2019 or start_year=2019) and country like ('%INDIA%') order by hundreds desc limit 6 ; 
#8. Using the data given, considering the players who were active in the year of 2019, create a set of batting 
#order of best 6 players using 2 selection criteria of your own for India.
select name,avg,hundreds,country,start_year,end_year from new where (start_year=2019 or end_year>=2019) and country like ('%INDIA%') order by avg and hundreds desc limit 6;
#9. Create a View named ‘Batting_Order_GoodAvgScorers_SA’ using the data given, considering the players who were active 
#in the year of 2019, create a set of batting order of best 6 players using the selection criteria of those who 
#have a good average score across all matches for South Africa.
select name,avg as Batting_Order_GoodAvgScorers_SA,start_year,end_year from new where start_year=2019 or end_year>=2019 order by avg desc limit 6;
#10. Create a View named ‘Batting_Order_HighestCenturyScorers_SA’ Using the data given, considering the players who 
#were active in the year of 2019, create a set of batting order of best 6 players using the selection criteria of 
#those who have highest number of 100s across all matches for South Africa.
select name,hundreds as Batting_Order_HighestCenturyScorers_SA,start_year,end_year from new where (start_year=2019 or end_year>=2019) and country like ('%SA%') order by hundreds desc limit 6;
SELECT * from new;
desc new;
#11. Using the data given, Give the number of player_played for each country.
select country,count(name) from new group by country;
#12. Using the data given, Give the number of player_played for Asian and Non-Asian continent
select distinct(country) from new;
select n.country as asian, count(n.name),a.country as non_asian, count(a.name) from new n join new a on a.name=n.name  where (n.country in ('%IND%','%SL%','%PAK%','%BDESH%','%AFG%') and a.country in ('%SA%','%ZIM%','%ENG%','%NZ%','%WI%','%IRE%','%AUS%')) GROUP BY (a.country and n.country);