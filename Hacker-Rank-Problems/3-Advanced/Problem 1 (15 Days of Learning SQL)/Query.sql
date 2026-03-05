with cte (submission_date, hacker_id) as 
(
    select distinct submission_date, hacker_id 
    from submissions 
    where submission_date=(select min(submission_date) from submissions)
    union all
    select s.submission_date, s.hacker_id from submissions s join cte on 
    cte.hacker_id=s.hacker_id 
    where s.submission_date=any(select min(submission_date) over() from submissions 
                                where submission_date > cte.submission_date)    
),
cte_unique(sdate, count_hid) as
(
    select submission_date, count(distinct hacker_id) from cte
    group by submission_date
),
cte_1 (sdate, hid, name, num_sub) as
(
    select s.submission_date, s.hacker_id, h.name,
    count(s.submission_id) over(partition by s.submission_date, s.hacker_id) from 
    submissions s join hackers h on h.hacker_id=s.hacker_id 
),
cte_f (sdate, hid, name, num_sub, min_hid, max_sub ) as
(
select *, min(hid) over(partition by sdate,num_Sub),
    max(num_sub) over(partition by sdate) from cte_1
),
cte_table (sdate, count_id, hid, name) as
(
    select cte_f.sdate,cteu.count_hid,cte_f.hid, cte_f.name from cte_unique cteu join 
    cte_f on cte_f.sdate=cteu.sdate
    where min_hid=cte_f.hid and num_sub=max_sub
)
select distinct cte_table.* from cte_table