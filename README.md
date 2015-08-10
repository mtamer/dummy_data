# dummy_data
Generate dummy data in PSQL

Code used to generate massive tables with data just for testing purposes. 

### Advantages:
1. Quick Querying.
2. Seeing how fast your CPU returns a query with so many rows and columns your application needs.
3. Figuring out where to placeto place indexes for faster result returns.
4. Bulk data loading.
5. Testing

####Generating Data
On the fly generating data:
```
SELECT generate_series(1,15) AS id, md5(random()::text) AS name, md5(random()::text) AS address, md5(random()::text) AS descr;
 id |               name               |             address              |              descr               
----+----------------------------------+----------------------------------+----------------------------------
  1 | 2a83273546302a829a02aa051ca96af6 | 781f13544e2d6677289e688b34b4c509 | e90524652d033f1508de2631ade431ba
  2 | 0c499d9aaef3ac3695f06dc8b737c3ee | 2ea93a4b5fe5c3ed516d29fbb001a02b | 21517d680e1463256265ed0a84484d14
  3 | 10d72cf9407a7f1e07212d543e77ef3f | 42efbc6496e4237d4ca24ec0cf63b445 | de3a42fd13a77cfa3b4cc40aac9427d8
  4 | 7ef20fcff2e7f81319db9c0b4a6caa0c | dea587c5a76646df5c400cdf53e4328a | c4a13f5c245cdc810b89b3e5912d2313
  5 | b29a4475df67cf03d9c7f0bce727a125 | e51df199336bdb68de97998a1af27d06 | 560c5ef46f040c2645d81a90a96315b2
  6 | 3857c8481aa416db84ad3918c644eaad | 4b00e81f147f0ab5f84b27d1c8ee329a | af2e80a7ed384612f194bff10b598d9a
  7 | 83493e87b5051bc84007e6e4a6add335 | ab148e70ed4bc09307293827b415ccbf | ab5eb9be5079d6b9e41dca3d2f811b08
  8 | 8ff3f067aff7f8f95bd63629fac3d7f7 | b17dc80e7a4b116579f740a957974270 | e805f415cd9da533f56925691169e36d
  9 | 470d92ef594e5fe5a0f5ed6b41d8c9b8 | e8c785d5c60e3020d809ca73eb17709d | a1d60a0aad2539bd71eb9ef63c9799a1
 10 | baae43065fde944db360c06a7fba8b02 | 8ba6ab8d9b800c12aac1e1fe5cf5e02b | 26b5349f074246a573e2abbd76255cd0
 11 | 1d1483f042c9761b245e8c1cf0eec189 | 022fd287173f6d1cb45a923f154c64cc | ceb55938d03c67387e15404331de238c
 12 | caab21925241164b3b8688d5968e1c9d | 3884ed36612e65e274101136a602a7ce | 9fd670d72691fc215109edd617128c84
 13 | 42dce5d4e367b0f7c5f47a9aaef702e0 | 8b8d3ae353942de62665098158690487 | fdc8d84e701b1e36cac8269261b018a7
 14 | 61795c1d6cad3ba546f6646f0a8bebcc | 14e07d2c1e067b54208c900808115076 | c38a9632e466e2ad7b848cd91095e6ad
 15 | 43ccdc154b1db5320e282d28d261cc9f | 5f7062e8b40f4654bbb96be4009aca45 | b042cf80ea14d25290dc5c12d708b838
(15 rows)
```
#### Populating a table
This useful when testing your database. This helps you analyze where to put the right indexes in your database and how to build your database in terms of your application. Helps  for prototyping your application. 
``` 
Create table dummies AS SELECT generate_series(1,1000) AS id, md5(random()::text) AS name, md5(random()::text) AS address, md5(random()::text) AS descr;
SELECT 1000

Select * from dummies;
  id  |               name               |             address              |              descr               
------+----------------------------------+----------------------------------+----------------------------------
    1 | 70fc6a52bcab78334a016cb5922adaf9 | 7ba8575fe4b4e8a8a7caea4b39577820 | 4143b25c01c49e5e806992c704453a5d
    2 | eac212ba34950754c0a167ace9f82f35 | 327a7f050d4665f2d3b005ef2f4e643d | b3b9b3807c61bf25b0e72434d5d1c44f
    3 | b7e018c7bcb4355eb1724d2ce69dfbec | 45a4bc7ae2da6688bfea34e2e9118b55 | ce43cae9f816278fd07c5f24564af906
    4 | bcb6b30cb2118d5c69c7e9dcaf5d691d | 42365653cff83811b964cc35abdae33f | 632f839eee7833b3d6d9a5b41c7c5615
    5 | 095c0fde9171b7ab1a907d0d837cf22e | e9a864357cfae0b94b581cef4487116c | 893c5c46c0d5075738aabde7aa4bb5fb
    6 | 3284d210ecfc206c3beaa0093ac0c519 | b239c2a932faffffd0fb983f58674a65 | aafa25faea02fd01bd67415ff4ebd155
    7 | 4997d5524d1f9105fc28dd9c9956e7ea | 9b3764a49e0f4362f90197fd9e5dfd77 | 1af11286b7b99a1a74c310f47cc94f3d
    8 | 96f0d45d6f39d2820b724eb3a78e8d80 | a3de5110108f7be4195d8d19e7a1d07c | 320c26b70c53779062199f01813daa0e
    9 | 1a5903763dc82b3ccb8a79410ccdb37a | e43785ae6c44219cb7064c1db7419249 | 6daae031d939a7b5a56a396c83f2afca
   10 | 04331f2cd2ca3e9e6ff873468b5b6ef1 | cea1975b3f5632a845a9544f093d3cce | dc1b22fbf3f7d83178a7a82fe48b666c
   11 | 1e3dbbcd81badee582de8c86aff6a072 | a1ff60090040fd7e87662fc68c2981ab | f8d96e5bdb44ddbeefeaa53816f8a68f
   12 | 42c689047dbb63289d7d91ed25180ceb | 4897aac910bad7facb37e8325c2ae1ec | 96d2e9edc9f51a6e014918236a255ed5
   13 | 518b2ce1d08550d88523abb935e87065 | c83a549f9a9d46ebea0b001a34fb712a | cdcf0d5398b2e41a85f32af75d9eb28e
   14 | d1ad61997f855e148222475e14f950e2 | a1398c762071b4487f7daf72b1fb0523 | 05e250ed7d3658da83f81e927aa6d2be
   15 | 91f1f3ff235cb174d0fb360277a8e13d | bf933ff9e4d93420363b097a8eda937f | 5873103a427b4d8856b2ee0b50c014b1
   16 | 1c2a93b678608b10c13cef1a6a3278b9 | acec8b69bf6909731f35372a79c16ad7 | 74544c3a1975d53a6b2a61e21f2067a6
   17 | 2300ed5f9c90c7300cc3f1a85ab8d8d4 | 9a6dc051619ca4274cf7d4d1a729c183 | c9cee28da7caf450020bb8c4d23f864f
   18 | 53316f41fe2198e5760623961b3e7bd4 | 300ce04844257bb32f60be2c6b2e846c | 296cb867ead60ec84fe38d39b0e1a20d
   19 | 5b750f9dc511f8ac3e51c4a786d693ec | 5f757d330fcbe062a929045868b09040 | 2b89f88cdfabcd29ea97f2ff91c0c3ec
   20 | 3ae7c7c7798ebf545bbf815ad2e8922d | 78dda7b1fa9888b8121c73a6a773f3ee | 1ce523a2eb0a1ebd66b8e858bac9c9bf
  ............................................................................................................
  ............................................................................................................
  998 | bd65bc2aa53a10f7b7be087aa5235e6a | d5cdecf3a1523e0b13867ba102b6fc18 | 33b9c4c0abc96ef699923eddce146d48
  999 | c9145de3c976ed86ffa5e6b762a333a8 | 2b52700eaade46589708a5200212cb71 | 71b775fd4ab1d00d1e9033eb2a3d4322
 1000 | 12a79ae0ee4de78b65ad2cfc67f1f431 | 63ca95fefb8c13079d6f071f683f1679 | 2db399a0e2dd3e442d2fa65c2cf9fa2b
(1000 rows)
```
#####Note that:
You can groe your table as much as you want, to meet your needs. Need to change the generate_series(1,#) function in your script.


