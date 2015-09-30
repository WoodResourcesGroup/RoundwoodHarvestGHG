create or replace function ccf2c(double precision, 
       	  	  	   	spgrav double precision default 0.45, 
				mc double precision default 0.12) returns double precision
       as 'select $1 * 0.083 * spgrav * 62.4 * 0.5 * 0.00045359237'
--     MMBF * mccf/mmbf + specific gravity (mlbs/mccf) * water mlbs/mccf * carbon ratio * mlbs/mmt 
       language sql
       immutable
       returns null on null input;


--note that this assumes 2012 end use proportions from McIver et al.
create or replace view hrv_by_enduse as select
       	     year,
	     0.43*private::numeric(8,2) as priv_lumber,
	     0.15*private::numeric(8,2) as priv_landscape,
	     0.34*private::numeric(8,2) as priv_energy,
	     0.06*private::numeric(8,2) as priv_pp,
	     0.001*private::numeric(8,2) priv_waste,
	     0.43*nationalforests::numeric(8,2) as nf_lumber,
	     0.15*nationalforests::numeric(8,2) as nf_landscape,
	     0.34*nationalforests::numeric(8,2) as nf_energy,
	     0.06*nationalforests::numeric(8,2) as nf_pp,
	     0.001*nationalforests::numeric(8,2) as nf_waste
	from umt_harvest order by year desc;


create or replace view tenyear_harv as
with foo as (select min(year)+10 mny from umt_harvest)
     select s1.year-10 year_start,
     	    s1.year year_end, 
     	    ccf2c(avg(s2.private))::numeric(8,2) as priv10y_avg,
	    ccf2c(stddev(s2.private))::numeric(8,2) as priv10y_stddev, 
     	    ccf2c(avg(s2.state))::numeric(8,2) as state10y_avg,
	    ccf2c(stddev(s2.state))::numeric(8,2) as state10y_stddev, 
     	    ccf2c(avg(s2.tribal))::numeric(8,2) as tribal10y_avg,
	    ccf2c(stddev(s2.tribal))::numeric(8,2) as tribal10y_stddev,
     	    ccf2c(avg(s2.blm))::numeric(8,2) as blm10y_avg,
	    ccf2c(stddev(s2.blm))::numeric(8,2) as blm10y_stddev,
     	    ccf2c(avg(s2.nationalforests))::numeric(8,2) as nf10y_avg,
	    ccf2c(stddev(s2.nationalforests))::numeric(8,2) as nf10y_stddev  
	    from umt_harvest s1, 
	    	 umt_harvest s2,
		 foo
            where s2.year between s1.year - 10 and s1.year 
	    and s1.year >= foo.mny
	    group by s1.year 
	    order by s1.year;
