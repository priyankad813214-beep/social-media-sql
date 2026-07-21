drop table instagram1;
create table instagram1(Post_ID	varchar(10),
Post_Date	date,
Platform	varchar(20),
Hashtag	varchar(30),
Content_Type	varchar(40),
Region	varchar(30),
Viewss	int,
Likes	int,
Shares	int,
Commentss	int);


copy instagram1
(Post_ID,Post_Date,Platform,Hashtag,Content_Type,Region,Viewss,Likes,Shares,Commentss)
from'C:\Program Files\PostgreSQL\18\Cleaned_Viral_Social_Media_Trends-selected-columns.csv'
delimiter','
csv header;


select count(*) from instagram1;

create table instagrame2(
Post_ID	varchar(10),
Platform	varchar(20),
Hashtag	varchar(20),
Content_Type	varchar(20),
Region	varchar(20),
Viewss	int,
Likes	int,
Shares	int,
Commentss	int,
Engagement_Level	varchar(20));


copy instagram2
(Post_ID,Platform,Hashtag,Content_Type,Region,Viewss,Likes,Shares,Commentss,Engagement_Level )
from'C:\Users\Admin\Downloads\New folder\Viral_Social_Media_Trends (1).csv'
delimiter','
csv header;

select * from instagram2;

select hashtag, row_number() over (partition by hashtag order by viewss) from instagram2;


-- check duplicates--
select Post_ID, count(*) from instagram2
group by Post_ID having count(*)>1

-- check missing values--
select count(*) filter (where post_date is null) as missing_date,
 count(*) filter (where platform is null) as platform, 
 count(*) filter (where hashtag is null) as hashtag,
 count(*) filter (where viewss is null) as viewss from instagram2;


 --total post--
 select count(*)from instagram2;

 --total views--
 select sum(Viewss) as total_views from instagram2;
 
 --average likes--
  select avg(likes) as avg_likes from instagram2;

  --mix views--
   select max(likes) as max_views from instagram2; 
 
   --min views--
    select min(viewss) as min_views from instagram2;

	-- views by platform--
	select sum(viewss) as total_views, platform  from instagram2
	group by Platform
	order by total_views;

	--liked by platform--
	select sum(likes) as likes, platform  from instagram2
	group by Platform

	--region analyisi--
	select sum(viewss) as total_views, region  from instagram2
	group by region
	order by total_views;
	-- top 10 hashtag--
	select sum(viewss) as total_views, hashtag  from instagram2
	group by hashtag
	order by total_views desc
	limit 10;

	