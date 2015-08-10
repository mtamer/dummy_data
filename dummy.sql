SELECT generate_series(1,15) AS id, md5(random()::text) AS name, md5(random()::text) AS address, md5(random()::text) AS descr;

Create table dummies AS SELECT generate_series(1,1000) AS id, md5(random()::text) AS name, md5(random()::text) AS address, md5(random()::text) AS descr;

