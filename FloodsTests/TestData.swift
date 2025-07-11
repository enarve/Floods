//
//
// TestData.swift
// FloodsTests
//
// Created by sinezeleuny on 12.07.2025
//
        

import Foundation

let testPoint_02327500 = """
    {"id":159,"site_name":"OCHLOCKONEE RIVER NEAR THOMASVILLE, GA","description":"Hwy 84 bridge deck","nws_id":"TMLG1","rp_name":"DECK","state_id":13,"county_id":523,"latitude":30.875806,"longitude":-84.04675,"nwis_id":"02327500","rp_elevation":28.270000457763672,"unit":"ft","gage_height":3.24,"is_flooding":false,"active":true}
    """.data(using: .utf8)!

let testFloodsData: Data = """
    {"type":"FeatureCollection","metadata":{"generated":1636130213000,"url":"https://earthquake.usgs.gov/earthquakes/feed/v1.0/summary/all_month.geojson","title":"USGS All Earthquakes, Past Month","status":200,"api":"1.10.3","count":9104},
    "features":[{"type":"Feature","properties":{"id":152,"site_name":"BEETREE RUN AT BENTLEY SPRINGS, MD","description":"Approximate elevation of bridge deck of Bentley Road, from elevation of RM2","nws_id":"BSBM2","rp_name":"DECK","state_id":25,"county_id":1196,"latitude":39.672983,"longitude":-76.675067,"nwis_id":"01581960","rp_elevation":7.439000129699707,"unit":"ft","gage_height":0.92,"is_flooding":false,"active":true},"geometry":{"type":"Point","coordinates":[-122.7968369,38.8093338,4.65]},"id":"nc73649170"},
    {"type":"Feature","properties":{"id":153,"site_name":"MUCKALEE CREEK AT GA 195, NEAR LEESBURG, GA","description":"Hwy 195 elevation of road at entrance to bridge on right end","nws_id":"MCKG1","rp_name":"ROAD","state_id":13,"county_id":475,"latitude":31.775944,"longitude":-84.139333,"nwis_id":"02351890","rp_elevation":21.1299991607666,"unit":"ft","gage_height":3.96,"is_flooding":false,"active":true},"geometry":{"type":"Point","coordinates":[-155.434173583984,19.2189998626709,34.8699989318848]},"id":"hv72783692"},
    {"type":"Feature","properties":{"id":154,"site_name":"MUCKALEE CREEK AT GA 195, NEAR LEESBURG, GA","description":"Top of right bank","nws_id":"MCKG1","rp_name":"BANK","state_id":13,"county_id":475,"latitude":31.776139,"longitude":-84.139139,"nwis_id":"02351890","rp_elevation":8.1899995803833,"unit":"ft","gage_height":3.96,"is_flooding":false,"active":true},"geometry":{"type":"Point","coordinates":[-122.8133316,38.831501,2.21]},"id":"nc73649165"},
    {"type":"Feature","properties":{"id":155,"site_name":"MUCKALEE CREEK AT GA 195, NEAR LEESBURG, GA","description":"Hwy 195 bridge chord","nws_id":"MCKG1","rp_name":"CHORD","state_id":13,"county_id":475,"latitude":31.776139,"longitude":-84.139139,"nwis_id":"02351890","rp_elevation":17.989999771118164,"unit":"ft","gage_height":3.96,"is_flooding":false,"active":true},"geometry":{"type":"Point","coordinates":[-116.2463333,31.9651667,19.17]},"id":"ci39849871"},
    {"type":"Feature","properties":{"id":156,"site_name":"JACKS CREEK AT BRANNAN ROAD, NEAR SNELLVILLE, GA","description":null,"nws_id":"JCKG1","rp_name":"BANK","state_id":13,"county_id":454,"latitude":33.825173,"longitude":-84.058902,"nwis_id":"02207055","rp_elevation":2.6600000858306885,"unit":"ft","gage_height":0.83,"is_flooding":false,"active":true},"geometry":{"type":"Point","coordinates":[-117.7733333,36.0221667,1.84]},"id":"ci39849855"},
    {"type":"Feature","properties":{"id":157,"site_name":"JACKS CREEK AT BRANNAN ROAD, NEAR SNELLVILLE, GA","description":"Brannan Road SW","nws_id":"JCKG1","rp_name":"DECK","state_id":13,"county_id":454,"latitude":33.82524,"longitude":-84.058999,"nwis_id":"02207055","rp_elevation":3.369999885559082,"unit":"ft","gage_height":0.83,"is_flooding":false,"active":true},"geometry":{"type":"Point","coordinates":[-116.0623,37.7392,0]},"id":"nn00827478"}],"bbox":[-179.9818,-62.918,-7.3,179.9919,86.307,655.67]}
    """.data(using: .utf8)!
