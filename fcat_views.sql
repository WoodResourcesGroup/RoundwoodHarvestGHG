--note that this assumes 2012 end use proportions from McIver et al.
create or replace view hrv_by_enduse as select
       	     year,
	     0.43*private as priv_lumber,
	     0.15*private as priv_landscape,
	     0.34*private as priv_energy,
	     0.06*private as priv_pp,
	     0.001*private as priv_waste,
	     0.43*nationalforests as nf_lumber,
	     0.15*nationalforests as nf_landscape,
	     0.34*nationalforests as nf_energy,
	     0.06*nationalforests as nf_pp,
	     0.001*nationalforests as nf_waste
	from umt_harvest order by year desc;


create or replace view tenyear_harv as
with foo as (select min(year)+10 mny from umt_harvest)
     select s1.year-10 year_start,
     	    s1.year year_end, 
     	    avg(s2.private) as priv10y_avg,
	    stddev(s2.private) as priv10y_stddev, 
     	    avg(s2.state) as state10y_avg,
	    stddev(s2.state) as state10y_stddev, 
     	    avg(s2.tribal) as tribal10y_avg,
	    stddev(s2.tribal) as tribal10y_stddev,
     	    avg(s2.blm) as blm10y_avg,
	    stddev(s2.blm) as blm10y_stddev,
     	    avg(s2.nationalforests) as nf10y_avg,
	    stddev(s2.nationalforests) as nf10y_stddev  
	    from umt_harvest s1, 
	    	 umt_harvest s2,
		 foo
            where s2.year between s1.year - 10 and s1.year 
	    and s1.year >= foo.mny
	    group by s1.year 
	    order by s1.year;
