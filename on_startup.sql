CREATE ROLE kafka_replica WITH superuser login PASSWORD 'kafka_replica';
CREATE SCHEMA debezium_info;
CREATE TABLE debezium_info.heartbeat (id serial PRIMARY KEY, date_load TIMESTAMPTZ DEFAULT NOW() );

CREATE TABLE public.fact_cost (
                id serial NOT NULL PRIMARY KEY,
                transaction_ts timestamp NOT NULL,
                sum_cost NUMERIC(10,3) NOT NULL
);

WITH insert_10 as(
select 
    generate_series(1, 100, 1) AS test, 
    timestamp '2023-01-01 00:00:00' +
       random() * (timestamp '2023-12-01 00:00:00' -
                   timestamp '2023-01-01 23:59:59') AS transaction_ts,
    random()*1000::NUMERIC(10,3) AS sum_cost)
INSERT  INTO public.fact_cost (transaction_ts, sum_cost)
SELECT transaction_ts,
        sum_cost
FROM insert_10;

CREATE TABLE public.alex (
                id serial NOT NULL PRIMARY KEY,
                name text NOT NULL,
                age integer NOT NULL
);

insert into public.alex (name, age) values ('Zadonsky', 60);

CREATE PUBLICATION dbz_publication FOR TABLE debezium_info.heartbeat,public.fact_cost,public.alex;