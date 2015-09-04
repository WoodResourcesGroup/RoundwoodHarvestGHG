drop table if exists harvested;


create table harvested as select
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
