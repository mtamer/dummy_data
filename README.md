# dummy_data
Generate dummy data in PSQL

Code used to generate massive tables with data just for testing purposes. 

### Advantages:
1. Quick Querying.<br>
2. Seeing how fast your CPU returns a query with so many rows and columns your application needs.
3. Figuring out where to placeto place indexes for faster result returns.
4. Bulk data loading.
5. Testing

####Generation Data
```
SELECT generate_series(1,10) AS id, md5(random()::text) AS descr;
```
