--представлення для об'єднання метрик 
CREATE VIEW data-analytics-mate.Students.v_Kepeshchuk_email_account AS
--метрики по аккаунтам
SELECT
s.date,
sp.country,
a.send_interval,
a.is_verified,
a.is_unsubscribed,
COUNT(DISTINCT a.id) AS account_cnt,
0 AS sent_msg,
0 AS open_msg,
0 AS visit_msg
FROM `DA.account` a      
JOIN `DA.account_session` acs
ON a.id = acs.account_id
JOIN `DA.session` s  
ON acs.ga_session_id = s.ga_session_id
JOIN `DA.session_params` sp
ON s.ga_session_id = sp.ga_session_id
GROUP BY s.date, sp.country, a.send_interval, a.is_verified,a.is_unsubscribed
UNION ALL
--метрики по емейлам
SELECT
DATE_ADD(s.date, INTERVAL es.sent_date DAY) AS date,
sp.country,
a.send_interval,
a.is_verified,
a.is_unsubscribed,
0 AS account_cnt,
COUNT(DISTINCT es.id_message) AS sent_msg,
COUNT(DISTINCT eo.id_message) AS open_msg,
COUNT(DISTINCT ev.id_message) AS visit_msg
FROM `DA.email_sent` es
LEFT JOIN `DA.email_open` eo
ON es.id_message = eo.id_message
LEFT JOIN `DA.email_visit` ev
ON es.id_message = ev.id_message
JOIN `DA.account` a      
ON a.id = es.id_account
JOIN `DA.account_session` acs    
ON a.id = acs.account_id
JOIN `DA.session` s
ON acs.ga_session_id = s.ga_session_id
JOIN `DA.session_params` sp
ON s.ga_session_id = sp.ga_session_id
GROUP BY date, sp.country,a.send_interval, a.is_verified, a.is_unsubscribed




with metrics_agg as
(
--агрегація даних
select
date,
country,
send_interval,
is_verified,
is_unsubscribed,
sum (account_cnt) as account_cnt,
sum (sent_msg) as sent_msg,
sum (open_msg) as open_msg,
sum (visit_msg) as visit_msg
from data-analytics-mate.Students.v_Kepeshchuk_email_account
group by date, country, send_interval, is_verified, is_unsubscribed
),


total_country as
--метрики по країні
(
select
country,
sum (account_cnt) as total_country_account_cnt,
sum (sent_msg) as total_country_sent_cnt
from metrics_agg
group by country
),


total_rank as
--ранг по країні
(
select
country,
rank () over (order by total_country_account_cnt desc) as rank_total_country_account_cnt,
rank () over (order by total_country_sent_cnt desc) as rank_total_country_sent_cnt
from total_country
)


--фінальний запит
select
date,
metrics_agg.country,
send_interval,
is_verified,
is_unsubscribed,
account_cnt,
sent_msg,
open_msg,
visit_msg,
total_country_account_cnt,
total_country_sent_cnt,
rank_total_country_account_cnt,
rank_total_country_sent_cnt
from metrics_agg
join total_country
on metrics_agg.country = total_country.country
join total_rank
on metrics_agg.country = total_rank.country
where rank_total_country_account_cnt <=10 or rank_total_country_sent_cnt <=10
order by date, country, send_interval, is_verified, is_unsubscribed
