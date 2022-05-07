=strip_input

0000100 strip fmtout
103 0


1001 cntrlvar 110                       $ Potenza Totale
*
1002 tempf 555500000                    $ Temperatura in uscita
*
1003 httemp 555000101                   $ Temperatura max fuel pellet (low, medium, high)
1004 httemp 555002501
1005 httemp 555005001
*
1006 httemp 555000108                   $ Temperatura max cladding (low, medium, high)
1007 httemp 555002508
1008 httemp 555005008
*
1009 httemp 555002501                   $ Profilo temperatura rod (volume 25)
1010 httemp 555002502
1011 httemp 555002503
1012 httemp 555002504
1013 httemp 555002505
1014 httemp 555002506
1015 httemp 555002507
1016 httemp 555002508
1017 httemp 555002509
1018 httemp 555002510
1019 tempf 555250000
*
1020 cntrlvar 120                       $ Caduta di pressione
*
*
1021 httemp 555000101                   $ Profilo assiale temp max fuel
1022 httemp 555000201
1023 httemp 555000301
1024 httemp 555000401
1025 httemp 555000501
1026 httemp 555000601
1027 httemp 555000701
1028 httemp 555000801
1029 httemp 555000901
1030 httemp 555001001
1031 httemp 555001101
1032 httemp 555001201
1033 httemp 555001301
1034 httemp 555001401
1035 httemp 555001501
1036 httemp 555001601
1037 httemp 555001701
1038 httemp 555001801
1039 httemp 555001901
1040 httemp 555002001
1041 httemp 555002101
1042 httemp 555002201
1043 httemp 555002301
1044 httemp 555002401
1045 httemp 555002501
1046 httemp 555002601
1047 httemp 555002701
1048 httemp 555002801
1049 httemp 555002901
1050 httemp 555003001
1051 httemp 555003101
1052 httemp 555003201
1053 httemp 555003301
1054 httemp 555003401
1055 httemp 555003501
1056 httemp 555003601
1057 httemp 555003701
1058 httemp 555003801
1059 httemp 555003901
1060 httemp 555004001
1061 httemp 555004101
1062 httemp 555004201
1063 httemp 555004301
1064 httemp 555004401
1065 httemp 555004501
1066 httemp 555004601
1067 httemp 555004701
1068 httemp 555004801
1069 httemp 555004901
1070 httemp 555005001
*
*
1071 htmode 555000101                     $ Profilo assiale heat transfer mode
1072 htmode 555000201
1073 htmode 555000301
1074 htmode 555000401
1075 htmode 555000501
1076 htmode 555000601
1077 htmode 555000701
1078 htmode 555000801
1079 htmode 555000901
1080 htmode 555001001
1081 htmode 555001101
1082 htmode 555001201
1083 htmode 555001301
1084 htmode 555001401
1085 htmode 555001501
1086 htmode 555001601
1087 htmode 555001701
1088 htmode 555001801
1089 htmode 555001901
1090 htmode 555002001
1091 htmode 555002101
1092 htmode 555002201
1093 htmode 555002301
1094 htmode 555002401
1095 htmode 555002501
1096 htmode 555002601
1097 htmode 555002701
1098 htmode 555002801
1099 htmode 555002901
1100 htmode 555003001
1101 htmode 555003101
1102 htmode 555003201
1103 htmode 555003301
1104 htmode 555003401
1105 htmode 555003501
1106 htmode 555003601
1107 htmode 555003701
1108 htmode 555003801
1109 htmode 555003901
1110 htmode 555004001
1111 htmode 555004101
1112 htmode 555004201
1113 htmode 555004301
1114 htmode 555004401
1115 htmode 555004501
1116 htmode 555004601
1117 htmode 555004701
1118 htmode 555004801
1119 htmode 555004901
1120 htmode 555005001
*
*
1271 htrnr 555000101                     $ Profilo assiale Heat Flux Convettivo
1272 htrnr 555000201
1273 htrnr 555000301
1274 htrnr 555000401
1275 htrnr 555000501
1276 htrnr 555000601
1277 htrnr 555000701
1278 htrnr 555000801
1279 htrnr 555000901
1280 htrnr 555001001
1281 htrnr 555001101
1282 htrnr 555001201
1283 htrnr 555001301
1284 htrnr 555001401
1285 htrnr 555001501
1286 htrnr 555001601
1287 htrnr 555001701
1288 htrnr 555001801
1289 htrnr 555001901
1290 htrnr 555002001
1291 htrnr 555002101
1292 htrnr 555002201
1293 htrnr 555002301
1294 htrnr 555002401
1295 htrnr 555002501
1296 htrnr 555002601
1297 htrnr 555002701
1298 htrnr 555002801
1299 htrnr 555002901
1300 htrnr 555003001
1301 htrnr 555003101
1302 htrnr 555003201
1303 htrnr 555003301
1304 htrnr 555003401
1305 htrnr 555003501
1306 htrnr 555003601
1307 htrnr 555003701
1308 htrnr 555003801
1309 htrnr 555003901
1310 htrnr 555004001
1311 htrnr 555004101
1312 htrnr 555004201
1313 htrnr 555004301
1314 htrnr 555004401
1315 htrnr 555004501
1316 htrnr 555004601
1317 htrnr 555004701
1318 htrnr 555004801
1319 htrnr 555004901
1320 htrnr 555005001
*
*
1321 hthtc 555000101                     $ Profilo assiale Heat Transfer Coefficient
1322 hthtc 555000201
1323 hthtc 555000301
1324 hthtc 555000401
1325 hthtc 555000501
1326 hthtc 555000601
1327 hthtc 555000701
1328 hthtc 555000801
1329 hthtc 555000901
1330 hthtc 555001001
1331 hthtc 555001101
1332 hthtc 555001201
1333 hthtc 555001301
1334 hthtc 555001401
1335 hthtc 555001501
1336 hthtc 555001601
1337 hthtc 555001701
1338 hthtc 555001801
1339 hthtc 555001901
1340 hthtc 555002001
1341 hthtc 555002101
1342 hthtc 555002201
1343 hthtc 555002301
1344 hthtc 555002401
1345 hthtc 555002501
1346 hthtc 555002601
1347 hthtc 555002701
1348 hthtc 555002801
1349 hthtc 555002901
1350 hthtc 555003001
1351 hthtc 555003101
1352 hthtc 555003201
1353 hthtc 555003301
1354 hthtc 555003401
1355 hthtc 555003501
1356 hthtc 555003601
1357 hthtc 555003701
1358 hthtc 555003801
1359 hthtc 555003901
1360 hthtc 555004001
1361 hthtc 555004101
1362 hthtc 555004201
1363 hthtc 555004301
1364 hthtc 555004401
1365 hthtc 555004501
1366 hthtc 555004601
1367 hthtc 555004701
1368 hthtc 555004801
1369 hthtc 555004901
1370 hthtc 555005001
*
*
1371 floreg 555010000                     $ Profilo assiale Flow Regime
1372 floreg 555020000
1373 floreg 555030000
1374 floreg 555040000
1375 floreg 555050000
1376 floreg 555060000
1377 floreg 555070000
1378 floreg 555080000
1379 floreg 555090000
1380 floreg 555100000
1381 floreg 555110000
1382 floreg 555120000
1383 floreg 555130000
1384 floreg 555140000
1385 floreg 555150000
1386 floreg 555160000
1387 floreg 555170000
1388 floreg 555180000
1389 floreg 555190000
1390 floreg 555200000
1391 floreg 555210000
1392 floreg 555220000
1393 floreg 555230000
1394 floreg 555240000
1395 floreg 555250000
1396 floreg 555260000
1397 floreg 555270000
1398 floreg 555280000
1399 floreg 555290000
1400 floreg 555300000
1401 floreg 555310000
1402 floreg 555320000
1403 floreg 555330000
1404 floreg 555340000
1405 floreg 555350000
1406 floreg 555360000
1407 floreg 555370000
1408 floreg 555380000
1409 floreg 555390000
1410 floreg 555400000
1411 floreg 555410000
1412 floreg 555420000
1413 floreg 555430000
1414 floreg 555440000
1415 floreg 555450000
1416 floreg 555460000
1417 floreg 555470000
1418 floreg 555480000
1419 floreg 555490000
1420 floreg 555500000
*
*
1421 voidg 555010000                     $ Profilo assiale Void Fraction
1422 voidg 555020000
1423 voidg 555030000
1424 voidg 555040000
1425 voidg 555050000
1426 voidg 555060000
1427 voidg 555070000
1428 voidg 555080000
1429 voidg 555090000
1430 voidg 555100000
1431 voidg 555110000
1432 voidg 555120000
1433 voidg 555130000
1434 voidg 555140000
1435 voidg 555150000
1436 voidg 555160000
1437 voidg 555170000
1438 voidg 555180000
1439 voidg 555190000
1440 voidg 555200000
1441 voidg 555210000
1442 voidg 555220000
1443 voidg 555230000
1444 voidg 555240000
1445 voidg 555250000
1446 voidg 555260000
1447 voidg 555270000
1448 voidg 555280000
1449 voidg 555290000
1450 voidg 555300000
1451 voidg 555310000
1452 voidg 555320000
1453 voidg 555330000
1454 voidg 555340000
1455 voidg 555350000
1456 voidg 555360000
1457 voidg 555370000
1458 voidg 555380000
1459 voidg 555390000
1460 voidg 555400000
1461 voidg 555410000
1462 voidg 555420000
1463 voidg 555430000
1464 voidg 555440000
1465 voidg 555450000
1466 voidg 555460000
1467 voidg 555470000
1468 voidg 555480000
1469 voidg 555490000
1470 voidg 555500000
*
*
1471 quale 555010000                     $ Profilo assiale equilibrium quality
1472 quale 555020000
1473 quale 555030000
1474 quale 555040000
1475 quale 555050000
1476 quale 555060000
1477 quale 555070000
1478 quale 555080000
1479 quale 555090000
1480 quale 555100000
1481 quale 555110000
1482 quale 555120000
1483 quale 555130000
1484 quale 555140000
1485 quale 555150000
1486 quale 555160000
1487 quale 555170000
1488 quale 555180000
1489 quale 555190000
1490 quale 555200000
1491 quale 555210000
1492 quale 555220000
1493 quale 555230000
1494 quale 555240000
1495 quale 555250000
1496 quale 555260000
1497 quale 555270000
1498 quale 555280000
1499 quale 555290000
1500 quale 555300000
1501 quale 555310000
1502 quale 555320000
1503 quale 555330000
1504 quale 555340000
1505 quale 555350000
1506 quale 555360000
1507 quale 555370000
1508 quale 555380000
1509 quale 555390000
1510 quale 555400000
1511 quale 555410000
1512 quale 555420000
1513 quale 555430000
1514 quale 555440000
1515 quale 555450000
1516 quale 555460000
1517 quale 555470000
1518 quale 555480000
1519 quale 555490000
1520 quale 555500000
*
*
1521 sathf 555010000                     $ Profilo assiale h_f
1522 sathf 555020000
1523 sathf 555030000
1524 sathf 555040000
1525 sathf 555050000
1526 sathf 555060000
1527 sathf 555070000
1528 sathf 555080000
1529 sathf 555090000
1530 sathf 555100000
1531 sathf 555110000
1532 sathf 555120000
1533 sathf 555130000
1534 sathf 555140000
1535 sathf 555150000
1536 sathf 555160000
1537 sathf 555170000
1538 sathf 555180000
1539 sathf 555190000
1540 sathf 555200000
1541 sathf 555210000
1542 sathf 555220000
1543 sathf 555230000
1544 sathf 555240000
1545 sathf 555250000
1546 sathf 555260000
1547 sathf 555270000
1548 sathf 555280000
1549 sathf 555290000
1550 sathf 555300000
1551 sathf 555310000
1552 sathf 555320000
1553 sathf 555330000
1554 sathf 555340000
1555 sathf 555350000
1556 sathf 555360000
1557 sathf 555370000
1558 sathf 555380000
1559 sathf 555390000
1560 sathf 555400000
1561 sathf 555410000
1562 sathf 555420000
1563 sathf 555430000
1564 sathf 555440000
1565 sathf 555450000
1566 sathf 555460000
1567 sathf 555470000
1568 sathf 555480000
1569 sathf 555490000
1570 sathf 555500000
*
*
1571 p 555010000                     $ Profilo assiale pressione
1572 p 555020000
1573 p 555030000
1574 p 555040000
1575 p 555050000
1576 p 555060000
1577 p 555070000
1578 p 555080000
1579 p 555090000
1580 p 555100000
1581 p 555110000
1582 p 555120000
1583 p 555130000
1584 p 555140000
1585 p 555150000
1586 p 555160000
1587 p 555170000
1588 p 555180000
1589 p 555190000
1590 p 555200000
1591 p 555210000
1592 p 555220000
1593 p 555230000
1594 p 555240000
1595 p 555250000
1596 p 555260000
1597 p 555270000
1598 p 555280000
1599 p 555290000
1600 p 555300000
1601 p 555310000
1602 p 555320000
1603 p 555330000
1604 p 555340000
1605 p 555350000
1606 p 555360000
1607 p 555370000
1608 p 555380000
1609 p 555390000
1610 p 555400000
1611 p 555410000
1612 p 555420000
1613 p 555430000
1614 p 555440000
1615 p 555450000
1616 p 555460000
1617 p 555470000
1618 p 555480000
1619 p 555490000
1620 p 555500000
.
