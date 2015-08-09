# dummy_data
Generate dummy data in PSQL

Code used to generate massive tables with data just for testing purposes. 

### Advantages:
1. Quick Querying.<br>
2. Seeing how fast your CPU returns a query with so many rows and columns your application needs.
3. Figuring out where to placeto place indexes for faster result returns.
4. Bulk data loading.
5. Testing

####Generating Data
```
SELECT generate_series(1,10) AS id, md5(random()::text) AS descr;
 id |              descr               
----+----------------------------------
  1 | 1fdbb1c3be52a6c20f4be976197a5008
  2 | d8880895231cc62224445ed2b56b951e
  3 | 34ae51b86f0c98eb26cc475301354141
  4 | e75979ce1020adb8eea2ee1d9752e1cf
  5 | 06e6266bd5f7eb92e61ac73201e966b7
  6 | 0db5d206dceea0f4b760f4fe127f13c9
  7 | 8b19604ed16870db11e87d8ba8e3d9e1
  8 | 555074051110dbcd78e3a5930aecbdf4
  9 | e7fe7f9722dc2a8bdfa5ffe8121f52d9
 10 | e6d4475a30caab95d00759a631b02caa
(10 rows)
```
