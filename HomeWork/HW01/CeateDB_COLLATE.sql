CREATE DATABASE MyOptionsTest01  
COLLATE French_100_CI_AI; 
/*French-100, case-insensitive, accent-insensitive, kanatype-insensitive, width-insensitive*/

CREATE DATABASE MyOptionsTest02
COLLATE Ukrainian_CS_AS_KS_WS;
/*Ukrainian, case-sensitive, accent-sensitive, kanatype-sensitive, width-sensitive*/

CREATE DATABASE MyOptionsTest03  
COLLATE Ukrainian_100_BIN2;
/*Ukrainian-100, binary code point comparison sort*/

CREATE DATABASE MyOptionsTest04 
COLLATE Japanese_XJIS_140_CI_AI_WS_VSS;
/*Japanese-XJIS-140, case-insensitive, accent-insensitive, 
kanatype-insensitive, width-sensitive, supplementary characters, 
variation selector sensitive */