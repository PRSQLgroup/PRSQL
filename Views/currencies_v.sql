create or replace view currencies_v as
select
  gt.r030,
  gt.txt,
  gt.rate,
  gt.cc,
  to_date(gt.exchangedate, 'DD.MM.YYYY') as exchangedate
from (
  select sys.get_nbu_currencies( ) as json_by_curency
  from dual
) tt
cross join json_table (
  tt.json_by_curency, '$[*]'
  columns (
    r030 number path '$.r030',
    txt varchar2(100) path '$.txt',
    rate number path '$.rate',
    cc varchar2(3) path '$.cc',
    exchangedate varchar2(10) path '$.exchangedate'
  )
) gt;



