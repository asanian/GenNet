-- File GRN
-- Path Constraints 

-- gene No0 = NFKB-- gene No1 = P21-- gene No2 = FOXM-- gene No3 = PI3K-- gene No4 = P53-- gene No5 = MDM2-- gene No6 = OGT-- gene No7 = OGA-- gene No8 = CMYC
var

dpP210,dpP530,dpMDM20,dpOGA0,dpOGT0,dnCMYC1,dnOGA1,dpPI3K0,dnOGT1,dpCMYC0,dnMDM21,dnP531,dpFOXM0,dnPI3K1,dnFOXM1,dnP211,dnNFKB1: parameter;

hNFKB,hP21,hFOXM,hPI3K,hP53,hMDM2,hOGT,hOGA,hCMYC :analog;
k,n: discrete;
automaton auto
synclabs: ;
initially loc_000000000;
-- for the configuration 0,0,0,0,0,0,0,0,0
loc loc_000000000: while hP21 <=  dpP210 & hP53 <=  dpP530 & hOGA <=  dpOGA0  wait {dhNFKB=0,dhP21=1,dhFOXM=0,dhPI3K=0,dhP53=1,dhMDM2=1,dhOGT=0,dhOGA=1,dhCMYC=0}
when hP21=dpP210 do {hP21'=0, k'=k+1} goto loc_010000000;
when hP53=dpP530 do {hP53'=0, k'=k+1} goto loc_000010000;
--when hMDM2=dpMDM20 do {hMDM2'=0, k'=k+1} goto loc_000001000;
when hOGA=dpOGA0 do {hOGA'=0, k'=k+1} goto loc_000000010;

-- for the configuration 0,0,0,0,0,0,0,0,1
loc loc_000000001: while hP21 <=  dpP210 & hP53 <=  dpP530 & hOGT <=  dpOGT0 & hOGA <=  dpOGA0 & hCMYC >=  dnCMYC1  wait {dhNFKB=0,dhP21=1,dhFOXM=0,dhPI3K=0,dhP53=1,dhMDM2=1,dhOGT=1,dhOGA=1,dhCMYC=1}
when hP21=dpP210 do {hP21'=0, k'=k+1} goto loc_010000001;
when hP53=dpP530 do {hP53'=0, k'=k+1} goto loc_000010001;
--when hMDM2=dpMDM20 do {hMDM2'=0, k'=k+1} goto loc_000001001;
when hOGT=dpOGT0 do {hOGT'=0, k'=k+1} goto loc_000000101;
when hOGA=dpOGA0 do {hOGA'=0, k'=k+1} goto loc_000000011;
when hCMYC=dnCMYC1 do {hCMYC'=0, k'=k+1} goto loc_000000000;

-- for the configuration 0,0,0,0,0,0,0,1,0
loc loc_000000010: while hP21 <=  dpP210 & hP53 <=  dpP530  wait {dhNFKB=0,dhP21=1,dhFOXM=0,dhPI3K=0,dhP53=1,dhMDM2=1,dhOGT=0,dhOGA=0,dhCMYC=0}
when hP21=dpP210 do {hP21'=0, k'=k+1} goto loc_010000010;
when hP53=dpP530 do {hP53'=0, k'=k+1} goto loc_000010010;
--when hMDM2=dpMDM20 do {hMDM2'=0, k'=k+1} goto loc_000001010;

-- for the configuration 0,0,0,0,0,0,0,1,1
loc loc_000000011: while hP21 <=  dpP210 & hP53 <=  dpP530 & hOGT <=  dpOGT0 & hCMYC >=  dnCMYC1  wait {dhNFKB=0,dhP21=1,dhFOXM=0,dhPI3K=0,dhP53=1,dhMDM2=1,dhOGT=1,dhOGA=-1,dhCMYC=1}
when hP21=dpP210 do {hP21'=0, k'=k+1} goto loc_010000011;
when hP53=dpP530 do {hP53'=0, k'=k+1} goto loc_000010011;
--when hMDM2=dpMDM20 do {hMDM2'=0, k'=k+1} goto loc_000001011;
when hOGT=dpOGT0 do {hOGT'=0, k'=k+1} goto loc_000000111;
--when hOGA=dnOGA1 do {hOGA'=0, k'=k+1} goto loc_000000001;
when hCMYC=dnCMYC1 do {hCMYC'=0, k'=k+1} goto loc_000000010;

-- for the configuration 0,0,0,0,0,0,1,0,0
loc loc_000000100: while hP21 <=  dpP210 & hP53 <=  dpP530 & hOGT >=  dnOGT1  wait {dhNFKB=0,dhP21=1,dhFOXM=0,dhPI3K=1,dhP53=1,dhMDM2=1,dhOGT=1,dhOGA=1,dhCMYC=1}
when hP21=dpP210 do {hP21'=0, k'=k+1} goto loc_010000100;
--when hPI3K=dpPI3K0 do {hPI3K'=0, k'=k+1} goto loc_000100100;
when hP53=dpP530 do {hP53'=0, k'=k+1} goto loc_000010100;
--when hMDM2=dpMDM20 do {hMDM2'=0, k'=k+1} goto loc_000001100;
when hOGT=dnOGT1 do {hOGT'=0, k'=k+1} goto loc_000000000;
--when hOGA=dpOGA0 do {hOGA'=0, k'=k+1} goto loc_000000110;
--when hCMYC=dpCMYC0 do {hCMYC'=0, k'=k+1} goto loc_000000101;

-- for the configuration 0,0,0,0,0,0,1,0,1
loc loc_000000101: while hP21 <=  dpP210 & hP53 <=  dpP530  wait {dhNFKB=0,dhP21=1,dhFOXM=0,dhPI3K=1,dhP53=1,dhMDM2=1,dhOGT=0,dhOGA=0,dhCMYC=0}
when hP21=dpP210 do {hP21'=0, k'=k+1} goto loc_010000101;
--when hPI3K=dpPI3K0 do {hPI3K'=0, k'=k+1} goto loc_000100101;
when hP53=dpP530 do {hP53'=0, k'=k+1} goto loc_000010101;
--when hMDM2=dpMDM20 do {hMDM2'=0, k'=k+1} goto loc_000001101;

-- for the configuration 0,0,0,0,0,0,1,1,0
loc loc_000000110: while hP21 <=  dpP210 & hP53 <=  dpP530 & hOGT >=  dnOGT1 & hOGA >=  dnOGA1  wait {dhNFKB=0,dhP21=1,dhFOXM=0,dhPI3K=1,dhP53=1,dhMDM2=1,dhOGT=1,dhOGA=1,dhCMYC=1}
when hP21=dpP210 do {hP21'=0, k'=k+1} goto loc_010000110;
--when hPI3K=dpPI3K0 do {hPI3K'=0, k'=k+1} goto loc_000100110;
when hP53=dpP530 do {hP53'=0, k'=k+1} goto loc_000010110;
--when hMDM2=dpMDM20 do {hMDM2'=0, k'=k+1} goto loc_000001110;
when hOGT=dnOGT1 do {hOGT'=0, k'=k+1} goto loc_000000010;
when hOGA=dnOGA1 do {hOGA'=0, k'=k+1} goto loc_000000100;
--when hCMYC=dpCMYC0 do {hCMYC'=0, k'=k+1} goto loc_000000111;

-- for the configuration 0,0,0,0,0,0,1,1,1
loc loc_000000111: while hP21 <=  dpP210 & hP53 <=  dpP530 & hOGA >=  dnOGA1  wait {dhNFKB=0,dhP21=1,dhFOXM=0,dhPI3K=1,dhP53=1,dhMDM2=1,dhOGT=0,dhOGA=1,dhCMYC=0}
when hP21=dpP210 do {hP21'=0, k'=k+1} goto loc_010000111;
--when hPI3K=dpPI3K0 do {hPI3K'=0, k'=k+1} goto loc_000100111;
when hP53=dpP530 do {hP53'=0, k'=k+1} goto loc_000010111;
--when hMDM2=dpMDM20 do {hMDM2'=0, k'=k+1} goto loc_000001111;
when hOGA=dnOGA1 do {hOGA'=0, k'=k+1} goto loc_000000101;

-- for the configuration 0,0,0,0,0,1,0,0,0
loc loc_000001000: while hP21 <=  dpP210 & hMDM2 >=  dnMDM21 & hOGA <=  dpOGA0  wait {dhNFKB=0,dhP21=1,dhFOXM=0,dhPI3K=0,dhP53=1,dhMDM2=1,dhOGT=0,dhOGA=1,dhCMYC=0}
when hP21=dpP210 do {hP21'=0, k'=k+1} goto loc_010001000;
--when hP53=dpP530 do {hP53'=0, k'=k+1} goto loc_000011000;
when hMDM2=dnMDM21 do {hMDM2'=0, k'=k+1} goto loc_000000000;
when hOGA=dpOGA0 do {hOGA'=0, k'=k+1} goto loc_000001010;

-- for the configuration 0,0,0,0,0,1,0,0,1
loc loc_000001001: while hP21 <=  dpP210 & hMDM2 >=  dnMDM21 & hOGT <=  dpOGT0 & hOGA <=  dpOGA0 & hCMYC >=  dnCMYC1  wait {dhNFKB=0,dhP21=1,dhFOXM=0,dhPI3K=0,dhP53=1,dhMDM2=1,dhOGT=1,dhOGA=1,dhCMYC=1}
when hP21=dpP210 do {hP21'=0, k'=k+1} goto loc_010001001;
--when hP53=dpP530 do {hP53'=0, k'=k+1} goto loc_000011001;
when hMDM2=dnMDM21 do {hMDM2'=0, k'=k+1} goto loc_000000001;
when hOGT=dpOGT0 do {hOGT'=0, k'=k+1} goto loc_000001101;
when hOGA=dpOGA0 do {hOGA'=0, k'=k+1} goto loc_000001011;
when hCMYC=dnCMYC1 do {hCMYC'=0, k'=k+1} goto loc_000001000;

-- for the configuration 0,0,0,0,0,1,0,1,0
loc loc_000001010: while hP21 <=  dpP210 & hMDM2 >=  dnMDM21  wait {dhNFKB=0,dhP21=1,dhFOXM=0,dhPI3K=0,dhP53=1,dhMDM2=1,dhOGT=0,dhOGA=0,dhCMYC=0}
when hP21=dpP210 do {hP21'=0, k'=k+1} goto loc_010001010;
--when hP53=dpP530 do {hP53'=0, k'=k+1} goto loc_000011010;
when hMDM2=dnMDM21 do {hMDM2'=0, k'=k+1} goto loc_000000010;

-- for the configuration 0,0,0,0,0,1,0,1,1
loc loc_000001011: while hP21 <=  dpP210 & hMDM2 >=  dnMDM21 & hOGT <=  dpOGT0 & hCMYC >=  dnCMYC1  wait {dhNFKB=0,dhP21=1,dhFOXM=0,dhPI3K=0,dhP53=1,dhMDM2=1,dhOGT=1,dhOGA=-1,dhCMYC=1}
when hP21=dpP210 do {hP21'=0, k'=k+1} goto loc_010001011;
--when hP53=dpP530 do {hP53'=0, k'=k+1} goto loc_000011011;
when hMDM2=dnMDM21 do {hMDM2'=0, k'=k+1} goto loc_000000011;
when hOGT=dpOGT0 do {hOGT'=0, k'=k+1} goto loc_000001111;
--when hOGA=dnOGA1 do {hOGA'=0, k'=k+1} goto loc_000001001;
when hCMYC=dnCMYC1 do {hCMYC'=0, k'=k+1} goto loc_000001010;

-- for the configuration 0,0,0,0,0,1,1,0,0
loc loc_000001100: while hP21 <=  dpP210 & hMDM2 >=  dnMDM21 & hOGT >=  dnOGT1  wait {dhNFKB=0,dhP21=1,dhFOXM=0,dhPI3K=0,dhP53=1,dhMDM2=1,dhOGT=1,dhOGA=1,dhCMYC=0}
when hP21=dpP210 do {hP21'=0, k'=k+1} goto loc_010001100;
--when hP53=dpP530 do {hP53'=0, k'=k+1} goto loc_000011100;
when hMDM2=dnMDM21 do {hMDM2'=0, k'=k+1} goto loc_000000100;
when hOGT=dnOGT1 do {hOGT'=0, k'=k+1} goto loc_000001000;
--when hOGA=dpOGA0 do {hOGA'=0, k'=k+1} goto loc_000001110;

-- for the configuration 0,0,0,0,0,1,1,0,1
loc loc_000001101: while hP21 <=  dpP210 & hMDM2 >=  dnMDM21  wait {dhNFKB=0,dhP21=1,dhFOXM=0,dhPI3K=0,dhP53=1,dhMDM2=1,dhOGT=0,dhOGA=0,dhCMYC=0}
when hP21=dpP210 do {hP21'=0, k'=k+1} goto loc_010001101;
--when hP53=dpP530 do {hP53'=0, k'=k+1} goto loc_000011101;
when hMDM2=dnMDM21 do {hMDM2'=0, k'=k+1} goto loc_000000101;

-- for the configuration 0,0,0,0,0,1,1,1,0
loc loc_000001110: while hP21 <=  dpP210 & hMDM2 >=  dnMDM21 & hOGT >=  dnOGT1 & hOGA >=  dnOGA1  wait {dhNFKB=0,dhP21=1,dhFOXM=0,dhPI3K=0,dhP53=1,dhMDM2=1,dhOGT=1,dhOGA=1,dhCMYC=0}
when hP21=dpP210 do {hP21'=0, k'=k+1} goto loc_010001110;
--when hP53=dpP530 do {hP53'=0, k'=k+1} goto loc_000011110;
when hMDM2=dnMDM21 do {hMDM2'=0, k'=k+1} goto loc_000000110;
when hOGT=dnOGT1 do {hOGT'=0, k'=k+1} goto loc_000001010;
when hOGA=dnOGA1 do {hOGA'=0, k'=k+1} goto loc_000001100;

-- for the configuration 0,0,0,0,0,1,1,1,1
loc loc_000001111: while hP21 <=  dpP210 & hMDM2 >=  dnMDM21 & hOGA >=  dnOGA1  wait {dhNFKB=0,dhP21=1,dhFOXM=0,dhPI3K=0,dhP53=1,dhMDM2=1,dhOGT=0,dhOGA=1,dhCMYC=0}
when hP21=dpP210 do {hP21'=0, k'=k+1} goto loc_010001111;
--when hP53=dpP530 do {hP53'=0, k'=k+1} goto loc_000011111;
when hMDM2=dnMDM21 do {hMDM2'=0, k'=k+1} goto loc_000000111;
when hOGA=dnOGA1 do {hOGA'=0, k'=k+1} goto loc_000001101;

-- for the configuration 0,0,0,0,1,0,0,0,0
loc loc_000010000: while hMDM2 <=  dpMDM20 & hOGA <=  dpOGA0  wait {dhNFKB=0,dhP21=0,dhFOXM=0,dhPI3K=0,dhP53=-1,dhMDM2=1,dhOGT=0,dhOGA=1,dhCMYC=0}
--when hP53=dnP531 do {hP53'=0, k'=k+1} goto loc_000000000;
when hMDM2=dpMDM20 do {hMDM2'=0, k'=k+1} goto loc_000011000;
when hOGA=dpOGA0 do {hOGA'=0, k'=k+1} goto loc_000010010;

-- for the configuration 0,0,0,0,1,0,0,0,1
loc loc_000010001: while hMDM2 <=  dpMDM20 & hOGT <=  dpOGT0 & hOGA <=  dpOGA0 & hCMYC >=  dnCMYC1  wait {dhNFKB=0,dhP21=0,dhFOXM=0,dhPI3K=1,dhP53=-1,dhMDM2=1,dhOGT=1,dhOGA=1,dhCMYC=1}
--when hPI3K=dpPI3K0 do {hPI3K'=0, k'=k+1} goto loc_000110001;
--when hP53=dnP531 do {hP53'=0, k'=k+1} goto loc_000000001;
when hMDM2=dpMDM20 do {hMDM2'=0, k'=k+1} goto loc_000011001;
when hOGT=dpOGT0 do {hOGT'=0, k'=k+1} goto loc_000010101;
when hOGA=dpOGA0 do {hOGA'=0, k'=k+1} goto loc_000010011;
when hCMYC=dnCMYC1 do {hCMYC'=0, k'=k+1} goto loc_000010000;

-- for the configuration 0,0,0,0,1,0,0,1,0
loc loc_000010010: while hMDM2 <=  dpMDM20  wait {dhNFKB=0,dhP21=0,dhFOXM=0,dhPI3K=0,dhP53=-1,dhMDM2=1,dhOGT=0,dhOGA=0,dhCMYC=0}
--when hP53=dnP531 do {hP53'=0, k'=k+1} goto loc_000000010;
when hMDM2=dpMDM20 do {hMDM2'=0, k'=k+1} goto loc_000011010;

-- for the configuration 0,0,0,0,1,0,0,1,1
loc loc_000010011: while hMDM2 <=  dpMDM20 & hOGT <=  dpOGT0 & hCMYC >=  dnCMYC1  wait {dhNFKB=0,dhP21=0,dhFOXM=0,dhPI3K=1,dhP53=-1,dhMDM2=1,dhOGT=1,dhOGA=-1,dhCMYC=1}
--when hPI3K=dpPI3K0 do {hPI3K'=0, k'=k+1} goto loc_000110011;
--when hP53=dnP531 do {hP53'=0, k'=k+1} goto loc_000000011;
when hMDM2=dpMDM20 do {hMDM2'=0, k'=k+1} goto loc_000011011;
when hOGT=dpOGT0 do {hOGT'=0, k'=k+1} goto loc_000010111;
--when hOGA=dnOGA1 do {hOGA'=0, k'=k+1} goto loc_000010001;
when hCMYC=dnCMYC1 do {hCMYC'=0, k'=k+1} goto loc_000010010;

-- for the configuration 0,0,0,0,1,0,1,0,0
loc loc_000010100: while hPI3K <=  dpPI3K0 & hMDM2 <=  dpMDM20 & hOGT >=  dnOGT1 & hCMYC <=  dpCMYC0  wait {dhNFKB=0,dhP21=1,dhFOXM=1,dhPI3K=1,dhP53=-1,dhMDM2=1,dhOGT=1,dhOGA=1,dhCMYC=1}
--when hP21=dpP210 do {hP21'=0, k'=k+1} goto loc_010010100;
--when hFOXM=dpFOXM0 do {hFOXM'=0, k'=k+1} goto loc_001010100;
when hPI3K=dpPI3K0 do {hPI3K'=0, k'=k+1} goto loc_000110100;
--when hP53=dnP531 do {hP53'=0, k'=k+1} goto loc_000000100;
when hMDM2=dpMDM20 do {hMDM2'=0, k'=k+1} goto loc_000011100;
when hOGT=dnOGT1 do {hOGT'=0, k'=k+1} goto loc_000010000;
--when hOGA=dpOGA0 do {hOGA'=0, k'=k+1} goto loc_000010110;
when hCMYC=dpCMYC0 do {hCMYC'=0, k'=k+1} goto loc_000010101;

-- for the configuration 0,0,0,0,1,0,1,0,1
loc loc_000010101: while hPI3K <=  dpPI3K0 & hMDM2 <=  dpMDM20  wait {dhNFKB=0,dhP21=1,dhFOXM=1,dhPI3K=1,dhP53=-1,dhMDM2=1,dhOGT=0,dhOGA=0,dhCMYC=0}
--when hP21=dpP210 do {hP21'=0, k'=k+1} goto loc_010010101;
--when hFOXM=dpFOXM0 do {hFOXM'=0, k'=k+1} goto loc_001010101;
when hPI3K=dpPI3K0 do {hPI3K'=0, k'=k+1} goto loc_000110101;
--when hP53=dnP531 do {hP53'=0, k'=k+1} goto loc_000000101;
when hMDM2=dpMDM20 do {hMDM2'=0, k'=k+1} goto loc_000011101;

-- for the configuration 0,0,0,0,1,0,1,1,0
loc loc_000010110: while hPI3K <=  dpPI3K0 & hMDM2 <=  dpMDM20 & hOGT >=  dnOGT1 & hOGA >=  dnOGA1 & hCMYC <=  dpCMYC0  wait {dhNFKB=0,dhP21=1,dhFOXM=1,dhPI3K=1,dhP53=-1,dhMDM2=1,dhOGT=1,dhOGA=1,dhCMYC=1}
--when hP21=dpP210 do {hP21'=0, k'=k+1} goto loc_010010110;
--when hFOXM=dpFOXM0 do {hFOXM'=0, k'=k+1} goto loc_001010110;
when hPI3K=dpPI3K0 do {hPI3K'=0, k'=k+1} goto loc_000110110;
--when hP53=dnP531 do {hP53'=0, k'=k+1} goto loc_000000110;
when hMDM2=dpMDM20 do {hMDM2'=0, k'=k+1} goto loc_000011110;
when hOGT=dnOGT1 do {hOGT'=0, k'=k+1} goto loc_000010010;
when hOGA=dnOGA1 do {hOGA'=0, k'=k+1} goto loc_000010100;
when hCMYC=dpCMYC0 do {hCMYC'=0, k'=k+1} goto loc_000010111;

-- for the configuration 0,0,0,0,1,0,1,1,1
loc loc_000010111: while hPI3K <=  dpPI3K0 & hMDM2 <=  dpMDM20 & hOGA >=  dnOGA1  wait {dhNFKB=0,dhP21=1,dhFOXM=1,dhPI3K=1,dhP53=-1,dhMDM2=1,dhOGT=0,dhOGA=1,dhCMYC=0}
--when hP21=dpP210 do {hP21'=0, k'=k+1} goto loc_010010111;
--when hFOXM=dpFOXM0 do {hFOXM'=0, k'=k+1} goto loc_001010111;
when hPI3K=dpPI3K0 do {hPI3K'=0, k'=k+1} goto loc_000110111;
--when hP53=dnP531 do {hP53'=0, k'=k+1} goto loc_000000111;
when hMDM2=dpMDM20 do {hMDM2'=0, k'=k+1} goto loc_000011111;
when hOGA=dnOGA1 do {hOGA'=0, k'=k+1} goto loc_000010101;

-- for the configuration 0,0,0,0,1,1,0,0,0
loc loc_000011000: while hP53 >=  dnP531 & hOGA <=  dpOGA0  wait {dhNFKB=0,dhP21=1,dhFOXM=0,dhPI3K=0,dhP53=1,dhMDM2=-1,dhOGT=0,dhOGA=1,dhCMYC=0}
--when hP21=dpP210 do {hP21'=0, k'=k+1} goto loc_010011000;
when hP53=dnP531 do {hP53'=0, k'=k+1} goto loc_000001000;
--when hMDM2=dnMDM21 do {hMDM2'=0, k'=k+1} goto loc_000010000;
when hOGA=dpOGA0 do {hOGA'=0, k'=k+1} goto loc_000011010;

-- for the configuration 0,0,0,0,1,1,0,0,1
loc loc_000011001: while hP53 >=  dnP531 & hOGT <=  dpOGT0 & hOGA <=  dpOGA0 & hCMYC >=  dnCMYC1  wait {dhNFKB=0,dhP21=1,dhFOXM=0,dhPI3K=1,dhP53=1,dhMDM2=-1,dhOGT=1,dhOGA=1,dhCMYC=1}
--when hP21=dpP210 do {hP21'=0, k'=k+1} goto loc_010011001;
--when hPI3K=dpPI3K0 do {hPI3K'=0, k'=k+1} goto loc_000111001;
when hP53=dnP531 do {hP53'=0, k'=k+1} goto loc_000001001;
--when hMDM2=dnMDM21 do {hMDM2'=0, k'=k+1} goto loc_000010001;
when hOGT=dpOGT0 do {hOGT'=0, k'=k+1} goto loc_000011101;
when hOGA=dpOGA0 do {hOGA'=0, k'=k+1} goto loc_000011011;
when hCMYC=dnCMYC1 do {hCMYC'=0, k'=k+1} goto loc_000011000;

-- for the configuration 0,0,0,0,1,1,0,1,0
loc loc_000011010: while hP53 >=  dnP531  wait {dhNFKB=0,dhP21=1,dhFOXM=0,dhPI3K=0,dhP53=1,dhMDM2=-1,dhOGT=0,dhOGA=0,dhCMYC=0}
--when hP21=dpP210 do {hP21'=0, k'=k+1} goto loc_010011010;
when hP53=dnP531 do {hP53'=0, k'=k+1} goto loc_000001010;
--when hMDM2=dnMDM21 do {hMDM2'=0, k'=k+1} goto loc_000010010;

-- for the configuration 0,0,0,0,1,1,0,1,1
loc loc_000011011: while hP53 >=  dnP531 & hOGT <=  dpOGT0 & hCMYC >=  dnCMYC1  wait {dhNFKB=0,dhP21=1,dhFOXM=0,dhPI3K=1,dhP53=1,dhMDM2=-1,dhOGT=1,dhOGA=-1,dhCMYC=1}
--when hP21=dpP210 do {hP21'=0, k'=k+1} goto loc_010011011;
--when hPI3K=dpPI3K0 do {hPI3K'=0, k'=k+1} goto loc_000111011;
when hP53=dnP531 do {hP53'=0, k'=k+1} goto loc_000001011;
--when hMDM2=dnMDM21 do {hMDM2'=0, k'=k+1} goto loc_000010011;
when hOGT=dpOGT0 do {hOGT'=0, k'=k+1} goto loc_000011111;
--when hOGA=dnOGA1 do {hOGA'=0, k'=k+1} goto loc_000011001;
when hCMYC=dnCMYC1 do {hCMYC'=0, k'=k+1} goto loc_000011010;

-- for the configuration 0,0,0,0,1,1,1,0,0
loc loc_000011100: while hPI3K <=  dpPI3K0 & hP53 >=  dnP531 & hOGT >=  dnOGT1 & hCMYC <=  dpCMYC0  wait {dhNFKB=0,dhP21=1,dhFOXM=1,dhPI3K=1,dhP53=1,dhMDM2=-1,dhOGT=1,dhOGA=1,dhCMYC=1}
--when hP21=dpP210 do {hP21'=0, k'=k+1} goto loc_010011100;
--when hFOXM=dpFOXM0 do {hFOXM'=0, k'=k+1} goto loc_001011100;
when hPI3K=dpPI3K0 do {hPI3K'=0, k'=k+1} goto loc_000111100;
when hP53=dnP531 do {hP53'=0, k'=k+1} goto loc_000001100;
--when hMDM2=dnMDM21 do {hMDM2'=0, k'=k+1} goto loc_000010100;
when hOGT=dnOGT1 do {hOGT'=0, k'=k+1} goto loc_000011000;
--when hOGA=dpOGA0 do {hOGA'=0, k'=k+1} goto loc_000011110;
when hCMYC=dpCMYC0 do {hCMYC'=0, k'=k+1} goto loc_000011101;

-- for the configuration 0,0,0,0,1,1,1,0,1
loc loc_000011101: while hPI3K <=  dpPI3K0 & hP53 >=  dnP531  wait {dhNFKB=0,dhP21=1,dhFOXM=1,dhPI3K=1,dhP53=1,dhMDM2=-1,dhOGT=0,dhOGA=0,dhCMYC=0}
--when hP21=dpP210 do {hP21'=0, k'=k+1} goto loc_010011101;
--when hFOXM=dpFOXM0 do {hFOXM'=0, k'=k+1} goto loc_001011101;
when hPI3K=dpPI3K0 do {hPI3K'=0, k'=k+1} goto loc_000111101;
when hP53=dnP531 do {hP53'=0, k'=k+1} goto loc_000001101;
--when hMDM2=dnMDM21 do {hMDM2'=0, k'=k+1} goto loc_000010101;

-- for the configuration 0,0,0,0,1,1,1,1,0
loc loc_000011110: while hPI3K <=  dpPI3K0 & hP53 >=  dnP531 & hOGT >=  dnOGT1 & hOGA >=  dnOGA1 & hCMYC <=  dpCMYC0  wait {dhNFKB=0,dhP21=1,dhFOXM=1,dhPI3K=1,dhP53=1,dhMDM2=-1,dhOGT=1,dhOGA=1,dhCMYC=1}
--when hP21=dpP210 do {hP21'=0, k'=k+1} goto loc_010011110;
--when hFOXM=dpFOXM0 do {hFOXM'=0, k'=k+1} goto loc_001011110;
when hPI3K=dpPI3K0 do {hPI3K'=0, k'=k+1} goto loc_000111110;
when hP53=dnP531 do {hP53'=0, k'=k+1} goto loc_000001110;
--when hMDM2=dnMDM21 do {hMDM2'=0, k'=k+1} goto loc_000010110;
when hOGT=dnOGT1 do {hOGT'=0, k'=k+1} goto loc_000011010;
when hOGA=dnOGA1 do {hOGA'=0, k'=k+1} goto loc_000011100;
when hCMYC=dpCMYC0 do {hCMYC'=0, k'=k+1} goto loc_000011111;

-- for the configuration 0,0,0,0,1,1,1,1,1
loc loc_000011111: while hPI3K <=  dpPI3K0 & hP53 >=  dnP531 & hOGA >=  dnOGA1  wait {dhNFKB=0,dhP21=1,dhFOXM=1,dhPI3K=1,dhP53=1,dhMDM2=-1,dhOGT=0,dhOGA=1,dhCMYC=0}
--when hP21=dpP210 do {hP21'=0, k'=k+1} goto loc_010011111;
--when hFOXM=dpFOXM0 do {hFOXM'=0, k'=k+1} goto loc_001011111;
when hPI3K=dpPI3K0 do {hPI3K'=0, k'=k+1} goto loc_000111111;
when hP53=dnP531 do {hP53'=0, k'=k+1} goto loc_000001111;
--when hMDM2=dnMDM21 do {hMDM2'=0, k'=k+1} goto loc_000010111;
when hOGA=dnOGA1 do {hOGA'=0, k'=k+1} goto loc_000011101;

-- for the configuration 0,0,0,1,0,0,0,0,0
loc loc_000100000: while hPI3K >=  dnPI3K1 & hP53 <=  dpP530 & hOGA <=  dpOGA0  wait {dhNFKB=0,dhP21=1,dhFOXM=1,dhPI3K=1,dhP53=1,dhMDM2=1,dhOGT=0,dhOGA=1,dhCMYC=0}
--when hP21=dpP210 do {hP21'=0, k'=k+1} goto loc_010100000;
--when hFOXM=dpFOXM0 do {hFOXM'=0, k'=k+1} goto loc_001100000;
when hPI3K=dnPI3K1 do {hPI3K'=0, k'=k+1} goto loc_000000000;
when hP53=dpP530 do {hP53'=0, k'=k+1} goto loc_000110000;
--when hMDM2=dpMDM20 do {hMDM2'=0, k'=k+1} goto loc_000101000;
when hOGA=dpOGA0 do {hOGA'=0, k'=k+1} goto loc_000100010;

-- for the configuration 0,0,0,1,0,0,0,0,1
loc loc_000100001: while hPI3K >=  dnPI3K1 & hP53 <=  dpP530 & hOGT <=  dpOGT0 & hOGA <=  dpOGA0 & hCMYC >=  dnCMYC1  wait {dhNFKB=0,dhP21=1,dhFOXM=1,dhPI3K=1,dhP53=1,dhMDM2=1,dhOGT=1,dhOGA=1,dhCMYC=1}
--when hP21=dpP210 do {hP21'=0, k'=k+1} goto loc_010100001;
--when hFOXM=dpFOXM0 do {hFOXM'=0, k'=k+1} goto loc_001100001;
when hPI3K=dnPI3K1 do {hPI3K'=0, k'=k+1} goto loc_000000001;
when hP53=dpP530 do {hP53'=0, k'=k+1} goto loc_000110001;
--when hMDM2=dpMDM20 do {hMDM2'=0, k'=k+1} goto loc_000101001;
when hOGT=dpOGT0 do {hOGT'=0, k'=k+1} goto loc_000100101;
when hOGA=dpOGA0 do {hOGA'=0, k'=k+1} goto loc_000100011;
when hCMYC=dnCMYC1 do {hCMYC'=0, k'=k+1} goto loc_000100000;

-- for the configuration 0,0,0,1,0,0,0,1,0
loc loc_000100010: while hPI3K >=  dnPI3K1 & hP53 <=  dpP530  wait {dhNFKB=0,dhP21=1,dhFOXM=1,dhPI3K=1,dhP53=1,dhMDM2=1,dhOGT=0,dhOGA=0,dhCMYC=0}
--when hP21=dpP210 do {hP21'=0, k'=k+1} goto loc_010100010;
--when hFOXM=dpFOXM0 do {hFOXM'=0, k'=k+1} goto loc_001100010;
when hPI3K=dnPI3K1 do {hPI3K'=0, k'=k+1} goto loc_000000010;
when hP53=dpP530 do {hP53'=0, k'=k+1} goto loc_000110010;
--when hMDM2=dpMDM20 do {hMDM2'=0, k'=k+1} goto loc_000101010;

-- for the configuration 0,0,0,1,0,0,0,1,1
loc loc_000100011: while hPI3K >=  dnPI3K1 & hP53 <=  dpP530 & hOGT <=  dpOGT0 & hCMYC >=  dnCMYC1  wait {dhNFKB=0,dhP21=1,dhFOXM=1,dhPI3K=1,dhP53=1,dhMDM2=1,dhOGT=1,dhOGA=-1,dhCMYC=1}
--when hP21=dpP210 do {hP21'=0, k'=k+1} goto loc_010100011;
--when hFOXM=dpFOXM0 do {hFOXM'=0, k'=k+1} goto loc_001100011;
when hPI3K=dnPI3K1 do {hPI3K'=0, k'=k+1} goto loc_000000011;
when hP53=dpP530 do {hP53'=0, k'=k+1} goto loc_000110011;
--when hMDM2=dpMDM20 do {hMDM2'=0, k'=k+1} goto loc_000101011;
when hOGT=dpOGT0 do {hOGT'=0, k'=k+1} goto loc_000100111;
--when hOGA=dnOGA1 do {hOGA'=0, k'=k+1} goto loc_000100001;
when hCMYC=dnCMYC1 do {hCMYC'=0, k'=k+1} goto loc_000100010;

-- for the configuration 0,0,0,1,0,0,1,0,0
loc loc_000100100: while hP53 <=  dpP530 & hOGT >=  dnOGT1  wait {dhNFKB=0,dhP21=1,dhFOXM=1,dhPI3K=-1,dhP53=1,dhMDM2=1,dhOGT=1,dhOGA=1,dhCMYC=1}
--when hP21=dpP210 do {hP21'=0, k'=k+1} goto loc_010100100;
--when hFOXM=dpFOXM0 do {hFOXM'=0, k'=k+1} goto loc_001100100;
--when hPI3K=dnPI3K1 do {hPI3K'=0, k'=k+1} goto loc_000000100;
when hP53=dpP530 do {hP53'=0, k'=k+1} goto loc_000110100;
--when hMDM2=dpMDM20 do {hMDM2'=0, k'=k+1} goto loc_000101100;
when hOGT=dnOGT1 do {hOGT'=0, k'=k+1} goto loc_000100000;
--when hOGA=dpOGA0 do {hOGA'=0, k'=k+1} goto loc_000100110;
--when hCMYC=dpCMYC0 do {hCMYC'=0, k'=k+1} goto loc_000100101;

-- for the configuration 0,0,0,1,0,0,1,0,1
loc loc_000100101: while hP53 <=  dpP530  wait {dhNFKB=0,dhP21=1,dhFOXM=1,dhPI3K=0,dhP53=1,dhMDM2=1,dhOGT=0,dhOGA=0,dhCMYC=0}
--when hP21=dpP210 do {hP21'=0, k'=k+1} goto loc_010100101;
--when hFOXM=dpFOXM0 do {hFOXM'=0, k'=k+1} goto loc_001100101;
when hP53=dpP530 do {hP53'=0, k'=k+1} goto loc_000110101;
--when hMDM2=dpMDM20 do {hMDM2'=0, k'=k+1} goto loc_000101101;

-- for the configuration 0,0,0,1,0,0,1,1,0
loc loc_000100110: while hP53 <=  dpP530 & hOGT >=  dnOGT1 & hOGA >=  dnOGA1  wait {dhNFKB=0,dhP21=1,dhFOXM=1,dhPI3K=-1,dhP53=1,dhMDM2=1,dhOGT=1,dhOGA=1,dhCMYC=1}
--when hP21=dpP210 do {hP21'=0, k'=k+1} goto loc_010100110;
--when hFOXM=dpFOXM0 do {hFOXM'=0, k'=k+1} goto loc_001100110;
--when hPI3K=dnPI3K1 do {hPI3K'=0, k'=k+1} goto loc_000000110;
when hP53=dpP530 do {hP53'=0, k'=k+1} goto loc_000110110;
--when hMDM2=dpMDM20 do {hMDM2'=0, k'=k+1} goto loc_000101110;
when hOGT=dnOGT1 do {hOGT'=0, k'=k+1} goto loc_000100010;
when hOGA=dnOGA1 do {hOGA'=0, k'=k+1} goto loc_000100100;
--when hCMYC=dpCMYC0 do {hCMYC'=0, k'=k+1} goto loc_000100111;

-- for the configuration 0,0,0,1,0,0,1,1,1
loc loc_000100111: while hP53 <=  dpP530 & hOGA >=  dnOGA1  wait {dhNFKB=0,dhP21=1,dhFOXM=1,dhPI3K=0,dhP53=1,dhMDM2=1,dhOGT=0,dhOGA=1,dhCMYC=0}
--when hP21=dpP210 do {hP21'=0, k'=k+1} goto loc_010100111;
--when hFOXM=dpFOXM0 do {hFOXM'=0, k'=k+1} goto loc_001100111;
when hP53=dpP530 do {hP53'=0, k'=k+1} goto loc_000110111;
--when hMDM2=dpMDM20 do {hMDM2'=0, k'=k+1} goto loc_000101111;
when hOGA=dnOGA1 do {hOGA'=0, k'=k+1} goto loc_000100101;

-- for the configuration 0,0,0,1,0,1,0,0,0
loc loc_000101000: while hPI3K >=  dnPI3K1 & hMDM2 >=  dnMDM21 & hOGA <=  dpOGA0  wait {dhNFKB=0,dhP21=1,dhFOXM=0,dhPI3K=1,dhP53=1,dhMDM2=1,dhOGT=0,dhOGA=1,dhCMYC=0}
--when hP21=dpP210 do {hP21'=0, k'=k+1} goto loc_010101000;
when hPI3K=dnPI3K1 do {hPI3K'=0, k'=k+1} goto loc_000001000;
--when hP53=dpP530 do {hP53'=0, k'=k+1} goto loc_000111000;
when hMDM2=dnMDM21 do {hMDM2'=0, k'=k+1} goto loc_000100000;
when hOGA=dpOGA0 do {hOGA'=0, k'=k+1} goto loc_000101010;

-- for the configuration 0,0,0,1,0,1,0,0,1
loc loc_000101001: while hPI3K >=  dnPI3K1 & hMDM2 >=  dnMDM21 & hOGT <=  dpOGT0 & hOGA <=  dpOGA0 & hCMYC >=  dnCMYC1  wait {dhNFKB=0,dhP21=1,dhFOXM=0,dhPI3K=1,dhP53=1,dhMDM2=1,dhOGT=1,dhOGA=1,dhCMYC=1}
--when hP21=dpP210 do {hP21'=0, k'=k+1} goto loc_010101001;
when hPI3K=dnPI3K1 do {hPI3K'=0, k'=k+1} goto loc_000001001;
--when hP53=dpP530 do {hP53'=0, k'=k+1} goto loc_000111001;
when hMDM2=dnMDM21 do {hMDM2'=0, k'=k+1} goto loc_000100001;
when hOGT=dpOGT0 do {hOGT'=0, k'=k+1} goto loc_000101101;
when hOGA=dpOGA0 do {hOGA'=0, k'=k+1} goto loc_000101011;
when hCMYC=dnCMYC1 do {hCMYC'=0, k'=k+1} goto loc_000101000;

-- for the configuration 0,0,0,1,0,1,0,1,0
loc loc_000101010: while hPI3K >=  dnPI3K1 & hMDM2 >=  dnMDM21  wait {dhNFKB=0,dhP21=1,dhFOXM=0,dhPI3K=1,dhP53=1,dhMDM2=1,dhOGT=0,dhOGA=0,dhCMYC=0}
--when hP21=dpP210 do {hP21'=0, k'=k+1} goto loc_010101010;
when hPI3K=dnPI3K1 do {hPI3K'=0, k'=k+1} goto loc_000001010;
--when hP53=dpP530 do {hP53'=0, k'=k+1} goto loc_000111010;
when hMDM2=dnMDM21 do {hMDM2'=0, k'=k+1} goto loc_000100010;

-- for the configuration 0,0,0,1,0,1,0,1,1
loc loc_000101011: while hPI3K >=  dnPI3K1 & hMDM2 >=  dnMDM21 & hOGT <=  dpOGT0 & hCMYC >=  dnCMYC1  wait {dhNFKB=0,dhP21=1,dhFOXM=0,dhPI3K=1,dhP53=1,dhMDM2=1,dhOGT=1,dhOGA=-1,dhCMYC=1}
--when hP21=dpP210 do {hP21'=0, k'=k+1} goto loc_010101011;
when hPI3K=dnPI3K1 do {hPI3K'=0, k'=k+1} goto loc_000001011;
--when hP53=dpP530 do {hP53'=0, k'=k+1} goto loc_000111011;
when hMDM2=dnMDM21 do {hMDM2'=0, k'=k+1} goto loc_000100011;
when hOGT=dpOGT0 do {hOGT'=0, k'=k+1} goto loc_000101111;
--when hOGA=dnOGA1 do {hOGA'=0, k'=k+1} goto loc_000101001;
when hCMYC=dnCMYC1 do {hCMYC'=0, k'=k+1} goto loc_000101010;

-- for the configuration 0,0,0,1,0,1,1,0,0
loc loc_000101100: while hMDM2 >=  dnMDM21 & hOGT >=  dnOGT1  wait {dhNFKB=0,dhP21=0,dhFOXM=0,dhPI3K=-1,dhP53=1,dhMDM2=1,dhOGT=1,dhOGA=1,dhCMYC=0}
--when hPI3K=dnPI3K1 do {hPI3K'=0, k'=k+1} goto loc_000001100;
--when hP53=dpP530 do {hP53'=0, k'=k+1} goto loc_000111100;
when hMDM2=dnMDM21 do {hMDM2'=0, k'=k+1} goto loc_000100100;
when hOGT=dnOGT1 do {hOGT'=0, k'=k+1} goto loc_000101000;
--when hOGA=dpOGA0 do {hOGA'=0, k'=k+1} goto loc_000101110;

-- for the configuration 0,0,0,1,0,1,1,0,1
loc loc_000101101: while hMDM2 >=  dnMDM21  wait {dhNFKB=0,dhP21=0,dhFOXM=0,dhPI3K=0,dhP53=1,dhMDM2=1,dhOGT=0,dhOGA=0,dhCMYC=0}
--when hP53=dpP530 do {hP53'=0, k'=k+1} goto loc_000111101;
when hMDM2=dnMDM21 do {hMDM2'=0, k'=k+1} goto loc_000100101;

-- for the configuration 0,0,0,1,0,1,1,1,0
loc loc_000101110: while hMDM2 >=  dnMDM21 & hOGT >=  dnOGT1 & hOGA >=  dnOGA1  wait {dhNFKB=0,dhP21=0,dhFOXM=0,dhPI3K=-1,dhP53=1,dhMDM2=1,dhOGT=1,dhOGA=1,dhCMYC=0}
--when hPI3K=dnPI3K1 do {hPI3K'=0, k'=k+1} goto loc_000001110;
--when hP53=dpP530 do {hP53'=0, k'=k+1} goto loc_000111110;
when hMDM2=dnMDM21 do {hMDM2'=0, k'=k+1} goto loc_000100110;
when hOGT=dnOGT1 do {hOGT'=0, k'=k+1} goto loc_000101010;
when hOGA=dnOGA1 do {hOGA'=0, k'=k+1} goto loc_000101100;

-- for the configuration 0,0,0,1,0,1,1,1,1
loc loc_000101111: while hMDM2 >=  dnMDM21 & hOGA >=  dnOGA1  wait {dhNFKB=0,dhP21=0,dhFOXM=0,dhPI3K=0,dhP53=1,dhMDM2=1,dhOGT=0,dhOGA=1,dhCMYC=0}
--when hP53=dpP530 do {hP53'=0, k'=k+1} goto loc_000111111;
when hMDM2=dnMDM21 do {hMDM2'=0, k'=k+1} goto loc_000100111;
when hOGA=dnOGA1 do {hOGA'=0, k'=k+1} goto loc_000101101;

-- for the configuration 0,0,0,1,1,0,0,0,0
loc loc_000110000: while hP21 <=  dpP210 & hFOXM <=  dpFOXM0 & hPI3K >=  dnPI3K1 & hMDM2 <=  dpMDM20 & hOGA <=  dpOGA0  wait {dhNFKB=0,dhP21=1,dhFOXM=1,dhPI3K=1,dhP53=-1,dhMDM2=1,dhOGT=0,dhOGA=1,dhCMYC=0}
when hP21=dpP210 do {hP21'=0, k'=k+1} goto loc_010110000;
when hFOXM=dpFOXM0 do {hFOXM'=0, k'=k+1} goto loc_001110000;
when hPI3K=dnPI3K1 do {hPI3K'=0, k'=k+1} goto loc_000010000;
--when hP53=dnP531 do {hP53'=0, k'=k+1} goto loc_000100000;
when hMDM2=dpMDM20 do {hMDM2'=0, k'=k+1} goto loc_000111000;
when hOGA=dpOGA0 do {hOGA'=0, k'=k+1} goto loc_000110010;

-- for the configuration 0,0,0,1,1,0,0,0,1
loc loc_000110001: while hP21 <=  dpP210 & hFOXM <=  dpFOXM0 & hPI3K >=  dnPI3K1 & hMDM2 <=  dpMDM20 & hOGT <=  dpOGT0 & hOGA <=  dpOGA0 & hCMYC >=  dnCMYC1  wait {dhNFKB=0,dhP21=1,dhFOXM=1,dhPI3K=1,dhP53=-1,dhMDM2=1,dhOGT=1,dhOGA=1,dhCMYC=1}
when hP21=dpP210 do {hP21'=0, k'=k+1} goto loc_010110001;
when hFOXM=dpFOXM0 do {hFOXM'=0, k'=k+1} goto loc_001110001;
when hPI3K=dnPI3K1 do {hPI3K'=0, k'=k+1} goto loc_000010001;
--when hP53=dnP531 do {hP53'=0, k'=k+1} goto loc_000100001;
when hMDM2=dpMDM20 do {hMDM2'=0, k'=k+1} goto loc_000111001;
when hOGT=dpOGT0 do {hOGT'=0, k'=k+1} goto loc_000110101;
when hOGA=dpOGA0 do {hOGA'=0, k'=k+1} goto loc_000110011;
when hCMYC=dnCMYC1 do {hCMYC'=0, k'=k+1} goto loc_000110000;

-- for the configuration 0,0,0,1,1,0,0,1,0
loc loc_000110010: while hP21 <=  dpP210 & hFOXM <=  dpFOXM0 & hPI3K >=  dnPI3K1 & hMDM2 <=  dpMDM20  wait {dhNFKB=0,dhP21=1,dhFOXM=1,dhPI3K=1,dhP53=-1,dhMDM2=1,dhOGT=0,dhOGA=0,dhCMYC=0}
when hP21=dpP210 do {hP21'=0, k'=k+1} goto loc_010110010;
when hFOXM=dpFOXM0 do {hFOXM'=0, k'=k+1} goto loc_001110010;
when hPI3K=dnPI3K1 do {hPI3K'=0, k'=k+1} goto loc_000010010;
--when hP53=dnP531 do {hP53'=0, k'=k+1} goto loc_000100010;
when hMDM2=dpMDM20 do {hMDM2'=0, k'=k+1} goto loc_000111010;

-- for the configuration 0,0,0,1,1,0,0,1,1
loc loc_000110011: while hP21 <=  dpP210 & hFOXM <=  dpFOXM0 & hPI3K >=  dnPI3K1 & hMDM2 <=  dpMDM20 & hOGT <=  dpOGT0 & hCMYC >=  dnCMYC1  wait {dhNFKB=0,dhP21=1,dhFOXM=1,dhPI3K=1,dhP53=-1,dhMDM2=1,dhOGT=1,dhOGA=-1,dhCMYC=1}
when hP21=dpP210 do {hP21'=0, k'=k+1} goto loc_010110011;
when hFOXM=dpFOXM0 do {hFOXM'=0, k'=k+1} goto loc_001110011;
when hPI3K=dnPI3K1 do {hPI3K'=0, k'=k+1} goto loc_000010011;
--when hP53=dnP531 do {hP53'=0, k'=k+1} goto loc_000100011;
when hMDM2=dpMDM20 do {hMDM2'=0, k'=k+1} goto loc_000111011;
when hOGT=dpOGT0 do {hOGT'=0, k'=k+1} goto loc_000110111;
--when hOGA=dnOGA1 do {hOGA'=0, k'=k+1} goto loc_000110001;
when hCMYC=dnCMYC1 do {hCMYC'=0, k'=k+1} goto loc_000110010;

-- for the configuration 0,0,0,1,1,0,1,0,0
loc loc_000110100: while hP21 <=  dpP210 & hFOXM <=  dpFOXM0 & hMDM2 <=  dpMDM20 & hOGT >=  dnOGT1 & hCMYC <=  dpCMYC0  wait {dhNFKB=0,dhP21=1,dhFOXM=1,dhPI3K=-1,dhP53=-1,dhMDM2=1,dhOGT=1,dhOGA=1,dhCMYC=1}
when hP21=dpP210 do {hP21'=0, k'=k+1} goto loc_010110100;
when hFOXM=dpFOXM0 do {hFOXM'=0, k'=k+1} goto loc_001110100;
--when hPI3K=dnPI3K1 do {hPI3K'=0, k'=k+1} goto loc_000010100;
--when hP53=dnP531 do {hP53'=0, k'=k+1} goto loc_000100100;
when hMDM2=dpMDM20 do {hMDM2'=0, k'=k+1} goto loc_000111100;
when hOGT=dnOGT1 do {hOGT'=0, k'=k+1} goto loc_000110000;
--when hOGA=dpOGA0 do {hOGA'=0, k'=k+1} goto loc_000110110;
when hCMYC=dpCMYC0 do {hCMYC'=0, k'=k+1} goto loc_000110101;

-- for the configuration 0,0,0,1,1,0,1,0,1
loc loc_000110101: while hP21 <=  dpP210 & hFOXM <=  dpFOXM0 & hMDM2 <=  dpMDM20  wait {dhNFKB=0,dhP21=1,dhFOXM=1,dhPI3K=0,dhP53=-1,dhMDM2=1,dhOGT=0,dhOGA=0,dhCMYC=0}
when hP21=dpP210 do {hP21'=0, k'=k+1} goto loc_010110101;
when hFOXM=dpFOXM0 do {hFOXM'=0, k'=k+1} goto loc_001110101;
--when hP53=dnP531 do {hP53'=0, k'=k+1} goto loc_000100101;
when hMDM2=dpMDM20 do {hMDM2'=0, k'=k+1} goto loc_000111101;

-- for the configuration 0,0,0,1,1,0,1,1,0
loc loc_000110110: while hP21 <=  dpP210 & hFOXM <=  dpFOXM0 & hMDM2 <=  dpMDM20 & hOGT >=  dnOGT1 & hOGA >=  dnOGA1 & hCMYC <=  dpCMYC0  wait {dhNFKB=0,dhP21=1,dhFOXM=1,dhPI3K=-1,dhP53=-1,dhMDM2=1,dhOGT=1,dhOGA=1,dhCMYC=1}
when hP21=dpP210 do {hP21'=0, k'=k+1} goto loc_010110110;
when hFOXM=dpFOXM0 do {hFOXM'=0, k'=k+1} goto loc_001110110;
--when hPI3K=dnPI3K1 do {hPI3K'=0, k'=k+1} goto loc_000010110;
--when hP53=dnP531 do {hP53'=0, k'=k+1} goto loc_000100110;
when hMDM2=dpMDM20 do {hMDM2'=0, k'=k+1} goto loc_000111110;
when hOGT=dnOGT1 do {hOGT'=0, k'=k+1} goto loc_000110010;
when hOGA=dnOGA1 do {hOGA'=0, k'=k+1} goto loc_000110100;
when hCMYC=dpCMYC0 do {hCMYC'=0, k'=k+1} goto loc_000110111;

-- for the configuration 0,0,0,1,1,0,1,1,1
loc loc_000110111: while hP21 <=  dpP210 & hFOXM <=  dpFOXM0 & hMDM2 <=  dpMDM20 & hOGA >=  dnOGA1  wait {dhNFKB=0,dhP21=1,dhFOXM=1,dhPI3K=0,dhP53=-1,dhMDM2=1,dhOGT=0,dhOGA=1,dhCMYC=0}
when hP21=dpP210 do {hP21'=0, k'=k+1} goto loc_010110111;
when hFOXM=dpFOXM0 do {hFOXM'=0, k'=k+1} goto loc_001110111;
--when hP53=dnP531 do {hP53'=0, k'=k+1} goto loc_000100111;
when hMDM2=dpMDM20 do {hMDM2'=0, k'=k+1} goto loc_000111111;
when hOGA=dnOGA1 do {hOGA'=0, k'=k+1} goto loc_000110101;

-- for the configuration 0,0,0,1,1,1,0,0,0
loc loc_000111000: while hP21 <=  dpP210 & hFOXM <=  dpFOXM0 & hPI3K >=  dnPI3K1 & hP53 >=  dnP531 & hOGA <=  dpOGA0  wait {dhNFKB=0,dhP21=1,dhFOXM=1,dhPI3K=1,dhP53=1,dhMDM2=-1,dhOGT=0,dhOGA=1,dhCMYC=0}
when hP21=dpP210 do {hP21'=0, k'=k+1} goto loc_010111000;
when hFOXM=dpFOXM0 do {hFOXM'=0, k'=k+1} goto loc_001111000;
when hPI3K=dnPI3K1 do {hPI3K'=0, k'=k+1} goto loc_000011000;
when hP53=dnP531 do {hP53'=0, k'=k+1} goto loc_000101000;
--when hMDM2=dnMDM21 do {hMDM2'=0, k'=k+1} goto loc_000110000;
when hOGA=dpOGA0 do {hOGA'=0, k'=k+1} goto loc_000111010;

-- for the configuration 0,0,0,1,1,1,0,0,1
loc loc_000111001: while hP21 <=  dpP210 & hFOXM <=  dpFOXM0 & hPI3K >=  dnPI3K1 & hP53 >=  dnP531 & hOGT <=  dpOGT0 & hOGA <=  dpOGA0 & hCMYC >=  dnCMYC1  wait {dhNFKB=0,dhP21=1,dhFOXM=1,dhPI3K=1,dhP53=1,dhMDM2=-1,dhOGT=1,dhOGA=1,dhCMYC=1}
when hP21=dpP210 do {hP21'=0, k'=k+1} goto loc_010111001;
when hFOXM=dpFOXM0 do {hFOXM'=0, k'=k+1} goto loc_001111001;
when hPI3K=dnPI3K1 do {hPI3K'=0, k'=k+1} goto loc_000011001;
when hP53=dnP531 do {hP53'=0, k'=k+1} goto loc_000101001;
--when hMDM2=dnMDM21 do {hMDM2'=0, k'=k+1} goto loc_000110001;
when hOGT=dpOGT0 do {hOGT'=0, k'=k+1} goto loc_000111101;
when hOGA=dpOGA0 do {hOGA'=0, k'=k+1} goto loc_000111011;
when hCMYC=dnCMYC1 do {hCMYC'=0, k'=k+1} goto loc_000111000;

-- for the configuration 0,0,0,1,1,1,0,1,0
loc loc_000111010: while hP21 <=  dpP210 & hFOXM <=  dpFOXM0 & hPI3K >=  dnPI3K1 & hP53 >=  dnP531  wait {dhNFKB=0,dhP21=1,dhFOXM=1,dhPI3K=1,dhP53=1,dhMDM2=-1,dhOGT=0,dhOGA=0,dhCMYC=0}
when hP21=dpP210 do {hP21'=0, k'=k+1} goto loc_010111010;
when hFOXM=dpFOXM0 do {hFOXM'=0, k'=k+1} goto loc_001111010;
when hPI3K=dnPI3K1 do {hPI3K'=0, k'=k+1} goto loc_000011010;
when hP53=dnP531 do {hP53'=0, k'=k+1} goto loc_000101010;
--when hMDM2=dnMDM21 do {hMDM2'=0, k'=k+1} goto loc_000110010;

-- for the configuration 0,0,0,1,1,1,0,1,1
loc loc_000111011: while hP21 <=  dpP210 & hFOXM <=  dpFOXM0 & hPI3K >=  dnPI3K1 & hP53 >=  dnP531 & hOGT <=  dpOGT0 & hCMYC >=  dnCMYC1  wait {dhNFKB=0,dhP21=1,dhFOXM=1,dhPI3K=1,dhP53=1,dhMDM2=-1,dhOGT=1,dhOGA=-1,dhCMYC=1}
when hP21=dpP210 do {hP21'=0, k'=k+1} goto loc_010111011;
when hFOXM=dpFOXM0 do {hFOXM'=0, k'=k+1} goto loc_001111011;
when hPI3K=dnPI3K1 do {hPI3K'=0, k'=k+1} goto loc_000011011;
when hP53=dnP531 do {hP53'=0, k'=k+1} goto loc_000101011;
--when hMDM2=dnMDM21 do {hMDM2'=0, k'=k+1} goto loc_000110011;
when hOGT=dpOGT0 do {hOGT'=0, k'=k+1} goto loc_000111111;
--when hOGA=dnOGA1 do {hOGA'=0, k'=k+1} goto loc_000111001;
when hCMYC=dnCMYC1 do {hCMYC'=0, k'=k+1} goto loc_000111010;

-- for the configuration 0,0,0,1,1,1,1,0,0
loc loc_000111100: while hP21 <=  dpP210 & hFOXM <=  dpFOXM0 & hP53 >=  dnP531 & hOGT >=  dnOGT1 & hCMYC <=  dpCMYC0  wait {dhNFKB=0,dhP21=1,dhFOXM=1,dhPI3K=-1,dhP53=1,dhMDM2=-1,dhOGT=1,dhOGA=1,dhCMYC=1}
when hP21=dpP210 do {hP21'=0, k'=k+1} goto loc_010111100;
when hFOXM=dpFOXM0 do {hFOXM'=0, k'=k+1} goto loc_001111100;
--when hPI3K=dnPI3K1 do {hPI3K'=0, k'=k+1} goto loc_000011100;
when hP53=dnP531 do {hP53'=0, k'=k+1} goto loc_000101100;
--when hMDM2=dnMDM21 do {hMDM2'=0, k'=k+1} goto loc_000110100;
when hOGT=dnOGT1 do {hOGT'=0, k'=k+1} goto loc_000111000;
--when hOGA=dpOGA0 do {hOGA'=0, k'=k+1} goto loc_000111110;
when hCMYC=dpCMYC0 do {hCMYC'=0, k'=k+1} goto loc_000111101;

-- for the configuration 0,0,0,1,1,1,1,0,1
loc loc_000111101: while hP21 <=  dpP210 & hFOXM <=  dpFOXM0 & hP53 >=  dnP531  wait {dhNFKB=0,dhP21=1,dhFOXM=1,dhPI3K=0,dhP53=1,dhMDM2=-1,dhOGT=0,dhOGA=0,dhCMYC=0}
when hP21=dpP210 do {hP21'=0, k'=k+1} goto loc_010111101;
when hFOXM=dpFOXM0 do {hFOXM'=0, k'=k+1} goto loc_001111101;
when hP53=dnP531 do {hP53'=0, k'=k+1} goto loc_000101101;
--when hMDM2=dnMDM21 do {hMDM2'=0, k'=k+1} goto loc_000110101;

-- for the configuration 0,0,0,1,1,1,1,1,0
loc loc_000111110: while hP21 <=  dpP210 & hFOXM <=  dpFOXM0 & hP53 >=  dnP531 & hOGT >=  dnOGT1 & hOGA >=  dnOGA1 & hCMYC <=  dpCMYC0  wait {dhNFKB=0,dhP21=1,dhFOXM=1,dhPI3K=-1,dhP53=1,dhMDM2=-1,dhOGT=1,dhOGA=1,dhCMYC=1}
when hP21=dpP210 do {hP21'=0, k'=k+1} goto loc_010111110;
when hFOXM=dpFOXM0 do {hFOXM'=0, k'=k+1} goto loc_001111110;
--when hPI3K=dnPI3K1 do {hPI3K'=0, k'=k+1} goto loc_000011110;
when hP53=dnP531 do {hP53'=0, k'=k+1} goto loc_000101110;
--when hMDM2=dnMDM21 do {hMDM2'=0, k'=k+1} goto loc_000110110;
when hOGT=dnOGT1 do {hOGT'=0, k'=k+1} goto loc_000111010;
when hOGA=dnOGA1 do {hOGA'=0, k'=k+1} goto loc_000111100;
when hCMYC=dpCMYC0 do {hCMYC'=0, k'=k+1} goto loc_000111111;

-- for the configuration 0,0,0,1,1,1,1,1,1
loc loc_000111111: while hP21 <=  dpP210 & hFOXM <=  dpFOXM0 & hP53 >=  dnP531 & hOGA >=  dnOGA1  wait {dhNFKB=0,dhP21=1,dhFOXM=1,dhPI3K=0,dhP53=1,dhMDM2=-1,dhOGT=0,dhOGA=1,dhCMYC=0}
when hP21=dpP210 do {hP21'=0, k'=k+1} goto loc_010111111;
when hFOXM=dpFOXM0 do {hFOXM'=0, k'=k+1} goto loc_001111111;
when hP53=dnP531 do {hP53'=0, k'=k+1} goto loc_000101111;
--when hMDM2=dnMDM21 do {hMDM2'=0, k'=k+1} goto loc_000110111;
when hOGA=dnOGA1 do {hOGA'=0, k'=k+1} goto loc_000111101;

-- for the configuration 0,0,1,0,0,0,0,0,0
loc loc_001000000: while hFOXM >=  dnFOXM1 & hP53 <=  dpP530 & hOGA <=  dpOGA0  wait {dhNFKB=0,dhP21=1,dhFOXM=1,dhPI3K=0,dhP53=1,dhMDM2=1,dhOGT=0,dhOGA=1,dhCMYC=0}
--when hP21=dpP210 do {hP21'=0, k'=k+1} goto loc_011000000;
when hFOXM=dnFOXM1 do {hFOXM'=0, k'=k+1} goto loc_000000000;
when hP53=dpP530 do {hP53'=0, k'=k+1} goto loc_001010000;
--when hMDM2=dpMDM20 do {hMDM2'=0, k'=k+1} goto loc_001001000;
when hOGA=dpOGA0 do {hOGA'=0, k'=k+1} goto loc_001000010;

-- for the configuration 0,0,1,0,0,0,0,0,1
loc loc_001000001: while hFOXM >=  dnFOXM1 & hP53 <=  dpP530 & hOGT <=  dpOGT0 & hOGA <=  dpOGA0 & hCMYC >=  dnCMYC1  wait {dhNFKB=0,dhP21=1,dhFOXM=1,dhPI3K=0,dhP53=1,dhMDM2=1,dhOGT=1,dhOGA=1,dhCMYC=1}
--when hP21=dpP210 do {hP21'=0, k'=k+1} goto loc_011000001;
when hFOXM=dnFOXM1 do {hFOXM'=0, k'=k+1} goto loc_000000001;
when hP53=dpP530 do {hP53'=0, k'=k+1} goto loc_001010001;
--when hMDM2=dpMDM20 do {hMDM2'=0, k'=k+1} goto loc_001001001;
when hOGT=dpOGT0 do {hOGT'=0, k'=k+1} goto loc_001000101;
when hOGA=dpOGA0 do {hOGA'=0, k'=k+1} goto loc_001000011;
when hCMYC=dnCMYC1 do {hCMYC'=0, k'=k+1} goto loc_001000000;

-- for the configuration 0,0,1,0,0,0,0,1,0
loc loc_001000010: while hFOXM >=  dnFOXM1 & hP53 <=  dpP530  wait {dhNFKB=0,dhP21=1,dhFOXM=1,dhPI3K=0,dhP53=1,dhMDM2=1,dhOGT=0,dhOGA=0,dhCMYC=0}
--when hP21=dpP210 do {hP21'=0, k'=k+1} goto loc_011000010;
when hFOXM=dnFOXM1 do {hFOXM'=0, k'=k+1} goto loc_000000010;
when hP53=dpP530 do {hP53'=0, k'=k+1} goto loc_001010010;
--when hMDM2=dpMDM20 do {hMDM2'=0, k'=k+1} goto loc_001001010;

-- for the configuration 0,0,1,0,0,0,0,1,1
loc loc_001000011: while hFOXM >=  dnFOXM1 & hP53 <=  dpP530 & hOGT <=  dpOGT0 & hCMYC >=  dnCMYC1  wait {dhNFKB=0,dhP21=1,dhFOXM=1,dhPI3K=0,dhP53=1,dhMDM2=1,dhOGT=1,dhOGA=-1,dhCMYC=1}
--when hP21=dpP210 do {hP21'=0, k'=k+1} goto loc_011000011;
when hFOXM=dnFOXM1 do {hFOXM'=0, k'=k+1} goto loc_000000011;
when hP53=dpP530 do {hP53'=0, k'=k+1} goto loc_001010011;
--when hMDM2=dpMDM20 do {hMDM2'=0, k'=k+1} goto loc_001001011;
when hOGT=dpOGT0 do {hOGT'=0, k'=k+1} goto loc_001000111;
--when hOGA=dnOGA1 do {hOGA'=0, k'=k+1} goto loc_001000001;
when hCMYC=dnCMYC1 do {hCMYC'=0, k'=k+1} goto loc_001000010;

-- for the configuration 0,0,1,0,0,0,1,0,0
loc loc_001000100: while hFOXM >=  dnFOXM1 & hP53 <=  dpP530 & hOGT >=  dnOGT1  wait {dhNFKB=0,dhP21=1,dhFOXM=1,dhPI3K=1,dhP53=1,dhMDM2=1,dhOGT=1,dhOGA=1,dhCMYC=1}
--when hP21=dpP210 do {hP21'=0, k'=k+1} goto loc_011000100;
when hFOXM=dnFOXM1 do {hFOXM'=0, k'=k+1} goto loc_000000100;
--when hPI3K=dpPI3K0 do {hPI3K'=0, k'=k+1} goto loc_001100100;
when hP53=dpP530 do {hP53'=0, k'=k+1} goto loc_001010100;
--when hMDM2=dpMDM20 do {hMDM2'=0, k'=k+1} goto loc_001001100;
when hOGT=dnOGT1 do {hOGT'=0, k'=k+1} goto loc_001000000;
--when hOGA=dpOGA0 do {hOGA'=0, k'=k+1} goto loc_001000110;
--when hCMYC=dpCMYC0 do {hCMYC'=0, k'=k+1} goto loc_001000101;

-- for the configuration 0,0,1,0,0,0,1,0,1
loc loc_001000101: while hFOXM >=  dnFOXM1 & hP53 <=  dpP530  wait {dhNFKB=0,dhP21=1,dhFOXM=1,dhPI3K=1,dhP53=1,dhMDM2=1,dhOGT=0,dhOGA=0,dhCMYC=0}
--when hP21=dpP210 do {hP21'=0, k'=k+1} goto loc_011000101;
when hFOXM=dnFOXM1 do {hFOXM'=0, k'=k+1} goto loc_000000101;
--when hPI3K=dpPI3K0 do {hPI3K'=0, k'=k+1} goto loc_001100101;
when hP53=dpP530 do {hP53'=0, k'=k+1} goto loc_001010101;
--when hMDM2=dpMDM20 do {hMDM2'=0, k'=k+1} goto loc_001001101;

-- for the configuration 0,0,1,0,0,0,1,1,0
loc loc_001000110: while hFOXM >=  dnFOXM1 & hP53 <=  dpP530 & hOGT >=  dnOGT1 & hOGA >=  dnOGA1  wait {dhNFKB=0,dhP21=1,dhFOXM=1,dhPI3K=1,dhP53=1,dhMDM2=1,dhOGT=1,dhOGA=1,dhCMYC=1}
--when hP21=dpP210 do {hP21'=0, k'=k+1} goto loc_011000110;
when hFOXM=dnFOXM1 do {hFOXM'=0, k'=k+1} goto loc_000000110;
--when hPI3K=dpPI3K0 do {hPI3K'=0, k'=k+1} goto loc_001100110;
when hP53=dpP530 do {hP53'=0, k'=k+1} goto loc_001010110;
--when hMDM2=dpMDM20 do {hMDM2'=0, k'=k+1} goto loc_001001110;
when hOGT=dnOGT1 do {hOGT'=0, k'=k+1} goto loc_001000010;
when hOGA=dnOGA1 do {hOGA'=0, k'=k+1} goto loc_001000100;
--when hCMYC=dpCMYC0 do {hCMYC'=0, k'=k+1} goto loc_001000111;

-- for the configuration 0,0,1,0,0,0,1,1,1
loc loc_001000111: while hFOXM >=  dnFOXM1 & hP53 <=  dpP530 & hOGA >=  dnOGA1  wait {dhNFKB=0,dhP21=1,dhFOXM=1,dhPI3K=1,dhP53=1,dhMDM2=1,dhOGT=0,dhOGA=1,dhCMYC=0}
--when hP21=dpP210 do {hP21'=0, k'=k+1} goto loc_011000111;
when hFOXM=dnFOXM1 do {hFOXM'=0, k'=k+1} goto loc_000000111;
--when hPI3K=dpPI3K0 do {hPI3K'=0, k'=k+1} goto loc_001100111;
when hP53=dpP530 do {hP53'=0, k'=k+1} goto loc_001010111;
--when hMDM2=dpMDM20 do {hMDM2'=0, k'=k+1} goto loc_001001111;
when hOGA=dnOGA1 do {hOGA'=0, k'=k+1} goto loc_001000101;

-- for the configuration 0,0,1,0,0,1,0,0,0
loc loc_001001000: while hFOXM >=  dnFOXM1 & hMDM2 >=  dnMDM21 & hOGA <=  dpOGA0  wait {dhNFKB=0,dhP21=1,dhFOXM=1,dhPI3K=0,dhP53=1,dhMDM2=1,dhOGT=0,dhOGA=1,dhCMYC=0}
--when hP21=dpP210 do {hP21'=0, k'=k+1} goto loc_011001000;
when hFOXM=dnFOXM1 do {hFOXM'=0, k'=k+1} goto loc_000001000;
--when hP53=dpP530 do {hP53'=0, k'=k+1} goto loc_001011000;
when hMDM2=dnMDM21 do {hMDM2'=0, k'=k+1} goto loc_001000000;
when hOGA=dpOGA0 do {hOGA'=0, k'=k+1} goto loc_001001010;

-- for the configuration 0,0,1,0,0,1,0,0,1
loc loc_001001001: while hFOXM >=  dnFOXM1 & hMDM2 >=  dnMDM21 & hOGT <=  dpOGT0 & hOGA <=  dpOGA0 & hCMYC >=  dnCMYC1  wait {dhNFKB=0,dhP21=1,dhFOXM=1,dhPI3K=0,dhP53=1,dhMDM2=1,dhOGT=1,dhOGA=1,dhCMYC=1}
--when hP21=dpP210 do {hP21'=0, k'=k+1} goto loc_011001001;
when hFOXM=dnFOXM1 do {hFOXM'=0, k'=k+1} goto loc_000001001;
--when hP53=dpP530 do {hP53'=0, k'=k+1} goto loc_001011001;
when hMDM2=dnMDM21 do {hMDM2'=0, k'=k+1} goto loc_001000001;
when hOGT=dpOGT0 do {hOGT'=0, k'=k+1} goto loc_001001101;
when hOGA=dpOGA0 do {hOGA'=0, k'=k+1} goto loc_001001011;
when hCMYC=dnCMYC1 do {hCMYC'=0, k'=k+1} goto loc_001001000;

-- for the configuration 0,0,1,0,0,1,0,1,0
loc loc_001001010: while hFOXM >=  dnFOXM1 & hMDM2 >=  dnMDM21  wait {dhNFKB=0,dhP21=1,dhFOXM=1,dhPI3K=0,dhP53=1,dhMDM2=1,dhOGT=0,dhOGA=0,dhCMYC=0}
--when hP21=dpP210 do {hP21'=0, k'=k+1} goto loc_011001010;
when hFOXM=dnFOXM1 do {hFOXM'=0, k'=k+1} goto loc_000001010;
--when hP53=dpP530 do {hP53'=0, k'=k+1} goto loc_001011010;
when hMDM2=dnMDM21 do {hMDM2'=0, k'=k+1} goto loc_001000010;

-- for the configuration 0,0,1,0,0,1,0,1,1
loc loc_001001011: while hFOXM >=  dnFOXM1 & hMDM2 >=  dnMDM21 & hOGT <=  dpOGT0 & hCMYC >=  dnCMYC1  wait {dhNFKB=0,dhP21=1,dhFOXM=1,dhPI3K=0,dhP53=1,dhMDM2=1,dhOGT=1,dhOGA=-1,dhCMYC=1}
--when hP21=dpP210 do {hP21'=0, k'=k+1} goto loc_011001011;
when hFOXM=dnFOXM1 do {hFOXM'=0, k'=k+1} goto loc_000001011;
--when hP53=dpP530 do {hP53'=0, k'=k+1} goto loc_001011011;
when hMDM2=dnMDM21 do {hMDM2'=0, k'=k+1} goto loc_001000011;
when hOGT=dpOGT0 do {hOGT'=0, k'=k+1} goto loc_001001111;
--when hOGA=dnOGA1 do {hOGA'=0, k'=k+1} goto loc_001001001;
when hCMYC=dnCMYC1 do {hCMYC'=0, k'=k+1} goto loc_001001010;

-- for the configuration 0,0,1,0,0,1,1,0,0
loc loc_001001100: while hFOXM >=  dnFOXM1 & hMDM2 >=  dnMDM21 & hOGT >=  dnOGT1  wait {dhNFKB=0,dhP21=1,dhFOXM=1,dhPI3K=0,dhP53=1,dhMDM2=1,dhOGT=1,dhOGA=1,dhCMYC=0}
--when hP21=dpP210 do {hP21'=0, k'=k+1} goto loc_011001100;
when hFOXM=dnFOXM1 do {hFOXM'=0, k'=k+1} goto loc_000001100;
--when hP53=dpP530 do {hP53'=0, k'=k+1} goto loc_001011100;
when hMDM2=dnMDM21 do {hMDM2'=0, k'=k+1} goto loc_001000100;
when hOGT=dnOGT1 do {hOGT'=0, k'=k+1} goto loc_001001000;
--when hOGA=dpOGA0 do {hOGA'=0, k'=k+1} goto loc_001001110;

-- for the configuration 0,0,1,0,0,1,1,0,1
loc loc_001001101: while hFOXM >=  dnFOXM1 & hMDM2 >=  dnMDM21  wait {dhNFKB=0,dhP21=1,dhFOXM=1,dhPI3K=0,dhP53=1,dhMDM2=1,dhOGT=0,dhOGA=0,dhCMYC=0}
--when hP21=dpP210 do {hP21'=0, k'=k+1} goto loc_011001101;
when hFOXM=dnFOXM1 do {hFOXM'=0, k'=k+1} goto loc_000001101;
--when hP53=dpP530 do {hP53'=0, k'=k+1} goto loc_001011101;
when hMDM2=dnMDM21 do {hMDM2'=0, k'=k+1} goto loc_001000101;

-- for the configuration 0,0,1,0,0,1,1,1,0
loc loc_001001110: while hFOXM >=  dnFOXM1 & hMDM2 >=  dnMDM21 & hOGT >=  dnOGT1 & hOGA >=  dnOGA1  wait {dhNFKB=0,dhP21=1,dhFOXM=1,dhPI3K=0,dhP53=1,dhMDM2=1,dhOGT=1,dhOGA=1,dhCMYC=0}
--when hP21=dpP210 do {hP21'=0, k'=k+1} goto loc_011001110;
when hFOXM=dnFOXM1 do {hFOXM'=0, k'=k+1} goto loc_000001110;
--when hP53=dpP530 do {hP53'=0, k'=k+1} goto loc_001011110;
when hMDM2=dnMDM21 do {hMDM2'=0, k'=k+1} goto loc_001000110;
when hOGT=dnOGT1 do {hOGT'=0, k'=k+1} goto loc_001001010;
when hOGA=dnOGA1 do {hOGA'=0, k'=k+1} goto loc_001001100;

-- for the configuration 0,0,1,0,0,1,1,1,1
loc loc_001001111: while hFOXM >=  dnFOXM1 & hMDM2 >=  dnMDM21 & hOGA >=  dnOGA1  wait {dhNFKB=0,dhP21=1,dhFOXM=1,dhPI3K=0,dhP53=1,dhMDM2=1,dhOGT=0,dhOGA=1,dhCMYC=0}
--when hP21=dpP210 do {hP21'=0, k'=k+1} goto loc_011001111;
when hFOXM=dnFOXM1 do {hFOXM'=0, k'=k+1} goto loc_000001111;
--when hP53=dpP530 do {hP53'=0, k'=k+1} goto loc_001011111;
when hMDM2=dnMDM21 do {hMDM2'=0, k'=k+1} goto loc_001000111;
when hOGA=dnOGA1 do {hOGA'=0, k'=k+1} goto loc_001001101;

-- for the configuration 0,0,1,0,1,0,0,0,0
loc loc_001010000: while hFOXM >=  dnFOXM1 & hMDM2 <=  dpMDM20 & hOGA <=  dpOGA0  wait {dhNFKB=0,dhP21=0,dhFOXM=1,dhPI3K=0,dhP53=-1,dhMDM2=1,dhOGT=0,dhOGA=1,dhCMYC=0}
when hFOXM=dnFOXM1 do {hFOXM'=0, k'=k+1} goto loc_000010000;
--when hP53=dnP531 do {hP53'=0, k'=k+1} goto loc_001000000;
when hMDM2=dpMDM20 do {hMDM2'=0, k'=k+1} goto loc_001011000;
when hOGA=dpOGA0 do {hOGA'=0, k'=k+1} goto loc_001010010;

-- for the configuration 0,0,1,0,1,0,0,0,1
loc loc_001010001: while hFOXM >=  dnFOXM1 & hMDM2 <=  dpMDM20 & hOGT <=  dpOGT0 & hOGA <=  dpOGA0 & hCMYC >=  dnCMYC1  wait {dhNFKB=0,dhP21=0,dhFOXM=1,dhPI3K=1,dhP53=-1,dhMDM2=1,dhOGT=1,dhOGA=1,dhCMYC=1}
when hFOXM=dnFOXM1 do {hFOXM'=0, k'=k+1} goto loc_000010001;
--when hPI3K=dpPI3K0 do {hPI3K'=0, k'=k+1} goto loc_001110001;
--when hP53=dnP531 do {hP53'=0, k'=k+1} goto loc_001000001;
when hMDM2=dpMDM20 do {hMDM2'=0, k'=k+1} goto loc_001011001;
when hOGT=dpOGT0 do {hOGT'=0, k'=k+1} goto loc_001010101;
when hOGA=dpOGA0 do {hOGA'=0, k'=k+1} goto loc_001010011;
when hCMYC=dnCMYC1 do {hCMYC'=0, k'=k+1} goto loc_001010000;

-- for the configuration 0,0,1,0,1,0,0,1,0
loc loc_001010010: while hFOXM >=  dnFOXM1 & hMDM2 <=  dpMDM20  wait {dhNFKB=0,dhP21=0,dhFOXM=1,dhPI3K=0,dhP53=-1,dhMDM2=1,dhOGT=0,dhOGA=0,dhCMYC=0}
when hFOXM=dnFOXM1 do {hFOXM'=0, k'=k+1} goto loc_000010010;
--when hP53=dnP531 do {hP53'=0, k'=k+1} goto loc_001000010;
when hMDM2=dpMDM20 do {hMDM2'=0, k'=k+1} goto loc_001011010;

-- for the configuration 0,0,1,0,1,0,0,1,1
loc loc_001010011: while hFOXM >=  dnFOXM1 & hMDM2 <=  dpMDM20 & hOGT <=  dpOGT0 & hCMYC >=  dnCMYC1  wait {dhNFKB=0,dhP21=0,dhFOXM=1,dhPI3K=1,dhP53=-1,dhMDM2=1,dhOGT=1,dhOGA=-1,dhCMYC=1}
when hFOXM=dnFOXM1 do {hFOXM'=0, k'=k+1} goto loc_000010011;
--when hPI3K=dpPI3K0 do {hPI3K'=0, k'=k+1} goto loc_001110011;
--when hP53=dnP531 do {hP53'=0, k'=k+1} goto loc_001000011;
when hMDM2=dpMDM20 do {hMDM2'=0, k'=k+1} goto loc_001011011;
when hOGT=dpOGT0 do {hOGT'=0, k'=k+1} goto loc_001010111;
--when hOGA=dnOGA1 do {hOGA'=0, k'=k+1} goto loc_001010001;
when hCMYC=dnCMYC1 do {hCMYC'=0, k'=k+1} goto loc_001010010;

-- for the configuration 0,0,1,0,1,0,1,0,0
loc loc_001010100: while hFOXM >=  dnFOXM1 & hPI3K <=  dpPI3K0 & hMDM2 <=  dpMDM20 & hOGT >=  dnOGT1 & hCMYC <=  dpCMYC0  wait {dhNFKB=0,dhP21=0,dhFOXM=1,dhPI3K=1,dhP53=-1,dhMDM2=1,dhOGT=1,dhOGA=1,dhCMYC=1}
when hFOXM=dnFOXM1 do {hFOXM'=0, k'=k+1} goto loc_000010100;
when hPI3K=dpPI3K0 do {hPI3K'=0, k'=k+1} goto loc_001110100;
--when hP53=dnP531 do {hP53'=0, k'=k+1} goto loc_001000100;
when hMDM2=dpMDM20 do {hMDM2'=0, k'=k+1} goto loc_001011100;
when hOGT=dnOGT1 do {hOGT'=0, k'=k+1} goto loc_001010000;
--when hOGA=dpOGA0 do {hOGA'=0, k'=k+1} goto loc_001010110;
when hCMYC=dpCMYC0 do {hCMYC'=0, k'=k+1} goto loc_001010101;

-- for the configuration 0,0,1,0,1,0,1,0,1
loc loc_001010101: while hFOXM >=  dnFOXM1 & hPI3K <=  dpPI3K0 & hMDM2 <=  dpMDM20  wait {dhNFKB=0,dhP21=0,dhFOXM=1,dhPI3K=1,dhP53=-1,dhMDM2=1,dhOGT=0,dhOGA=0,dhCMYC=0}
when hFOXM=dnFOXM1 do {hFOXM'=0, k'=k+1} goto loc_000010101;
when hPI3K=dpPI3K0 do {hPI3K'=0, k'=k+1} goto loc_001110101;
--when hP53=dnP531 do {hP53'=0, k'=k+1} goto loc_001000101;
when hMDM2=dpMDM20 do {hMDM2'=0, k'=k+1} goto loc_001011101;

-- for the configuration 0,0,1,0,1,0,1,1,0
loc loc_001010110: while hFOXM >=  dnFOXM1 & hPI3K <=  dpPI3K0 & hMDM2 <=  dpMDM20 & hOGT >=  dnOGT1 & hOGA >=  dnOGA1 & hCMYC <=  dpCMYC0  wait {dhNFKB=0,dhP21=0,dhFOXM=1,dhPI3K=1,dhP53=-1,dhMDM2=1,dhOGT=1,dhOGA=1,dhCMYC=1}
when hFOXM=dnFOXM1 do {hFOXM'=0, k'=k+1} goto loc_000010110;
when hPI3K=dpPI3K0 do {hPI3K'=0, k'=k+1} goto loc_001110110;
--when hP53=dnP531 do {hP53'=0, k'=k+1} goto loc_001000110;
when hMDM2=dpMDM20 do {hMDM2'=0, k'=k+1} goto loc_001011110;
when hOGT=dnOGT1 do {hOGT'=0, k'=k+1} goto loc_001010010;
when hOGA=dnOGA1 do {hOGA'=0, k'=k+1} goto loc_001010100;
when hCMYC=dpCMYC0 do {hCMYC'=0, k'=k+1} goto loc_001010111;

-- for the configuration 0,0,1,0,1,0,1,1,1
loc loc_001010111: while hFOXM >=  dnFOXM1 & hPI3K <=  dpPI3K0 & hMDM2 <=  dpMDM20 & hOGA >=  dnOGA1  wait {dhNFKB=0,dhP21=0,dhFOXM=1,dhPI3K=1,dhP53=-1,dhMDM2=1,dhOGT=0,dhOGA=1,dhCMYC=0}
when hFOXM=dnFOXM1 do {hFOXM'=0, k'=k+1} goto loc_000010111;
when hPI3K=dpPI3K0 do {hPI3K'=0, k'=k+1} goto loc_001110111;
--when hP53=dnP531 do {hP53'=0, k'=k+1} goto loc_001000111;
when hMDM2=dpMDM20 do {hMDM2'=0, k'=k+1} goto loc_001011111;
when hOGA=dnOGA1 do {hOGA'=0, k'=k+1} goto loc_001010101;

-- for the configuration 0,0,1,0,1,1,0,0,0
loc loc_001011000: while hFOXM >=  dnFOXM1 & hP53 >=  dnP531 & hOGA <=  dpOGA0  wait {dhNFKB=0,dhP21=0,dhFOXM=1,dhPI3K=0,dhP53=1,dhMDM2=-1,dhOGT=0,dhOGA=1,dhCMYC=0}
when hFOXM=dnFOXM1 do {hFOXM'=0, k'=k+1} goto loc_000011000;
when hP53=dnP531 do {hP53'=0, k'=k+1} goto loc_001001000;
--when hMDM2=dnMDM21 do {hMDM2'=0, k'=k+1} goto loc_001010000;
when hOGA=dpOGA0 do {hOGA'=0, k'=k+1} goto loc_001011010;

-- for the configuration 0,0,1,0,1,1,0,0,1
loc loc_001011001: while hFOXM >=  dnFOXM1 & hP53 >=  dnP531 & hOGT <=  dpOGT0 & hOGA <=  dpOGA0 & hCMYC >=  dnCMYC1  wait {dhNFKB=0,dhP21=0,dhFOXM=1,dhPI3K=1,dhP53=1,dhMDM2=-1,dhOGT=1,dhOGA=1,dhCMYC=1}
when hFOXM=dnFOXM1 do {hFOXM'=0, k'=k+1} goto loc_000011001;
--when hPI3K=dpPI3K0 do {hPI3K'=0, k'=k+1} goto loc_001111001;
when hP53=dnP531 do {hP53'=0, k'=k+1} goto loc_001001001;
--when hMDM2=dnMDM21 do {hMDM2'=0, k'=k+1} goto loc_001010001;
when hOGT=dpOGT0 do {hOGT'=0, k'=k+1} goto loc_001011101;
when hOGA=dpOGA0 do {hOGA'=0, k'=k+1} goto loc_001011011;
when hCMYC=dnCMYC1 do {hCMYC'=0, k'=k+1} goto loc_001011000;

-- for the configuration 0,0,1,0,1,1,0,1,0
loc loc_001011010: while hFOXM >=  dnFOXM1 & hP53 >=  dnP531  wait {dhNFKB=0,dhP21=0,dhFOXM=1,dhPI3K=0,dhP53=1,dhMDM2=-1,dhOGT=0,dhOGA=0,dhCMYC=0}
when hFOXM=dnFOXM1 do {hFOXM'=0, k'=k+1} goto loc_000011010;
when hP53=dnP531 do {hP53'=0, k'=k+1} goto loc_001001010;
--when hMDM2=dnMDM21 do {hMDM2'=0, k'=k+1} goto loc_001010010;

-- for the configuration 0,0,1,0,1,1,0,1,1
loc loc_001011011: while hFOXM >=  dnFOXM1 & hP53 >=  dnP531 & hOGT <=  dpOGT0 & hCMYC >=  dnCMYC1  wait {dhNFKB=0,dhP21=0,dhFOXM=1,dhPI3K=1,dhP53=1,dhMDM2=-1,dhOGT=1,dhOGA=-1,dhCMYC=1}
when hFOXM=dnFOXM1 do {hFOXM'=0, k'=k+1} goto loc_000011011;
--when hPI3K=dpPI3K0 do {hPI3K'=0, k'=k+1} goto loc_001111011;
when hP53=dnP531 do {hP53'=0, k'=k+1} goto loc_001001011;
--when hMDM2=dnMDM21 do {hMDM2'=0, k'=k+1} goto loc_001010011;
when hOGT=dpOGT0 do {hOGT'=0, k'=k+1} goto loc_001011111;
--when hOGA=dnOGA1 do {hOGA'=0, k'=k+1} goto loc_001011001;
when hCMYC=dnCMYC1 do {hCMYC'=0, k'=k+1} goto loc_001011010;

-- for the configuration 0,0,1,0,1,1,1,0,0
loc loc_001011100: while hFOXM >=  dnFOXM1 & hPI3K <=  dpPI3K0 & hP53 >=  dnP531 & hOGT >=  dnOGT1 & hCMYC <=  dpCMYC0  wait {dhNFKB=0,dhP21=0,dhFOXM=1,dhPI3K=1,dhP53=1,dhMDM2=-1,dhOGT=1,dhOGA=1,dhCMYC=1}
when hFOXM=dnFOXM1 do {hFOXM'=0, k'=k+1} goto loc_000011100;
when hPI3K=dpPI3K0 do {hPI3K'=0, k'=k+1} goto loc_001111100;
when hP53=dnP531 do {hP53'=0, k'=k+1} goto loc_001001100;
--when hMDM2=dnMDM21 do {hMDM2'=0, k'=k+1} goto loc_001010100;
when hOGT=dnOGT1 do {hOGT'=0, k'=k+1} goto loc_001011000;
--when hOGA=dpOGA0 do {hOGA'=0, k'=k+1} goto loc_001011110;
when hCMYC=dpCMYC0 do {hCMYC'=0, k'=k+1} goto loc_001011101;

-- for the configuration 0,0,1,0,1,1,1,0,1
loc loc_001011101: while hFOXM >=  dnFOXM1 & hPI3K <=  dpPI3K0 & hP53 >=  dnP531  wait {dhNFKB=0,dhP21=0,dhFOXM=1,dhPI3K=1,dhP53=1,dhMDM2=-1,dhOGT=0,dhOGA=0,dhCMYC=0}
when hFOXM=dnFOXM1 do {hFOXM'=0, k'=k+1} goto loc_000011101;
when hPI3K=dpPI3K0 do {hPI3K'=0, k'=k+1} goto loc_001111101;
when hP53=dnP531 do {hP53'=0, k'=k+1} goto loc_001001101;
--when hMDM2=dnMDM21 do {hMDM2'=0, k'=k+1} goto loc_001010101;

-- for the configuration 0,0,1,0,1,1,1,1,0
loc loc_001011110: while hFOXM >=  dnFOXM1 & hPI3K <=  dpPI3K0 & hP53 >=  dnP531 & hOGT >=  dnOGT1 & hOGA >=  dnOGA1 & hCMYC <=  dpCMYC0  wait {dhNFKB=0,dhP21=0,dhFOXM=1,dhPI3K=1,dhP53=1,dhMDM2=-1,dhOGT=1,dhOGA=1,dhCMYC=1}
when hFOXM=dnFOXM1 do {hFOXM'=0, k'=k+1} goto loc_000011110;
when hPI3K=dpPI3K0 do {hPI3K'=0, k'=k+1} goto loc_001111110;
when hP53=dnP531 do {hP53'=0, k'=k+1} goto loc_001001110;
--when hMDM2=dnMDM21 do {hMDM2'=0, k'=k+1} goto loc_001010110;
when hOGT=dnOGT1 do {hOGT'=0, k'=k+1} goto loc_001011010;
when hOGA=dnOGA1 do {hOGA'=0, k'=k+1} goto loc_001011100;
when hCMYC=dpCMYC0 do {hCMYC'=0, k'=k+1} goto loc_001011111;

-- for the configuration 0,0,1,0,1,1,1,1,1
loc loc_001011111: while hFOXM >=  dnFOXM1 & hPI3K <=  dpPI3K0 & hP53 >=  dnP531 & hOGA >=  dnOGA1  wait {dhNFKB=0,dhP21=0,dhFOXM=1,dhPI3K=1,dhP53=1,dhMDM2=-1,dhOGT=0,dhOGA=1,dhCMYC=0}
when hFOXM=dnFOXM1 do {hFOXM'=0, k'=k+1} goto loc_000011111;
when hPI3K=dpPI3K0 do {hPI3K'=0, k'=k+1} goto loc_001111111;
when hP53=dnP531 do {hP53'=0, k'=k+1} goto loc_001001111;
--when hMDM2=dnMDM21 do {hMDM2'=0, k'=k+1} goto loc_001010111;
when hOGA=dnOGA1 do {hOGA'=0, k'=k+1} goto loc_001011101;

-- for the configuration 0,0,1,1,0,0,0,0,0
loc loc_001100000: while hPI3K >=  dnPI3K1 & hP53 <=  dpP530 & hOGA <=  dpOGA0  wait {dhNFKB=0,dhP21=0,dhFOXM=-1,dhPI3K=1,dhP53=1,dhMDM2=1,dhOGT=0,dhOGA=1,dhCMYC=0}
--when hFOXM=dnFOXM1 do {hFOXM'=0, k'=k+1} goto loc_000100000;
when hPI3K=dnPI3K1 do {hPI3K'=0, k'=k+1} goto loc_001000000;
when hP53=dpP530 do {hP53'=0, k'=k+1} goto loc_001110000;
--when hMDM2=dpMDM20 do {hMDM2'=0, k'=k+1} goto loc_001101000;
when hOGA=dpOGA0 do {hOGA'=0, k'=k+1} goto loc_001100010;

-- for the configuration 0,0,1,1,0,0,0,0,1
loc loc_001100001: while hPI3K >=  dnPI3K1 & hP53 <=  dpP530 & hOGT <=  dpOGT0 & hOGA <=  dpOGA0 & hCMYC >=  dnCMYC1  wait {dhNFKB=0,dhP21=0,dhFOXM=-1,dhPI3K=1,dhP53=1,dhMDM2=1,dhOGT=1,dhOGA=1,dhCMYC=1}
--when hFOXM=dnFOXM1 do {hFOXM'=0, k'=k+1} goto loc_000100001;
when hPI3K=dnPI3K1 do {hPI3K'=0, k'=k+1} goto loc_001000001;
when hP53=dpP530 do {hP53'=0, k'=k+1} goto loc_001110001;
--when hMDM2=dpMDM20 do {hMDM2'=0, k'=k+1} goto loc_001101001;
when hOGT=dpOGT0 do {hOGT'=0, k'=k+1} goto loc_001100101;
when hOGA=dpOGA0 do {hOGA'=0, k'=k+1} goto loc_001100011;
when hCMYC=dnCMYC1 do {hCMYC'=0, k'=k+1} goto loc_001100000;

-- for the configuration 0,0,1,1,0,0,0,1,0
loc loc_001100010: while hPI3K >=  dnPI3K1 & hP53 <=  dpP530  wait {dhNFKB=0,dhP21=0,dhFOXM=-1,dhPI3K=1,dhP53=1,dhMDM2=1,dhOGT=0,dhOGA=0,dhCMYC=0}
--when hFOXM=dnFOXM1 do {hFOXM'=0, k'=k+1} goto loc_000100010;
when hPI3K=dnPI3K1 do {hPI3K'=0, k'=k+1} goto loc_001000010;
when hP53=dpP530 do {hP53'=0, k'=k+1} goto loc_001110010;
--when hMDM2=dpMDM20 do {hMDM2'=0, k'=k+1} goto loc_001101010;

-- for the configuration 0,0,1,1,0,0,0,1,1
loc loc_001100011: while hPI3K >=  dnPI3K1 & hP53 <=  dpP530 & hOGT <=  dpOGT0 & hCMYC >=  dnCMYC1  wait {dhNFKB=0,dhP21=0,dhFOXM=-1,dhPI3K=1,dhP53=1,dhMDM2=1,dhOGT=1,dhOGA=-1,dhCMYC=1}
--when hFOXM=dnFOXM1 do {hFOXM'=0, k'=k+1} goto loc_000100011;
when hPI3K=dnPI3K1 do {hPI3K'=0, k'=k+1} goto loc_001000011;
when hP53=dpP530 do {hP53'=0, k'=k+1} goto loc_001110011;
--when hMDM2=dpMDM20 do {hMDM2'=0, k'=k+1} goto loc_001101011;
when hOGT=dpOGT0 do {hOGT'=0, k'=k+1} goto loc_001100111;
--when hOGA=dnOGA1 do {hOGA'=0, k'=k+1} goto loc_001100001;
when hCMYC=dnCMYC1 do {hCMYC'=0, k'=k+1} goto loc_001100010;

-- for the configuration 0,0,1,1,0,0,1,0,0
loc loc_001100100: while hP53 <=  dpP530 & hOGT >=  dnOGT1  wait {dhNFKB=0,dhP21=0,dhFOXM=0,dhPI3K=-1,dhP53=1,dhMDM2=1,dhOGT=1,dhOGA=1,dhCMYC=1}
--when hPI3K=dnPI3K1 do {hPI3K'=0, k'=k+1} goto loc_001000100;
when hP53=dpP530 do {hP53'=0, k'=k+1} goto loc_001110100;
--when hMDM2=dpMDM20 do {hMDM2'=0, k'=k+1} goto loc_001101100;
when hOGT=dnOGT1 do {hOGT'=0, k'=k+1} goto loc_001100000;
--when hOGA=dpOGA0 do {hOGA'=0, k'=k+1} goto loc_001100110;
--when hCMYC=dpCMYC0 do {hCMYC'=0, k'=k+1} goto loc_001100101;

-- for the configuration 0,0,1,1,0,0,1,0,1
loc loc_001100101: while hP53 <=  dpP530  wait {dhNFKB=0,dhP21=0,dhFOXM=0,dhPI3K=0,dhP53=1,dhMDM2=1,dhOGT=0,dhOGA=0,dhCMYC=0}
when hP53=dpP530 do {hP53'=0, k'=k+1} goto loc_001110101;
--when hMDM2=dpMDM20 do {hMDM2'=0, k'=k+1} goto loc_001101101;

-- for the configuration 0,0,1,1,0,0,1,1,0
loc loc_001100110: while hP53 <=  dpP530 & hOGT >=  dnOGT1 & hOGA >=  dnOGA1  wait {dhNFKB=0,dhP21=0,dhFOXM=0,dhPI3K=-1,dhP53=1,dhMDM2=1,dhOGT=1,dhOGA=1,dhCMYC=1}
--when hPI3K=dnPI3K1 do {hPI3K'=0, k'=k+1} goto loc_001000110;
when hP53=dpP530 do {hP53'=0, k'=k+1} goto loc_001110110;
--when hMDM2=dpMDM20 do {hMDM2'=0, k'=k+1} goto loc_001101110;
when hOGT=dnOGT1 do {hOGT'=0, k'=k+1} goto loc_001100010;
when hOGA=dnOGA1 do {hOGA'=0, k'=k+1} goto loc_001100100;
--when hCMYC=dpCMYC0 do {hCMYC'=0, k'=k+1} goto loc_001100111;

-- for the configuration 0,0,1,1,0,0,1,1,1
loc loc_001100111: while hP53 <=  dpP530 & hOGA >=  dnOGA1  wait {dhNFKB=0,dhP21=0,dhFOXM=0,dhPI3K=0,dhP53=1,dhMDM2=1,dhOGT=0,dhOGA=1,dhCMYC=0}
when hP53=dpP530 do {hP53'=0, k'=k+1} goto loc_001110111;
--when hMDM2=dpMDM20 do {hMDM2'=0, k'=k+1} goto loc_001101111;
when hOGA=dnOGA1 do {hOGA'=0, k'=k+1} goto loc_001100101;

-- for the configuration 0,0,1,1,0,1,0,0,0
loc loc_001101000: while hPI3K >=  dnPI3K1 & hMDM2 >=  dnMDM21 & hOGA <=  dpOGA0  wait {dhNFKB=0,dhP21=0,dhFOXM=-1,dhPI3K=1,dhP53=1,dhMDM2=1,dhOGT=0,dhOGA=1,dhCMYC=0}
--when hFOXM=dnFOXM1 do {hFOXM'=0, k'=k+1} goto loc_000101000;
when hPI3K=dnPI3K1 do {hPI3K'=0, k'=k+1} goto loc_001001000;
--when hP53=dpP530 do {hP53'=0, k'=k+1} goto loc_001111000;
when hMDM2=dnMDM21 do {hMDM2'=0, k'=k+1} goto loc_001100000;
when hOGA=dpOGA0 do {hOGA'=0, k'=k+1} goto loc_001101010;

-- for the configuration 0,0,1,1,0,1,0,0,1
loc loc_001101001: while hPI3K >=  dnPI3K1 & hMDM2 >=  dnMDM21 & hOGT <=  dpOGT0 & hOGA <=  dpOGA0 & hCMYC >=  dnCMYC1  wait {dhNFKB=0,dhP21=0,dhFOXM=-1,dhPI3K=1,dhP53=1,dhMDM2=1,dhOGT=1,dhOGA=1,dhCMYC=1}
--when hFOXM=dnFOXM1 do {hFOXM'=0, k'=k+1} goto loc_000101001;
when hPI3K=dnPI3K1 do {hPI3K'=0, k'=k+1} goto loc_001001001;
--when hP53=dpP530 do {hP53'=0, k'=k+1} goto loc_001111001;
when hMDM2=dnMDM21 do {hMDM2'=0, k'=k+1} goto loc_001100001;
when hOGT=dpOGT0 do {hOGT'=0, k'=k+1} goto loc_001101101;
when hOGA=dpOGA0 do {hOGA'=0, k'=k+1} goto loc_001101011;
when hCMYC=dnCMYC1 do {hCMYC'=0, k'=k+1} goto loc_001101000;

-- for the configuration 0,0,1,1,0,1,0,1,0
loc loc_001101010: while hPI3K >=  dnPI3K1 & hMDM2 >=  dnMDM21  wait {dhNFKB=0,dhP21=0,dhFOXM=-1,dhPI3K=1,dhP53=1,dhMDM2=1,dhOGT=0,dhOGA=0,dhCMYC=0}
--when hFOXM=dnFOXM1 do {hFOXM'=0, k'=k+1} goto loc_000101010;
when hPI3K=dnPI3K1 do {hPI3K'=0, k'=k+1} goto loc_001001010;
--when hP53=dpP530 do {hP53'=0, k'=k+1} goto loc_001111010;
when hMDM2=dnMDM21 do {hMDM2'=0, k'=k+1} goto loc_001100010;

-- for the configuration 0,0,1,1,0,1,0,1,1
loc loc_001101011: while hPI3K >=  dnPI3K1 & hMDM2 >=  dnMDM21 & hOGT <=  dpOGT0 & hCMYC >=  dnCMYC1  wait {dhNFKB=0,dhP21=0,dhFOXM=-1,dhPI3K=1,dhP53=1,dhMDM2=1,dhOGT=1,dhOGA=-1,dhCMYC=1}
--when hFOXM=dnFOXM1 do {hFOXM'=0, k'=k+1} goto loc_000101011;
when hPI3K=dnPI3K1 do {hPI3K'=0, k'=k+1} goto loc_001001011;
--when hP53=dpP530 do {hP53'=0, k'=k+1} goto loc_001111011;
when hMDM2=dnMDM21 do {hMDM2'=0, k'=k+1} goto loc_001100011;
when hOGT=dpOGT0 do {hOGT'=0, k'=k+1} goto loc_001101111;
--when hOGA=dnOGA1 do {hOGA'=0, k'=k+1} goto loc_001101001;
when hCMYC=dnCMYC1 do {hCMYC'=0, k'=k+1} goto loc_001101010;

-- for the configuration 0,0,1,1,0,1,1,0,0
loc loc_001101100: while hMDM2 >=  dnMDM21 & hOGT >=  dnOGT1  wait {dhNFKB=0,dhP21=0,dhFOXM=0,dhPI3K=-1,dhP53=1,dhMDM2=1,dhOGT=1,dhOGA=1,dhCMYC=0}
--when hPI3K=dnPI3K1 do {hPI3K'=0, k'=k+1} goto loc_001001100;
--when hP53=dpP530 do {hP53'=0, k'=k+1} goto loc_001111100;
when hMDM2=dnMDM21 do {hMDM2'=0, k'=k+1} goto loc_001100100;
when hOGT=dnOGT1 do {hOGT'=0, k'=k+1} goto loc_001101000;
--when hOGA=dpOGA0 do {hOGA'=0, k'=k+1} goto loc_001101110;

-- for the configuration 0,0,1,1,0,1,1,0,1
loc loc_001101101: while hMDM2 >=  dnMDM21  wait {dhNFKB=0,dhP21=0,dhFOXM=0,dhPI3K=0,dhP53=1,dhMDM2=1,dhOGT=0,dhOGA=0,dhCMYC=0}
--when hP53=dpP530 do {hP53'=0, k'=k+1} goto loc_001111101;
when hMDM2=dnMDM21 do {hMDM2'=0, k'=k+1} goto loc_001100101;

-- for the configuration 0,0,1,1,0,1,1,1,0
loc loc_001101110: while hMDM2 >=  dnMDM21 & hOGT >=  dnOGT1 & hOGA >=  dnOGA1  wait {dhNFKB=0,dhP21=0,dhFOXM=0,dhPI3K=-1,dhP53=1,dhMDM2=1,dhOGT=1,dhOGA=1,dhCMYC=0}
--when hPI3K=dnPI3K1 do {hPI3K'=0, k'=k+1} goto loc_001001110;
--when hP53=dpP530 do {hP53'=0, k'=k+1} goto loc_001111110;
when hMDM2=dnMDM21 do {hMDM2'=0, k'=k+1} goto loc_001100110;
when hOGT=dnOGT1 do {hOGT'=0, k'=k+1} goto loc_001101010;
when hOGA=dnOGA1 do {hOGA'=0, k'=k+1} goto loc_001101100;

-- for the configuration 0,0,1,1,0,1,1,1,1
loc loc_001101111: while hMDM2 >=  dnMDM21 & hOGA >=  dnOGA1  wait {dhNFKB=0,dhP21=0,dhFOXM=0,dhPI3K=0,dhP53=1,dhMDM2=1,dhOGT=0,dhOGA=1,dhCMYC=0}
--when hP53=dpP530 do {hP53'=0, k'=k+1} goto loc_001111111;
when hMDM2=dnMDM21 do {hMDM2'=0, k'=k+1} goto loc_001100111;
when hOGA=dnOGA1 do {hOGA'=0, k'=k+1} goto loc_001101101;

-- for the configuration 0,0,1,1,1,0,0,0,0
loc loc_001110000: while hPI3K >=  dnPI3K1 & hMDM2 <=  dpMDM20 & hOGA <=  dpOGA0  wait {dhNFKB=0,dhP21=0,dhFOXM=-1,dhPI3K=1,dhP53=-1,dhMDM2=1,dhOGT=0,dhOGA=1,dhCMYC=0}
--when hFOXM=dnFOXM1 do {hFOXM'=0, k'=k+1} goto loc_000110000;
when hPI3K=dnPI3K1 do {hPI3K'=0, k'=k+1} goto loc_001010000;
--when hP53=dnP531 do {hP53'=0, k'=k+1} goto loc_001100000;
when hMDM2=dpMDM20 do {hMDM2'=0, k'=k+1} goto loc_001111000;
when hOGA=dpOGA0 do {hOGA'=0, k'=k+1} goto loc_001110010;

-- for the configuration 0,0,1,1,1,0,0,0,1
loc loc_001110001: while hPI3K >=  dnPI3K1 & hMDM2 <=  dpMDM20 & hOGT <=  dpOGT0 & hOGA <=  dpOGA0 & hCMYC >=  dnCMYC1  wait {dhNFKB=0,dhP21=0,dhFOXM=-1,dhPI3K=1,dhP53=-1,dhMDM2=1,dhOGT=1,dhOGA=1,dhCMYC=1}
--when hFOXM=dnFOXM1 do {hFOXM'=0, k'=k+1} goto loc_000110001;
when hPI3K=dnPI3K1 do {hPI3K'=0, k'=k+1} goto loc_001010001;
--when hP53=dnP531 do {hP53'=0, k'=k+1} goto loc_001100001;
when hMDM2=dpMDM20 do {hMDM2'=0, k'=k+1} goto loc_001111001;
when hOGT=dpOGT0 do {hOGT'=0, k'=k+1} goto loc_001110101;
when hOGA=dpOGA0 do {hOGA'=0, k'=k+1} goto loc_001110011;
when hCMYC=dnCMYC1 do {hCMYC'=0, k'=k+1} goto loc_001110000;

-- for the configuration 0,0,1,1,1,0,0,1,0
loc loc_001110010: while hPI3K >=  dnPI3K1 & hMDM2 <=  dpMDM20  wait {dhNFKB=0,dhP21=0,dhFOXM=-1,dhPI3K=1,dhP53=-1,dhMDM2=1,dhOGT=0,dhOGA=0,dhCMYC=0}
--when hFOXM=dnFOXM1 do {hFOXM'=0, k'=k+1} goto loc_000110010;
when hPI3K=dnPI3K1 do {hPI3K'=0, k'=k+1} goto loc_001010010;
--when hP53=dnP531 do {hP53'=0, k'=k+1} goto loc_001100010;
when hMDM2=dpMDM20 do {hMDM2'=0, k'=k+1} goto loc_001111010;

-- for the configuration 0,0,1,1,1,0,0,1,1
loc loc_001110011: while hPI3K >=  dnPI3K1 & hMDM2 <=  dpMDM20 & hOGT <=  dpOGT0 & hCMYC >=  dnCMYC1  wait {dhNFKB=0,dhP21=0,dhFOXM=-1,dhPI3K=1,dhP53=-1,dhMDM2=1,dhOGT=1,dhOGA=-1,dhCMYC=1}
--when hFOXM=dnFOXM1 do {hFOXM'=0, k'=k+1} goto loc_000110011;
when hPI3K=dnPI3K1 do {hPI3K'=0, k'=k+1} goto loc_001010011;
--when hP53=dnP531 do {hP53'=0, k'=k+1} goto loc_001100011;
when hMDM2=dpMDM20 do {hMDM2'=0, k'=k+1} goto loc_001111011;
when hOGT=dpOGT0 do {hOGT'=0, k'=k+1} goto loc_001110111;
--when hOGA=dnOGA1 do {hOGA'=0, k'=k+1} goto loc_001110001;
when hCMYC=dnCMYC1 do {hCMYC'=0, k'=k+1} goto loc_001110010;

-- for the configuration 0,0,1,1,1,0,1,0,0
loc loc_001110100: while hMDM2 <=  dpMDM20 & hOGT >=  dnOGT1 & hCMYC <=  dpCMYC0  wait {dhNFKB=0,dhP21=0,dhFOXM=0,dhPI3K=-1,dhP53=-1,dhMDM2=1,dhOGT=1,dhOGA=1,dhCMYC=1}
--when hPI3K=dnPI3K1 do {hPI3K'=0, k'=k+1} goto loc_001010100;
--when hP53=dnP531 do {hP53'=0, k'=k+1} goto loc_001100100;
when hMDM2=dpMDM20 do {hMDM2'=0, k'=k+1} goto loc_001111100;
when hOGT=dnOGT1 do {hOGT'=0, k'=k+1} goto loc_001110000;
--when hOGA=dpOGA0 do {hOGA'=0, k'=k+1} goto loc_001110110;
when hCMYC=dpCMYC0 do {hCMYC'=0, k'=k+1} goto loc_001110101;

-- for the configuration 0,0,1,1,1,0,1,0,1
loc loc_001110101: while hMDM2 <=  dpMDM20  wait {dhNFKB=0,dhP21=0,dhFOXM=0,dhPI3K=0,dhP53=-1,dhMDM2=1,dhOGT=0,dhOGA=0,dhCMYC=0}
--when hP53=dnP531 do {hP53'=0, k'=k+1} goto loc_001100101;
when hMDM2=dpMDM20 do {hMDM2'=0, k'=k+1} goto loc_001111101;

-- for the configuration 0,0,1,1,1,0,1,1,0
loc loc_001110110: while hMDM2 <=  dpMDM20 & hOGT >=  dnOGT1 & hOGA >=  dnOGA1 & hCMYC <=  dpCMYC0  wait {dhNFKB=0,dhP21=0,dhFOXM=0,dhPI3K=-1,dhP53=-1,dhMDM2=1,dhOGT=1,dhOGA=1,dhCMYC=1}
--when hPI3K=dnPI3K1 do {hPI3K'=0, k'=k+1} goto loc_001010110;
--when hP53=dnP531 do {hP53'=0, k'=k+1} goto loc_001100110;
when hMDM2=dpMDM20 do {hMDM2'=0, k'=k+1} goto loc_001111110;
when hOGT=dnOGT1 do {hOGT'=0, k'=k+1} goto loc_001110010;
when hOGA=dnOGA1 do {hOGA'=0, k'=k+1} goto loc_001110100;
when hCMYC=dpCMYC0 do {hCMYC'=0, k'=k+1} goto loc_001110111;

-- for the configuration 0,0,1,1,1,0,1,1,1
loc loc_001110111: while hMDM2 <=  dpMDM20 & hOGA >=  dnOGA1  wait {dhNFKB=0,dhP21=0,dhFOXM=0,dhPI3K=0,dhP53=-1,dhMDM2=1,dhOGT=0,dhOGA=1,dhCMYC=0}
--when hP53=dnP531 do {hP53'=0, k'=k+1} goto loc_001100111;
when hMDM2=dpMDM20 do {hMDM2'=0, k'=k+1} goto loc_001111111;
when hOGA=dnOGA1 do {hOGA'=0, k'=k+1} goto loc_001110101;

-- for the configuration 0,0,1,1,1,1,0,0,0
loc loc_001111000: while hPI3K >=  dnPI3K1 & hP53 >=  dnP531 & hOGA <=  dpOGA0  wait {dhNFKB=0,dhP21=0,dhFOXM=-1,dhPI3K=1,dhP53=1,dhMDM2=-1,dhOGT=0,dhOGA=1,dhCMYC=0}
--when hFOXM=dnFOXM1 do {hFOXM'=0, k'=k+1} goto loc_000111000;
when hPI3K=dnPI3K1 do {hPI3K'=0, k'=k+1} goto loc_001011000;
when hP53=dnP531 do {hP53'=0, k'=k+1} goto loc_001101000;
--when hMDM2=dnMDM21 do {hMDM2'=0, k'=k+1} goto loc_001110000;
when hOGA=dpOGA0 do {hOGA'=0, k'=k+1} goto loc_001111010;

-- for the configuration 0,0,1,1,1,1,0,0,1
loc loc_001111001: while hPI3K >=  dnPI3K1 & hP53 >=  dnP531 & hOGT <=  dpOGT0 & hOGA <=  dpOGA0 & hCMYC >=  dnCMYC1  wait {dhNFKB=0,dhP21=0,dhFOXM=-1,dhPI3K=1,dhP53=1,dhMDM2=-1,dhOGT=1,dhOGA=1,dhCMYC=1}
--when hFOXM=dnFOXM1 do {hFOXM'=0, k'=k+1} goto loc_000111001;
when hPI3K=dnPI3K1 do {hPI3K'=0, k'=k+1} goto loc_001011001;
when hP53=dnP531 do {hP53'=0, k'=k+1} goto loc_001101001;
--when hMDM2=dnMDM21 do {hMDM2'=0, k'=k+1} goto loc_001110001;
when hOGT=dpOGT0 do {hOGT'=0, k'=k+1} goto loc_001111101;
when hOGA=dpOGA0 do {hOGA'=0, k'=k+1} goto loc_001111011;
when hCMYC=dnCMYC1 do {hCMYC'=0, k'=k+1} goto loc_001111000;

-- for the configuration 0,0,1,1,1,1,0,1,0
loc loc_001111010: while hPI3K >=  dnPI3K1 & hP53 >=  dnP531  wait {dhNFKB=0,dhP21=0,dhFOXM=-1,dhPI3K=1,dhP53=1,dhMDM2=-1,dhOGT=0,dhOGA=0,dhCMYC=0}
--when hFOXM=dnFOXM1 do {hFOXM'=0, k'=k+1} goto loc_000111010;
when hPI3K=dnPI3K1 do {hPI3K'=0, k'=k+1} goto loc_001011010;
when hP53=dnP531 do {hP53'=0, k'=k+1} goto loc_001101010;
--when hMDM2=dnMDM21 do {hMDM2'=0, k'=k+1} goto loc_001110010;

-- for the configuration 0,0,1,1,1,1,0,1,1
loc loc_001111011: while hPI3K >=  dnPI3K1 & hP53 >=  dnP531 & hOGT <=  dpOGT0 & hCMYC >=  dnCMYC1  wait {dhNFKB=0,dhP21=0,dhFOXM=-1,dhPI3K=1,dhP53=1,dhMDM2=-1,dhOGT=1,dhOGA=-1,dhCMYC=1}
--when hFOXM=dnFOXM1 do {hFOXM'=0, k'=k+1} goto loc_000111011;
when hPI3K=dnPI3K1 do {hPI3K'=0, k'=k+1} goto loc_001011011;
when hP53=dnP531 do {hP53'=0, k'=k+1} goto loc_001101011;
--when hMDM2=dnMDM21 do {hMDM2'=0, k'=k+1} goto loc_001110011;
when hOGT=dpOGT0 do {hOGT'=0, k'=k+1} goto loc_001111111;
--when hOGA=dnOGA1 do {hOGA'=0, k'=k+1} goto loc_001111001;
when hCMYC=dnCMYC1 do {hCMYC'=0, k'=k+1} goto loc_001111010;

-- for the configuration 0,0,1,1,1,1,1,0,0
loc loc_001111100: while hP53 >=  dnP531 & hOGT >=  dnOGT1 & hCMYC <=  dpCMYC0  wait {dhNFKB=0,dhP21=0,dhFOXM=0,dhPI3K=-1,dhP53=1,dhMDM2=-1,dhOGT=1,dhOGA=1,dhCMYC=1}
--when hPI3K=dnPI3K1 do {hPI3K'=0, k'=k+1} goto loc_001011100;
when hP53=dnP531 do {hP53'=0, k'=k+1} goto loc_001101100;
--when hMDM2=dnMDM21 do {hMDM2'=0, k'=k+1} goto loc_001110100;
when hOGT=dnOGT1 do {hOGT'=0, k'=k+1} goto loc_001111000;
--when hOGA=dpOGA0 do {hOGA'=0, k'=k+1} goto loc_001111110;
when hCMYC=dpCMYC0 do {hCMYC'=0, k'=k+1} goto loc_001111101;

-- for the configuration 0,0,1,1,1,1,1,0,1
loc loc_001111101: while hP53 >=  dnP531  wait {dhNFKB=0,dhP21=0,dhFOXM=0,dhPI3K=0,dhP53=1,dhMDM2=-1,dhOGT=0,dhOGA=0,dhCMYC=0}
when hP53=dnP531 do {hP53'=0, k'=k+1} goto loc_001101101;
--when hMDM2=dnMDM21 do {hMDM2'=0, k'=k+1} goto loc_001110101;

-- for the configuration 0,0,1,1,1,1,1,1,0
loc loc_001111110: while hP53 >=  dnP531 & hOGT >=  dnOGT1 & hOGA >=  dnOGA1 & hCMYC <=  dpCMYC0  wait {dhNFKB=0,dhP21=0,dhFOXM=0,dhPI3K=-1,dhP53=1,dhMDM2=-1,dhOGT=1,dhOGA=1,dhCMYC=1}
--when hPI3K=dnPI3K1 do {hPI3K'=0, k'=k+1} goto loc_001011110;
when hP53=dnP531 do {hP53'=0, k'=k+1} goto loc_001101110;
--when hMDM2=dnMDM21 do {hMDM2'=0, k'=k+1} goto loc_001110110;
when hOGT=dnOGT1 do {hOGT'=0, k'=k+1} goto loc_001111010;
when hOGA=dnOGA1 do {hOGA'=0, k'=k+1} goto loc_001111100;
when hCMYC=dpCMYC0 do {hCMYC'=0, k'=k+1} goto loc_001111111;

-- for the configuration 0,0,1,1,1,1,1,1,1
loc loc_001111111: while hP53 >=  dnP531 & hOGA >=  dnOGA1  wait {dhNFKB=0,dhP21=0,dhFOXM=0,dhPI3K=0,dhP53=1,dhMDM2=-1,dhOGT=0,dhOGA=1,dhCMYC=0}
when hP53=dnP531 do {hP53'=0, k'=k+1} goto loc_001101111;
--when hMDM2=dnMDM21 do {hMDM2'=0, k'=k+1} goto loc_001110111;
when hOGA=dnOGA1 do {hOGA'=0, k'=k+1} goto loc_001111101;

-- for the configuration 0,1,0,0,0,0,0,0,0
loc loc_010000000: while hP53 <=  dpP530 & hOGA <=  dpOGA0  wait {dhNFKB=0,dhP21=0,dhFOXM=0,dhPI3K=0,dhP53=1,dhMDM2=1,dhOGT=0,dhOGA=1,dhCMYC=0}
when hP53=dpP530 do {hP53'=0, k'=k+1} goto loc_010010000;
--when hMDM2=dpMDM20 do {hMDM2'=0, k'=k+1} goto loc_010001000;
when hOGA=dpOGA0 do {hOGA'=0, k'=k+1} goto loc_010000010;

-- for the configuration 0,1,0,0,0,0,0,0,1
loc loc_010000001: while hP53 <=  dpP530 & hOGT <=  dpOGT0 & hOGA <=  dpOGA0 & hCMYC >=  dnCMYC1  wait {dhNFKB=0,dhP21=0,dhFOXM=0,dhPI3K=0,dhP53=1,dhMDM2=1,dhOGT=1,dhOGA=1,dhCMYC=1}
when hP53=dpP530 do {hP53'=0, k'=k+1} goto loc_010010001;
--when hMDM2=dpMDM20 do {hMDM2'=0, k'=k+1} goto loc_010001001;
when hOGT=dpOGT0 do {hOGT'=0, k'=k+1} goto loc_010000101;
when hOGA=dpOGA0 do {hOGA'=0, k'=k+1} goto loc_010000011;
when hCMYC=dnCMYC1 do {hCMYC'=0, k'=k+1} goto loc_010000000;

-- for the configuration 0,1,0,0,0,0,0,1,0
loc loc_010000010: while hP53 <=  dpP530  wait {dhNFKB=0,dhP21=0,dhFOXM=0,dhPI3K=0,dhP53=1,dhMDM2=1,dhOGT=0,dhOGA=0,dhCMYC=0}
when hP53=dpP530 do {hP53'=0, k'=k+1} goto loc_010010010;
--when hMDM2=dpMDM20 do {hMDM2'=0, k'=k+1} goto loc_010001010;

-- for the configuration 0,1,0,0,0,0,0,1,1
loc loc_010000011: while hP53 <=  dpP530 & hOGT <=  dpOGT0 & hCMYC >=  dnCMYC1  wait {dhNFKB=0,dhP21=0,dhFOXM=0,dhPI3K=0,dhP53=1,dhMDM2=1,dhOGT=1,dhOGA=-1,dhCMYC=1}
when hP53=dpP530 do {hP53'=0, k'=k+1} goto loc_010010011;
--when hMDM2=dpMDM20 do {hMDM2'=0, k'=k+1} goto loc_010001011;
when hOGT=dpOGT0 do {hOGT'=0, k'=k+1} goto loc_010000111;
--when hOGA=dnOGA1 do {hOGA'=0, k'=k+1} goto loc_010000001;
when hCMYC=dnCMYC1 do {hCMYC'=0, k'=k+1} goto loc_010000010;

-- for the configuration 0,1,0,0,0,0,1,0,0
loc loc_010000100: while hP53 <=  dpP530 & hOGT >=  dnOGT1  wait {dhNFKB=0,dhP21=0,dhFOXM=0,dhPI3K=1,dhP53=1,dhMDM2=1,dhOGT=1,dhOGA=1,dhCMYC=1}
--when hPI3K=dpPI3K0 do {hPI3K'=0, k'=k+1} goto loc_010100100;
when hP53=dpP530 do {hP53'=0, k'=k+1} goto loc_010010100;
--when hMDM2=dpMDM20 do {hMDM2'=0, k'=k+1} goto loc_010001100;
when hOGT=dnOGT1 do {hOGT'=0, k'=k+1} goto loc_010000000;
--when hOGA=dpOGA0 do {hOGA'=0, k'=k+1} goto loc_010000110;
--when hCMYC=dpCMYC0 do {hCMYC'=0, k'=k+1} goto loc_010000101;

-- for the configuration 0,1,0,0,0,0,1,0,1
loc loc_010000101: while hP53 <=  dpP530  wait {dhNFKB=0,dhP21=0,dhFOXM=0,dhPI3K=1,dhP53=1,dhMDM2=1,dhOGT=0,dhOGA=0,dhCMYC=0}
--when hPI3K=dpPI3K0 do {hPI3K'=0, k'=k+1} goto loc_010100101;
when hP53=dpP530 do {hP53'=0, k'=k+1} goto loc_010010101;
--when hMDM2=dpMDM20 do {hMDM2'=0, k'=k+1} goto loc_010001101;

-- for the configuration 0,1,0,0,0,0,1,1,0
loc loc_010000110: while hP53 <=  dpP530 & hOGT >=  dnOGT1 & hOGA >=  dnOGA1  wait {dhNFKB=0,dhP21=0,dhFOXM=0,dhPI3K=1,dhP53=1,dhMDM2=1,dhOGT=1,dhOGA=1,dhCMYC=1}
--when hPI3K=dpPI3K0 do {hPI3K'=0, k'=k+1} goto loc_010100110;
when hP53=dpP530 do {hP53'=0, k'=k+1} goto loc_010010110;
--when hMDM2=dpMDM20 do {hMDM2'=0, k'=k+1} goto loc_010001110;
when hOGT=dnOGT1 do {hOGT'=0, k'=k+1} goto loc_010000010;
when hOGA=dnOGA1 do {hOGA'=0, k'=k+1} goto loc_010000100;
--when hCMYC=dpCMYC0 do {hCMYC'=0, k'=k+1} goto loc_010000111;

-- for the configuration 0,1,0,0,0,0,1,1,1
loc loc_010000111: while hP53 <=  dpP530 & hOGA >=  dnOGA1  wait {dhNFKB=0,dhP21=0,dhFOXM=0,dhPI3K=1,dhP53=1,dhMDM2=1,dhOGT=0,dhOGA=1,dhCMYC=0}
--when hPI3K=dpPI3K0 do {hPI3K'=0, k'=k+1} goto loc_010100111;
when hP53=dpP530 do {hP53'=0, k'=k+1} goto loc_010010111;
--when hMDM2=dpMDM20 do {hMDM2'=0, k'=k+1} goto loc_010001111;
when hOGA=dnOGA1 do {hOGA'=0, k'=k+1} goto loc_010000101;

-- for the configuration 0,1,0,0,0,1,0,0,0
loc loc_010001000: while hMDM2 >=  dnMDM21 & hOGA <=  dpOGA0  wait {dhNFKB=0,dhP21=0,dhFOXM=0,dhPI3K=0,dhP53=1,dhMDM2=1,dhOGT=0,dhOGA=1,dhCMYC=0}
--when hP53=dpP530 do {hP53'=0, k'=k+1} goto loc_010011000;
when hMDM2=dnMDM21 do {hMDM2'=0, k'=k+1} goto loc_010000000;
when hOGA=dpOGA0 do {hOGA'=0, k'=k+1} goto loc_010001010;

-- for the configuration 0,1,0,0,0,1,0,0,1
loc loc_010001001: while hMDM2 >=  dnMDM21 & hOGT <=  dpOGT0 & hOGA <=  dpOGA0 & hCMYC >=  dnCMYC1  wait {dhNFKB=0,dhP21=0,dhFOXM=0,dhPI3K=0,dhP53=1,dhMDM2=1,dhOGT=1,dhOGA=1,dhCMYC=1}
--when hP53=dpP530 do {hP53'=0, k'=k+1} goto loc_010011001;
when hMDM2=dnMDM21 do {hMDM2'=0, k'=k+1} goto loc_010000001;
when hOGT=dpOGT0 do {hOGT'=0, k'=k+1} goto loc_010001101;
when hOGA=dpOGA0 do {hOGA'=0, k'=k+1} goto loc_010001011;
when hCMYC=dnCMYC1 do {hCMYC'=0, k'=k+1} goto loc_010001000;

-- for the configuration 0,1,0,0,0,1,0,1,0
loc loc_010001010: while hMDM2 >=  dnMDM21  wait {dhNFKB=0,dhP21=0,dhFOXM=0,dhPI3K=0,dhP53=1,dhMDM2=1,dhOGT=0,dhOGA=0,dhCMYC=0}
--when hP53=dpP530 do {hP53'=0, k'=k+1} goto loc_010011010;
when hMDM2=dnMDM21 do {hMDM2'=0, k'=k+1} goto loc_010000010;

-- for the configuration 0,1,0,0,0,1,0,1,1
loc loc_010001011: while hMDM2 >=  dnMDM21 & hOGT <=  dpOGT0 & hCMYC >=  dnCMYC1  wait {dhNFKB=0,dhP21=0,dhFOXM=0,dhPI3K=0,dhP53=1,dhMDM2=1,dhOGT=1,dhOGA=-1,dhCMYC=1}
--when hP53=dpP530 do {hP53'=0, k'=k+1} goto loc_010011011;
when hMDM2=dnMDM21 do {hMDM2'=0, k'=k+1} goto loc_010000011;
when hOGT=dpOGT0 do {hOGT'=0, k'=k+1} goto loc_010001111;
--when hOGA=dnOGA1 do {hOGA'=0, k'=k+1} goto loc_010001001;
when hCMYC=dnCMYC1 do {hCMYC'=0, k'=k+1} goto loc_010001010;

-- for the configuration 0,1,0,0,0,1,1,0,0
loc loc_010001100: while hMDM2 >=  dnMDM21 & hOGT >=  dnOGT1  wait {dhNFKB=0,dhP21=0,dhFOXM=0,dhPI3K=0,dhP53=1,dhMDM2=1,dhOGT=1,dhOGA=1,dhCMYC=0}
--when hP53=dpP530 do {hP53'=0, k'=k+1} goto loc_010011100;
when hMDM2=dnMDM21 do {hMDM2'=0, k'=k+1} goto loc_010000100;
when hOGT=dnOGT1 do {hOGT'=0, k'=k+1} goto loc_010001000;
--when hOGA=dpOGA0 do {hOGA'=0, k'=k+1} goto loc_010001110;

-- for the configuration 0,1,0,0,0,1,1,0,1
loc loc_010001101: while hMDM2 >=  dnMDM21  wait {dhNFKB=0,dhP21=0,dhFOXM=0,dhPI3K=0,dhP53=1,dhMDM2=1,dhOGT=0,dhOGA=0,dhCMYC=0}
--when hP53=dpP530 do {hP53'=0, k'=k+1} goto loc_010011101;
when hMDM2=dnMDM21 do {hMDM2'=0, k'=k+1} goto loc_010000101;

-- for the configuration 0,1,0,0,0,1,1,1,0
loc loc_010001110: while hMDM2 >=  dnMDM21 & hOGT >=  dnOGT1 & hOGA >=  dnOGA1  wait {dhNFKB=0,dhP21=0,dhFOXM=0,dhPI3K=0,dhP53=1,dhMDM2=1,dhOGT=1,dhOGA=1,dhCMYC=0}
--when hP53=dpP530 do {hP53'=0, k'=k+1} goto loc_010011110;
when hMDM2=dnMDM21 do {hMDM2'=0, k'=k+1} goto loc_010000110;
when hOGT=dnOGT1 do {hOGT'=0, k'=k+1} goto loc_010001010;
when hOGA=dnOGA1 do {hOGA'=0, k'=k+1} goto loc_010001100;

-- for the configuration 0,1,0,0,0,1,1,1,1
loc loc_010001111: while hMDM2 >=  dnMDM21 & hOGA >=  dnOGA1  wait {dhNFKB=0,dhP21=0,dhFOXM=0,dhPI3K=0,dhP53=1,dhMDM2=1,dhOGT=0,dhOGA=1,dhCMYC=0}
--when hP53=dpP530 do {hP53'=0, k'=k+1} goto loc_010011111;
when hMDM2=dnMDM21 do {hMDM2'=0, k'=k+1} goto loc_010000111;
when hOGA=dnOGA1 do {hOGA'=0, k'=k+1} goto loc_010001101;

-- for the configuration 0,1,0,0,1,0,0,0,0
loc loc_010010000: while hMDM2 <=  dpMDM20 & hOGA <=  dpOGA0  wait {dhNFKB=0,dhP21=0,dhFOXM=0,dhPI3K=0,dhP53=-1,dhMDM2=1,dhOGT=0,dhOGA=1,dhCMYC=0}
--when hP53=dnP531 do {hP53'=0, k'=k+1} goto loc_010000000;
when hMDM2=dpMDM20 do {hMDM2'=0, k'=k+1} goto loc_010011000;
when hOGA=dpOGA0 do {hOGA'=0, k'=k+1} goto loc_010010010;

-- for the configuration 0,1,0,0,1,0,0,0,1
loc loc_010010001: while hMDM2 <=  dpMDM20 & hOGT <=  dpOGT0 & hOGA <=  dpOGA0 & hCMYC >=  dnCMYC1  wait {dhNFKB=0,dhP21=0,dhFOXM=0,dhPI3K=1,dhP53=-1,dhMDM2=1,dhOGT=1,dhOGA=1,dhCMYC=1}
--when hPI3K=dpPI3K0 do {hPI3K'=0, k'=k+1} goto loc_010110001;
--when hP53=dnP531 do {hP53'=0, k'=k+1} goto loc_010000001;
when hMDM2=dpMDM20 do {hMDM2'=0, k'=k+1} goto loc_010011001;
when hOGT=dpOGT0 do {hOGT'=0, k'=k+1} goto loc_010010101;
when hOGA=dpOGA0 do {hOGA'=0, k'=k+1} goto loc_010010011;
when hCMYC=dnCMYC1 do {hCMYC'=0, k'=k+1} goto loc_010010000;

-- for the configuration 0,1,0,0,1,0,0,1,0
loc loc_010010010: while hMDM2 <=  dpMDM20  wait {dhNFKB=0,dhP21=0,dhFOXM=0,dhPI3K=0,dhP53=-1,dhMDM2=1,dhOGT=0,dhOGA=0,dhCMYC=0}
--when hP53=dnP531 do {hP53'=0, k'=k+1} goto loc_010000010;
when hMDM2=dpMDM20 do {hMDM2'=0, k'=k+1} goto loc_010011010;

-- for the configuration 0,1,0,0,1,0,0,1,1
loc loc_010010011: while hMDM2 <=  dpMDM20 & hOGT <=  dpOGT0 & hCMYC >=  dnCMYC1  wait {dhNFKB=0,dhP21=0,dhFOXM=0,dhPI3K=1,dhP53=-1,dhMDM2=1,dhOGT=1,dhOGA=-1,dhCMYC=1}
--when hPI3K=dpPI3K0 do {hPI3K'=0, k'=k+1} goto loc_010110011;
--when hP53=dnP531 do {hP53'=0, k'=k+1} goto loc_010000011;
when hMDM2=dpMDM20 do {hMDM2'=0, k'=k+1} goto loc_010011011;
when hOGT=dpOGT0 do {hOGT'=0, k'=k+1} goto loc_010010111;
--when hOGA=dnOGA1 do {hOGA'=0, k'=k+1} goto loc_010010001;
when hCMYC=dnCMYC1 do {hCMYC'=0, k'=k+1} goto loc_010010010;

-- for the configuration 0,1,0,0,1,0,1,0,0
loc loc_010010100: while hPI3K <=  dpPI3K0 & hMDM2 <=  dpMDM20 & hOGT >=  dnOGT1 & hCMYC <=  dpCMYC0  wait {dhNFKB=0,dhP21=0,dhFOXM=1,dhPI3K=1,dhP53=-1,dhMDM2=1,dhOGT=1,dhOGA=1,dhCMYC=1}
--when hFOXM=dpFOXM0 do {hFOXM'=0, k'=k+1} goto loc_011010100;
when hPI3K=dpPI3K0 do {hPI3K'=0, k'=k+1} goto loc_010110100;
--when hP53=dnP531 do {hP53'=0, k'=k+1} goto loc_010000100;
when hMDM2=dpMDM20 do {hMDM2'=0, k'=k+1} goto loc_010011100;
when hOGT=dnOGT1 do {hOGT'=0, k'=k+1} goto loc_010010000;
--when hOGA=dpOGA0 do {hOGA'=0, k'=k+1} goto loc_010010110;
when hCMYC=dpCMYC0 do {hCMYC'=0, k'=k+1} goto loc_010010101;

-- for the configuration 0,1,0,0,1,0,1,0,1
loc loc_010010101: while hPI3K <=  dpPI3K0 & hMDM2 <=  dpMDM20  wait {dhNFKB=0,dhP21=0,dhFOXM=1,dhPI3K=1,dhP53=-1,dhMDM2=1,dhOGT=0,dhOGA=0,dhCMYC=0}
--when hFOXM=dpFOXM0 do {hFOXM'=0, k'=k+1} goto loc_011010101;
when hPI3K=dpPI3K0 do {hPI3K'=0, k'=k+1} goto loc_010110101;
--when hP53=dnP531 do {hP53'=0, k'=k+1} goto loc_010000101;
when hMDM2=dpMDM20 do {hMDM2'=0, k'=k+1} goto loc_010011101;

-- for the configuration 0,1,0,0,1,0,1,1,0
loc loc_010010110: while hPI3K <=  dpPI3K0 & hMDM2 <=  dpMDM20 & hOGT >=  dnOGT1 & hOGA >=  dnOGA1 & hCMYC <=  dpCMYC0  wait {dhNFKB=0,dhP21=0,dhFOXM=1,dhPI3K=1,dhP53=-1,dhMDM2=1,dhOGT=1,dhOGA=1,dhCMYC=1}
--when hFOXM=dpFOXM0 do {hFOXM'=0, k'=k+1} goto loc_011010110;
when hPI3K=dpPI3K0 do {hPI3K'=0, k'=k+1} goto loc_010110110;
--when hP53=dnP531 do {hP53'=0, k'=k+1} goto loc_010000110;
when hMDM2=dpMDM20 do {hMDM2'=0, k'=k+1} goto loc_010011110;
when hOGT=dnOGT1 do {hOGT'=0, k'=k+1} goto loc_010010010;
when hOGA=dnOGA1 do {hOGA'=0, k'=k+1} goto loc_010010100;
when hCMYC=dpCMYC0 do {hCMYC'=0, k'=k+1} goto loc_010010111;

-- for the configuration 0,1,0,0,1,0,1,1,1
loc loc_010010111: while hPI3K <=  dpPI3K0 & hMDM2 <=  dpMDM20 & hOGA >=  dnOGA1  wait {dhNFKB=0,dhP21=0,dhFOXM=1,dhPI3K=1,dhP53=-1,dhMDM2=1,dhOGT=0,dhOGA=1,dhCMYC=0}
--when hFOXM=dpFOXM0 do {hFOXM'=0, k'=k+1} goto loc_011010111;
when hPI3K=dpPI3K0 do {hPI3K'=0, k'=k+1} goto loc_010110111;
--when hP53=dnP531 do {hP53'=0, k'=k+1} goto loc_010000111;
when hMDM2=dpMDM20 do {hMDM2'=0, k'=k+1} goto loc_010011111;
when hOGA=dnOGA1 do {hOGA'=0, k'=k+1} goto loc_010010101;

-- for the configuration 0,1,0,0,1,1,0,0,0
loc loc_010011000: while hP53 >=  dnP531 & hOGA <=  dpOGA0  wait {dhNFKB=0,dhP21=0,dhFOXM=0,dhPI3K=0,dhP53=1,dhMDM2=-1,dhOGT=0,dhOGA=1,dhCMYC=0}
when hP53=dnP531 do {hP53'=0, k'=k+1} goto loc_010001000;
--when hMDM2=dnMDM21 do {hMDM2'=0, k'=k+1} goto loc_010010000;
when hOGA=dpOGA0 do {hOGA'=0, k'=k+1} goto loc_010011010;

-- for the configuration 0,1,0,0,1,1,0,0,1
loc loc_010011001: while hP53 >=  dnP531 & hOGT <=  dpOGT0 & hOGA <=  dpOGA0 & hCMYC >=  dnCMYC1  wait {dhNFKB=0,dhP21=0,dhFOXM=0,dhPI3K=1,dhP53=1,dhMDM2=-1,dhOGT=1,dhOGA=1,dhCMYC=1}
--when hPI3K=dpPI3K0 do {hPI3K'=0, k'=k+1} goto loc_010111001;
when hP53=dnP531 do {hP53'=0, k'=k+1} goto loc_010001001;
--when hMDM2=dnMDM21 do {hMDM2'=0, k'=k+1} goto loc_010010001;
when hOGT=dpOGT0 do {hOGT'=0, k'=k+1} goto loc_010011101;
when hOGA=dpOGA0 do {hOGA'=0, k'=k+1} goto loc_010011011;
when hCMYC=dnCMYC1 do {hCMYC'=0, k'=k+1} goto loc_010011000;

-- for the configuration 0,1,0,0,1,1,0,1,0
loc loc_010011010: while hP53 >=  dnP531  wait {dhNFKB=0,dhP21=0,dhFOXM=0,dhPI3K=0,dhP53=1,dhMDM2=-1,dhOGT=0,dhOGA=0,dhCMYC=0}
when hP53=dnP531 do {hP53'=0, k'=k+1} goto loc_010001010;
--when hMDM2=dnMDM21 do {hMDM2'=0, k'=k+1} goto loc_010010010;

-- for the configuration 0,1,0,0,1,1,0,1,1
loc loc_010011011: while hP53 >=  dnP531 & hOGT <=  dpOGT0 & hCMYC >=  dnCMYC1  wait {dhNFKB=0,dhP21=0,dhFOXM=0,dhPI3K=1,dhP53=1,dhMDM2=-1,dhOGT=1,dhOGA=-1,dhCMYC=1}
--when hPI3K=dpPI3K0 do {hPI3K'=0, k'=k+1} goto loc_010111011;
when hP53=dnP531 do {hP53'=0, k'=k+1} goto loc_010001011;
--when hMDM2=dnMDM21 do {hMDM2'=0, k'=k+1} goto loc_010010011;
when hOGT=dpOGT0 do {hOGT'=0, k'=k+1} goto loc_010011111;
--when hOGA=dnOGA1 do {hOGA'=0, k'=k+1} goto loc_010011001;
when hCMYC=dnCMYC1 do {hCMYC'=0, k'=k+1} goto loc_010011010;

-- for the configuration 0,1,0,0,1,1,1,0,0
loc loc_010011100: while hPI3K <=  dpPI3K0 & hP53 >=  dnP531 & hOGT >=  dnOGT1 & hCMYC <=  dpCMYC0  wait {dhNFKB=0,dhP21=0,dhFOXM=1,dhPI3K=1,dhP53=1,dhMDM2=-1,dhOGT=1,dhOGA=1,dhCMYC=1}
--when hFOXM=dpFOXM0 do {hFOXM'=0, k'=k+1} goto loc_011011100;
when hPI3K=dpPI3K0 do {hPI3K'=0, k'=k+1} goto loc_010111100;
when hP53=dnP531 do {hP53'=0, k'=k+1} goto loc_010001100;
--when hMDM2=dnMDM21 do {hMDM2'=0, k'=k+1} goto loc_010010100;
when hOGT=dnOGT1 do {hOGT'=0, k'=k+1} goto loc_010011000;
--when hOGA=dpOGA0 do {hOGA'=0, k'=k+1} goto loc_010011110;
when hCMYC=dpCMYC0 do {hCMYC'=0, k'=k+1} goto loc_010011101;

-- for the configuration 0,1,0,0,1,1,1,0,1
loc loc_010011101: while hPI3K <=  dpPI3K0 & hP53 >=  dnP531  wait {dhNFKB=0,dhP21=0,dhFOXM=1,dhPI3K=1,dhP53=1,dhMDM2=-1,dhOGT=0,dhOGA=0,dhCMYC=0}
--when hFOXM=dpFOXM0 do {hFOXM'=0, k'=k+1} goto loc_011011101;
when hPI3K=dpPI3K0 do {hPI3K'=0, k'=k+1} goto loc_010111101;
when hP53=dnP531 do {hP53'=0, k'=k+1} goto loc_010001101;
--when hMDM2=dnMDM21 do {hMDM2'=0, k'=k+1} goto loc_010010101;

-- for the configuration 0,1,0,0,1,1,1,1,0
loc loc_010011110: while hPI3K <=  dpPI3K0 & hP53 >=  dnP531 & hOGT >=  dnOGT1 & hOGA >=  dnOGA1 & hCMYC <=  dpCMYC0  wait {dhNFKB=0,dhP21=0,dhFOXM=1,dhPI3K=1,dhP53=1,dhMDM2=-1,dhOGT=1,dhOGA=1,dhCMYC=1}
--when hFOXM=dpFOXM0 do {hFOXM'=0, k'=k+1} goto loc_011011110;
when hPI3K=dpPI3K0 do {hPI3K'=0, k'=k+1} goto loc_010111110;
when hP53=dnP531 do {hP53'=0, k'=k+1} goto loc_010001110;
--when hMDM2=dnMDM21 do {hMDM2'=0, k'=k+1} goto loc_010010110;
when hOGT=dnOGT1 do {hOGT'=0, k'=k+1} goto loc_010011010;
when hOGA=dnOGA1 do {hOGA'=0, k'=k+1} goto loc_010011100;
when hCMYC=dpCMYC0 do {hCMYC'=0, k'=k+1} goto loc_010011111;

-- for the configuration 0,1,0,0,1,1,1,1,1
loc loc_010011111: while hPI3K <=  dpPI3K0 & hP53 >=  dnP531 & hOGA >=  dnOGA1  wait {dhNFKB=0,dhP21=0,dhFOXM=1,dhPI3K=1,dhP53=1,dhMDM2=-1,dhOGT=0,dhOGA=1,dhCMYC=0}
--when hFOXM=dpFOXM0 do {hFOXM'=0, k'=k+1} goto loc_011011111;
when hPI3K=dpPI3K0 do {hPI3K'=0, k'=k+1} goto loc_010111111;
when hP53=dnP531 do {hP53'=0, k'=k+1} goto loc_010001111;
--when hMDM2=dnMDM21 do {hMDM2'=0, k'=k+1} goto loc_010010111;
when hOGA=dnOGA1 do {hOGA'=0, k'=k+1} goto loc_010011101;

-- for the configuration 0,1,0,1,0,0,0,0,0
loc loc_010100000: while hP21 >=  dnP211 & hPI3K >=  dnPI3K1 & hP53 <=  dpP530 & hOGA <=  dpOGA0  wait {dhNFKB=0,dhP21=1,dhFOXM=1,dhPI3K=1,dhP53=1,dhMDM2=1,dhOGT=0,dhOGA=1,dhCMYC=0}
when hP21=dnP211 do {hP21'=0, k'=k+1} goto loc_000100000;
--when hFOXM=dpFOXM0 do {hFOXM'=0, k'=k+1} goto loc_011100000;
when hPI3K=dnPI3K1 do {hPI3K'=0, k'=k+1} goto loc_010000000;
when hP53=dpP530 do {hP53'=0, k'=k+1} goto loc_010110000;
--when hMDM2=dpMDM20 do {hMDM2'=0, k'=k+1} goto loc_010101000;
when hOGA=dpOGA0 do {hOGA'=0, k'=k+1} goto loc_010100010;

-- for the configuration 0,1,0,1,0,0,0,0,1
loc loc_010100001: while hP21 >=  dnP211 & hPI3K >=  dnPI3K1 & hP53 <=  dpP530 & hOGT <=  dpOGT0 & hOGA <=  dpOGA0 & hCMYC >=  dnCMYC1  wait {dhNFKB=0,dhP21=1,dhFOXM=1,dhPI3K=1,dhP53=1,dhMDM2=1,dhOGT=1,dhOGA=1,dhCMYC=1}
when hP21=dnP211 do {hP21'=0, k'=k+1} goto loc_000100001;
--when hFOXM=dpFOXM0 do {hFOXM'=0, k'=k+1} goto loc_011100001;
when hPI3K=dnPI3K1 do {hPI3K'=0, k'=k+1} goto loc_010000001;
when hP53=dpP530 do {hP53'=0, k'=k+1} goto loc_010110001;
--when hMDM2=dpMDM20 do {hMDM2'=0, k'=k+1} goto loc_010101001;
when hOGT=dpOGT0 do {hOGT'=0, k'=k+1} goto loc_010100101;
when hOGA=dpOGA0 do {hOGA'=0, k'=k+1} goto loc_010100011;
when hCMYC=dnCMYC1 do {hCMYC'=0, k'=k+1} goto loc_010100000;

-- for the configuration 0,1,0,1,0,0,0,1,0
loc loc_010100010: while hP21 >=  dnP211 & hPI3K >=  dnPI3K1 & hP53 <=  dpP530  wait {dhNFKB=0,dhP21=1,dhFOXM=1,dhPI3K=1,dhP53=1,dhMDM2=1,dhOGT=0,dhOGA=0,dhCMYC=0}
when hP21=dnP211 do {hP21'=0, k'=k+1} goto loc_000100010;
--when hFOXM=dpFOXM0 do {hFOXM'=0, k'=k+1} goto loc_011100010;
when hPI3K=dnPI3K1 do {hPI3K'=0, k'=k+1} goto loc_010000010;
when hP53=dpP530 do {hP53'=0, k'=k+1} goto loc_010110010;
--when hMDM2=dpMDM20 do {hMDM2'=0, k'=k+1} goto loc_010101010;

-- for the configuration 0,1,0,1,0,0,0,1,1
loc loc_010100011: while hP21 >=  dnP211 & hPI3K >=  dnPI3K1 & hP53 <=  dpP530 & hOGT <=  dpOGT0 & hCMYC >=  dnCMYC1  wait {dhNFKB=0,dhP21=1,dhFOXM=1,dhPI3K=1,dhP53=1,dhMDM2=1,dhOGT=1,dhOGA=-1,dhCMYC=1}
when hP21=dnP211 do {hP21'=0, k'=k+1} goto loc_000100011;
--when hFOXM=dpFOXM0 do {hFOXM'=0, k'=k+1} goto loc_011100011;
when hPI3K=dnPI3K1 do {hPI3K'=0, k'=k+1} goto loc_010000011;
when hP53=dpP530 do {hP53'=0, k'=k+1} goto loc_010110011;
--when hMDM2=dpMDM20 do {hMDM2'=0, k'=k+1} goto loc_010101011;
when hOGT=dpOGT0 do {hOGT'=0, k'=k+1} goto loc_010100111;
--when hOGA=dnOGA1 do {hOGA'=0, k'=k+1} goto loc_010100001;
when hCMYC=dnCMYC1 do {hCMYC'=0, k'=k+1} goto loc_010100010;

-- for the configuration 0,1,0,1,0,0,1,0,0
loc loc_010100100: while hP21 >=  dnP211 & hP53 <=  dpP530 & hOGT >=  dnOGT1  wait {dhNFKB=0,dhP21=1,dhFOXM=1,dhPI3K=-1,dhP53=1,dhMDM2=1,dhOGT=1,dhOGA=1,dhCMYC=1}
when hP21=dnP211 do {hP21'=0, k'=k+1} goto loc_000100100;
--when hFOXM=dpFOXM0 do {hFOXM'=0, k'=k+1} goto loc_011100100;
--when hPI3K=dnPI3K1 do {hPI3K'=0, k'=k+1} goto loc_010000100;
when hP53=dpP530 do {hP53'=0, k'=k+1} goto loc_010110100;
--when hMDM2=dpMDM20 do {hMDM2'=0, k'=k+1} goto loc_010101100;
when hOGT=dnOGT1 do {hOGT'=0, k'=k+1} goto loc_010100000;
--when hOGA=dpOGA0 do {hOGA'=0, k'=k+1} goto loc_010100110;
--when hCMYC=dpCMYC0 do {hCMYC'=0, k'=k+1} goto loc_010100101;

-- for the configuration 0,1,0,1,0,0,1,0,1
loc loc_010100101: while hP21 >=  dnP211 & hP53 <=  dpP530  wait {dhNFKB=0,dhP21=1,dhFOXM=1,dhPI3K=0,dhP53=1,dhMDM2=1,dhOGT=0,dhOGA=0,dhCMYC=0}
when hP21=dnP211 do {hP21'=0, k'=k+1} goto loc_000100101;
--when hFOXM=dpFOXM0 do {hFOXM'=0, k'=k+1} goto loc_011100101;
when hP53=dpP530 do {hP53'=0, k'=k+1} goto loc_010110101;
--when hMDM2=dpMDM20 do {hMDM2'=0, k'=k+1} goto loc_010101101;

-- for the configuration 0,1,0,1,0,0,1,1,0
loc loc_010100110: while hP21 >=  dnP211 & hP53 <=  dpP530 & hOGT >=  dnOGT1 & hOGA >=  dnOGA1  wait {dhNFKB=0,dhP21=1,dhFOXM=1,dhPI3K=-1,dhP53=1,dhMDM2=1,dhOGT=1,dhOGA=1,dhCMYC=1}
when hP21=dnP211 do {hP21'=0, k'=k+1} goto loc_000100110;
--when hFOXM=dpFOXM0 do {hFOXM'=0, k'=k+1} goto loc_011100110;
--when hPI3K=dnPI3K1 do {hPI3K'=0, k'=k+1} goto loc_010000110;
when hP53=dpP530 do {hP53'=0, k'=k+1} goto loc_010110110;
--when hMDM2=dpMDM20 do {hMDM2'=0, k'=k+1} goto loc_010101110;
when hOGT=dnOGT1 do {hOGT'=0, k'=k+1} goto loc_010100010;
when hOGA=dnOGA1 do {hOGA'=0, k'=k+1} goto loc_010100100;
--when hCMYC=dpCMYC0 do {hCMYC'=0, k'=k+1} goto loc_010100111;

-- for the configuration 0,1,0,1,0,0,1,1,1
loc loc_010100111: while hP21 >=  dnP211 & hP53 <=  dpP530 & hOGA >=  dnOGA1  wait {dhNFKB=0,dhP21=1,dhFOXM=1,dhPI3K=0,dhP53=1,dhMDM2=1,dhOGT=0,dhOGA=1,dhCMYC=0}
when hP21=dnP211 do {hP21'=0, k'=k+1} goto loc_000100111;
--when hFOXM=dpFOXM0 do {hFOXM'=0, k'=k+1} goto loc_011100111;
when hP53=dpP530 do {hP53'=0, k'=k+1} goto loc_010110111;
--when hMDM2=dpMDM20 do {hMDM2'=0, k'=k+1} goto loc_010101111;
when hOGA=dnOGA1 do {hOGA'=0, k'=k+1} goto loc_010100101;

-- for the configuration 0,1,0,1,0,1,0,0,0
loc loc_010101000: while hP21 >=  dnP211 & hPI3K >=  dnPI3K1 & hMDM2 >=  dnMDM21 & hOGA <=  dpOGA0  wait {dhNFKB=0,dhP21=1,dhFOXM=0,dhPI3K=1,dhP53=1,dhMDM2=1,dhOGT=0,dhOGA=1,dhCMYC=0}
when hP21=dnP211 do {hP21'=0, k'=k+1} goto loc_000101000;
when hPI3K=dnPI3K1 do {hPI3K'=0, k'=k+1} goto loc_010001000;
--when hP53=dpP530 do {hP53'=0, k'=k+1} goto loc_010111000;
when hMDM2=dnMDM21 do {hMDM2'=0, k'=k+1} goto loc_010100000;
when hOGA=dpOGA0 do {hOGA'=0, k'=k+1} goto loc_010101010;

-- for the configuration 0,1,0,1,0,1,0,0,1
loc loc_010101001: while hP21 >=  dnP211 & hPI3K >=  dnPI3K1 & hMDM2 >=  dnMDM21 & hOGT <=  dpOGT0 & hOGA <=  dpOGA0 & hCMYC >=  dnCMYC1  wait {dhNFKB=0,dhP21=1,dhFOXM=0,dhPI3K=1,dhP53=1,dhMDM2=1,dhOGT=1,dhOGA=1,dhCMYC=1}
when hP21=dnP211 do {hP21'=0, k'=k+1} goto loc_000101001;
when hPI3K=dnPI3K1 do {hPI3K'=0, k'=k+1} goto loc_010001001;
--when hP53=dpP530 do {hP53'=0, k'=k+1} goto loc_010111001;
when hMDM2=dnMDM21 do {hMDM2'=0, k'=k+1} goto loc_010100001;
when hOGT=dpOGT0 do {hOGT'=0, k'=k+1} goto loc_010101101;
when hOGA=dpOGA0 do {hOGA'=0, k'=k+1} goto loc_010101011;
when hCMYC=dnCMYC1 do {hCMYC'=0, k'=k+1} goto loc_010101000;

-- for the configuration 0,1,0,1,0,1,0,1,0
loc loc_010101010: while hP21 >=  dnP211 & hPI3K >=  dnPI3K1 & hMDM2 >=  dnMDM21  wait {dhNFKB=0,dhP21=1,dhFOXM=0,dhPI3K=1,dhP53=1,dhMDM2=1,dhOGT=0,dhOGA=0,dhCMYC=0}
when hP21=dnP211 do {hP21'=0, k'=k+1} goto loc_000101010;
when hPI3K=dnPI3K1 do {hPI3K'=0, k'=k+1} goto loc_010001010;
--when hP53=dpP530 do {hP53'=0, k'=k+1} goto loc_010111010;
when hMDM2=dnMDM21 do {hMDM2'=0, k'=k+1} goto loc_010100010;

-- for the configuration 0,1,0,1,0,1,0,1,1
loc loc_010101011: while hP21 >=  dnP211 & hPI3K >=  dnPI3K1 & hMDM2 >=  dnMDM21 & hOGT <=  dpOGT0 & hCMYC >=  dnCMYC1  wait {dhNFKB=0,dhP21=1,dhFOXM=0,dhPI3K=1,dhP53=1,dhMDM2=1,dhOGT=1,dhOGA=-1,dhCMYC=1}
when hP21=dnP211 do {hP21'=0, k'=k+1} goto loc_000101011;
when hPI3K=dnPI3K1 do {hPI3K'=0, k'=k+1} goto loc_010001011;
--when hP53=dpP530 do {hP53'=0, k'=k+1} goto loc_010111011;
when hMDM2=dnMDM21 do {hMDM2'=0, k'=k+1} goto loc_010100011;
when hOGT=dpOGT0 do {hOGT'=0, k'=k+1} goto loc_010101111;
--when hOGA=dnOGA1 do {hOGA'=0, k'=k+1} goto loc_010101001;
when hCMYC=dnCMYC1 do {hCMYC'=0, k'=k+1} goto loc_010101010;

-- for the configuration 0,1,0,1,0,1,1,0,0
loc loc_010101100: while hP21 >=  dnP211 & hMDM2 >=  dnMDM21 & hOGT >=  dnOGT1  wait {dhNFKB=0,dhP21=1,dhFOXM=0,dhPI3K=-1,dhP53=1,dhMDM2=1,dhOGT=1,dhOGA=1,dhCMYC=0}
when hP21=dnP211 do {hP21'=0, k'=k+1} goto loc_000101100;
--when hPI3K=dnPI3K1 do {hPI3K'=0, k'=k+1} goto loc_010001100;
--when hP53=dpP530 do {hP53'=0, k'=k+1} goto loc_010111100;
when hMDM2=dnMDM21 do {hMDM2'=0, k'=k+1} goto loc_010100100;
when hOGT=dnOGT1 do {hOGT'=0, k'=k+1} goto loc_010101000;
--when hOGA=dpOGA0 do {hOGA'=0, k'=k+1} goto loc_010101110;

-- for the configuration 0,1,0,1,0,1,1,0,1
loc loc_010101101: while hP21 >=  dnP211 & hMDM2 >=  dnMDM21  wait {dhNFKB=0,dhP21=1,dhFOXM=0,dhPI3K=0,dhP53=1,dhMDM2=1,dhOGT=0,dhOGA=0,dhCMYC=0}
when hP21=dnP211 do {hP21'=0, k'=k+1} goto loc_000101101;
--when hP53=dpP530 do {hP53'=0, k'=k+1} goto loc_010111101;
when hMDM2=dnMDM21 do {hMDM2'=0, k'=k+1} goto loc_010100101;

-- for the configuration 0,1,0,1,0,1,1,1,0
loc loc_010101110: while hP21 >=  dnP211 & hMDM2 >=  dnMDM21 & hOGT >=  dnOGT1 & hOGA >=  dnOGA1  wait {dhNFKB=0,dhP21=1,dhFOXM=0,dhPI3K=-1,dhP53=1,dhMDM2=1,dhOGT=1,dhOGA=1,dhCMYC=0}
when hP21=dnP211 do {hP21'=0, k'=k+1} goto loc_000101110;
--when hPI3K=dnPI3K1 do {hPI3K'=0, k'=k+1} goto loc_010001110;
--when hP53=dpP530 do {hP53'=0, k'=k+1} goto loc_010111110;
when hMDM2=dnMDM21 do {hMDM2'=0, k'=k+1} goto loc_010100110;
when hOGT=dnOGT1 do {hOGT'=0, k'=k+1} goto loc_010101010;
when hOGA=dnOGA1 do {hOGA'=0, k'=k+1} goto loc_010101100;

-- for the configuration 0,1,0,1,0,1,1,1,1
loc loc_010101111: while hP21 >=  dnP211 & hMDM2 >=  dnMDM21 & hOGA >=  dnOGA1  wait {dhNFKB=0,dhP21=1,dhFOXM=0,dhPI3K=0,dhP53=1,dhMDM2=1,dhOGT=0,dhOGA=1,dhCMYC=0}
when hP21=dnP211 do {hP21'=0, k'=k+1} goto loc_000101111;
--when hP53=dpP530 do {hP53'=0, k'=k+1} goto loc_010111111;
when hMDM2=dnMDM21 do {hMDM2'=0, k'=k+1} goto loc_010100111;
when hOGA=dnOGA1 do {hOGA'=0, k'=k+1} goto loc_010101101;

-- for the configuration 0,1,0,1,1,0,0,0,0
loc loc_010110000: while hFOXM <=  dpFOXM0 & hPI3K >=  dnPI3K1 & hMDM2 <=  dpMDM20 & hOGA <=  dpOGA0  wait {dhNFKB=0,dhP21=-1,dhFOXM=1,dhPI3K=1,dhP53=-1,dhMDM2=1,dhOGT=0,dhOGA=1,dhCMYC=0}
--when hP21=dnP211 do {hP21'=0, k'=k+1} goto loc_000110000;
when hFOXM=dpFOXM0 do {hFOXM'=0, k'=k+1} goto loc_011110000;
when hPI3K=dnPI3K1 do {hPI3K'=0, k'=k+1} goto loc_010010000;
--when hP53=dnP531 do {hP53'=0, k'=k+1} goto loc_010100000;
when hMDM2=dpMDM20 do {hMDM2'=0, k'=k+1} goto loc_010111000;
when hOGA=dpOGA0 do {hOGA'=0, k'=k+1} goto loc_010110010;

-- for the configuration 0,1,0,1,1,0,0,0,1
loc loc_010110001: while hFOXM <=  dpFOXM0 & hPI3K >=  dnPI3K1 & hMDM2 <=  dpMDM20 & hOGT <=  dpOGT0 & hOGA <=  dpOGA0 & hCMYC >=  dnCMYC1  wait {dhNFKB=0,dhP21=-1,dhFOXM=1,dhPI3K=1,dhP53=-1,dhMDM2=1,dhOGT=1,dhOGA=1,dhCMYC=1}
--when hP21=dnP211 do {hP21'=0, k'=k+1} goto loc_000110001;
when hFOXM=dpFOXM0 do {hFOXM'=0, k'=k+1} goto loc_011110001;
when hPI3K=dnPI3K1 do {hPI3K'=0, k'=k+1} goto loc_010010001;
--when hP53=dnP531 do {hP53'=0, k'=k+1} goto loc_010100001;
when hMDM2=dpMDM20 do {hMDM2'=0, k'=k+1} goto loc_010111001;
when hOGT=dpOGT0 do {hOGT'=0, k'=k+1} goto loc_010110101;
when hOGA=dpOGA0 do {hOGA'=0, k'=k+1} goto loc_010110011;
when hCMYC=dnCMYC1 do {hCMYC'=0, k'=k+1} goto loc_010110000;

-- for the configuration 0,1,0,1,1,0,0,1,0
loc loc_010110010: while hFOXM <=  dpFOXM0 & hPI3K >=  dnPI3K1 & hMDM2 <=  dpMDM20  wait {dhNFKB=0,dhP21=-1,dhFOXM=1,dhPI3K=1,dhP53=-1,dhMDM2=1,dhOGT=0,dhOGA=0,dhCMYC=0}
--when hP21=dnP211 do {hP21'=0, k'=k+1} goto loc_000110010;
when hFOXM=dpFOXM0 do {hFOXM'=0, k'=k+1} goto loc_011110010;
when hPI3K=dnPI3K1 do {hPI3K'=0, k'=k+1} goto loc_010010010;
--when hP53=dnP531 do {hP53'=0, k'=k+1} goto loc_010100010;
when hMDM2=dpMDM20 do {hMDM2'=0, k'=k+1} goto loc_010111010;

-- for the configuration 0,1,0,1,1,0,0,1,1
loc loc_010110011: while hFOXM <=  dpFOXM0 & hPI3K >=  dnPI3K1 & hMDM2 <=  dpMDM20 & hOGT <=  dpOGT0 & hCMYC >=  dnCMYC1  wait {dhNFKB=0,dhP21=-1,dhFOXM=1,dhPI3K=1,dhP53=-1,dhMDM2=1,dhOGT=1,dhOGA=-1,dhCMYC=1}
--when hP21=dnP211 do {hP21'=0, k'=k+1} goto loc_000110011;
when hFOXM=dpFOXM0 do {hFOXM'=0, k'=k+1} goto loc_011110011;
when hPI3K=dnPI3K1 do {hPI3K'=0, k'=k+1} goto loc_010010011;
--when hP53=dnP531 do {hP53'=0, k'=k+1} goto loc_010100011;
when hMDM2=dpMDM20 do {hMDM2'=0, k'=k+1} goto loc_010111011;
when hOGT=dpOGT0 do {hOGT'=0, k'=k+1} goto loc_010110111;
--when hOGA=dnOGA1 do {hOGA'=0, k'=k+1} goto loc_010110001;
when hCMYC=dnCMYC1 do {hCMYC'=0, k'=k+1} goto loc_010110010;

-- for the configuration 0,1,0,1,1,0,1,0,0
loc loc_010110100: while hFOXM <=  dpFOXM0 & hMDM2 <=  dpMDM20 & hOGT >=  dnOGT1 & hCMYC <=  dpCMYC0  wait {dhNFKB=0,dhP21=-1,dhFOXM=1,dhPI3K=-1,dhP53=-1,dhMDM2=1,dhOGT=1,dhOGA=1,dhCMYC=1}
--when hP21=dnP211 do {hP21'=0, k'=k+1} goto loc_000110100;
when hFOXM=dpFOXM0 do {hFOXM'=0, k'=k+1} goto loc_011110100;
--when hPI3K=dnPI3K1 do {hPI3K'=0, k'=k+1} goto loc_010010100;
--when hP53=dnP531 do {hP53'=0, k'=k+1} goto loc_010100100;
when hMDM2=dpMDM20 do {hMDM2'=0, k'=k+1} goto loc_010111100;
when hOGT=dnOGT1 do {hOGT'=0, k'=k+1} goto loc_010110000;
--when hOGA=dpOGA0 do {hOGA'=0, k'=k+1} goto loc_010110110;
when hCMYC=dpCMYC0 do {hCMYC'=0, k'=k+1} goto loc_010110101;

-- for the configuration 0,1,0,1,1,0,1,0,1
loc loc_010110101: while hFOXM <=  dpFOXM0 & hMDM2 <=  dpMDM20  wait {dhNFKB=0,dhP21=-1,dhFOXM=1,dhPI3K=0,dhP53=-1,dhMDM2=1,dhOGT=0,dhOGA=0,dhCMYC=0}
--when hP21=dnP211 do {hP21'=0, k'=k+1} goto loc_000110101;
when hFOXM=dpFOXM0 do {hFOXM'=0, k'=k+1} goto loc_011110101;
--when hP53=dnP531 do {hP53'=0, k'=k+1} goto loc_010100101;
when hMDM2=dpMDM20 do {hMDM2'=0, k'=k+1} goto loc_010111101;

-- for the configuration 0,1,0,1,1,0,1,1,0
loc loc_010110110: while hFOXM <=  dpFOXM0 & hMDM2 <=  dpMDM20 & hOGT >=  dnOGT1 & hOGA >=  dnOGA1 & hCMYC <=  dpCMYC0  wait {dhNFKB=0,dhP21=-1,dhFOXM=1,dhPI3K=-1,dhP53=-1,dhMDM2=1,dhOGT=1,dhOGA=1,dhCMYC=1}
--when hP21=dnP211 do {hP21'=0, k'=k+1} goto loc_000110110;
when hFOXM=dpFOXM0 do {hFOXM'=0, k'=k+1} goto loc_011110110;
--when hPI3K=dnPI3K1 do {hPI3K'=0, k'=k+1} goto loc_010010110;
--when hP53=dnP531 do {hP53'=0, k'=k+1} goto loc_010100110;
when hMDM2=dpMDM20 do {hMDM2'=0, k'=k+1} goto loc_010111110;
when hOGT=dnOGT1 do {hOGT'=0, k'=k+1} goto loc_010110010;
when hOGA=dnOGA1 do {hOGA'=0, k'=k+1} goto loc_010110100;
when hCMYC=dpCMYC0 do {hCMYC'=0, k'=k+1} goto loc_010110111;

-- for the configuration 0,1,0,1,1,0,1,1,1
loc loc_010110111: while hFOXM <=  dpFOXM0 & hMDM2 <=  dpMDM20 & hOGA >=  dnOGA1  wait {dhNFKB=0,dhP21=-1,dhFOXM=1,dhPI3K=0,dhP53=-1,dhMDM2=1,dhOGT=0,dhOGA=1,dhCMYC=0}
--when hP21=dnP211 do {hP21'=0, k'=k+1} goto loc_000110111;
when hFOXM=dpFOXM0 do {hFOXM'=0, k'=k+1} goto loc_011110111;
--when hP53=dnP531 do {hP53'=0, k'=k+1} goto loc_010100111;
when hMDM2=dpMDM20 do {hMDM2'=0, k'=k+1} goto loc_010111111;
when hOGA=dnOGA1 do {hOGA'=0, k'=k+1} goto loc_010110101;

-- for the configuration 0,1,0,1,1,1,0,0,0
loc loc_010111000: while hFOXM <=  dpFOXM0 & hPI3K >=  dnPI3K1 & hP53 >=  dnP531 & hOGA <=  dpOGA0  wait {dhNFKB=0,dhP21=-1,dhFOXM=1,dhPI3K=1,dhP53=1,dhMDM2=-1,dhOGT=0,dhOGA=1,dhCMYC=0}
--when hP21=dnP211 do {hP21'=0, k'=k+1} goto loc_000111000;
when hFOXM=dpFOXM0 do {hFOXM'=0, k'=k+1} goto loc_011111000;
when hPI3K=dnPI3K1 do {hPI3K'=0, k'=k+1} goto loc_010011000;
when hP53=dnP531 do {hP53'=0, k'=k+1} goto loc_010101000;
--when hMDM2=dnMDM21 do {hMDM2'=0, k'=k+1} goto loc_010110000;
when hOGA=dpOGA0 do {hOGA'=0, k'=k+1} goto loc_010111010;

-- for the configuration 0,1,0,1,1,1,0,0,1
loc loc_010111001: while hFOXM <=  dpFOXM0 & hPI3K >=  dnPI3K1 & hP53 >=  dnP531 & hOGT <=  dpOGT0 & hOGA <=  dpOGA0 & hCMYC >=  dnCMYC1  wait {dhNFKB=0,dhP21=-1,dhFOXM=1,dhPI3K=1,dhP53=1,dhMDM2=-1,dhOGT=1,dhOGA=1,dhCMYC=1}
--when hP21=dnP211 do {hP21'=0, k'=k+1} goto loc_000111001;
when hFOXM=dpFOXM0 do {hFOXM'=0, k'=k+1} goto loc_011111001;
when hPI3K=dnPI3K1 do {hPI3K'=0, k'=k+1} goto loc_010011001;
when hP53=dnP531 do {hP53'=0, k'=k+1} goto loc_010101001;
--when hMDM2=dnMDM21 do {hMDM2'=0, k'=k+1} goto loc_010110001;
when hOGT=dpOGT0 do {hOGT'=0, k'=k+1} goto loc_010111101;
when hOGA=dpOGA0 do {hOGA'=0, k'=k+1} goto loc_010111011;
when hCMYC=dnCMYC1 do {hCMYC'=0, k'=k+1} goto loc_010111000;

-- for the configuration 0,1,0,1,1,1,0,1,0
loc loc_010111010: while hFOXM <=  dpFOXM0 & hPI3K >=  dnPI3K1 & hP53 >=  dnP531  wait {dhNFKB=0,dhP21=-1,dhFOXM=1,dhPI3K=1,dhP53=1,dhMDM2=-1,dhOGT=0,dhOGA=0,dhCMYC=0}
--when hP21=dnP211 do {hP21'=0, k'=k+1} goto loc_000111010;
when hFOXM=dpFOXM0 do {hFOXM'=0, k'=k+1} goto loc_011111010;
when hPI3K=dnPI3K1 do {hPI3K'=0, k'=k+1} goto loc_010011010;
when hP53=dnP531 do {hP53'=0, k'=k+1} goto loc_010101010;
--when hMDM2=dnMDM21 do {hMDM2'=0, k'=k+1} goto loc_010110010;

-- for the configuration 0,1,0,1,1,1,0,1,1
loc loc_010111011: while hFOXM <=  dpFOXM0 & hPI3K >=  dnPI3K1 & hP53 >=  dnP531 & hOGT <=  dpOGT0 & hCMYC >=  dnCMYC1  wait {dhNFKB=0,dhP21=-1,dhFOXM=1,dhPI3K=1,dhP53=1,dhMDM2=-1,dhOGT=1,dhOGA=-1,dhCMYC=1}
--when hP21=dnP211 do {hP21'=0, k'=k+1} goto loc_000111011;
when hFOXM=dpFOXM0 do {hFOXM'=0, k'=k+1} goto loc_011111011;
when hPI3K=dnPI3K1 do {hPI3K'=0, k'=k+1} goto loc_010011011;
when hP53=dnP531 do {hP53'=0, k'=k+1} goto loc_010101011;
--when hMDM2=dnMDM21 do {hMDM2'=0, k'=k+1} goto loc_010110011;
when hOGT=dpOGT0 do {hOGT'=0, k'=k+1} goto loc_010111111;
--when hOGA=dnOGA1 do {hOGA'=0, k'=k+1} goto loc_010111001;
when hCMYC=dnCMYC1 do {hCMYC'=0, k'=k+1} goto loc_010111010;

-- for the configuration 0,1,0,1,1,1,1,0,0
loc loc_010111100: while hFOXM <=  dpFOXM0 & hP53 >=  dnP531 & hOGT >=  dnOGT1 & hCMYC <=  dpCMYC0  wait {dhNFKB=0,dhP21=-1,dhFOXM=1,dhPI3K=-1,dhP53=1,dhMDM2=-1,dhOGT=1,dhOGA=1,dhCMYC=1}
--when hP21=dnP211 do {hP21'=0, k'=k+1} goto loc_000111100;
when hFOXM=dpFOXM0 do {hFOXM'=0, k'=k+1} goto loc_011111100;
--when hPI3K=dnPI3K1 do {hPI3K'=0, k'=k+1} goto loc_010011100;
when hP53=dnP531 do {hP53'=0, k'=k+1} goto loc_010101100;
--when hMDM2=dnMDM21 do {hMDM2'=0, k'=k+1} goto loc_010110100;
when hOGT=dnOGT1 do {hOGT'=0, k'=k+1} goto loc_010111000;
--when hOGA=dpOGA0 do {hOGA'=0, k'=k+1} goto loc_010111110;
when hCMYC=dpCMYC0 do {hCMYC'=0, k'=k+1} goto loc_010111101;

-- for the configuration 0,1,0,1,1,1,1,0,1
loc loc_010111101: while hFOXM <=  dpFOXM0 & hP53 >=  dnP531  wait {dhNFKB=0,dhP21=-1,dhFOXM=1,dhPI3K=0,dhP53=1,dhMDM2=-1,dhOGT=0,dhOGA=0,dhCMYC=0}
--when hP21=dnP211 do {hP21'=0, k'=k+1} goto loc_000111101;
when hFOXM=dpFOXM0 do {hFOXM'=0, k'=k+1} goto loc_011111101;
when hP53=dnP531 do {hP53'=0, k'=k+1} goto loc_010101101;
--when hMDM2=dnMDM21 do {hMDM2'=0, k'=k+1} goto loc_010110101;

-- for the configuration 0,1,0,1,1,1,1,1,0
loc loc_010111110: while hFOXM <=  dpFOXM0 & hP53 >=  dnP531 & hOGT >=  dnOGT1 & hOGA >=  dnOGA1 & hCMYC <=  dpCMYC0  wait {dhNFKB=0,dhP21=-1,dhFOXM=1,dhPI3K=-1,dhP53=1,dhMDM2=-1,dhOGT=1,dhOGA=1,dhCMYC=1}
--when hP21=dnP211 do {hP21'=0, k'=k+1} goto loc_000111110;
when hFOXM=dpFOXM0 do {hFOXM'=0, k'=k+1} goto loc_011111110;
--when hPI3K=dnPI3K1 do {hPI3K'=0, k'=k+1} goto loc_010011110;
when hP53=dnP531 do {hP53'=0, k'=k+1} goto loc_010101110;
--when hMDM2=dnMDM21 do {hMDM2'=0, k'=k+1} goto loc_010110110;
when hOGT=dnOGT1 do {hOGT'=0, k'=k+1} goto loc_010111010;
when hOGA=dnOGA1 do {hOGA'=0, k'=k+1} goto loc_010111100;
when hCMYC=dpCMYC0 do {hCMYC'=0, k'=k+1} goto loc_010111111;

-- for the configuration 0,1,0,1,1,1,1,1,1
loc loc_010111111: while hFOXM <=  dpFOXM0 & hP53 >=  dnP531 & hOGA >=  dnOGA1  wait {dhNFKB=0,dhP21=-1,dhFOXM=1,dhPI3K=0,dhP53=1,dhMDM2=-1,dhOGT=0,dhOGA=1,dhCMYC=0}
--when hP21=dnP211 do {hP21'=0, k'=k+1} goto loc_000111111;
when hFOXM=dpFOXM0 do {hFOXM'=0, k'=k+1} goto loc_011111111;
when hP53=dnP531 do {hP53'=0, k'=k+1} goto loc_010101111;
--when hMDM2=dnMDM21 do {hMDM2'=0, k'=k+1} goto loc_010110111;
when hOGA=dnOGA1 do {hOGA'=0, k'=k+1} goto loc_010111101;

-- for the configuration 0,1,1,0,0,0,0,0,0
loc loc_011000000: while hP21 >=  dnP211 & hFOXM >=  dnFOXM1 & hP53 <=  dpP530 & hOGA <=  dpOGA0  wait {dhNFKB=0,dhP21=1,dhFOXM=1,dhPI3K=0,dhP53=1,dhMDM2=1,dhOGT=0,dhOGA=1,dhCMYC=0}
when hP21=dnP211 do {hP21'=0, k'=k+1} goto loc_001000000;
when hFOXM=dnFOXM1 do {hFOXM'=0, k'=k+1} goto loc_010000000;
when hP53=dpP530 do {hP53'=0, k'=k+1} goto loc_011010000;
--when hMDM2=dpMDM20 do {hMDM2'=0, k'=k+1} goto loc_011001000;
when hOGA=dpOGA0 do {hOGA'=0, k'=k+1} goto loc_011000010;

-- for the configuration 0,1,1,0,0,0,0,0,1
loc loc_011000001: while hP21 >=  dnP211 & hFOXM >=  dnFOXM1 & hP53 <=  dpP530 & hOGT <=  dpOGT0 & hOGA <=  dpOGA0 & hCMYC >=  dnCMYC1  wait {dhNFKB=0,dhP21=1,dhFOXM=1,dhPI3K=0,dhP53=1,dhMDM2=1,dhOGT=1,dhOGA=1,dhCMYC=1}
when hP21=dnP211 do {hP21'=0, k'=k+1} goto loc_001000001;
when hFOXM=dnFOXM1 do {hFOXM'=0, k'=k+1} goto loc_010000001;
when hP53=dpP530 do {hP53'=0, k'=k+1} goto loc_011010001;
--when hMDM2=dpMDM20 do {hMDM2'=0, k'=k+1} goto loc_011001001;
when hOGT=dpOGT0 do {hOGT'=0, k'=k+1} goto loc_011000101;
when hOGA=dpOGA0 do {hOGA'=0, k'=k+1} goto loc_011000011;
when hCMYC=dnCMYC1 do {hCMYC'=0, k'=k+1} goto loc_011000000;

-- for the configuration 0,1,1,0,0,0,0,1,0
loc loc_011000010: while hP21 >=  dnP211 & hFOXM >=  dnFOXM1 & hP53 <=  dpP530  wait {dhNFKB=0,dhP21=1,dhFOXM=1,dhPI3K=0,dhP53=1,dhMDM2=1,dhOGT=0,dhOGA=0,dhCMYC=0}
when hP21=dnP211 do {hP21'=0, k'=k+1} goto loc_001000010;
when hFOXM=dnFOXM1 do {hFOXM'=0, k'=k+1} goto loc_010000010;
when hP53=dpP530 do {hP53'=0, k'=k+1} goto loc_011010010;
--when hMDM2=dpMDM20 do {hMDM2'=0, k'=k+1} goto loc_011001010;

-- for the configuration 0,1,1,0,0,0,0,1,1
loc loc_011000011: while hP21 >=  dnP211 & hFOXM >=  dnFOXM1 & hP53 <=  dpP530 & hOGT <=  dpOGT0 & hCMYC >=  dnCMYC1  wait {dhNFKB=0,dhP21=1,dhFOXM=1,dhPI3K=0,dhP53=1,dhMDM2=1,dhOGT=1,dhOGA=-1,dhCMYC=1}
when hP21=dnP211 do {hP21'=0, k'=k+1} goto loc_001000011;
when hFOXM=dnFOXM1 do {hFOXM'=0, k'=k+1} goto loc_010000011;
when hP53=dpP530 do {hP53'=0, k'=k+1} goto loc_011010011;
--when hMDM2=dpMDM20 do {hMDM2'=0, k'=k+1} goto loc_011001011;
when hOGT=dpOGT0 do {hOGT'=0, k'=k+1} goto loc_011000111;
--when hOGA=dnOGA1 do {hOGA'=0, k'=k+1} goto loc_011000001;
when hCMYC=dnCMYC1 do {hCMYC'=0, k'=k+1} goto loc_011000010;

-- for the configuration 0,1,1,0,0,0,1,0,0
loc loc_011000100: while hP21 >=  dnP211 & hFOXM >=  dnFOXM1 & hP53 <=  dpP530 & hOGT >=  dnOGT1  wait {dhNFKB=0,dhP21=1,dhFOXM=1,dhPI3K=1,dhP53=1,dhMDM2=1,dhOGT=1,dhOGA=1,dhCMYC=1}
when hP21=dnP211 do {hP21'=0, k'=k+1} goto loc_001000100;
when hFOXM=dnFOXM1 do {hFOXM'=0, k'=k+1} goto loc_010000100;
--when hPI3K=dpPI3K0 do {hPI3K'=0, k'=k+1} goto loc_011100100;
when hP53=dpP530 do {hP53'=0, k'=k+1} goto loc_011010100;
--when hMDM2=dpMDM20 do {hMDM2'=0, k'=k+1} goto loc_011001100;
when hOGT=dnOGT1 do {hOGT'=0, k'=k+1} goto loc_011000000;
--when hOGA=dpOGA0 do {hOGA'=0, k'=k+1} goto loc_011000110;
--when hCMYC=dpCMYC0 do {hCMYC'=0, k'=k+1} goto loc_011000101;

-- for the configuration 0,1,1,0,0,0,1,0,1
loc loc_011000101: while hP21 >=  dnP211 & hFOXM >=  dnFOXM1 & hP53 <=  dpP530  wait {dhNFKB=0,dhP21=1,dhFOXM=1,dhPI3K=1,dhP53=1,dhMDM2=1,dhOGT=0,dhOGA=0,dhCMYC=0}
when hP21=dnP211 do {hP21'=0, k'=k+1} goto loc_001000101;
when hFOXM=dnFOXM1 do {hFOXM'=0, k'=k+1} goto loc_010000101;
--when hPI3K=dpPI3K0 do {hPI3K'=0, k'=k+1} goto loc_011100101;
when hP53=dpP530 do {hP53'=0, k'=k+1} goto loc_011010101;
--when hMDM2=dpMDM20 do {hMDM2'=0, k'=k+1} goto loc_011001101;

-- for the configuration 0,1,1,0,0,0,1,1,0
loc loc_011000110: while hP21 >=  dnP211 & hFOXM >=  dnFOXM1 & hP53 <=  dpP530 & hOGT >=  dnOGT1 & hOGA >=  dnOGA1  wait {dhNFKB=0,dhP21=1,dhFOXM=1,dhPI3K=1,dhP53=1,dhMDM2=1,dhOGT=1,dhOGA=1,dhCMYC=1}
when hP21=dnP211 do {hP21'=0, k'=k+1} goto loc_001000110;
when hFOXM=dnFOXM1 do {hFOXM'=0, k'=k+1} goto loc_010000110;
--when hPI3K=dpPI3K0 do {hPI3K'=0, k'=k+1} goto loc_011100110;
when hP53=dpP530 do {hP53'=0, k'=k+1} goto loc_011010110;
--when hMDM2=dpMDM20 do {hMDM2'=0, k'=k+1} goto loc_011001110;
when hOGT=dnOGT1 do {hOGT'=0, k'=k+1} goto loc_011000010;
when hOGA=dnOGA1 do {hOGA'=0, k'=k+1} goto loc_011000100;
--when hCMYC=dpCMYC0 do {hCMYC'=0, k'=k+1} goto loc_011000111;

-- for the configuration 0,1,1,0,0,0,1,1,1
loc loc_011000111: while hP21 >=  dnP211 & hFOXM >=  dnFOXM1 & hP53 <=  dpP530 & hOGA >=  dnOGA1  wait {dhNFKB=0,dhP21=1,dhFOXM=1,dhPI3K=1,dhP53=1,dhMDM2=1,dhOGT=0,dhOGA=1,dhCMYC=0}
when hP21=dnP211 do {hP21'=0, k'=k+1} goto loc_001000111;
when hFOXM=dnFOXM1 do {hFOXM'=0, k'=k+1} goto loc_010000111;
--when hPI3K=dpPI3K0 do {hPI3K'=0, k'=k+1} goto loc_011100111;
when hP53=dpP530 do {hP53'=0, k'=k+1} goto loc_011010111;
--when hMDM2=dpMDM20 do {hMDM2'=0, k'=k+1} goto loc_011001111;
when hOGA=dnOGA1 do {hOGA'=0, k'=k+1} goto loc_011000101;

-- for the configuration 0,1,1,0,0,1,0,0,0
loc loc_011001000: while hP21 >=  dnP211 & hFOXM >=  dnFOXM1 & hMDM2 >=  dnMDM21 & hOGA <=  dpOGA0  wait {dhNFKB=0,dhP21=1,dhFOXM=1,dhPI3K=0,dhP53=1,dhMDM2=1,dhOGT=0,dhOGA=1,dhCMYC=0}
when hP21=dnP211 do {hP21'=0, k'=k+1} goto loc_001001000;
when hFOXM=dnFOXM1 do {hFOXM'=0, k'=k+1} goto loc_010001000;
--when hP53=dpP530 do {hP53'=0, k'=k+1} goto loc_011011000;
when hMDM2=dnMDM21 do {hMDM2'=0, k'=k+1} goto loc_011000000;
when hOGA=dpOGA0 do {hOGA'=0, k'=k+1} goto loc_011001010;

-- for the configuration 0,1,1,0,0,1,0,0,1
loc loc_011001001: while hP21 >=  dnP211 & hFOXM >=  dnFOXM1 & hMDM2 >=  dnMDM21 & hOGT <=  dpOGT0 & hOGA <=  dpOGA0 & hCMYC >=  dnCMYC1  wait {dhNFKB=0,dhP21=1,dhFOXM=1,dhPI3K=0,dhP53=1,dhMDM2=1,dhOGT=1,dhOGA=1,dhCMYC=1}
when hP21=dnP211 do {hP21'=0, k'=k+1} goto loc_001001001;
when hFOXM=dnFOXM1 do {hFOXM'=0, k'=k+1} goto loc_010001001;
--when hP53=dpP530 do {hP53'=0, k'=k+1} goto loc_011011001;
when hMDM2=dnMDM21 do {hMDM2'=0, k'=k+1} goto loc_011000001;
when hOGT=dpOGT0 do {hOGT'=0, k'=k+1} goto loc_011001101;
when hOGA=dpOGA0 do {hOGA'=0, k'=k+1} goto loc_011001011;
when hCMYC=dnCMYC1 do {hCMYC'=0, k'=k+1} goto loc_011001000;

-- for the configuration 0,1,1,0,0,1,0,1,0
loc loc_011001010: while hP21 >=  dnP211 & hFOXM >=  dnFOXM1 & hMDM2 >=  dnMDM21  wait {dhNFKB=0,dhP21=1,dhFOXM=1,dhPI3K=0,dhP53=1,dhMDM2=1,dhOGT=0,dhOGA=0,dhCMYC=0}
when hP21=dnP211 do {hP21'=0, k'=k+1} goto loc_001001010;
when hFOXM=dnFOXM1 do {hFOXM'=0, k'=k+1} goto loc_010001010;
--when hP53=dpP530 do {hP53'=0, k'=k+1} goto loc_011011010;
when hMDM2=dnMDM21 do {hMDM2'=0, k'=k+1} goto loc_011000010;

-- for the configuration 0,1,1,0,0,1,0,1,1
loc loc_011001011: while hP21 >=  dnP211 & hFOXM >=  dnFOXM1 & hMDM2 >=  dnMDM21 & hOGT <=  dpOGT0 & hCMYC >=  dnCMYC1  wait {dhNFKB=0,dhP21=1,dhFOXM=1,dhPI3K=0,dhP53=1,dhMDM2=1,dhOGT=1,dhOGA=-1,dhCMYC=1}
when hP21=dnP211 do {hP21'=0, k'=k+1} goto loc_001001011;
when hFOXM=dnFOXM1 do {hFOXM'=0, k'=k+1} goto loc_010001011;
--when hP53=dpP530 do {hP53'=0, k'=k+1} goto loc_011011011;
when hMDM2=dnMDM21 do {hMDM2'=0, k'=k+1} goto loc_011000011;
when hOGT=dpOGT0 do {hOGT'=0, k'=k+1} goto loc_011001111;
--when hOGA=dnOGA1 do {hOGA'=0, k'=k+1} goto loc_011001001;
when hCMYC=dnCMYC1 do {hCMYC'=0, k'=k+1} goto loc_011001010;

-- for the configuration 0,1,1,0,0,1,1,0,0
loc loc_011001100: while hP21 >=  dnP211 & hFOXM >=  dnFOXM1 & hMDM2 >=  dnMDM21 & hOGT >=  dnOGT1  wait {dhNFKB=0,dhP21=1,dhFOXM=1,dhPI3K=0,dhP53=1,dhMDM2=1,dhOGT=1,dhOGA=1,dhCMYC=0}
when hP21=dnP211 do {hP21'=0, k'=k+1} goto loc_001001100;
when hFOXM=dnFOXM1 do {hFOXM'=0, k'=k+1} goto loc_010001100;
--when hP53=dpP530 do {hP53'=0, k'=k+1} goto loc_011011100;
when hMDM2=dnMDM21 do {hMDM2'=0, k'=k+1} goto loc_011000100;
when hOGT=dnOGT1 do {hOGT'=0, k'=k+1} goto loc_011001000;
--when hOGA=dpOGA0 do {hOGA'=0, k'=k+1} goto loc_011001110;

-- for the configuration 0,1,1,0,0,1,1,0,1
loc loc_011001101: while hP21 >=  dnP211 & hFOXM >=  dnFOXM1 & hMDM2 >=  dnMDM21  wait {dhNFKB=0,dhP21=1,dhFOXM=1,dhPI3K=0,dhP53=1,dhMDM2=1,dhOGT=0,dhOGA=0,dhCMYC=0}
when hP21=dnP211 do {hP21'=0, k'=k+1} goto loc_001001101;
when hFOXM=dnFOXM1 do {hFOXM'=0, k'=k+1} goto loc_010001101;
--when hP53=dpP530 do {hP53'=0, k'=k+1} goto loc_011011101;
when hMDM2=dnMDM21 do {hMDM2'=0, k'=k+1} goto loc_011000101;

-- for the configuration 0,1,1,0,0,1,1,1,0
loc loc_011001110: while hP21 >=  dnP211 & hFOXM >=  dnFOXM1 & hMDM2 >=  dnMDM21 & hOGT >=  dnOGT1 & hOGA >=  dnOGA1  wait {dhNFKB=0,dhP21=1,dhFOXM=1,dhPI3K=0,dhP53=1,dhMDM2=1,dhOGT=1,dhOGA=1,dhCMYC=0}
when hP21=dnP211 do {hP21'=0, k'=k+1} goto loc_001001110;
when hFOXM=dnFOXM1 do {hFOXM'=0, k'=k+1} goto loc_010001110;
--when hP53=dpP530 do {hP53'=0, k'=k+1} goto loc_011011110;
when hMDM2=dnMDM21 do {hMDM2'=0, k'=k+1} goto loc_011000110;
when hOGT=dnOGT1 do {hOGT'=0, k'=k+1} goto loc_011001010;
when hOGA=dnOGA1 do {hOGA'=0, k'=k+1} goto loc_011001100;

-- for the configuration 0,1,1,0,0,1,1,1,1
loc loc_011001111: while hP21 >=  dnP211 & hFOXM >=  dnFOXM1 & hMDM2 >=  dnMDM21 & hOGA >=  dnOGA1  wait {dhNFKB=0,dhP21=1,dhFOXM=1,dhPI3K=0,dhP53=1,dhMDM2=1,dhOGT=0,dhOGA=1,dhCMYC=0}
when hP21=dnP211 do {hP21'=0, k'=k+1} goto loc_001001111;
when hFOXM=dnFOXM1 do {hFOXM'=0, k'=k+1} goto loc_010001111;
--when hP53=dpP530 do {hP53'=0, k'=k+1} goto loc_011011111;
when hMDM2=dnMDM21 do {hMDM2'=0, k'=k+1} goto loc_011000111;
when hOGA=dnOGA1 do {hOGA'=0, k'=k+1} goto loc_011001101;

-- for the configuration 0,1,1,0,1,0,0,0,0
loc loc_011010000: while hFOXM >=  dnFOXM1 & hMDM2 <=  dpMDM20 & hOGA <=  dpOGA0  wait {dhNFKB=0,dhP21=0,dhFOXM=1,dhPI3K=0,dhP53=-1,dhMDM2=1,dhOGT=0,dhOGA=1,dhCMYC=0}
when hFOXM=dnFOXM1 do {hFOXM'=0, k'=k+1} goto loc_010010000;
--when hP53=dnP531 do {hP53'=0, k'=k+1} goto loc_011000000;
when hMDM2=dpMDM20 do {hMDM2'=0, k'=k+1} goto loc_011011000;
when hOGA=dpOGA0 do {hOGA'=0, k'=k+1} goto loc_011010010;

-- for the configuration 0,1,1,0,1,0,0,0,1
loc loc_011010001: while hFOXM >=  dnFOXM1 & hMDM2 <=  dpMDM20 & hOGT <=  dpOGT0 & hOGA <=  dpOGA0 & hCMYC >=  dnCMYC1  wait {dhNFKB=0,dhP21=0,dhFOXM=1,dhPI3K=1,dhP53=-1,dhMDM2=1,dhOGT=1,dhOGA=1,dhCMYC=1}
when hFOXM=dnFOXM1 do {hFOXM'=0, k'=k+1} goto loc_010010001;
--when hPI3K=dpPI3K0 do {hPI3K'=0, k'=k+1} goto loc_011110001;
--when hP53=dnP531 do {hP53'=0, k'=k+1} goto loc_011000001;
when hMDM2=dpMDM20 do {hMDM2'=0, k'=k+1} goto loc_011011001;
when hOGT=dpOGT0 do {hOGT'=0, k'=k+1} goto loc_011010101;
when hOGA=dpOGA0 do {hOGA'=0, k'=k+1} goto loc_011010011;
when hCMYC=dnCMYC1 do {hCMYC'=0, k'=k+1} goto loc_011010000;

-- for the configuration 0,1,1,0,1,0,0,1,0
loc loc_011010010: while hFOXM >=  dnFOXM1 & hMDM2 <=  dpMDM20  wait {dhNFKB=0,dhP21=0,dhFOXM=1,dhPI3K=0,dhP53=-1,dhMDM2=1,dhOGT=0,dhOGA=0,dhCMYC=0}
when hFOXM=dnFOXM1 do {hFOXM'=0, k'=k+1} goto loc_010010010;
--when hP53=dnP531 do {hP53'=0, k'=k+1} goto loc_011000010;
when hMDM2=dpMDM20 do {hMDM2'=0, k'=k+1} goto loc_011011010;

-- for the configuration 0,1,1,0,1,0,0,1,1
loc loc_011010011: while hFOXM >=  dnFOXM1 & hMDM2 <=  dpMDM20 & hOGT <=  dpOGT0 & hCMYC >=  dnCMYC1  wait {dhNFKB=0,dhP21=0,dhFOXM=1,dhPI3K=1,dhP53=-1,dhMDM2=1,dhOGT=1,dhOGA=-1,dhCMYC=1}
when hFOXM=dnFOXM1 do {hFOXM'=0, k'=k+1} goto loc_010010011;
--when hPI3K=dpPI3K0 do {hPI3K'=0, k'=k+1} goto loc_011110011;
--when hP53=dnP531 do {hP53'=0, k'=k+1} goto loc_011000011;
when hMDM2=dpMDM20 do {hMDM2'=0, k'=k+1} goto loc_011011011;
when hOGT=dpOGT0 do {hOGT'=0, k'=k+1} goto loc_011010111;
--when hOGA=dnOGA1 do {hOGA'=0, k'=k+1} goto loc_011010001;
when hCMYC=dnCMYC1 do {hCMYC'=0, k'=k+1} goto loc_011010010;

-- for the configuration 0,1,1,0,1,0,1,0,0
loc loc_011010100: while hFOXM >=  dnFOXM1 & hPI3K <=  dpPI3K0 & hMDM2 <=  dpMDM20 & hOGT >=  dnOGT1 & hCMYC <=  dpCMYC0  wait {dhNFKB=0,dhP21=-1,dhFOXM=1,dhPI3K=1,dhP53=-1,dhMDM2=1,dhOGT=1,dhOGA=1,dhCMYC=1}
--when hP21=dnP211 do {hP21'=0, k'=k+1} goto loc_001010100;
when hFOXM=dnFOXM1 do {hFOXM'=0, k'=k+1} goto loc_010010100;
when hPI3K=dpPI3K0 do {hPI3K'=0, k'=k+1} goto loc_011110100;
--when hP53=dnP531 do {hP53'=0, k'=k+1} goto loc_011000100;
when hMDM2=dpMDM20 do {hMDM2'=0, k'=k+1} goto loc_011011100;
when hOGT=dnOGT1 do {hOGT'=0, k'=k+1} goto loc_011010000;
--when hOGA=dpOGA0 do {hOGA'=0, k'=k+1} goto loc_011010110;
when hCMYC=dpCMYC0 do {hCMYC'=0, k'=k+1} goto loc_011010101;

-- for the configuration 0,1,1,0,1,0,1,0,1
loc loc_011010101: while hFOXM >=  dnFOXM1 & hPI3K <=  dpPI3K0 & hMDM2 <=  dpMDM20  wait {dhNFKB=0,dhP21=-1,dhFOXM=1,dhPI3K=1,dhP53=-1,dhMDM2=1,dhOGT=0,dhOGA=0,dhCMYC=0}
--when hP21=dnP211 do {hP21'=0, k'=k+1} goto loc_001010101;
when hFOXM=dnFOXM1 do {hFOXM'=0, k'=k+1} goto loc_010010101;
when hPI3K=dpPI3K0 do {hPI3K'=0, k'=k+1} goto loc_011110101;
--when hP53=dnP531 do {hP53'=0, k'=k+1} goto loc_011000101;
when hMDM2=dpMDM20 do {hMDM2'=0, k'=k+1} goto loc_011011101;

-- for the configuration 0,1,1,0,1,0,1,1,0
loc loc_011010110: while hFOXM >=  dnFOXM1 & hPI3K <=  dpPI3K0 & hMDM2 <=  dpMDM20 & hOGT >=  dnOGT1 & hOGA >=  dnOGA1 & hCMYC <=  dpCMYC0  wait {dhNFKB=0,dhP21=-1,dhFOXM=1,dhPI3K=1,dhP53=-1,dhMDM2=1,dhOGT=1,dhOGA=1,dhCMYC=1}
--when hP21=dnP211 do {hP21'=0, k'=k+1} goto loc_001010110;
when hFOXM=dnFOXM1 do {hFOXM'=0, k'=k+1} goto loc_010010110;
when hPI3K=dpPI3K0 do {hPI3K'=0, k'=k+1} goto loc_011110110;
--when hP53=dnP531 do {hP53'=0, k'=k+1} goto loc_011000110;
when hMDM2=dpMDM20 do {hMDM2'=0, k'=k+1} goto loc_011011110;
when hOGT=dnOGT1 do {hOGT'=0, k'=k+1} goto loc_011010010;
when hOGA=dnOGA1 do {hOGA'=0, k'=k+1} goto loc_011010100;
when hCMYC=dpCMYC0 do {hCMYC'=0, k'=k+1} goto loc_011010111;

-- for the configuration 0,1,1,0,1,0,1,1,1
loc loc_011010111: while hFOXM >=  dnFOXM1 & hPI3K <=  dpPI3K0 & hMDM2 <=  dpMDM20 & hOGA >=  dnOGA1  wait {dhNFKB=0,dhP21=-1,dhFOXM=1,dhPI3K=1,dhP53=-1,dhMDM2=1,dhOGT=0,dhOGA=1,dhCMYC=0}
--when hP21=dnP211 do {hP21'=0, k'=k+1} goto loc_001010111;
when hFOXM=dnFOXM1 do {hFOXM'=0, k'=k+1} goto loc_010010111;
when hPI3K=dpPI3K0 do {hPI3K'=0, k'=k+1} goto loc_011110111;
--when hP53=dnP531 do {hP53'=0, k'=k+1} goto loc_011000111;
when hMDM2=dpMDM20 do {hMDM2'=0, k'=k+1} goto loc_011011111;
when hOGA=dnOGA1 do {hOGA'=0, k'=k+1} goto loc_011010101;

-- for the configuration 0,1,1,0,1,1,0,0,0
loc loc_011011000: while hFOXM >=  dnFOXM1 & hP53 >=  dnP531 & hOGA <=  dpOGA0  wait {dhNFKB=0,dhP21=-1,dhFOXM=1,dhPI3K=0,dhP53=1,dhMDM2=-1,dhOGT=0,dhOGA=1,dhCMYC=0}
--when hP21=dnP211 do {hP21'=0, k'=k+1} goto loc_001011000;
when hFOXM=dnFOXM1 do {hFOXM'=0, k'=k+1} goto loc_010011000;
when hP53=dnP531 do {hP53'=0, k'=k+1} goto loc_011001000;
--when hMDM2=dnMDM21 do {hMDM2'=0, k'=k+1} goto loc_011010000;
when hOGA=dpOGA0 do {hOGA'=0, k'=k+1} goto loc_011011010;

-- for the configuration 0,1,1,0,1,1,0,0,1
loc loc_011011001: while hFOXM >=  dnFOXM1 & hP53 >=  dnP531 & hOGT <=  dpOGT0 & hOGA <=  dpOGA0 & hCMYC >=  dnCMYC1  wait {dhNFKB=0,dhP21=-1,dhFOXM=1,dhPI3K=1,dhP53=1,dhMDM2=-1,dhOGT=1,dhOGA=1,dhCMYC=1}
--when hP21=dnP211 do {hP21'=0, k'=k+1} goto loc_001011001;
when hFOXM=dnFOXM1 do {hFOXM'=0, k'=k+1} goto loc_010011001;
--when hPI3K=dpPI3K0 do {hPI3K'=0, k'=k+1} goto loc_011111001;
when hP53=dnP531 do {hP53'=0, k'=k+1} goto loc_011001001;
--when hMDM2=dnMDM21 do {hMDM2'=0, k'=k+1} goto loc_011010001;
when hOGT=dpOGT0 do {hOGT'=0, k'=k+1} goto loc_011011101;
when hOGA=dpOGA0 do {hOGA'=0, k'=k+1} goto loc_011011011;
when hCMYC=dnCMYC1 do {hCMYC'=0, k'=k+1} goto loc_011011000;

-- for the configuration 0,1,1,0,1,1,0,1,0
loc loc_011011010: while hFOXM >=  dnFOXM1 & hP53 >=  dnP531  wait {dhNFKB=0,dhP21=-1,dhFOXM=1,dhPI3K=0,dhP53=1,dhMDM2=-1,dhOGT=0,dhOGA=0,dhCMYC=0}
--when hP21=dnP211 do {hP21'=0, k'=k+1} goto loc_001011010;
when hFOXM=dnFOXM1 do {hFOXM'=0, k'=k+1} goto loc_010011010;
when hP53=dnP531 do {hP53'=0, k'=k+1} goto loc_011001010;
--when hMDM2=dnMDM21 do {hMDM2'=0, k'=k+1} goto loc_011010010;

-- for the configuration 0,1,1,0,1,1,0,1,1
loc loc_011011011: while hFOXM >=  dnFOXM1 & hP53 >=  dnP531 & hOGT <=  dpOGT0 & hCMYC >=  dnCMYC1  wait {dhNFKB=0,dhP21=-1,dhFOXM=1,dhPI3K=1,dhP53=1,dhMDM2=-1,dhOGT=1,dhOGA=-1,dhCMYC=1}
--when hP21=dnP211 do {hP21'=0, k'=k+1} goto loc_001011011;
when hFOXM=dnFOXM1 do {hFOXM'=0, k'=k+1} goto loc_010011011;
--when hPI3K=dpPI3K0 do {hPI3K'=0, k'=k+1} goto loc_011111011;
when hP53=dnP531 do {hP53'=0, k'=k+1} goto loc_011001011;
--when hMDM2=dnMDM21 do {hMDM2'=0, k'=k+1} goto loc_011010011;
when hOGT=dpOGT0 do {hOGT'=0, k'=k+1} goto loc_011011111;
--when hOGA=dnOGA1 do {hOGA'=0, k'=k+1} goto loc_011011001;
when hCMYC=dnCMYC1 do {hCMYC'=0, k'=k+1} goto loc_011011010;

-- for the configuration 0,1,1,0,1,1,1,0,0
loc loc_011011100: while hFOXM >=  dnFOXM1 & hPI3K <=  dpPI3K0 & hP53 >=  dnP531 & hOGT >=  dnOGT1 & hCMYC <=  dpCMYC0  wait {dhNFKB=0,dhP21=-1,dhFOXM=1,dhPI3K=1,dhP53=1,dhMDM2=-1,dhOGT=1,dhOGA=1,dhCMYC=1}
--when hP21=dnP211 do {hP21'=0, k'=k+1} goto loc_001011100;
when hFOXM=dnFOXM1 do {hFOXM'=0, k'=k+1} goto loc_010011100;
when hPI3K=dpPI3K0 do {hPI3K'=0, k'=k+1} goto loc_011111100;
when hP53=dnP531 do {hP53'=0, k'=k+1} goto loc_011001100;
--when hMDM2=dnMDM21 do {hMDM2'=0, k'=k+1} goto loc_011010100;
when hOGT=dnOGT1 do {hOGT'=0, k'=k+1} goto loc_011011000;
--when hOGA=dpOGA0 do {hOGA'=0, k'=k+1} goto loc_011011110;
when hCMYC=dpCMYC0 do {hCMYC'=0, k'=k+1} goto loc_011011101;

-- for the configuration 0,1,1,0,1,1,1,0,1
loc loc_011011101: while hFOXM >=  dnFOXM1 & hPI3K <=  dpPI3K0 & hP53 >=  dnP531  wait {dhNFKB=0,dhP21=-1,dhFOXM=1,dhPI3K=1,dhP53=1,dhMDM2=-1,dhOGT=0,dhOGA=0,dhCMYC=0}
--when hP21=dnP211 do {hP21'=0, k'=k+1} goto loc_001011101;
when hFOXM=dnFOXM1 do {hFOXM'=0, k'=k+1} goto loc_010011101;
when hPI3K=dpPI3K0 do {hPI3K'=0, k'=k+1} goto loc_011111101;
when hP53=dnP531 do {hP53'=0, k'=k+1} goto loc_011001101;
--when hMDM2=dnMDM21 do {hMDM2'=0, k'=k+1} goto loc_011010101;

-- for the configuration 0,1,1,0,1,1,1,1,0
loc loc_011011110: while hFOXM >=  dnFOXM1 & hPI3K <=  dpPI3K0 & hP53 >=  dnP531 & hOGT >=  dnOGT1 & hOGA >=  dnOGA1 & hCMYC <=  dpCMYC0  wait {dhNFKB=0,dhP21=-1,dhFOXM=1,dhPI3K=1,dhP53=1,dhMDM2=-1,dhOGT=1,dhOGA=1,dhCMYC=1}
--when hP21=dnP211 do {hP21'=0, k'=k+1} goto loc_001011110;
when hFOXM=dnFOXM1 do {hFOXM'=0, k'=k+1} goto loc_010011110;
when hPI3K=dpPI3K0 do {hPI3K'=0, k'=k+1} goto loc_011111110;
when hP53=dnP531 do {hP53'=0, k'=k+1} goto loc_011001110;
--when hMDM2=dnMDM21 do {hMDM2'=0, k'=k+1} goto loc_011010110;
when hOGT=dnOGT1 do {hOGT'=0, k'=k+1} goto loc_011011010;
when hOGA=dnOGA1 do {hOGA'=0, k'=k+1} goto loc_011011100;
when hCMYC=dpCMYC0 do {hCMYC'=0, k'=k+1} goto loc_011011111;

-- for the configuration 0,1,1,0,1,1,1,1,1
loc loc_011011111: while hFOXM >=  dnFOXM1 & hPI3K <=  dpPI3K0 & hP53 >=  dnP531 & hOGA >=  dnOGA1  wait {dhNFKB=0,dhP21=-1,dhFOXM=1,dhPI3K=1,dhP53=1,dhMDM2=-1,dhOGT=0,dhOGA=1,dhCMYC=0}
--when hP21=dnP211 do {hP21'=0, k'=k+1} goto loc_001011111;
when hFOXM=dnFOXM1 do {hFOXM'=0, k'=k+1} goto loc_010011111;
when hPI3K=dpPI3K0 do {hPI3K'=0, k'=k+1} goto loc_011111111;
when hP53=dnP531 do {hP53'=0, k'=k+1} goto loc_011001111;
--when hMDM2=dnMDM21 do {hMDM2'=0, k'=k+1} goto loc_011010111;
when hOGA=dnOGA1 do {hOGA'=0, k'=k+1} goto loc_011011101;

-- for the configuration 0,1,1,1,0,0,0,0,0
loc loc_011100000: while hP21 >=  dnP211 & hPI3K >=  dnPI3K1 & hP53 <=  dpP530 & hOGA <=  dpOGA0  wait {dhNFKB=0,dhP21=1,dhFOXM=-1,dhPI3K=1,dhP53=1,dhMDM2=1,dhOGT=0,dhOGA=1,dhCMYC=0}
when hP21=dnP211 do {hP21'=0, k'=k+1} goto loc_001100000;
--when hFOXM=dnFOXM1 do {hFOXM'=0, k'=k+1} goto loc_010100000;
when hPI3K=dnPI3K1 do {hPI3K'=0, k'=k+1} goto loc_011000000;
when hP53=dpP530 do {hP53'=0, k'=k+1} goto loc_011110000;
--when hMDM2=dpMDM20 do {hMDM2'=0, k'=k+1} goto loc_011101000;
when hOGA=dpOGA0 do {hOGA'=0, k'=k+1} goto loc_011100010;

-- for the configuration 0,1,1,1,0,0,0,0,1
loc loc_011100001: while hP21 >=  dnP211 & hPI3K >=  dnPI3K1 & hP53 <=  dpP530 & hOGT <=  dpOGT0 & hOGA <=  dpOGA0 & hCMYC >=  dnCMYC1  wait {dhNFKB=0,dhP21=1,dhFOXM=-1,dhPI3K=1,dhP53=1,dhMDM2=1,dhOGT=1,dhOGA=1,dhCMYC=1}
when hP21=dnP211 do {hP21'=0, k'=k+1} goto loc_001100001;
--when hFOXM=dnFOXM1 do {hFOXM'=0, k'=k+1} goto loc_010100001;
when hPI3K=dnPI3K1 do {hPI3K'=0, k'=k+1} goto loc_011000001;
when hP53=dpP530 do {hP53'=0, k'=k+1} goto loc_011110001;
--when hMDM2=dpMDM20 do {hMDM2'=0, k'=k+1} goto loc_011101001;
when hOGT=dpOGT0 do {hOGT'=0, k'=k+1} goto loc_011100101;
when hOGA=dpOGA0 do {hOGA'=0, k'=k+1} goto loc_011100011;
when hCMYC=dnCMYC1 do {hCMYC'=0, k'=k+1} goto loc_011100000;

-- for the configuration 0,1,1,1,0,0,0,1,0
loc loc_011100010: while hP21 >=  dnP211 & hPI3K >=  dnPI3K1 & hP53 <=  dpP530  wait {dhNFKB=0,dhP21=1,dhFOXM=-1,dhPI3K=1,dhP53=1,dhMDM2=1,dhOGT=0,dhOGA=0,dhCMYC=0}
when hP21=dnP211 do {hP21'=0, k'=k+1} goto loc_001100010;
--when hFOXM=dnFOXM1 do {hFOXM'=0, k'=k+1} goto loc_010100010;
when hPI3K=dnPI3K1 do {hPI3K'=0, k'=k+1} goto loc_011000010;
when hP53=dpP530 do {hP53'=0, k'=k+1} goto loc_011110010;
--when hMDM2=dpMDM20 do {hMDM2'=0, k'=k+1} goto loc_011101010;

-- for the configuration 0,1,1,1,0,0,0,1,1
loc loc_011100011: while hP21 >=  dnP211 & hPI3K >=  dnPI3K1 & hP53 <=  dpP530 & hOGT <=  dpOGT0 & hCMYC >=  dnCMYC1  wait {dhNFKB=0,dhP21=1,dhFOXM=-1,dhPI3K=1,dhP53=1,dhMDM2=1,dhOGT=1,dhOGA=-1,dhCMYC=1}
when hP21=dnP211 do {hP21'=0, k'=k+1} goto loc_001100011;
--when hFOXM=dnFOXM1 do {hFOXM'=0, k'=k+1} goto loc_010100011;
when hPI3K=dnPI3K1 do {hPI3K'=0, k'=k+1} goto loc_011000011;
when hP53=dpP530 do {hP53'=0, k'=k+1} goto loc_011110011;
--when hMDM2=dpMDM20 do {hMDM2'=0, k'=k+1} goto loc_011101011;
when hOGT=dpOGT0 do {hOGT'=0, k'=k+1} goto loc_011100111;
--when hOGA=dnOGA1 do {hOGA'=0, k'=k+1} goto loc_011100001;
when hCMYC=dnCMYC1 do {hCMYC'=0, k'=k+1} goto loc_011100010;

-- for the configuration 0,1,1,1,0,0,1,0,0
loc loc_011100100: while hP21 >=  dnP211 & hP53 <=  dpP530 & hOGT >=  dnOGT1  wait {dhNFKB=0,dhP21=1,dhFOXM=0,dhPI3K=-1,dhP53=1,dhMDM2=1,dhOGT=1,dhOGA=1,dhCMYC=1}
when hP21=dnP211 do {hP21'=0, k'=k+1} goto loc_001100100;
--when hPI3K=dnPI3K1 do {hPI3K'=0, k'=k+1} goto loc_011000100;
when hP53=dpP530 do {hP53'=0, k'=k+1} goto loc_011110100;
--when hMDM2=dpMDM20 do {hMDM2'=0, k'=k+1} goto loc_011101100;
when hOGT=dnOGT1 do {hOGT'=0, k'=k+1} goto loc_011100000;
--when hOGA=dpOGA0 do {hOGA'=0, k'=k+1} goto loc_011100110;
--when hCMYC=dpCMYC0 do {hCMYC'=0, k'=k+1} goto loc_011100101;

-- for the configuration 0,1,1,1,0,0,1,0,1
loc loc_011100101: while hP21 >=  dnP211 & hP53 <=  dpP530  wait {dhNFKB=0,dhP21=1,dhFOXM=0,dhPI3K=0,dhP53=1,dhMDM2=1,dhOGT=0,dhOGA=0,dhCMYC=0}
when hP21=dnP211 do {hP21'=0, k'=k+1} goto loc_001100101;
when hP53=dpP530 do {hP53'=0, k'=k+1} goto loc_011110101;
--when hMDM2=dpMDM20 do {hMDM2'=0, k'=k+1} goto loc_011101101;

-- for the configuration 0,1,1,1,0,0,1,1,0
loc loc_011100110: while hP21 >=  dnP211 & hP53 <=  dpP530 & hOGT >=  dnOGT1 & hOGA >=  dnOGA1  wait {dhNFKB=0,dhP21=1,dhFOXM=0,dhPI3K=-1,dhP53=1,dhMDM2=1,dhOGT=1,dhOGA=1,dhCMYC=1}
when hP21=dnP211 do {hP21'=0, k'=k+1} goto loc_001100110;
--when hPI3K=dnPI3K1 do {hPI3K'=0, k'=k+1} goto loc_011000110;
when hP53=dpP530 do {hP53'=0, k'=k+1} goto loc_011110110;
--when hMDM2=dpMDM20 do {hMDM2'=0, k'=k+1} goto loc_011101110;
when hOGT=dnOGT1 do {hOGT'=0, k'=k+1} goto loc_011100010;
when hOGA=dnOGA1 do {hOGA'=0, k'=k+1} goto loc_011100100;
--when hCMYC=dpCMYC0 do {hCMYC'=0, k'=k+1} goto loc_011100111;

-- for the configuration 0,1,1,1,0,0,1,1,1
loc loc_011100111: while hP21 >=  dnP211 & hP53 <=  dpP530 & hOGA >=  dnOGA1  wait {dhNFKB=0,dhP21=1,dhFOXM=0,dhPI3K=0,dhP53=1,dhMDM2=1,dhOGT=0,dhOGA=1,dhCMYC=0}
when hP21=dnP211 do {hP21'=0, k'=k+1} goto loc_001100111;
when hP53=dpP530 do {hP53'=0, k'=k+1} goto loc_011110111;
--when hMDM2=dpMDM20 do {hMDM2'=0, k'=k+1} goto loc_011101111;
when hOGA=dnOGA1 do {hOGA'=0, k'=k+1} goto loc_011100101;

-- for the configuration 0,1,1,1,0,1,0,0,0
loc loc_011101000: while hP21 >=  dnP211 & hPI3K >=  dnPI3K1 & hMDM2 >=  dnMDM21 & hOGA <=  dpOGA0  wait {dhNFKB=0,dhP21=1,dhFOXM=-1,dhPI3K=1,dhP53=1,dhMDM2=1,dhOGT=0,dhOGA=1,dhCMYC=0}
when hP21=dnP211 do {hP21'=0, k'=k+1} goto loc_001101000;
--when hFOXM=dnFOXM1 do {hFOXM'=0, k'=k+1} goto loc_010101000;
when hPI3K=dnPI3K1 do {hPI3K'=0, k'=k+1} goto loc_011001000;
--when hP53=dpP530 do {hP53'=0, k'=k+1} goto loc_011111000;
when hMDM2=dnMDM21 do {hMDM2'=0, k'=k+1} goto loc_011100000;
when hOGA=dpOGA0 do {hOGA'=0, k'=k+1} goto loc_011101010;

-- for the configuration 0,1,1,1,0,1,0,0,1
loc loc_011101001: while hP21 >=  dnP211 & hPI3K >=  dnPI3K1 & hMDM2 >=  dnMDM21 & hOGT <=  dpOGT0 & hOGA <=  dpOGA0 & hCMYC >=  dnCMYC1  wait {dhNFKB=0,dhP21=1,dhFOXM=-1,dhPI3K=1,dhP53=1,dhMDM2=1,dhOGT=1,dhOGA=1,dhCMYC=1}
when hP21=dnP211 do {hP21'=0, k'=k+1} goto loc_001101001;
--when hFOXM=dnFOXM1 do {hFOXM'=0, k'=k+1} goto loc_010101001;
when hPI3K=dnPI3K1 do {hPI3K'=0, k'=k+1} goto loc_011001001;
--when hP53=dpP530 do {hP53'=0, k'=k+1} goto loc_011111001;
when hMDM2=dnMDM21 do {hMDM2'=0, k'=k+1} goto loc_011100001;
when hOGT=dpOGT0 do {hOGT'=0, k'=k+1} goto loc_011101101;
when hOGA=dpOGA0 do {hOGA'=0, k'=k+1} goto loc_011101011;
when hCMYC=dnCMYC1 do {hCMYC'=0, k'=k+1} goto loc_011101000;

-- for the configuration 0,1,1,1,0,1,0,1,0
loc loc_011101010: while hP21 >=  dnP211 & hPI3K >=  dnPI3K1 & hMDM2 >=  dnMDM21  wait {dhNFKB=0,dhP21=1,dhFOXM=-1,dhPI3K=1,dhP53=1,dhMDM2=1,dhOGT=0,dhOGA=0,dhCMYC=0}
when hP21=dnP211 do {hP21'=0, k'=k+1} goto loc_001101010;
--when hFOXM=dnFOXM1 do {hFOXM'=0, k'=k+1} goto loc_010101010;
when hPI3K=dnPI3K1 do {hPI3K'=0, k'=k+1} goto loc_011001010;
--when hP53=dpP530 do {hP53'=0, k'=k+1} goto loc_011111010;
when hMDM2=dnMDM21 do {hMDM2'=0, k'=k+1} goto loc_011100010;

-- for the configuration 0,1,1,1,0,1,0,1,1
loc loc_011101011: while hP21 >=  dnP211 & hPI3K >=  dnPI3K1 & hMDM2 >=  dnMDM21 & hOGT <=  dpOGT0 & hCMYC >=  dnCMYC1  wait {dhNFKB=0,dhP21=1,dhFOXM=-1,dhPI3K=1,dhP53=1,dhMDM2=1,dhOGT=1,dhOGA=-1,dhCMYC=1}
when hP21=dnP211 do {hP21'=0, k'=k+1} goto loc_001101011;
--when hFOXM=dnFOXM1 do {hFOXM'=0, k'=k+1} goto loc_010101011;
when hPI3K=dnPI3K1 do {hPI3K'=0, k'=k+1} goto loc_011001011;
--when hP53=dpP530 do {hP53'=0, k'=k+1} goto loc_011111011;
when hMDM2=dnMDM21 do {hMDM2'=0, k'=k+1} goto loc_011100011;
when hOGT=dpOGT0 do {hOGT'=0, k'=k+1} goto loc_011101111;
--when hOGA=dnOGA1 do {hOGA'=0, k'=k+1} goto loc_011101001;
when hCMYC=dnCMYC1 do {hCMYC'=0, k'=k+1} goto loc_011101010;

-- for the configuration 0,1,1,1,0,1,1,0,0
loc loc_011101100: while hP21 >=  dnP211 & hMDM2 >=  dnMDM21 & hOGT >=  dnOGT1  wait {dhNFKB=0,dhP21=1,dhFOXM=0,dhPI3K=-1,dhP53=1,dhMDM2=1,dhOGT=1,dhOGA=1,dhCMYC=0}
when hP21=dnP211 do {hP21'=0, k'=k+1} goto loc_001101100;
--when hPI3K=dnPI3K1 do {hPI3K'=0, k'=k+1} goto loc_011001100;
--when hP53=dpP530 do {hP53'=0, k'=k+1} goto loc_011111100;
when hMDM2=dnMDM21 do {hMDM2'=0, k'=k+1} goto loc_011100100;
when hOGT=dnOGT1 do {hOGT'=0, k'=k+1} goto loc_011101000;
--when hOGA=dpOGA0 do {hOGA'=0, k'=k+1} goto loc_011101110;

-- for the configuration 0,1,1,1,0,1,1,0,1
loc loc_011101101: while hP21 >=  dnP211 & hMDM2 >=  dnMDM21  wait {dhNFKB=0,dhP21=1,dhFOXM=0,dhPI3K=0,dhP53=1,dhMDM2=1,dhOGT=0,dhOGA=0,dhCMYC=0}
when hP21=dnP211 do {hP21'=0, k'=k+1} goto loc_001101101;
--when hP53=dpP530 do {hP53'=0, k'=k+1} goto loc_011111101;
when hMDM2=dnMDM21 do {hMDM2'=0, k'=k+1} goto loc_011100101;

-- for the configuration 0,1,1,1,0,1,1,1,0
loc loc_011101110: while hP21 >=  dnP211 & hMDM2 >=  dnMDM21 & hOGT >=  dnOGT1 & hOGA >=  dnOGA1  wait {dhNFKB=0,dhP21=1,dhFOXM=0,dhPI3K=-1,dhP53=1,dhMDM2=1,dhOGT=1,dhOGA=1,dhCMYC=0}
when hP21=dnP211 do {hP21'=0, k'=k+1} goto loc_001101110;
--when hPI3K=dnPI3K1 do {hPI3K'=0, k'=k+1} goto loc_011001110;
--when hP53=dpP530 do {hP53'=0, k'=k+1} goto loc_011111110;
when hMDM2=dnMDM21 do {hMDM2'=0, k'=k+1} goto loc_011100110;
when hOGT=dnOGT1 do {hOGT'=0, k'=k+1} goto loc_011101010;
when hOGA=dnOGA1 do {hOGA'=0, k'=k+1} goto loc_011101100;

-- for the configuration 0,1,1,1,0,1,1,1,1
loc loc_011101111: while hP21 >=  dnP211 & hMDM2 >=  dnMDM21 & hOGA >=  dnOGA1  wait {dhNFKB=0,dhP21=1,dhFOXM=0,dhPI3K=0,dhP53=1,dhMDM2=1,dhOGT=0,dhOGA=1,dhCMYC=0}
when hP21=dnP211 do {hP21'=0, k'=k+1} goto loc_001101111;
--when hP53=dpP530 do {hP53'=0, k'=k+1} goto loc_011111111;
when hMDM2=dnMDM21 do {hMDM2'=0, k'=k+1} goto loc_011100111;
when hOGA=dnOGA1 do {hOGA'=0, k'=k+1} goto loc_011101101;

-- for the configuration 0,1,1,1,1,0,0,0,0
loc loc_011110000: while hP21 >=  dnP211 & hPI3K >=  dnPI3K1 & hMDM2 <=  dpMDM20 & hOGA <=  dpOGA0  wait {dhNFKB=0,dhP21=1,dhFOXM=-1,dhPI3K=1,dhP53=-1,dhMDM2=1,dhOGT=0,dhOGA=1,dhCMYC=0}
when hP21=dnP211 do {hP21'=0, k'=k+1} goto loc_001110000;
--when hFOXM=dnFOXM1 do {hFOXM'=0, k'=k+1} goto loc_010110000;
when hPI3K=dnPI3K1 do {hPI3K'=0, k'=k+1} goto loc_011010000;
--when hP53=dnP531 do {hP53'=0, k'=k+1} goto loc_011100000;
when hMDM2=dpMDM20 do {hMDM2'=0, k'=k+1} goto loc_011111000;
when hOGA=dpOGA0 do {hOGA'=0, k'=k+1} goto loc_011110010;

-- for the configuration 0,1,1,1,1,0,0,0,1
loc loc_011110001: while hP21 >=  dnP211 & hPI3K >=  dnPI3K1 & hMDM2 <=  dpMDM20 & hOGT <=  dpOGT0 & hOGA <=  dpOGA0 & hCMYC >=  dnCMYC1  wait {dhNFKB=0,dhP21=1,dhFOXM=-1,dhPI3K=1,dhP53=-1,dhMDM2=1,dhOGT=1,dhOGA=1,dhCMYC=1}
when hP21=dnP211 do {hP21'=0, k'=k+1} goto loc_001110001;
--when hFOXM=dnFOXM1 do {hFOXM'=0, k'=k+1} goto loc_010110001;
when hPI3K=dnPI3K1 do {hPI3K'=0, k'=k+1} goto loc_011010001;
--when hP53=dnP531 do {hP53'=0, k'=k+1} goto loc_011100001;
when hMDM2=dpMDM20 do {hMDM2'=0, k'=k+1} goto loc_011111001;
when hOGT=dpOGT0 do {hOGT'=0, k'=k+1} goto loc_011110101;
when hOGA=dpOGA0 do {hOGA'=0, k'=k+1} goto loc_011110011;
when hCMYC=dnCMYC1 do {hCMYC'=0, k'=k+1} goto loc_011110000;

-- for the configuration 0,1,1,1,1,0,0,1,0
loc loc_011110010: while hP21 >=  dnP211 & hPI3K >=  dnPI3K1 & hMDM2 <=  dpMDM20  wait {dhNFKB=0,dhP21=1,dhFOXM=-1,dhPI3K=1,dhP53=-1,dhMDM2=1,dhOGT=0,dhOGA=0,dhCMYC=0}
when hP21=dnP211 do {hP21'=0, k'=k+1} goto loc_001110010;
--when hFOXM=dnFOXM1 do {hFOXM'=0, k'=k+1} goto loc_010110010;
when hPI3K=dnPI3K1 do {hPI3K'=0, k'=k+1} goto loc_011010010;
--when hP53=dnP531 do {hP53'=0, k'=k+1} goto loc_011100010;
when hMDM2=dpMDM20 do {hMDM2'=0, k'=k+1} goto loc_011111010;

-- for the configuration 0,1,1,1,1,0,0,1,1
loc loc_011110011: while hP21 >=  dnP211 & hPI3K >=  dnPI3K1 & hMDM2 <=  dpMDM20 & hOGT <=  dpOGT0 & hCMYC >=  dnCMYC1  wait {dhNFKB=0,dhP21=1,dhFOXM=-1,dhPI3K=1,dhP53=-1,dhMDM2=1,dhOGT=1,dhOGA=-1,dhCMYC=1}
when hP21=dnP211 do {hP21'=0, k'=k+1} goto loc_001110011;
--when hFOXM=dnFOXM1 do {hFOXM'=0, k'=k+1} goto loc_010110011;
when hPI3K=dnPI3K1 do {hPI3K'=0, k'=k+1} goto loc_011010011;
--when hP53=dnP531 do {hP53'=0, k'=k+1} goto loc_011100011;
when hMDM2=dpMDM20 do {hMDM2'=0, k'=k+1} goto loc_011111011;
when hOGT=dpOGT0 do {hOGT'=0, k'=k+1} goto loc_011110111;
--when hOGA=dnOGA1 do {hOGA'=0, k'=k+1} goto loc_011110001;
when hCMYC=dnCMYC1 do {hCMYC'=0, k'=k+1} goto loc_011110010;

-- for the configuration 0,1,1,1,1,0,1,0,0
loc loc_011110100: while hP21 >=  dnP211 & hMDM2 <=  dpMDM20 & hOGT >=  dnOGT1 & hCMYC <=  dpCMYC0  wait {dhNFKB=0,dhP21=1,dhFOXM=0,dhPI3K=-1,dhP53=-1,dhMDM2=1,dhOGT=1,dhOGA=1,dhCMYC=1}
when hP21=dnP211 do {hP21'=0, k'=k+1} goto loc_001110100;
--when hPI3K=dnPI3K1 do {hPI3K'=0, k'=k+1} goto loc_011010100;
--when hP53=dnP531 do {hP53'=0, k'=k+1} goto loc_011100100;
when hMDM2=dpMDM20 do {hMDM2'=0, k'=k+1} goto loc_011111100;
when hOGT=dnOGT1 do {hOGT'=0, k'=k+1} goto loc_011110000;
--when hOGA=dpOGA0 do {hOGA'=0, k'=k+1} goto loc_011110110;
when hCMYC=dpCMYC0 do {hCMYC'=0, k'=k+1} goto loc_011110101;

-- for the configuration 0,1,1,1,1,0,1,0,1
loc loc_011110101: while hP21 >=  dnP211 & hMDM2 <=  dpMDM20  wait {dhNFKB=0,dhP21=1,dhFOXM=0,dhPI3K=0,dhP53=-1,dhMDM2=1,dhOGT=0,dhOGA=0,dhCMYC=0}
when hP21=dnP211 do {hP21'=0, k'=k+1} goto loc_001110101;
--when hP53=dnP531 do {hP53'=0, k'=k+1} goto loc_011100101;
when hMDM2=dpMDM20 do {hMDM2'=0, k'=k+1} goto loc_011111101;

-- for the configuration 0,1,1,1,1,0,1,1,0
loc loc_011110110: while hP21 >=  dnP211 & hMDM2 <=  dpMDM20 & hOGT >=  dnOGT1 & hOGA >=  dnOGA1 & hCMYC <=  dpCMYC0  wait {dhNFKB=0,dhP21=1,dhFOXM=0,dhPI3K=-1,dhP53=-1,dhMDM2=1,dhOGT=1,dhOGA=1,dhCMYC=1}
when hP21=dnP211 do {hP21'=0, k'=k+1} goto loc_001110110;
--when hPI3K=dnPI3K1 do {hPI3K'=0, k'=k+1} goto loc_011010110;
--when hP53=dnP531 do {hP53'=0, k'=k+1} goto loc_011100110;
when hMDM2=dpMDM20 do {hMDM2'=0, k'=k+1} goto loc_011111110;
when hOGT=dnOGT1 do {hOGT'=0, k'=k+1} goto loc_011110010;
when hOGA=dnOGA1 do {hOGA'=0, k'=k+1} goto loc_011110100;
when hCMYC=dpCMYC0 do {hCMYC'=0, k'=k+1} goto loc_011110111;

-- for the configuration 0,1,1,1,1,0,1,1,1
loc loc_011110111: while hP21 >=  dnP211 & hMDM2 <=  dpMDM20 & hOGA >=  dnOGA1  wait {dhNFKB=0,dhP21=1,dhFOXM=0,dhPI3K=0,dhP53=-1,dhMDM2=1,dhOGT=0,dhOGA=1,dhCMYC=0}
when hP21=dnP211 do {hP21'=0, k'=k+1} goto loc_001110111;
--when hP53=dnP531 do {hP53'=0, k'=k+1} goto loc_011100111;
when hMDM2=dpMDM20 do {hMDM2'=0, k'=k+1} goto loc_011111111;
when hOGA=dnOGA1 do {hOGA'=0, k'=k+1} goto loc_011110101;

-- for the configuration 0,1,1,1,1,1,0,0,0
loc loc_011111000: while hP21 >=  dnP211 & hPI3K >=  dnPI3K1 & hP53 >=  dnP531 & hOGA <=  dpOGA0  wait {dhNFKB=0,dhP21=1,dhFOXM=-1,dhPI3K=1,dhP53=1,dhMDM2=-1,dhOGT=0,dhOGA=1,dhCMYC=0}
when hP21=dnP211 do {hP21'=0, k'=k+1} goto loc_001111000;
--when hFOXM=dnFOXM1 do {hFOXM'=0, k'=k+1} goto loc_010111000;
when hPI3K=dnPI3K1 do {hPI3K'=0, k'=k+1} goto loc_011011000;
when hP53=dnP531 do {hP53'=0, k'=k+1} goto loc_011101000;
--when hMDM2=dnMDM21 do {hMDM2'=0, k'=k+1} goto loc_011110000;
when hOGA=dpOGA0 do {hOGA'=0, k'=k+1} goto loc_011111010;

-- for the configuration 0,1,1,1,1,1,0,0,1
loc loc_011111001: while hP21 >=  dnP211 & hPI3K >=  dnPI3K1 & hP53 >=  dnP531 & hOGT <=  dpOGT0 & hOGA <=  dpOGA0 & hCMYC >=  dnCMYC1  wait {dhNFKB=0,dhP21=1,dhFOXM=-1,dhPI3K=1,dhP53=1,dhMDM2=-1,dhOGT=1,dhOGA=1,dhCMYC=1}
when hP21=dnP211 do {hP21'=0, k'=k+1} goto loc_001111001;
--when hFOXM=dnFOXM1 do {hFOXM'=0, k'=k+1} goto loc_010111001;
when hPI3K=dnPI3K1 do {hPI3K'=0, k'=k+1} goto loc_011011001;
when hP53=dnP531 do {hP53'=0, k'=k+1} goto loc_011101001;
--when hMDM2=dnMDM21 do {hMDM2'=0, k'=k+1} goto loc_011110001;
when hOGT=dpOGT0 do {hOGT'=0, k'=k+1} goto loc_011111101;
when hOGA=dpOGA0 do {hOGA'=0, k'=k+1} goto loc_011111011;
when hCMYC=dnCMYC1 do {hCMYC'=0, k'=k+1} goto loc_011111000;

-- for the configuration 0,1,1,1,1,1,0,1,0
loc loc_011111010: while hP21 >=  dnP211 & hPI3K >=  dnPI3K1 & hP53 >=  dnP531  wait {dhNFKB=0,dhP21=1,dhFOXM=-1,dhPI3K=1,dhP53=1,dhMDM2=-1,dhOGT=0,dhOGA=0,dhCMYC=0}
when hP21=dnP211 do {hP21'=0, k'=k+1} goto loc_001111010;
--when hFOXM=dnFOXM1 do {hFOXM'=0, k'=k+1} goto loc_010111010;
when hPI3K=dnPI3K1 do {hPI3K'=0, k'=k+1} goto loc_011011010;
when hP53=dnP531 do {hP53'=0, k'=k+1} goto loc_011101010;
--when hMDM2=dnMDM21 do {hMDM2'=0, k'=k+1} goto loc_011110010;

-- for the configuration 0,1,1,1,1,1,0,1,1
loc loc_011111011: while hP21 >=  dnP211 & hPI3K >=  dnPI3K1 & hP53 >=  dnP531 & hOGT <=  dpOGT0 & hCMYC >=  dnCMYC1  wait {dhNFKB=0,dhP21=1,dhFOXM=-1,dhPI3K=1,dhP53=1,dhMDM2=-1,dhOGT=1,dhOGA=-1,dhCMYC=1}
when hP21=dnP211 do {hP21'=0, k'=k+1} goto loc_001111011;
--when hFOXM=dnFOXM1 do {hFOXM'=0, k'=k+1} goto loc_010111011;
when hPI3K=dnPI3K1 do {hPI3K'=0, k'=k+1} goto loc_011011011;
when hP53=dnP531 do {hP53'=0, k'=k+1} goto loc_011101011;
--when hMDM2=dnMDM21 do {hMDM2'=0, k'=k+1} goto loc_011110011;
when hOGT=dpOGT0 do {hOGT'=0, k'=k+1} goto loc_011111111;
--when hOGA=dnOGA1 do {hOGA'=0, k'=k+1} goto loc_011111001;
when hCMYC=dnCMYC1 do {hCMYC'=0, k'=k+1} goto loc_011111010;

-- for the configuration 0,1,1,1,1,1,1,0,0
loc loc_011111100: while hP21 >=  dnP211 & hP53 >=  dnP531 & hOGT >=  dnOGT1 & hCMYC <=  dpCMYC0  wait {dhNFKB=0,dhP21=1,dhFOXM=0,dhPI3K=-1,dhP53=1,dhMDM2=-1,dhOGT=1,dhOGA=1,dhCMYC=1}
when hP21=dnP211 do {hP21'=0, k'=k+1} goto loc_001111100;
--when hPI3K=dnPI3K1 do {hPI3K'=0, k'=k+1} goto loc_011011100;
when hP53=dnP531 do {hP53'=0, k'=k+1} goto loc_011101100;
--when hMDM2=dnMDM21 do {hMDM2'=0, k'=k+1} goto loc_011110100;
when hOGT=dnOGT1 do {hOGT'=0, k'=k+1} goto loc_011111000;
--when hOGA=dpOGA0 do {hOGA'=0, k'=k+1} goto loc_011111110;
when hCMYC=dpCMYC0 do {hCMYC'=0, k'=k+1} goto loc_011111101;

-- for the configuration 0,1,1,1,1,1,1,0,1
loc loc_011111101: while hP21 >=  dnP211 & hP53 >=  dnP531  wait {dhNFKB=0,dhP21=1,dhFOXM=0,dhPI3K=0,dhP53=1,dhMDM2=-1,dhOGT=0,dhOGA=0,dhCMYC=0}
when hP21=dnP211 do {hP21'=0, k'=k+1} goto loc_001111101;
when hP53=dnP531 do {hP53'=0, k'=k+1} goto loc_011101101;
--when hMDM2=dnMDM21 do {hMDM2'=0, k'=k+1} goto loc_011110101;

-- for the configuration 0,1,1,1,1,1,1,1,0
loc loc_011111110: while hP21 >=  dnP211 & hP53 >=  dnP531 & hOGT >=  dnOGT1 & hOGA >=  dnOGA1 & hCMYC <=  dpCMYC0  wait {dhNFKB=0,dhP21=1,dhFOXM=0,dhPI3K=-1,dhP53=1,dhMDM2=-1,dhOGT=1,dhOGA=1,dhCMYC=1}
when hP21=dnP211 do {hP21'=0, k'=k+1} goto loc_001111110;
--when hPI3K=dnPI3K1 do {hPI3K'=0, k'=k+1} goto loc_011011110;
when hP53=dnP531 do {hP53'=0, k'=k+1} goto loc_011101110;
--when hMDM2=dnMDM21 do {hMDM2'=0, k'=k+1} goto loc_011110110;
when hOGT=dnOGT1 do {hOGT'=0, k'=k+1} goto loc_011111010;
when hOGA=dnOGA1 do {hOGA'=0, k'=k+1} goto loc_011111100;
when hCMYC=dpCMYC0 do {hCMYC'=0, k'=k+1} goto loc_011111111;

-- for the configuration 0,1,1,1,1,1,1,1,1
loc loc_011111111: while hP21 >=  dnP211 & hP53 >=  dnP531 & hOGA >=  dnOGA1  wait {dhNFKB=0,dhP21=1,dhFOXM=0,dhPI3K=0,dhP53=1,dhMDM2=-1,dhOGT=0,dhOGA=1,dhCMYC=0}
when hP21=dnP211 do {hP21'=0, k'=k+1} goto loc_001111111;
when hP53=dnP531 do {hP53'=0, k'=k+1} goto loc_011101111;
--when hMDM2=dnMDM21 do {hMDM2'=0, k'=k+1} goto loc_011110111;
when hOGA=dnOGA1 do {hOGA'=0, k'=k+1} goto loc_011111101;

-- for the configuration 1,0,0,0,0,0,0,0,0
loc loc_100000000: while hNFKB >=  dnNFKB1 & hP21 <=  dpP210 & hPI3K <=  dpPI3K0 & hP53 <=  dpP530 & hOGA <=  dpOGA0  wait {dhNFKB=1,dhP21=1,dhFOXM=0,dhPI3K=1,dhP53=1,dhMDM2=1,dhOGT=0,dhOGA=1,dhCMYC=0}
when hNFKB=dnNFKB1 do {hNFKB'=0, k'=k+1} goto loc_000000000;
when hP21=dpP210 do {hP21'=0, k'=k+1} goto loc_110000000;
when hPI3K=dpPI3K0 do {hPI3K'=0, k'=k+1} goto loc_100100000;
when hP53=dpP530 do {hP53'=0, k'=k+1} goto loc_100010000;
--when hMDM2=dpMDM20 do {hMDM2'=0, k'=k+1} goto loc_100001000;
when hOGA=dpOGA0 do {hOGA'=0, k'=k+1} goto loc_100000010;

-- for the configuration 1,0,0,0,0,0,0,0,1
loc loc_100000001: while hNFKB >=  dnNFKB1 & hP21 <=  dpP210 & hPI3K <=  dpPI3K0 & hP53 <=  dpP530 & hOGT <=  dpOGT0 & hOGA <=  dpOGA0 & hCMYC >=  dnCMYC1  wait {dhNFKB=1,dhP21=1,dhFOXM=0,dhPI3K=1,dhP53=1,dhMDM2=1,dhOGT=1,dhOGA=1,dhCMYC=1}
when hNFKB=dnNFKB1 do {hNFKB'=0, k'=k+1} goto loc_000000001;
when hP21=dpP210 do {hP21'=0, k'=k+1} goto loc_110000001;
when hPI3K=dpPI3K0 do {hPI3K'=0, k'=k+1} goto loc_100100001;
when hP53=dpP530 do {hP53'=0, k'=k+1} goto loc_100010001;
--when hMDM2=dpMDM20 do {hMDM2'=0, k'=k+1} goto loc_100001001;
when hOGT=dpOGT0 do {hOGT'=0, k'=k+1} goto loc_100000101;
when hOGA=dpOGA0 do {hOGA'=0, k'=k+1} goto loc_100000011;
when hCMYC=dnCMYC1 do {hCMYC'=0, k'=k+1} goto loc_100000000;

-- for the configuration 1,0,0,0,0,0,0,1,0
loc loc_100000010: while hNFKB >=  dnNFKB1 & hP21 <=  dpP210 & hPI3K <=  dpPI3K0 & hP53 <=  dpP530  wait {dhNFKB=1,dhP21=1,dhFOXM=0,dhPI3K=1,dhP53=1,dhMDM2=1,dhOGT=0,dhOGA=0,dhCMYC=0}
when hNFKB=dnNFKB1 do {hNFKB'=0, k'=k+1} goto loc_000000010;
when hP21=dpP210 do {hP21'=0, k'=k+1} goto loc_110000010;
when hPI3K=dpPI3K0 do {hPI3K'=0, k'=k+1} goto loc_100100010;
when hP53=dpP530 do {hP53'=0, k'=k+1} goto loc_100010010;
--when hMDM2=dpMDM20 do {hMDM2'=0, k'=k+1} goto loc_100001010;

-- for the configuration 1,0,0,0,0,0,0,1,1
loc loc_100000011: while hNFKB >=  dnNFKB1 & hP21 <=  dpP210 & hPI3K <=  dpPI3K0 & hP53 <=  dpP530 & hOGT <=  dpOGT0 & hCMYC >=  dnCMYC1  wait {dhNFKB=1,dhP21=1,dhFOXM=0,dhPI3K=1,dhP53=1,dhMDM2=1,dhOGT=1,dhOGA=-1,dhCMYC=1}
when hNFKB=dnNFKB1 do {hNFKB'=0, k'=k+1} goto loc_000000011;
when hP21=dpP210 do {hP21'=0, k'=k+1} goto loc_110000011;
when hPI3K=dpPI3K0 do {hPI3K'=0, k'=k+1} goto loc_100100011;
when hP53=dpP530 do {hP53'=0, k'=k+1} goto loc_100010011;
--when hMDM2=dpMDM20 do {hMDM2'=0, k'=k+1} goto loc_100001011;
when hOGT=dpOGT0 do {hOGT'=0, k'=k+1} goto loc_100000111;
--when hOGA=dnOGA1 do {hOGA'=0, k'=k+1} goto loc_100000001;
when hCMYC=dnCMYC1 do {hCMYC'=0, k'=k+1} goto loc_100000010;

-- for the configuration 1,0,0,0,0,0,1,0,0
loc loc_100000100: while hNFKB >=  dnNFKB1 & hP21 <=  dpP210 & hP53 <=  dpP530 & hOGT >=  dnOGT1  wait {dhNFKB=1,dhP21=1,dhFOXM=0,dhPI3K=1,dhP53=1,dhMDM2=1,dhOGT=1,dhOGA=1,dhCMYC=1}
when hNFKB=dnNFKB1 do {hNFKB'=0, k'=k+1} goto loc_000000100;
when hP21=dpP210 do {hP21'=0, k'=k+1} goto loc_110000100;
--when hPI3K=dpPI3K0 do {hPI3K'=0, k'=k+1} goto loc_100100100;
when hP53=dpP530 do {hP53'=0, k'=k+1} goto loc_100010100;
--when hMDM2=dpMDM20 do {hMDM2'=0, k'=k+1} goto loc_100001100;
when hOGT=dnOGT1 do {hOGT'=0, k'=k+1} goto loc_100000000;
--when hOGA=dpOGA0 do {hOGA'=0, k'=k+1} goto loc_100000110;
--when hCMYC=dpCMYC0 do {hCMYC'=0, k'=k+1} goto loc_100000101;

-- for the configuration 1,0,0,0,0,0,1,0,1
loc loc_100000101: while hNFKB >=  dnNFKB1 & hP21 <=  dpP210 & hP53 <=  dpP530  wait {dhNFKB=1,dhP21=1,dhFOXM=0,dhPI3K=1,dhP53=1,dhMDM2=1,dhOGT=0,dhOGA=0,dhCMYC=0}
when hNFKB=dnNFKB1 do {hNFKB'=0, k'=k+1} goto loc_000000101;
when hP21=dpP210 do {hP21'=0, k'=k+1} goto loc_110000101;
--when hPI3K=dpPI3K0 do {hPI3K'=0, k'=k+1} goto loc_100100101;
when hP53=dpP530 do {hP53'=0, k'=k+1} goto loc_100010101;
--when hMDM2=dpMDM20 do {hMDM2'=0, k'=k+1} goto loc_100001101;

-- for the configuration 1,0,0,0,0,0,1,1,0
loc loc_100000110: while hNFKB >=  dnNFKB1 & hP21 <=  dpP210 & hP53 <=  dpP530 & hOGT >=  dnOGT1 & hOGA >=  dnOGA1  wait {dhNFKB=1,dhP21=1,dhFOXM=0,dhPI3K=1,dhP53=1,dhMDM2=1,dhOGT=1,dhOGA=1,dhCMYC=1}
when hNFKB=dnNFKB1 do {hNFKB'=0, k'=k+1} goto loc_000000110;
when hP21=dpP210 do {hP21'=0, k'=k+1} goto loc_110000110;
--when hPI3K=dpPI3K0 do {hPI3K'=0, k'=k+1} goto loc_100100110;
when hP53=dpP530 do {hP53'=0, k'=k+1} goto loc_100010110;
--when hMDM2=dpMDM20 do {hMDM2'=0, k'=k+1} goto loc_100001110;
when hOGT=dnOGT1 do {hOGT'=0, k'=k+1} goto loc_100000010;
when hOGA=dnOGA1 do {hOGA'=0, k'=k+1} goto loc_100000100;
--when hCMYC=dpCMYC0 do {hCMYC'=0, k'=k+1} goto loc_100000111;

-- for the configuration 1,0,0,0,0,0,1,1,1
loc loc_100000111: while hNFKB >=  dnNFKB1 & hP21 <=  dpP210 & hP53 <=  dpP530 & hOGA >=  dnOGA1  wait {dhNFKB=1,dhP21=1,dhFOXM=0,dhPI3K=1,dhP53=1,dhMDM2=1,dhOGT=0,dhOGA=1,dhCMYC=0}
when hNFKB=dnNFKB1 do {hNFKB'=0, k'=k+1} goto loc_000000111;
when hP21=dpP210 do {hP21'=0, k'=k+1} goto loc_110000111;
--when hPI3K=dpPI3K0 do {hPI3K'=0, k'=k+1} goto loc_100100111;
when hP53=dpP530 do {hP53'=0, k'=k+1} goto loc_100010111;
--when hMDM2=dpMDM20 do {hMDM2'=0, k'=k+1} goto loc_100001111;
when hOGA=dnOGA1 do {hOGA'=0, k'=k+1} goto loc_100000101;

-- for the configuration 1,0,0,0,0,1,0,0,0
loc loc_100001000: while hNFKB >=  dnNFKB1 & hP21 <=  dpP210 & hPI3K <=  dpPI3K0 & hP53 <=  dpP530 & hMDM2 >=  dnMDM21 & hOGA <=  dpOGA0  wait {dhNFKB=1,dhP21=1,dhFOXM=0,dhPI3K=1,dhP53=1,dhMDM2=1,dhOGT=0,dhOGA=1,dhCMYC=0}
when hNFKB=dnNFKB1 do {hNFKB'=0, k'=k+1} goto loc_000001000;
when hP21=dpP210 do {hP21'=0, k'=k+1} goto loc_110001000;
when hPI3K=dpPI3K0 do {hPI3K'=0, k'=k+1} goto loc_100101000;
when hP53=dpP530 do {hP53'=0, k'=k+1} goto loc_100011000;
when hMDM2=dnMDM21 do {hMDM2'=0, k'=k+1} goto loc_100000000;
when hOGA=dpOGA0 do {hOGA'=0, k'=k+1} goto loc_100001010;

-- for the configuration 1,0,0,0,0,1,0,0,1
loc loc_100001001: while hNFKB >=  dnNFKB1 & hP21 <=  dpP210 & hPI3K <=  dpPI3K0 & hP53 <=  dpP530 & hMDM2 >=  dnMDM21 & hOGT <=  dpOGT0 & hOGA <=  dpOGA0 & hCMYC >=  dnCMYC1  wait {dhNFKB=1,dhP21=1,dhFOXM=0,dhPI3K=1,dhP53=1,dhMDM2=1,dhOGT=1,dhOGA=1,dhCMYC=1}
when hNFKB=dnNFKB1 do {hNFKB'=0, k'=k+1} goto loc_000001001;
when hP21=dpP210 do {hP21'=0, k'=k+1} goto loc_110001001;
when hPI3K=dpPI3K0 do {hPI3K'=0, k'=k+1} goto loc_100101001;
when hP53=dpP530 do {hP53'=0, k'=k+1} goto loc_100011001;
when hMDM2=dnMDM21 do {hMDM2'=0, k'=k+1} goto loc_100000001;
when hOGT=dpOGT0 do {hOGT'=0, k'=k+1} goto loc_100001101;
when hOGA=dpOGA0 do {hOGA'=0, k'=k+1} goto loc_100001011;
when hCMYC=dnCMYC1 do {hCMYC'=0, k'=k+1} goto loc_100001000;

-- for the configuration 1,0,0,0,0,1,0,1,0
loc loc_100001010: while hNFKB >=  dnNFKB1 & hP21 <=  dpP210 & hPI3K <=  dpPI3K0 & hP53 <=  dpP530 & hMDM2 >=  dnMDM21  wait {dhNFKB=1,dhP21=1,dhFOXM=0,dhPI3K=1,dhP53=1,dhMDM2=1,dhOGT=0,dhOGA=0,dhCMYC=0}
when hNFKB=dnNFKB1 do {hNFKB'=0, k'=k+1} goto loc_000001010;
when hP21=dpP210 do {hP21'=0, k'=k+1} goto loc_110001010;
when hPI3K=dpPI3K0 do {hPI3K'=0, k'=k+1} goto loc_100101010;
when hP53=dpP530 do {hP53'=0, k'=k+1} goto loc_100011010;
when hMDM2=dnMDM21 do {hMDM2'=0, k'=k+1} goto loc_100000010;

-- for the configuration 1,0,0,0,0,1,0,1,1
loc loc_100001011: while hNFKB >=  dnNFKB1 & hP21 <=  dpP210 & hPI3K <=  dpPI3K0 & hP53 <=  dpP530 & hMDM2 >=  dnMDM21 & hOGT <=  dpOGT0 & hCMYC >=  dnCMYC1  wait {dhNFKB=1,dhP21=1,dhFOXM=0,dhPI3K=1,dhP53=1,dhMDM2=1,dhOGT=1,dhOGA=-1,dhCMYC=1}
when hNFKB=dnNFKB1 do {hNFKB'=0, k'=k+1} goto loc_000001011;
when hP21=dpP210 do {hP21'=0, k'=k+1} goto loc_110001011;
when hPI3K=dpPI3K0 do {hPI3K'=0, k'=k+1} goto loc_100101011;
when hP53=dpP530 do {hP53'=0, k'=k+1} goto loc_100011011;
when hMDM2=dnMDM21 do {hMDM2'=0, k'=k+1} goto loc_100000011;
when hOGT=dpOGT0 do {hOGT'=0, k'=k+1} goto loc_100001111;
--when hOGA=dnOGA1 do {hOGA'=0, k'=k+1} goto loc_100001001;
when hCMYC=dnCMYC1 do {hCMYC'=0, k'=k+1} goto loc_100001010;

-- for the configuration 1,0,0,0,0,1,1,0,0
loc loc_100001100: while hNFKB >=  dnNFKB1 & hP21 <=  dpP210 & hP53 <=  dpP530 & hMDM2 >=  dnMDM21 & hOGT >=  dnOGT1  wait {dhNFKB=1,dhP21=1,dhFOXM=0,dhPI3K=1,dhP53=1,dhMDM2=1,dhOGT=1,dhOGA=1,dhCMYC=1}
when hNFKB=dnNFKB1 do {hNFKB'=0, k'=k+1} goto loc_000001100;
when hP21=dpP210 do {hP21'=0, k'=k+1} goto loc_110001100;
--when hPI3K=dpPI3K0 do {hPI3K'=0, k'=k+1} goto loc_100101100;
when hP53=dpP530 do {hP53'=0, k'=k+1} goto loc_100011100;
when hMDM2=dnMDM21 do {hMDM2'=0, k'=k+1} goto loc_100000100;
when hOGT=dnOGT1 do {hOGT'=0, k'=k+1} goto loc_100001000;
--when hOGA=dpOGA0 do {hOGA'=0, k'=k+1} goto loc_100001110;
--when hCMYC=dpCMYC0 do {hCMYC'=0, k'=k+1} goto loc_100001101;

-- for the configuration 1,0,0,0,0,1,1,0,1
loc loc_100001101: while hNFKB >=  dnNFKB1 & hP21 <=  dpP210 & hP53 <=  dpP530 & hMDM2 >=  dnMDM21  wait {dhNFKB=1,dhP21=1,dhFOXM=0,dhPI3K=1,dhP53=1,dhMDM2=1,dhOGT=0,dhOGA=0,dhCMYC=0}
when hNFKB=dnNFKB1 do {hNFKB'=0, k'=k+1} goto loc_000001101;
when hP21=dpP210 do {hP21'=0, k'=k+1} goto loc_110001101;
--when hPI3K=dpPI3K0 do {hPI3K'=0, k'=k+1} goto loc_100101101;
when hP53=dpP530 do {hP53'=0, k'=k+1} goto loc_100011101;
when hMDM2=dnMDM21 do {hMDM2'=0, k'=k+1} goto loc_100000101;

-- for the configuration 1,0,0,0,0,1,1,1,0
loc loc_100001110: while hNFKB >=  dnNFKB1 & hP21 <=  dpP210 & hP53 <=  dpP530 & hMDM2 >=  dnMDM21 & hOGT >=  dnOGT1 & hOGA >=  dnOGA1  wait {dhNFKB=1,dhP21=1,dhFOXM=0,dhPI3K=1,dhP53=1,dhMDM2=1,dhOGT=1,dhOGA=1,dhCMYC=1}
when hNFKB=dnNFKB1 do {hNFKB'=0, k'=k+1} goto loc_000001110;
when hP21=dpP210 do {hP21'=0, k'=k+1} goto loc_110001110;
--when hPI3K=dpPI3K0 do {hPI3K'=0, k'=k+1} goto loc_100101110;
when hP53=dpP530 do {hP53'=0, k'=k+1} goto loc_100011110;
when hMDM2=dnMDM21 do {hMDM2'=0, k'=k+1} goto loc_100000110;
when hOGT=dnOGT1 do {hOGT'=0, k'=k+1} goto loc_100001010;
when hOGA=dnOGA1 do {hOGA'=0, k'=k+1} goto loc_100001100;
--when hCMYC=dpCMYC0 do {hCMYC'=0, k'=k+1} goto loc_100001111;

-- for the configuration 1,0,0,0,0,1,1,1,1
loc loc_100001111: while hNFKB >=  dnNFKB1 & hP21 <=  dpP210 & hP53 <=  dpP530 & hMDM2 >=  dnMDM21 & hOGA >=  dnOGA1  wait {dhNFKB=1,dhP21=1,dhFOXM=0,dhPI3K=1,dhP53=1,dhMDM2=1,dhOGT=0,dhOGA=1,dhCMYC=0}
when hNFKB=dnNFKB1 do {hNFKB'=0, k'=k+1} goto loc_000001111;
when hP21=dpP210 do {hP21'=0, k'=k+1} goto loc_110001111;
--when hPI3K=dpPI3K0 do {hPI3K'=0, k'=k+1} goto loc_100101111;
when hP53=dpP530 do {hP53'=0, k'=k+1} goto loc_100011111;
when hMDM2=dnMDM21 do {hMDM2'=0, k'=k+1} goto loc_100000111;
when hOGA=dnOGA1 do {hOGA'=0, k'=k+1} goto loc_100001101;

-- for the configuration 1,0,0,0,1,0,0,0,0
loc loc_100010000: while hNFKB >=  dnNFKB1 & hMDM2 <=  dpMDM20 & hOGA <=  dpOGA0  wait {dhNFKB=1,dhP21=0,dhFOXM=0,dhPI3K=0,dhP53=0,dhMDM2=1,dhOGT=0,dhOGA=1,dhCMYC=0}
when hNFKB=dnNFKB1 do {hNFKB'=0, k'=k+1} goto loc_000010000;
when hMDM2=dpMDM20 do {hMDM2'=0, k'=k+1} goto loc_100011000;
when hOGA=dpOGA0 do {hOGA'=0, k'=k+1} goto loc_100010010;

-- for the configuration 1,0,0,0,1,0,0,0,1
loc loc_100010001: while hNFKB >=  dnNFKB1 & hMDM2 <=  dpMDM20 & hOGT <=  dpOGT0 & hOGA <=  dpOGA0 & hCMYC >=  dnCMYC1  wait {dhNFKB=1,dhP21=0,dhFOXM=0,dhPI3K=1,dhP53=0,dhMDM2=1,dhOGT=1,dhOGA=1,dhCMYC=1}
when hNFKB=dnNFKB1 do {hNFKB'=0, k'=k+1} goto loc_000010001;
--when hPI3K=dpPI3K0 do {hPI3K'=0, k'=k+1} goto loc_100110001;
when hMDM2=dpMDM20 do {hMDM2'=0, k'=k+1} goto loc_100011001;
when hOGT=dpOGT0 do {hOGT'=0, k'=k+1} goto loc_100010101;
when hOGA=dpOGA0 do {hOGA'=0, k'=k+1} goto loc_100010011;
when hCMYC=dnCMYC1 do {hCMYC'=0, k'=k+1} goto loc_100010000;

-- for the configuration 1,0,0,0,1,0,0,1,0
loc loc_100010010: while hNFKB >=  dnNFKB1 & hMDM2 <=  dpMDM20  wait {dhNFKB=1,dhP21=0,dhFOXM=0,dhPI3K=0,dhP53=0,dhMDM2=1,dhOGT=0,dhOGA=0,dhCMYC=0}
when hNFKB=dnNFKB1 do {hNFKB'=0, k'=k+1} goto loc_000010010;
when hMDM2=dpMDM20 do {hMDM2'=0, k'=k+1} goto loc_100011010;

-- for the configuration 1,0,0,0,1,0,0,1,1
loc loc_100010011: while hNFKB >=  dnNFKB1 & hMDM2 <=  dpMDM20 & hOGT <=  dpOGT0 & hCMYC >=  dnCMYC1  wait {dhNFKB=1,dhP21=0,dhFOXM=0,dhPI3K=1,dhP53=0,dhMDM2=1,dhOGT=1,dhOGA=-1,dhCMYC=1}
when hNFKB=dnNFKB1 do {hNFKB'=0, k'=k+1} goto loc_000010011;
--when hPI3K=dpPI3K0 do {hPI3K'=0, k'=k+1} goto loc_100110011;
when hMDM2=dpMDM20 do {hMDM2'=0, k'=k+1} goto loc_100011011;
when hOGT=dpOGT0 do {hOGT'=0, k'=k+1} goto loc_100010111;
--when hOGA=dnOGA1 do {hOGA'=0, k'=k+1} goto loc_100010001;
when hCMYC=dnCMYC1 do {hCMYC'=0, k'=k+1} goto loc_100010010;

-- for the configuration 1,0,0,0,1,0,1,0,0
loc loc_100010100: while hNFKB >=  dnNFKB1 & hPI3K <=  dpPI3K0 & hMDM2 <=  dpMDM20 & hOGT >=  dnOGT1 & hCMYC <=  dpCMYC0  wait {dhNFKB=1,dhP21=1,dhFOXM=1,dhPI3K=1,dhP53=0,dhMDM2=1,dhOGT=1,dhOGA=1,dhCMYC=1}
when hNFKB=dnNFKB1 do {hNFKB'=0, k'=k+1} goto loc_000010100;
--when hP21=dpP210 do {hP21'=0, k'=k+1} goto loc_110010100;
--when hFOXM=dpFOXM0 do {hFOXM'=0, k'=k+1} goto loc_101010100;
when hPI3K=dpPI3K0 do {hPI3K'=0, k'=k+1} goto loc_100110100;
when hMDM2=dpMDM20 do {hMDM2'=0, k'=k+1} goto loc_100011100;
when hOGT=dnOGT1 do {hOGT'=0, k'=k+1} goto loc_100010000;
--when hOGA=dpOGA0 do {hOGA'=0, k'=k+1} goto loc_100010110;
when hCMYC=dpCMYC0 do {hCMYC'=0, k'=k+1} goto loc_100010101;

-- for the configuration 1,0,0,0,1,0,1,0,1
loc loc_100010101: while hNFKB >=  dnNFKB1 & hPI3K <=  dpPI3K0 & hMDM2 <=  dpMDM20  wait {dhNFKB=1,dhP21=1,dhFOXM=1,dhPI3K=1,dhP53=0,dhMDM2=1,dhOGT=0,dhOGA=0,dhCMYC=0}
when hNFKB=dnNFKB1 do {hNFKB'=0, k'=k+1} goto loc_000010101;
--when hP21=dpP210 do {hP21'=0, k'=k+1} goto loc_110010101;
--when hFOXM=dpFOXM0 do {hFOXM'=0, k'=k+1} goto loc_101010101;
when hPI3K=dpPI3K0 do {hPI3K'=0, k'=k+1} goto loc_100110101;
when hMDM2=dpMDM20 do {hMDM2'=0, k'=k+1} goto loc_100011101;

-- for the configuration 1,0,0,0,1,0,1,1,0
loc loc_100010110: while hNFKB >=  dnNFKB1 & hPI3K <=  dpPI3K0 & hMDM2 <=  dpMDM20 & hOGT >=  dnOGT1 & hOGA >=  dnOGA1 & hCMYC <=  dpCMYC0  wait {dhNFKB=1,dhP21=1,dhFOXM=1,dhPI3K=1,dhP53=0,dhMDM2=1,dhOGT=1,dhOGA=1,dhCMYC=1}
when hNFKB=dnNFKB1 do {hNFKB'=0, k'=k+1} goto loc_000010110;
--when hP21=dpP210 do {hP21'=0, k'=k+1} goto loc_110010110;
--when hFOXM=dpFOXM0 do {hFOXM'=0, k'=k+1} goto loc_101010110;
when hPI3K=dpPI3K0 do {hPI3K'=0, k'=k+1} goto loc_100110110;
when hMDM2=dpMDM20 do {hMDM2'=0, k'=k+1} goto loc_100011110;
when hOGT=dnOGT1 do {hOGT'=0, k'=k+1} goto loc_100010010;
when hOGA=dnOGA1 do {hOGA'=0, k'=k+1} goto loc_100010100;
when hCMYC=dpCMYC0 do {hCMYC'=0, k'=k+1} goto loc_100010111;

-- for the configuration 1,0,0,0,1,0,1,1,1
loc loc_100010111: while hNFKB >=  dnNFKB1 & hPI3K <=  dpPI3K0 & hMDM2 <=  dpMDM20 & hOGA >=  dnOGA1  wait {dhNFKB=1,dhP21=1,dhFOXM=1,dhPI3K=1,dhP53=0,dhMDM2=1,dhOGT=0,dhOGA=1,dhCMYC=0}
when hNFKB=dnNFKB1 do {hNFKB'=0, k'=k+1} goto loc_000010111;
--when hP21=dpP210 do {hP21'=0, k'=k+1} goto loc_110010111;
--when hFOXM=dpFOXM0 do {hFOXM'=0, k'=k+1} goto loc_101010111;
when hPI3K=dpPI3K0 do {hPI3K'=0, k'=k+1} goto loc_100110111;
when hMDM2=dpMDM20 do {hMDM2'=0, k'=k+1} goto loc_100011111;
when hOGA=dnOGA1 do {hOGA'=0, k'=k+1} goto loc_100010101;

-- for the configuration 1,0,0,0,1,1,0,0,0
loc loc_100011000: while hNFKB >=  dnNFKB1 & hOGA <=  dpOGA0  wait {dhNFKB=1,dhP21=0,dhFOXM=0,dhPI3K=0,dhP53=-1,dhMDM2=0,dhOGT=0,dhOGA=1,dhCMYC=0}
when hNFKB=dnNFKB1 do {hNFKB'=0, k'=k+1} goto loc_000011000;
--when hP53=dnP531 do {hP53'=0, k'=k+1} goto loc_100001000;
when hOGA=dpOGA0 do {hOGA'=0, k'=k+1} goto loc_100011010;

-- for the configuration 1,0,0,0,1,1,0,0,1
loc loc_100011001: while hNFKB >=  dnNFKB1 & hOGT <=  dpOGT0 & hOGA <=  dpOGA0 & hCMYC >=  dnCMYC1  wait {dhNFKB=1,dhP21=0,dhFOXM=0,dhPI3K=1,dhP53=-1,dhMDM2=0,dhOGT=1,dhOGA=1,dhCMYC=1}
when hNFKB=dnNFKB1 do {hNFKB'=0, k'=k+1} goto loc_000011001;
--when hPI3K=dpPI3K0 do {hPI3K'=0, k'=k+1} goto loc_100111001;
--when hP53=dnP531 do {hP53'=0, k'=k+1} goto loc_100001001;
when hOGT=dpOGT0 do {hOGT'=0, k'=k+1} goto loc_100011101;
when hOGA=dpOGA0 do {hOGA'=0, k'=k+1} goto loc_100011011;
when hCMYC=dnCMYC1 do {hCMYC'=0, k'=k+1} goto loc_100011000;

-- for the configuration 1,0,0,0,1,1,0,1,0
loc loc_100011010: while hNFKB >=  dnNFKB1  wait {dhNFKB=1,dhP21=0,dhFOXM=0,dhPI3K=0,dhP53=-1,dhMDM2=0,dhOGT=0,dhOGA=0,dhCMYC=0}
when hNFKB=dnNFKB1 do {hNFKB'=0, k'=k+1} goto loc_000011010;
--when hP53=dnP531 do {hP53'=0, k'=k+1} goto loc_100001010;

-- for the configuration 1,0,0,0,1,1,0,1,1
loc loc_100011011: while hNFKB >=  dnNFKB1 & hOGT <=  dpOGT0 & hCMYC >=  dnCMYC1  wait {dhNFKB=1,dhP21=0,dhFOXM=0,dhPI3K=1,dhP53=-1,dhMDM2=0,dhOGT=1,dhOGA=-1,dhCMYC=1}
when hNFKB=dnNFKB1 do {hNFKB'=0, k'=k+1} goto loc_000011011;
--when hPI3K=dpPI3K0 do {hPI3K'=0, k'=k+1} goto loc_100111011;
--when hP53=dnP531 do {hP53'=0, k'=k+1} goto loc_100001011;
when hOGT=dpOGT0 do {hOGT'=0, k'=k+1} goto loc_100011111;
--when hOGA=dnOGA1 do {hOGA'=0, k'=k+1} goto loc_100011001;
when hCMYC=dnCMYC1 do {hCMYC'=0, k'=k+1} goto loc_100011010;

-- for the configuration 1,0,0,0,1,1,1,0,0
loc loc_100011100: while hNFKB >=  dnNFKB1 & hPI3K <=  dpPI3K0 & hOGT >=  dnOGT1 & hCMYC <=  dpCMYC0  wait {dhNFKB=1,dhP21=1,dhFOXM=1,dhPI3K=1,dhP53=-1,dhMDM2=0,dhOGT=1,dhOGA=1,dhCMYC=1}
when hNFKB=dnNFKB1 do {hNFKB'=0, k'=k+1} goto loc_000011100;
--when hP21=dpP210 do {hP21'=0, k'=k+1} goto loc_110011100;
--when hFOXM=dpFOXM0 do {hFOXM'=0, k'=k+1} goto loc_101011100;
when hPI3K=dpPI3K0 do {hPI3K'=0, k'=k+1} goto loc_100111100;
--when hP53=dnP531 do {hP53'=0, k'=k+1} goto loc_100001100;
when hOGT=dnOGT1 do {hOGT'=0, k'=k+1} goto loc_100011000;
--when hOGA=dpOGA0 do {hOGA'=0, k'=k+1} goto loc_100011110;
when hCMYC=dpCMYC0 do {hCMYC'=0, k'=k+1} goto loc_100011101;

-- for the configuration 1,0,0,0,1,1,1,0,1
loc loc_100011101: while hNFKB >=  dnNFKB1 & hPI3K <=  dpPI3K0  wait {dhNFKB=1,dhP21=1,dhFOXM=1,dhPI3K=1,dhP53=-1,dhMDM2=0,dhOGT=0,dhOGA=0,dhCMYC=0}
when hNFKB=dnNFKB1 do {hNFKB'=0, k'=k+1} goto loc_000011101;
--when hP21=dpP210 do {hP21'=0, k'=k+1} goto loc_110011101;
--when hFOXM=dpFOXM0 do {hFOXM'=0, k'=k+1} goto loc_101011101;
when hPI3K=dpPI3K0 do {hPI3K'=0, k'=k+1} goto loc_100111101;
--when hP53=dnP531 do {hP53'=0, k'=k+1} goto loc_100001101;

-- for the configuration 1,0,0,0,1,1,1,1,0
loc loc_100011110: while hNFKB >=  dnNFKB1 & hPI3K <=  dpPI3K0 & hOGT >=  dnOGT1 & hOGA >=  dnOGA1 & hCMYC <=  dpCMYC0  wait {dhNFKB=1,dhP21=1,dhFOXM=1,dhPI3K=1,dhP53=-1,dhMDM2=0,dhOGT=1,dhOGA=1,dhCMYC=1}
when hNFKB=dnNFKB1 do {hNFKB'=0, k'=k+1} goto loc_000011110;
--when hP21=dpP210 do {hP21'=0, k'=k+1} goto loc_110011110;
--when hFOXM=dpFOXM0 do {hFOXM'=0, k'=k+1} goto loc_101011110;
when hPI3K=dpPI3K0 do {hPI3K'=0, k'=k+1} goto loc_100111110;
--when hP53=dnP531 do {hP53'=0, k'=k+1} goto loc_100001110;
when hOGT=dnOGT1 do {hOGT'=0, k'=k+1} goto loc_100011010;
when hOGA=dnOGA1 do {hOGA'=0, k'=k+1} goto loc_100011100;
when hCMYC=dpCMYC0 do {hCMYC'=0, k'=k+1} goto loc_100011111;

-- for the configuration 1,0,0,0,1,1,1,1,1
loc loc_100011111: while hNFKB >=  dnNFKB1 & hPI3K <=  dpPI3K0 & hOGA >=  dnOGA1  wait {dhNFKB=1,dhP21=1,dhFOXM=1,dhPI3K=1,dhP53=-1,dhMDM2=0,dhOGT=0,dhOGA=1,dhCMYC=0}
when hNFKB=dnNFKB1 do {hNFKB'=0, k'=k+1} goto loc_000011111;
--when hP21=dpP210 do {hP21'=0, k'=k+1} goto loc_110011111;
--when hFOXM=dpFOXM0 do {hFOXM'=0, k'=k+1} goto loc_101011111;
when hPI3K=dpPI3K0 do {hPI3K'=0, k'=k+1} goto loc_100111111;
--when hP53=dnP531 do {hP53'=0, k'=k+1} goto loc_100001111;
when hOGA=dnOGA1 do {hOGA'=0, k'=k+1} goto loc_100011101;

-- for the configuration 1,0,0,1,0,0,0,0,0
loc loc_100100000: while hP53 <=  dpP530 & hOGA <=  dpOGA0  wait {dhNFKB=0,dhP21=1,dhFOXM=1,dhPI3K=-1,dhP53=1,dhMDM2=1,dhOGT=0,dhOGA=1,dhCMYC=0}
--when hP21=dpP210 do {hP21'=0, k'=k+1} goto loc_110100000;
--when hFOXM=dpFOXM0 do {hFOXM'=0, k'=k+1} goto loc_101100000;
--when hPI3K=dnPI3K1 do {hPI3K'=0, k'=k+1} goto loc_100000000;
when hP53=dpP530 do {hP53'=0, k'=k+1} goto loc_100110000;
--when hMDM2=dpMDM20 do {hMDM2'=0, k'=k+1} goto loc_100101000;
when hOGA=dpOGA0 do {hOGA'=0, k'=k+1} goto loc_100100010;

-- for the configuration 1,0,0,1,0,0,0,0,1
loc loc_100100001: while hP53 <=  dpP530 & hOGT <=  dpOGT0 & hOGA <=  dpOGA0 & hCMYC >=  dnCMYC1  wait {dhNFKB=0,dhP21=1,dhFOXM=1,dhPI3K=-1,dhP53=1,dhMDM2=1,dhOGT=1,dhOGA=1,dhCMYC=1}
--when hP21=dpP210 do {hP21'=0, k'=k+1} goto loc_110100001;
--when hFOXM=dpFOXM0 do {hFOXM'=0, k'=k+1} goto loc_101100001;
--when hPI3K=dnPI3K1 do {hPI3K'=0, k'=k+1} goto loc_100000001;
when hP53=dpP530 do {hP53'=0, k'=k+1} goto loc_100110001;
--when hMDM2=dpMDM20 do {hMDM2'=0, k'=k+1} goto loc_100101001;
when hOGT=dpOGT0 do {hOGT'=0, k'=k+1} goto loc_100100101;
when hOGA=dpOGA0 do {hOGA'=0, k'=k+1} goto loc_100100011;
when hCMYC=dnCMYC1 do {hCMYC'=0, k'=k+1} goto loc_100100000;

-- for the configuration 1,0,0,1,0,0,0,1,0
loc loc_100100010: while hP53 <=  dpP530  wait {dhNFKB=0,dhP21=1,dhFOXM=1,dhPI3K=-1,dhP53=1,dhMDM2=1,dhOGT=0,dhOGA=0,dhCMYC=0}
--when hP21=dpP210 do {hP21'=0, k'=k+1} goto loc_110100010;
--when hFOXM=dpFOXM0 do {hFOXM'=0, k'=k+1} goto loc_101100010;
--when hPI3K=dnPI3K1 do {hPI3K'=0, k'=k+1} goto loc_100000010;
when hP53=dpP530 do {hP53'=0, k'=k+1} goto loc_100110010;
--when hMDM2=dpMDM20 do {hMDM2'=0, k'=k+1} goto loc_100101010;

-- for the configuration 1,0,0,1,0,0,0,1,1
loc loc_100100011: while hP53 <=  dpP530 & hOGT <=  dpOGT0 & hCMYC >=  dnCMYC1  wait {dhNFKB=0,dhP21=1,dhFOXM=1,dhPI3K=-1,dhP53=1,dhMDM2=1,dhOGT=1,dhOGA=-1,dhCMYC=1}
--when hP21=dpP210 do {hP21'=0, k'=k+1} goto loc_110100011;
--when hFOXM=dpFOXM0 do {hFOXM'=0, k'=k+1} goto loc_101100011;
--when hPI3K=dnPI3K1 do {hPI3K'=0, k'=k+1} goto loc_100000011;
when hP53=dpP530 do {hP53'=0, k'=k+1} goto loc_100110011;
--when hMDM2=dpMDM20 do {hMDM2'=0, k'=k+1} goto loc_100101011;
when hOGT=dpOGT0 do {hOGT'=0, k'=k+1} goto loc_100100111;
--when hOGA=dnOGA1 do {hOGA'=0, k'=k+1} goto loc_100100001;
when hCMYC=dnCMYC1 do {hCMYC'=0, k'=k+1} goto loc_100100010;

-- for the configuration 1,0,0,1,0,0,1,0,0
loc loc_100100100: while hP53 <=  dpP530 & hOGT >=  dnOGT1  wait {dhNFKB=0,dhP21=1,dhFOXM=1,dhPI3K=0,dhP53=1,dhMDM2=1,dhOGT=1,dhOGA=1,dhCMYC=1}
--when hP21=dpP210 do {hP21'=0, k'=k+1} goto loc_110100100;
--when hFOXM=dpFOXM0 do {hFOXM'=0, k'=k+1} goto loc_101100100;
when hP53=dpP530 do {hP53'=0, k'=k+1} goto loc_100110100;
--when hMDM2=dpMDM20 do {hMDM2'=0, k'=k+1} goto loc_100101100;
when hOGT=dnOGT1 do {hOGT'=0, k'=k+1} goto loc_100100000;
--when hOGA=dpOGA0 do {hOGA'=0, k'=k+1} goto loc_100100110;
--when hCMYC=dpCMYC0 do {hCMYC'=0, k'=k+1} goto loc_100100101;

-- for the configuration 1,0,0,1,0,0,1,0,1
loc loc_100100101: while hP53 <=  dpP530  wait {dhNFKB=0,dhP21=1,dhFOXM=1,dhPI3K=0,dhP53=1,dhMDM2=1,dhOGT=0,dhOGA=0,dhCMYC=0}
--when hP21=dpP210 do {hP21'=0, k'=k+1} goto loc_110100101;
--when hFOXM=dpFOXM0 do {hFOXM'=0, k'=k+1} goto loc_101100101;
when hP53=dpP530 do {hP53'=0, k'=k+1} goto loc_100110101;
--when hMDM2=dpMDM20 do {hMDM2'=0, k'=k+1} goto loc_100101101;

-- for the configuration 1,0,0,1,0,0,1,1,0
loc loc_100100110: while hP53 <=  dpP530 & hOGT >=  dnOGT1 & hOGA >=  dnOGA1  wait {dhNFKB=0,dhP21=1,dhFOXM=1,dhPI3K=0,dhP53=1,dhMDM2=1,dhOGT=1,dhOGA=1,dhCMYC=1}
--when hP21=dpP210 do {hP21'=0, k'=k+1} goto loc_110100110;
--when hFOXM=dpFOXM0 do {hFOXM'=0, k'=k+1} goto loc_101100110;
when hP53=dpP530 do {hP53'=0, k'=k+1} goto loc_100110110;
--when hMDM2=dpMDM20 do {hMDM2'=0, k'=k+1} goto loc_100101110;
when hOGT=dnOGT1 do {hOGT'=0, k'=k+1} goto loc_100100010;
when hOGA=dnOGA1 do {hOGA'=0, k'=k+1} goto loc_100100100;
--when hCMYC=dpCMYC0 do {hCMYC'=0, k'=k+1} goto loc_100100111;

-- for the configuration 1,0,0,1,0,0,1,1,1
loc loc_100100111: while hP53 <=  dpP530 & hOGA >=  dnOGA1  wait {dhNFKB=0,dhP21=1,dhFOXM=1,dhPI3K=0,dhP53=1,dhMDM2=1,dhOGT=0,dhOGA=1,dhCMYC=0}
--when hP21=dpP210 do {hP21'=0, k'=k+1} goto loc_110100111;
--when hFOXM=dpFOXM0 do {hFOXM'=0, k'=k+1} goto loc_101100111;
when hP53=dpP530 do {hP53'=0, k'=k+1} goto loc_100110111;
--when hMDM2=dpMDM20 do {hMDM2'=0, k'=k+1} goto loc_100101111;
when hOGA=dnOGA1 do {hOGA'=0, k'=k+1} goto loc_100100101;

-- for the configuration 1,0,0,1,0,1,0,0,0
loc loc_100101000: while hP53 <=  dpP530 & hMDM2 >=  dnMDM21 & hOGA <=  dpOGA0  wait {dhNFKB=0,dhP21=1,dhFOXM=1,dhPI3K=-1,dhP53=1,dhMDM2=1,dhOGT=0,dhOGA=1,dhCMYC=0}
--when hP21=dpP210 do {hP21'=0, k'=k+1} goto loc_110101000;
--when hFOXM=dpFOXM0 do {hFOXM'=0, k'=k+1} goto loc_101101000;
--when hPI3K=dnPI3K1 do {hPI3K'=0, k'=k+1} goto loc_100001000;
when hP53=dpP530 do {hP53'=0, k'=k+1} goto loc_100111000;
when hMDM2=dnMDM21 do {hMDM2'=0, k'=k+1} goto loc_100100000;
when hOGA=dpOGA0 do {hOGA'=0, k'=k+1} goto loc_100101010;

-- for the configuration 1,0,0,1,0,1,0,0,1
loc loc_100101001: while hP53 <=  dpP530 & hMDM2 >=  dnMDM21 & hOGT <=  dpOGT0 & hOGA <=  dpOGA0 & hCMYC >=  dnCMYC1  wait {dhNFKB=0,dhP21=1,dhFOXM=1,dhPI3K=-1,dhP53=1,dhMDM2=1,dhOGT=1,dhOGA=1,dhCMYC=1}
--when hP21=dpP210 do {hP21'=0, k'=k+1} goto loc_110101001;
--when hFOXM=dpFOXM0 do {hFOXM'=0, k'=k+1} goto loc_101101001;
--when hPI3K=dnPI3K1 do {hPI3K'=0, k'=k+1} goto loc_100001001;
when hP53=dpP530 do {hP53'=0, k'=k+1} goto loc_100111001;
when hMDM2=dnMDM21 do {hMDM2'=0, k'=k+1} goto loc_100100001;
when hOGT=dpOGT0 do {hOGT'=0, k'=k+1} goto loc_100101101;
when hOGA=dpOGA0 do {hOGA'=0, k'=k+1} goto loc_100101011;
when hCMYC=dnCMYC1 do {hCMYC'=0, k'=k+1} goto loc_100101000;

-- for the configuration 1,0,0,1,0,1,0,1,0
loc loc_100101010: while hP53 <=  dpP530 & hMDM2 >=  dnMDM21  wait {dhNFKB=0,dhP21=1,dhFOXM=1,dhPI3K=-1,dhP53=1,dhMDM2=1,dhOGT=0,dhOGA=0,dhCMYC=0}
--when hP21=dpP210 do {hP21'=0, k'=k+1} goto loc_110101010;
--when hFOXM=dpFOXM0 do {hFOXM'=0, k'=k+1} goto loc_101101010;
--when hPI3K=dnPI3K1 do {hPI3K'=0, k'=k+1} goto loc_100001010;
when hP53=dpP530 do {hP53'=0, k'=k+1} goto loc_100111010;
when hMDM2=dnMDM21 do {hMDM2'=0, k'=k+1} goto loc_100100010;

-- for the configuration 1,0,0,1,0,1,0,1,1
loc loc_100101011: while hP53 <=  dpP530 & hMDM2 >=  dnMDM21 & hOGT <=  dpOGT0 & hCMYC >=  dnCMYC1  wait {dhNFKB=0,dhP21=1,dhFOXM=1,dhPI3K=-1,dhP53=1,dhMDM2=1,dhOGT=1,dhOGA=-1,dhCMYC=1}
--when hP21=dpP210 do {hP21'=0, k'=k+1} goto loc_110101011;
--when hFOXM=dpFOXM0 do {hFOXM'=0, k'=k+1} goto loc_101101011;
--when hPI3K=dnPI3K1 do {hPI3K'=0, k'=k+1} goto loc_100001011;
when hP53=dpP530 do {hP53'=0, k'=k+1} goto loc_100111011;
when hMDM2=dnMDM21 do {hMDM2'=0, k'=k+1} goto loc_100100011;
when hOGT=dpOGT0 do {hOGT'=0, k'=k+1} goto loc_100101111;
--when hOGA=dnOGA1 do {hOGA'=0, k'=k+1} goto loc_100101001;
when hCMYC=dnCMYC1 do {hCMYC'=0, k'=k+1} goto loc_100101010;

-- for the configuration 1,0,0,1,0,1,1,0,0
loc loc_100101100: while hP53 <=  dpP530 & hMDM2 >=  dnMDM21 & hOGT >=  dnOGT1  wait {dhNFKB=0,dhP21=1,dhFOXM=1,dhPI3K=0,dhP53=1,dhMDM2=1,dhOGT=1,dhOGA=1,dhCMYC=1}
--when hP21=dpP210 do {hP21'=0, k'=k+1} goto loc_110101100;
--when hFOXM=dpFOXM0 do {hFOXM'=0, k'=k+1} goto loc_101101100;
when hP53=dpP530 do {hP53'=0, k'=k+1} goto loc_100111100;
when hMDM2=dnMDM21 do {hMDM2'=0, k'=k+1} goto loc_100100100;
when hOGT=dnOGT1 do {hOGT'=0, k'=k+1} goto loc_100101000;
--when hOGA=dpOGA0 do {hOGA'=0, k'=k+1} goto loc_100101110;
--when hCMYC=dpCMYC0 do {hCMYC'=0, k'=k+1} goto loc_100101101;

-- for the configuration 1,0,0,1,0,1,1,0,1
loc loc_100101101: while hP53 <=  dpP530 & hMDM2 >=  dnMDM21  wait {dhNFKB=0,dhP21=1,dhFOXM=1,dhPI3K=0,dhP53=1,dhMDM2=1,dhOGT=0,dhOGA=0,dhCMYC=0}
--when hP21=dpP210 do {hP21'=0, k'=k+1} goto loc_110101101;
--when hFOXM=dpFOXM0 do {hFOXM'=0, k'=k+1} goto loc_101101101;
when hP53=dpP530 do {hP53'=0, k'=k+1} goto loc_100111101;
when hMDM2=dnMDM21 do {hMDM2'=0, k'=k+1} goto loc_100100101;

-- for the configuration 1,0,0,1,0,1,1,1,0
loc loc_100101110: while hP53 <=  dpP530 & hMDM2 >=  dnMDM21 & hOGT >=  dnOGT1 & hOGA >=  dnOGA1  wait {dhNFKB=0,dhP21=1,dhFOXM=1,dhPI3K=0,dhP53=1,dhMDM2=1,dhOGT=1,dhOGA=1,dhCMYC=1}
--when hP21=dpP210 do {hP21'=0, k'=k+1} goto loc_110101110;
--when hFOXM=dpFOXM0 do {hFOXM'=0, k'=k+1} goto loc_101101110;
when hP53=dpP530 do {hP53'=0, k'=k+1} goto loc_100111110;
when hMDM2=dnMDM21 do {hMDM2'=0, k'=k+1} goto loc_100100110;
when hOGT=dnOGT1 do {hOGT'=0, k'=k+1} goto loc_100101010;
when hOGA=dnOGA1 do {hOGA'=0, k'=k+1} goto loc_100101100;
--when hCMYC=dpCMYC0 do {hCMYC'=0, k'=k+1} goto loc_100101111;

-- for the configuration 1,0,0,1,0,1,1,1,1
loc loc_100101111: while hP53 <=  dpP530 & hMDM2 >=  dnMDM21 & hOGA >=  dnOGA1  wait {dhNFKB=0,dhP21=1,dhFOXM=1,dhPI3K=0,dhP53=1,dhMDM2=1,dhOGT=0,dhOGA=1,dhCMYC=0}
--when hP21=dpP210 do {hP21'=0, k'=k+1} goto loc_110101111;
--when hFOXM=dpFOXM0 do {hFOXM'=0, k'=k+1} goto loc_101101111;
when hP53=dpP530 do {hP53'=0, k'=k+1} goto loc_100111111;
when hMDM2=dnMDM21 do {hMDM2'=0, k'=k+1} goto loc_100100111;
when hOGA=dnOGA1 do {hOGA'=0, k'=k+1} goto loc_100101101;

-- for the configuration 1,0,0,1,1,0,0,0,0
loc loc_100110000: while hP21 <=  dpP210 & hFOXM <=  dpFOXM0 & hPI3K >=  dnPI3K1 & hMDM2 <=  dpMDM20 & hOGA <=  dpOGA0  wait {dhNFKB=-1,dhP21=1,dhFOXM=1,dhPI3K=1,dhP53=0,dhMDM2=1,dhOGT=0,dhOGA=1,dhCMYC=0}
--when hNFKB=dnNFKB1 do {hNFKB'=0, k'=k+1} goto loc_000110000;
when hP21=dpP210 do {hP21'=0, k'=k+1} goto loc_110110000;
when hFOXM=dpFOXM0 do {hFOXM'=0, k'=k+1} goto loc_101110000;
when hPI3K=dnPI3K1 do {hPI3K'=0, k'=k+1} goto loc_100010000;
when hMDM2=dpMDM20 do {hMDM2'=0, k'=k+1} goto loc_100111000;
when hOGA=dpOGA0 do {hOGA'=0, k'=k+1} goto loc_100110010;

-- for the configuration 1,0,0,1,1,0,0,0,1
loc loc_100110001: while hP21 <=  dpP210 & hFOXM <=  dpFOXM0 & hPI3K >=  dnPI3K1 & hMDM2 <=  dpMDM20 & hOGT <=  dpOGT0 & hOGA <=  dpOGA0 & hCMYC >=  dnCMYC1  wait {dhNFKB=-1,dhP21=1,dhFOXM=1,dhPI3K=1,dhP53=0,dhMDM2=1,dhOGT=1,dhOGA=1,dhCMYC=1}
--when hNFKB=dnNFKB1 do {hNFKB'=0, k'=k+1} goto loc_000110001;
when hP21=dpP210 do {hP21'=0, k'=k+1} goto loc_110110001;
when hFOXM=dpFOXM0 do {hFOXM'=0, k'=k+1} goto loc_101110001;
when hPI3K=dnPI3K1 do {hPI3K'=0, k'=k+1} goto loc_100010001;
when hMDM2=dpMDM20 do {hMDM2'=0, k'=k+1} goto loc_100111001;
when hOGT=dpOGT0 do {hOGT'=0, k'=k+1} goto loc_100110101;
when hOGA=dpOGA0 do {hOGA'=0, k'=k+1} goto loc_100110011;
when hCMYC=dnCMYC1 do {hCMYC'=0, k'=k+1} goto loc_100110000;

-- for the configuration 1,0,0,1,1,0,0,1,0
loc loc_100110010: while hP21 <=  dpP210 & hFOXM <=  dpFOXM0 & hPI3K >=  dnPI3K1 & hMDM2 <=  dpMDM20  wait {dhNFKB=-1,dhP21=1,dhFOXM=1,dhPI3K=1,dhP53=0,dhMDM2=1,dhOGT=0,dhOGA=0,dhCMYC=0}
--when hNFKB=dnNFKB1 do {hNFKB'=0, k'=k+1} goto loc_000110010;
when hP21=dpP210 do {hP21'=0, k'=k+1} goto loc_110110010;
when hFOXM=dpFOXM0 do {hFOXM'=0, k'=k+1} goto loc_101110010;
when hPI3K=dnPI3K1 do {hPI3K'=0, k'=k+1} goto loc_100010010;
when hMDM2=dpMDM20 do {hMDM2'=0, k'=k+1} goto loc_100111010;

-- for the configuration 1,0,0,1,1,0,0,1,1
loc loc_100110011: while hP21 <=  dpP210 & hFOXM <=  dpFOXM0 & hPI3K >=  dnPI3K1 & hMDM2 <=  dpMDM20 & hOGT <=  dpOGT0 & hCMYC >=  dnCMYC1  wait {dhNFKB=-1,dhP21=1,dhFOXM=1,dhPI3K=1,dhP53=0,dhMDM2=1,dhOGT=1,dhOGA=-1,dhCMYC=1}
--when hNFKB=dnNFKB1 do {hNFKB'=0, k'=k+1} goto loc_000110011;
when hP21=dpP210 do {hP21'=0, k'=k+1} goto loc_110110011;
when hFOXM=dpFOXM0 do {hFOXM'=0, k'=k+1} goto loc_101110011;
when hPI3K=dnPI3K1 do {hPI3K'=0, k'=k+1} goto loc_100010011;
when hMDM2=dpMDM20 do {hMDM2'=0, k'=k+1} goto loc_100111011;
when hOGT=dpOGT0 do {hOGT'=0, k'=k+1} goto loc_100110111;
--when hOGA=dnOGA1 do {hOGA'=0, k'=k+1} goto loc_100110001;
when hCMYC=dnCMYC1 do {hCMYC'=0, k'=k+1} goto loc_100110010;

-- for the configuration 1,0,0,1,1,0,1,0,0
loc loc_100110100: while hP21 <=  dpP210 & hFOXM <=  dpFOXM0 & hMDM2 <=  dpMDM20 & hOGT >=  dnOGT1 & hCMYC <=  dpCMYC0  wait {dhNFKB=-1,dhP21=1,dhFOXM=1,dhPI3K=-1,dhP53=0,dhMDM2=1,dhOGT=1,dhOGA=1,dhCMYC=1}
--when hNFKB=dnNFKB1 do {hNFKB'=0, k'=k+1} goto loc_000110100;
when hP21=dpP210 do {hP21'=0, k'=k+1} goto loc_110110100;
when hFOXM=dpFOXM0 do {hFOXM'=0, k'=k+1} goto loc_101110100;
--when hPI3K=dnPI3K1 do {hPI3K'=0, k'=k+1} goto loc_100010100;
when hMDM2=dpMDM20 do {hMDM2'=0, k'=k+1} goto loc_100111100;
when hOGT=dnOGT1 do {hOGT'=0, k'=k+1} goto loc_100110000;
--when hOGA=dpOGA0 do {hOGA'=0, k'=k+1} goto loc_100110110;
when hCMYC=dpCMYC0 do {hCMYC'=0, k'=k+1} goto loc_100110101;

-- for the configuration 1,0,0,1,1,0,1,0,1
loc loc_100110101: while hP21 <=  dpP210 & hFOXM <=  dpFOXM0 & hMDM2 <=  dpMDM20  wait {dhNFKB=-1,dhP21=1,dhFOXM=1,dhPI3K=0,dhP53=0,dhMDM2=1,dhOGT=0,dhOGA=0,dhCMYC=0}
--when hNFKB=dnNFKB1 do {hNFKB'=0, k'=k+1} goto loc_000110101;
when hP21=dpP210 do {hP21'=0, k'=k+1} goto loc_110110101;
when hFOXM=dpFOXM0 do {hFOXM'=0, k'=k+1} goto loc_101110101;
when hMDM2=dpMDM20 do {hMDM2'=0, k'=k+1} goto loc_100111101;

-- for the configuration 1,0,0,1,1,0,1,1,0
loc loc_100110110: while hP21 <=  dpP210 & hFOXM <=  dpFOXM0 & hMDM2 <=  dpMDM20 & hOGT >=  dnOGT1 & hOGA >=  dnOGA1 & hCMYC <=  dpCMYC0  wait {dhNFKB=-1,dhP21=1,dhFOXM=1,dhPI3K=-1,dhP53=0,dhMDM2=1,dhOGT=1,dhOGA=1,dhCMYC=1}
--when hNFKB=dnNFKB1 do {hNFKB'=0, k'=k+1} goto loc_000110110;
when hP21=dpP210 do {hP21'=0, k'=k+1} goto loc_110110110;
when hFOXM=dpFOXM0 do {hFOXM'=0, k'=k+1} goto loc_101110110;
--when hPI3K=dnPI3K1 do {hPI3K'=0, k'=k+1} goto loc_100010110;
when hMDM2=dpMDM20 do {hMDM2'=0, k'=k+1} goto loc_100111110;
when hOGT=dnOGT1 do {hOGT'=0, k'=k+1} goto loc_100110010;
when hOGA=dnOGA1 do {hOGA'=0, k'=k+1} goto loc_100110100;
when hCMYC=dpCMYC0 do {hCMYC'=0, k'=k+1} goto loc_100110111;

-- for the configuration 1,0,0,1,1,0,1,1,1
loc loc_100110111: while hP21 <=  dpP210 & hFOXM <=  dpFOXM0 & hMDM2 <=  dpMDM20 & hOGA >=  dnOGA1  wait {dhNFKB=-1,dhP21=1,dhFOXM=1,dhPI3K=0,dhP53=0,dhMDM2=1,dhOGT=0,dhOGA=1,dhCMYC=0}
--when hNFKB=dnNFKB1 do {hNFKB'=0, k'=k+1} goto loc_000110111;
when hP21=dpP210 do {hP21'=0, k'=k+1} goto loc_110110111;
when hFOXM=dpFOXM0 do {hFOXM'=0, k'=k+1} goto loc_101110111;
when hMDM2=dpMDM20 do {hMDM2'=0, k'=k+1} goto loc_100111111;
when hOGA=dnOGA1 do {hOGA'=0, k'=k+1} goto loc_100110101;

-- for the configuration 1,0,0,1,1,1,0,0,0
loc loc_100111000: while hP21 <=  dpP210 & hFOXM <=  dpFOXM0 & hPI3K >=  dnPI3K1 & hOGA <=  dpOGA0  wait {dhNFKB=-1,dhP21=1,dhFOXM=1,dhPI3K=1,dhP53=0,dhMDM2=0,dhOGT=0,dhOGA=1,dhCMYC=0}
--when hNFKB=dnNFKB1 do {hNFKB'=0, k'=k+1} goto loc_000111000;
when hP21=dpP210 do {hP21'=0, k'=k+1} goto loc_110111000;
when hFOXM=dpFOXM0 do {hFOXM'=0, k'=k+1} goto loc_101111000;
when hPI3K=dnPI3K1 do {hPI3K'=0, k'=k+1} goto loc_100011000;
when hOGA=dpOGA0 do {hOGA'=0, k'=k+1} goto loc_100111010;

-- for the configuration 1,0,0,1,1,1,0,0,1
loc loc_100111001: while hP21 <=  dpP210 & hFOXM <=  dpFOXM0 & hPI3K >=  dnPI3K1 & hOGT <=  dpOGT0 & hOGA <=  dpOGA0 & hCMYC >=  dnCMYC1  wait {dhNFKB=-1,dhP21=1,dhFOXM=1,dhPI3K=1,dhP53=0,dhMDM2=0,dhOGT=1,dhOGA=1,dhCMYC=1}
--when hNFKB=dnNFKB1 do {hNFKB'=0, k'=k+1} goto loc_000111001;
when hP21=dpP210 do {hP21'=0, k'=k+1} goto loc_110111001;
when hFOXM=dpFOXM0 do {hFOXM'=0, k'=k+1} goto loc_101111001;
when hPI3K=dnPI3K1 do {hPI3K'=0, k'=k+1} goto loc_100011001;
when hOGT=dpOGT0 do {hOGT'=0, k'=k+1} goto loc_100111101;
when hOGA=dpOGA0 do {hOGA'=0, k'=k+1} goto loc_100111011;
when hCMYC=dnCMYC1 do {hCMYC'=0, k'=k+1} goto loc_100111000;

-- for the configuration 1,0,0,1,1,1,0,1,0
loc loc_100111010: while hP21 <=  dpP210 & hFOXM <=  dpFOXM0 & hPI3K >=  dnPI3K1  wait {dhNFKB=-1,dhP21=1,dhFOXM=1,dhPI3K=1,dhP53=0,dhMDM2=0,dhOGT=0,dhOGA=0,dhCMYC=0}
--when hNFKB=dnNFKB1 do {hNFKB'=0, k'=k+1} goto loc_000111010;
when hP21=dpP210 do {hP21'=0, k'=k+1} goto loc_110111010;
when hFOXM=dpFOXM0 do {hFOXM'=0, k'=k+1} goto loc_101111010;
when hPI3K=dnPI3K1 do {hPI3K'=0, k'=k+1} goto loc_100011010;

-- for the configuration 1,0,0,1,1,1,0,1,1
loc loc_100111011: while hP21 <=  dpP210 & hFOXM <=  dpFOXM0 & hPI3K >=  dnPI3K1 & hOGT <=  dpOGT0 & hCMYC >=  dnCMYC1  wait {dhNFKB=-1,dhP21=1,dhFOXM=1,dhPI3K=1,dhP53=0,dhMDM2=0,dhOGT=1,dhOGA=-1,dhCMYC=1}
--when hNFKB=dnNFKB1 do {hNFKB'=0, k'=k+1} goto loc_000111011;
when hP21=dpP210 do {hP21'=0, k'=k+1} goto loc_110111011;
when hFOXM=dpFOXM0 do {hFOXM'=0, k'=k+1} goto loc_101111011;
when hPI3K=dnPI3K1 do {hPI3K'=0, k'=k+1} goto loc_100011011;
when hOGT=dpOGT0 do {hOGT'=0, k'=k+1} goto loc_100111111;
--when hOGA=dnOGA1 do {hOGA'=0, k'=k+1} goto loc_100111001;
when hCMYC=dnCMYC1 do {hCMYC'=0, k'=k+1} goto loc_100111010;

-- for the configuration 1,0,0,1,1,1,1,0,0
loc loc_100111100: while hP21 <=  dpP210 & hFOXM <=  dpFOXM0 & hOGT >=  dnOGT1 & hCMYC <=  dpCMYC0  wait {dhNFKB=-1,dhP21=1,dhFOXM=1,dhPI3K=-1,dhP53=0,dhMDM2=0,dhOGT=1,dhOGA=1,dhCMYC=1}
--when hNFKB=dnNFKB1 do {hNFKB'=0, k'=k+1} goto loc_000111100;
when hP21=dpP210 do {hP21'=0, k'=k+1} goto loc_110111100;
when hFOXM=dpFOXM0 do {hFOXM'=0, k'=k+1} goto loc_101111100;
--when hPI3K=dnPI3K1 do {hPI3K'=0, k'=k+1} goto loc_100011100;
when hOGT=dnOGT1 do {hOGT'=0, k'=k+1} goto loc_100111000;
--when hOGA=dpOGA0 do {hOGA'=0, k'=k+1} goto loc_100111110;
when hCMYC=dpCMYC0 do {hCMYC'=0, k'=k+1} goto loc_100111101;

-- for the configuration 1,0,0,1,1,1,1,0,1
loc loc_100111101: while hP21 <=  dpP210 & hFOXM <=  dpFOXM0  wait {dhNFKB=-1,dhP21=1,dhFOXM=1,dhPI3K=0,dhP53=0,dhMDM2=0,dhOGT=0,dhOGA=0,dhCMYC=0}
--when hNFKB=dnNFKB1 do {hNFKB'=0, k'=k+1} goto loc_000111101;
when hP21=dpP210 do {hP21'=0, k'=k+1} goto loc_110111101;
when hFOXM=dpFOXM0 do {hFOXM'=0, k'=k+1} goto loc_101111101;

-- for the configuration 1,0,0,1,1,1,1,1,0
loc loc_100111110: while hP21 <=  dpP210 & hFOXM <=  dpFOXM0 & hOGT >=  dnOGT1 & hOGA >=  dnOGA1 & hCMYC <=  dpCMYC0  wait {dhNFKB=-1,dhP21=1,dhFOXM=1,dhPI3K=-1,dhP53=0,dhMDM2=0,dhOGT=1,dhOGA=1,dhCMYC=1}
--when hNFKB=dnNFKB1 do {hNFKB'=0, k'=k+1} goto loc_000111110;
when hP21=dpP210 do {hP21'=0, k'=k+1} goto loc_110111110;
when hFOXM=dpFOXM0 do {hFOXM'=0, k'=k+1} goto loc_101111110;
--when hPI3K=dnPI3K1 do {hPI3K'=0, k'=k+1} goto loc_100011110;
when hOGT=dnOGT1 do {hOGT'=0, k'=k+1} goto loc_100111010;
when hOGA=dnOGA1 do {hOGA'=0, k'=k+1} goto loc_100111100;
when hCMYC=dpCMYC0 do {hCMYC'=0, k'=k+1} goto loc_100111111;

-- for the configuration 1,0,0,1,1,1,1,1,1
loc loc_100111111: while hP21 <=  dpP210 & hFOXM <=  dpFOXM0 & hOGA >=  dnOGA1  wait {dhNFKB=-1,dhP21=1,dhFOXM=1,dhPI3K=0,dhP53=0,dhMDM2=0,dhOGT=0,dhOGA=1,dhCMYC=0}
--when hNFKB=dnNFKB1 do {hNFKB'=0, k'=k+1} goto loc_000111111;
when hP21=dpP210 do {hP21'=0, k'=k+1} goto loc_110111111;
when hFOXM=dpFOXM0 do {hFOXM'=0, k'=k+1} goto loc_101111111;
when hOGA=dnOGA1 do {hOGA'=0, k'=k+1} goto loc_100111101;

-- for the configuration 1,0,1,0,0,0,0,0,0
loc loc_101000000: while hNFKB >=  dnNFKB1 & hFOXM >=  dnFOXM1 & hPI3K <=  dpPI3K0 & hP53 <=  dpP530 & hOGA <=  dpOGA0  wait {dhNFKB=1,dhP21=1,dhFOXM=1,dhPI3K=1,dhP53=1,dhMDM2=1,dhOGT=0,dhOGA=1,dhCMYC=0}
when hNFKB=dnNFKB1 do {hNFKB'=0, k'=k+1} goto loc_001000000;
--when hP21=dpP210 do {hP21'=0, k'=k+1} goto loc_111000000;
when hFOXM=dnFOXM1 do {hFOXM'=0, k'=k+1} goto loc_100000000;
when hPI3K=dpPI3K0 do {hPI3K'=0, k'=k+1} goto loc_101100000;
when hP53=dpP530 do {hP53'=0, k'=k+1} goto loc_101010000;
--when hMDM2=dpMDM20 do {hMDM2'=0, k'=k+1} goto loc_101001000;
when hOGA=dpOGA0 do {hOGA'=0, k'=k+1} goto loc_101000010;

-- for the configuration 1,0,1,0,0,0,0,0,1
loc loc_101000001: while hNFKB >=  dnNFKB1 & hFOXM >=  dnFOXM1 & hPI3K <=  dpPI3K0 & hP53 <=  dpP530 & hOGT <=  dpOGT0 & hOGA <=  dpOGA0 & hCMYC >=  dnCMYC1  wait {dhNFKB=1,dhP21=1,dhFOXM=1,dhPI3K=1,dhP53=1,dhMDM2=1,dhOGT=1,dhOGA=1,dhCMYC=1}
when hNFKB=dnNFKB1 do {hNFKB'=0, k'=k+1} goto loc_001000001;
--when hP21=dpP210 do {hP21'=0, k'=k+1} goto loc_111000001;
when hFOXM=dnFOXM1 do {hFOXM'=0, k'=k+1} goto loc_100000001;
when hPI3K=dpPI3K0 do {hPI3K'=0, k'=k+1} goto loc_101100001;
when hP53=dpP530 do {hP53'=0, k'=k+1} goto loc_101010001;
--when hMDM2=dpMDM20 do {hMDM2'=0, k'=k+1} goto loc_101001001;
when hOGT=dpOGT0 do {hOGT'=0, k'=k+1} goto loc_101000101;
when hOGA=dpOGA0 do {hOGA'=0, k'=k+1} goto loc_101000011;
when hCMYC=dnCMYC1 do {hCMYC'=0, k'=k+1} goto loc_101000000;

-- for the configuration 1,0,1,0,0,0,0,1,0
loc loc_101000010: while hNFKB >=  dnNFKB1 & hFOXM >=  dnFOXM1 & hPI3K <=  dpPI3K0 & hP53 <=  dpP530  wait {dhNFKB=1,dhP21=1,dhFOXM=1,dhPI3K=1,dhP53=1,dhMDM2=1,dhOGT=0,dhOGA=0,dhCMYC=0}
when hNFKB=dnNFKB1 do {hNFKB'=0, k'=k+1} goto loc_001000010;
--when hP21=dpP210 do {hP21'=0, k'=k+1} goto loc_111000010;
when hFOXM=dnFOXM1 do {hFOXM'=0, k'=k+1} goto loc_100000010;
when hPI3K=dpPI3K0 do {hPI3K'=0, k'=k+1} goto loc_101100010;
when hP53=dpP530 do {hP53'=0, k'=k+1} goto loc_101010010;
--when hMDM2=dpMDM20 do {hMDM2'=0, k'=k+1} goto loc_101001010;

-- for the configuration 1,0,1,0,0,0,0,1,1
loc loc_101000011: while hNFKB >=  dnNFKB1 & hFOXM >=  dnFOXM1 & hPI3K <=  dpPI3K0 & hP53 <=  dpP530 & hOGT <=  dpOGT0 & hCMYC >=  dnCMYC1  wait {dhNFKB=1,dhP21=1,dhFOXM=1,dhPI3K=1,dhP53=1,dhMDM2=1,dhOGT=1,dhOGA=-1,dhCMYC=1}
when hNFKB=dnNFKB1 do {hNFKB'=0, k'=k+1} goto loc_001000011;
--when hP21=dpP210 do {hP21'=0, k'=k+1} goto loc_111000011;
when hFOXM=dnFOXM1 do {hFOXM'=0, k'=k+1} goto loc_100000011;
when hPI3K=dpPI3K0 do {hPI3K'=0, k'=k+1} goto loc_101100011;
when hP53=dpP530 do {hP53'=0, k'=k+1} goto loc_101010011;
--when hMDM2=dpMDM20 do {hMDM2'=0, k'=k+1} goto loc_101001011;
when hOGT=dpOGT0 do {hOGT'=0, k'=k+1} goto loc_101000111;
--when hOGA=dnOGA1 do {hOGA'=0, k'=k+1} goto loc_101000001;
when hCMYC=dnCMYC1 do {hCMYC'=0, k'=k+1} goto loc_101000010;

-- for the configuration 1,0,1,0,0,0,1,0,0
loc loc_101000100: while hNFKB >=  dnNFKB1 & hFOXM >=  dnFOXM1 & hP53 <=  dpP530 & hOGT >=  dnOGT1  wait {dhNFKB=1,dhP21=1,dhFOXM=1,dhPI3K=1,dhP53=1,dhMDM2=1,dhOGT=1,dhOGA=1,dhCMYC=1}
when hNFKB=dnNFKB1 do {hNFKB'=0, k'=k+1} goto loc_001000100;
--when hP21=dpP210 do {hP21'=0, k'=k+1} goto loc_111000100;
when hFOXM=dnFOXM1 do {hFOXM'=0, k'=k+1} goto loc_100000100;
--when hPI3K=dpPI3K0 do {hPI3K'=0, k'=k+1} goto loc_101100100;
when hP53=dpP530 do {hP53'=0, k'=k+1} goto loc_101010100;
--when hMDM2=dpMDM20 do {hMDM2'=0, k'=k+1} goto loc_101001100;
when hOGT=dnOGT1 do {hOGT'=0, k'=k+1} goto loc_101000000;
--when hOGA=dpOGA0 do {hOGA'=0, k'=k+1} goto loc_101000110;
--when hCMYC=dpCMYC0 do {hCMYC'=0, k'=k+1} goto loc_101000101;

-- for the configuration 1,0,1,0,0,0,1,0,1
loc loc_101000101: while hNFKB >=  dnNFKB1 & hFOXM >=  dnFOXM1 & hP53 <=  dpP530  wait {dhNFKB=1,dhP21=1,dhFOXM=1,dhPI3K=1,dhP53=1,dhMDM2=1,dhOGT=0,dhOGA=0,dhCMYC=0}
when hNFKB=dnNFKB1 do {hNFKB'=0, k'=k+1} goto loc_001000101;
--when hP21=dpP210 do {hP21'=0, k'=k+1} goto loc_111000101;
when hFOXM=dnFOXM1 do {hFOXM'=0, k'=k+1} goto loc_100000101;
--when hPI3K=dpPI3K0 do {hPI3K'=0, k'=k+1} goto loc_101100101;
when hP53=dpP530 do {hP53'=0, k'=k+1} goto loc_101010101;
--when hMDM2=dpMDM20 do {hMDM2'=0, k'=k+1} goto loc_101001101;

-- for the configuration 1,0,1,0,0,0,1,1,0
loc loc_101000110: while hNFKB >=  dnNFKB1 & hFOXM >=  dnFOXM1 & hP53 <=  dpP530 & hOGT >=  dnOGT1 & hOGA >=  dnOGA1  wait {dhNFKB=1,dhP21=1,dhFOXM=1,dhPI3K=1,dhP53=1,dhMDM2=1,dhOGT=1,dhOGA=1,dhCMYC=1}
when hNFKB=dnNFKB1 do {hNFKB'=0, k'=k+1} goto loc_001000110;
--when hP21=dpP210 do {hP21'=0, k'=k+1} goto loc_111000110;
when hFOXM=dnFOXM1 do {hFOXM'=0, k'=k+1} goto loc_100000110;
--when hPI3K=dpPI3K0 do {hPI3K'=0, k'=k+1} goto loc_101100110;
when hP53=dpP530 do {hP53'=0, k'=k+1} goto loc_101010110;
--when hMDM2=dpMDM20 do {hMDM2'=0, k'=k+1} goto loc_101001110;
when hOGT=dnOGT1 do {hOGT'=0, k'=k+1} goto loc_101000010;
when hOGA=dnOGA1 do {hOGA'=0, k'=k+1} goto loc_101000100;
--when hCMYC=dpCMYC0 do {hCMYC'=0, k'=k+1} goto loc_101000111;

-- for the configuration 1,0,1,0,0,0,1,1,1
loc loc_101000111: while hNFKB >=  dnNFKB1 & hFOXM >=  dnFOXM1 & hP53 <=  dpP530 & hOGA >=  dnOGA1  wait {dhNFKB=1,dhP21=1,dhFOXM=1,dhPI3K=1,dhP53=1,dhMDM2=1,dhOGT=0,dhOGA=1,dhCMYC=0}
when hNFKB=dnNFKB1 do {hNFKB'=0, k'=k+1} goto loc_001000111;
--when hP21=dpP210 do {hP21'=0, k'=k+1} goto loc_111000111;
when hFOXM=dnFOXM1 do {hFOXM'=0, k'=k+1} goto loc_100000111;
--when hPI3K=dpPI3K0 do {hPI3K'=0, k'=k+1} goto loc_101100111;
when hP53=dpP530 do {hP53'=0, k'=k+1} goto loc_101010111;
--when hMDM2=dpMDM20 do {hMDM2'=0, k'=k+1} goto loc_101001111;
when hOGA=dnOGA1 do {hOGA'=0, k'=k+1} goto loc_101000101;

-- for the configuration 1,0,1,0,0,1,0,0,0
loc loc_101001000: while hNFKB >=  dnNFKB1 & hFOXM >=  dnFOXM1 & hPI3K <=  dpPI3K0 & hP53 <=  dpP530 & hMDM2 >=  dnMDM21 & hOGA <=  dpOGA0  wait {dhNFKB=1,dhP21=1,dhFOXM=1,dhPI3K=1,dhP53=1,dhMDM2=1,dhOGT=0,dhOGA=1,dhCMYC=0}
when hNFKB=dnNFKB1 do {hNFKB'=0, k'=k+1} goto loc_001001000;
--when hP21=dpP210 do {hP21'=0, k'=k+1} goto loc_111001000;
when hFOXM=dnFOXM1 do {hFOXM'=0, k'=k+1} goto loc_100001000;
when hPI3K=dpPI3K0 do {hPI3K'=0, k'=k+1} goto loc_101101000;
when hP53=dpP530 do {hP53'=0, k'=k+1} goto loc_101011000;
when hMDM2=dnMDM21 do {hMDM2'=0, k'=k+1} goto loc_101000000;
when hOGA=dpOGA0 do {hOGA'=0, k'=k+1} goto loc_101001010;

-- for the configuration 1,0,1,0,0,1,0,0,1
loc loc_101001001: while hNFKB >=  dnNFKB1 & hFOXM >=  dnFOXM1 & hPI3K <=  dpPI3K0 & hP53 <=  dpP530 & hMDM2 >=  dnMDM21 & hOGT <=  dpOGT0 & hOGA <=  dpOGA0 & hCMYC >=  dnCMYC1  wait {dhNFKB=1,dhP21=1,dhFOXM=1,dhPI3K=1,dhP53=1,dhMDM2=1,dhOGT=1,dhOGA=1,dhCMYC=1}
when hNFKB=dnNFKB1 do {hNFKB'=0, k'=k+1} goto loc_001001001;
--when hP21=dpP210 do {hP21'=0, k'=k+1} goto loc_111001001;
when hFOXM=dnFOXM1 do {hFOXM'=0, k'=k+1} goto loc_100001001;
when hPI3K=dpPI3K0 do {hPI3K'=0, k'=k+1} goto loc_101101001;
when hP53=dpP530 do {hP53'=0, k'=k+1} goto loc_101011001;
when hMDM2=dnMDM21 do {hMDM2'=0, k'=k+1} goto loc_101000001;
when hOGT=dpOGT0 do {hOGT'=0, k'=k+1} goto loc_101001101;
when hOGA=dpOGA0 do {hOGA'=0, k'=k+1} goto loc_101001011;
when hCMYC=dnCMYC1 do {hCMYC'=0, k'=k+1} goto loc_101001000;

-- for the configuration 1,0,1,0,0,1,0,1,0
loc loc_101001010: while hNFKB >=  dnNFKB1 & hFOXM >=  dnFOXM1 & hPI3K <=  dpPI3K0 & hP53 <=  dpP530 & hMDM2 >=  dnMDM21  wait {dhNFKB=1,dhP21=1,dhFOXM=1,dhPI3K=1,dhP53=1,dhMDM2=1,dhOGT=0,dhOGA=0,dhCMYC=0}
when hNFKB=dnNFKB1 do {hNFKB'=0, k'=k+1} goto loc_001001010;
--when hP21=dpP210 do {hP21'=0, k'=k+1} goto loc_111001010;
when hFOXM=dnFOXM1 do {hFOXM'=0, k'=k+1} goto loc_100001010;
when hPI3K=dpPI3K0 do {hPI3K'=0, k'=k+1} goto loc_101101010;
when hP53=dpP530 do {hP53'=0, k'=k+1} goto loc_101011010;
when hMDM2=dnMDM21 do {hMDM2'=0, k'=k+1} goto loc_101000010;

-- for the configuration 1,0,1,0,0,1,0,1,1
loc loc_101001011: while hNFKB >=  dnNFKB1 & hFOXM >=  dnFOXM1 & hPI3K <=  dpPI3K0 & hP53 <=  dpP530 & hMDM2 >=  dnMDM21 & hOGT <=  dpOGT0 & hCMYC >=  dnCMYC1  wait {dhNFKB=1,dhP21=1,dhFOXM=1,dhPI3K=1,dhP53=1,dhMDM2=1,dhOGT=1,dhOGA=-1,dhCMYC=1}
when hNFKB=dnNFKB1 do {hNFKB'=0, k'=k+1} goto loc_001001011;
--when hP21=dpP210 do {hP21'=0, k'=k+1} goto loc_111001011;
when hFOXM=dnFOXM1 do {hFOXM'=0, k'=k+1} goto loc_100001011;
when hPI3K=dpPI3K0 do {hPI3K'=0, k'=k+1} goto loc_101101011;
when hP53=dpP530 do {hP53'=0, k'=k+1} goto loc_101011011;
when hMDM2=dnMDM21 do {hMDM2'=0, k'=k+1} goto loc_101000011;
when hOGT=dpOGT0 do {hOGT'=0, k'=k+1} goto loc_101001111;
--when hOGA=dnOGA1 do {hOGA'=0, k'=k+1} goto loc_101001001;
when hCMYC=dnCMYC1 do {hCMYC'=0, k'=k+1} goto loc_101001010;

-- for the configuration 1,0,1,0,0,1,1,0,0
loc loc_101001100: while hNFKB >=  dnNFKB1 & hFOXM >=  dnFOXM1 & hP53 <=  dpP530 & hMDM2 >=  dnMDM21 & hOGT >=  dnOGT1  wait {dhNFKB=1,dhP21=1,dhFOXM=1,dhPI3K=1,dhP53=1,dhMDM2=1,dhOGT=1,dhOGA=1,dhCMYC=1}
when hNFKB=dnNFKB1 do {hNFKB'=0, k'=k+1} goto loc_001001100;
--when hP21=dpP210 do {hP21'=0, k'=k+1} goto loc_111001100;
when hFOXM=dnFOXM1 do {hFOXM'=0, k'=k+1} goto loc_100001100;
--when hPI3K=dpPI3K0 do {hPI3K'=0, k'=k+1} goto loc_101101100;
when hP53=dpP530 do {hP53'=0, k'=k+1} goto loc_101011100;
when hMDM2=dnMDM21 do {hMDM2'=0, k'=k+1} goto loc_101000100;
when hOGT=dnOGT1 do {hOGT'=0, k'=k+1} goto loc_101001000;
--when hOGA=dpOGA0 do {hOGA'=0, k'=k+1} goto loc_101001110;
--when hCMYC=dpCMYC0 do {hCMYC'=0, k'=k+1} goto loc_101001101;

-- for the configuration 1,0,1,0,0,1,1,0,1
loc loc_101001101: while hNFKB >=  dnNFKB1 & hFOXM >=  dnFOXM1 & hP53 <=  dpP530 & hMDM2 >=  dnMDM21  wait {dhNFKB=1,dhP21=1,dhFOXM=1,dhPI3K=1,dhP53=1,dhMDM2=1,dhOGT=0,dhOGA=0,dhCMYC=0}
when hNFKB=dnNFKB1 do {hNFKB'=0, k'=k+1} goto loc_001001101;
--when hP21=dpP210 do {hP21'=0, k'=k+1} goto loc_111001101;
when hFOXM=dnFOXM1 do {hFOXM'=0, k'=k+1} goto loc_100001101;
--when hPI3K=dpPI3K0 do {hPI3K'=0, k'=k+1} goto loc_101101101;
when hP53=dpP530 do {hP53'=0, k'=k+1} goto loc_101011101;
when hMDM2=dnMDM21 do {hMDM2'=0, k'=k+1} goto loc_101000101;

-- for the configuration 1,0,1,0,0,1,1,1,0
loc loc_101001110: while hNFKB >=  dnNFKB1 & hFOXM >=  dnFOXM1 & hP53 <=  dpP530 & hMDM2 >=  dnMDM21 & hOGT >=  dnOGT1 & hOGA >=  dnOGA1  wait {dhNFKB=1,dhP21=1,dhFOXM=1,dhPI3K=1,dhP53=1,dhMDM2=1,dhOGT=1,dhOGA=1,dhCMYC=1}
when hNFKB=dnNFKB1 do {hNFKB'=0, k'=k+1} goto loc_001001110;
--when hP21=dpP210 do {hP21'=0, k'=k+1} goto loc_111001110;
when hFOXM=dnFOXM1 do {hFOXM'=0, k'=k+1} goto loc_100001110;
--when hPI3K=dpPI3K0 do {hPI3K'=0, k'=k+1} goto loc_101101110;
when hP53=dpP530 do {hP53'=0, k'=k+1} goto loc_101011110;
when hMDM2=dnMDM21 do {hMDM2'=0, k'=k+1} goto loc_101000110;
when hOGT=dnOGT1 do {hOGT'=0, k'=k+1} goto loc_101001010;
when hOGA=dnOGA1 do {hOGA'=0, k'=k+1} goto loc_101001100;
--when hCMYC=dpCMYC0 do {hCMYC'=0, k'=k+1} goto loc_101001111;

-- for the configuration 1,0,1,0,0,1,1,1,1
loc loc_101001111: while hNFKB >=  dnNFKB1 & hFOXM >=  dnFOXM1 & hP53 <=  dpP530 & hMDM2 >=  dnMDM21 & hOGA >=  dnOGA1  wait {dhNFKB=1,dhP21=1,dhFOXM=1,dhPI3K=1,dhP53=1,dhMDM2=1,dhOGT=0,dhOGA=1,dhCMYC=0}
when hNFKB=dnNFKB1 do {hNFKB'=0, k'=k+1} goto loc_001001111;
--when hP21=dpP210 do {hP21'=0, k'=k+1} goto loc_111001111;
when hFOXM=dnFOXM1 do {hFOXM'=0, k'=k+1} goto loc_100001111;
--when hPI3K=dpPI3K0 do {hPI3K'=0, k'=k+1} goto loc_101101111;
when hP53=dpP530 do {hP53'=0, k'=k+1} goto loc_101011111;
when hMDM2=dnMDM21 do {hMDM2'=0, k'=k+1} goto loc_101000111;
when hOGA=dnOGA1 do {hOGA'=0, k'=k+1} goto loc_101001101;

-- for the configuration 1,0,1,0,1,0,0,0,0
loc loc_101010000: while hNFKB >=  dnNFKB1 & hFOXM >=  dnFOXM1 & hMDM2 <=  dpMDM20 & hOGA <=  dpOGA0  wait {dhNFKB=1,dhP21=0,dhFOXM=1,dhPI3K=0,dhP53=0,dhMDM2=1,dhOGT=0,dhOGA=1,dhCMYC=0}
when hNFKB=dnNFKB1 do {hNFKB'=0, k'=k+1} goto loc_001010000;
when hFOXM=dnFOXM1 do {hFOXM'=0, k'=k+1} goto loc_100010000;
when hMDM2=dpMDM20 do {hMDM2'=0, k'=k+1} goto loc_101011000;
when hOGA=dpOGA0 do {hOGA'=0, k'=k+1} goto loc_101010010;

-- for the configuration 1,0,1,0,1,0,0,0,1
loc loc_101010001: while hNFKB >=  dnNFKB1 & hFOXM >=  dnFOXM1 & hMDM2 <=  dpMDM20 & hOGT <=  dpOGT0 & hOGA <=  dpOGA0 & hCMYC >=  dnCMYC1  wait {dhNFKB=1,dhP21=0,dhFOXM=1,dhPI3K=1,dhP53=0,dhMDM2=1,dhOGT=1,dhOGA=1,dhCMYC=1}
when hNFKB=dnNFKB1 do {hNFKB'=0, k'=k+1} goto loc_001010001;
when hFOXM=dnFOXM1 do {hFOXM'=0, k'=k+1} goto loc_100010001;
--when hPI3K=dpPI3K0 do {hPI3K'=0, k'=k+1} goto loc_101110001;
when hMDM2=dpMDM20 do {hMDM2'=0, k'=k+1} goto loc_101011001;
when hOGT=dpOGT0 do {hOGT'=0, k'=k+1} goto loc_101010101;
when hOGA=dpOGA0 do {hOGA'=0, k'=k+1} goto loc_101010011;
when hCMYC=dnCMYC1 do {hCMYC'=0, k'=k+1} goto loc_101010000;

-- for the configuration 1,0,1,0,1,0,0,1,0
loc loc_101010010: while hNFKB >=  dnNFKB1 & hFOXM >=  dnFOXM1 & hMDM2 <=  dpMDM20  wait {dhNFKB=1,dhP21=0,dhFOXM=1,dhPI3K=0,dhP53=0,dhMDM2=1,dhOGT=0,dhOGA=0,dhCMYC=0}
when hNFKB=dnNFKB1 do {hNFKB'=0, k'=k+1} goto loc_001010010;
when hFOXM=dnFOXM1 do {hFOXM'=0, k'=k+1} goto loc_100010010;
when hMDM2=dpMDM20 do {hMDM2'=0, k'=k+1} goto loc_101011010;

-- for the configuration 1,0,1,0,1,0,0,1,1
loc loc_101010011: while hNFKB >=  dnNFKB1 & hFOXM >=  dnFOXM1 & hMDM2 <=  dpMDM20 & hOGT <=  dpOGT0 & hCMYC >=  dnCMYC1  wait {dhNFKB=1,dhP21=0,dhFOXM=1,dhPI3K=1,dhP53=0,dhMDM2=1,dhOGT=1,dhOGA=-1,dhCMYC=1}
when hNFKB=dnNFKB1 do {hNFKB'=0, k'=k+1} goto loc_001010011;
when hFOXM=dnFOXM1 do {hFOXM'=0, k'=k+1} goto loc_100010011;
--when hPI3K=dpPI3K0 do {hPI3K'=0, k'=k+1} goto loc_101110011;
when hMDM2=dpMDM20 do {hMDM2'=0, k'=k+1} goto loc_101011011;
when hOGT=dpOGT0 do {hOGT'=0, k'=k+1} goto loc_101010111;
--when hOGA=dnOGA1 do {hOGA'=0, k'=k+1} goto loc_101010001;
when hCMYC=dnCMYC1 do {hCMYC'=0, k'=k+1} goto loc_101010010;

-- for the configuration 1,0,1,0,1,0,1,0,0
loc loc_101010100: while hNFKB >=  dnNFKB1 & hFOXM >=  dnFOXM1 & hPI3K <=  dpPI3K0 & hMDM2 <=  dpMDM20 & hOGT >=  dnOGT1 & hCMYC <=  dpCMYC0  wait {dhNFKB=1,dhP21=0,dhFOXM=1,dhPI3K=1,dhP53=0,dhMDM2=1,dhOGT=1,dhOGA=1,dhCMYC=1}
when hNFKB=dnNFKB1 do {hNFKB'=0, k'=k+1} goto loc_001010100;
when hFOXM=dnFOXM1 do {hFOXM'=0, k'=k+1} goto loc_100010100;
when hPI3K=dpPI3K0 do {hPI3K'=0, k'=k+1} goto loc_101110100;
when hMDM2=dpMDM20 do {hMDM2'=0, k'=k+1} goto loc_101011100;
when hOGT=dnOGT1 do {hOGT'=0, k'=k+1} goto loc_101010000;
--when hOGA=dpOGA0 do {hOGA'=0, k'=k+1} goto loc_101010110;
when hCMYC=dpCMYC0 do {hCMYC'=0, k'=k+1} goto loc_101010101;

-- for the configuration 1,0,1,0,1,0,1,0,1
loc loc_101010101: while hNFKB >=  dnNFKB1 & hFOXM >=  dnFOXM1 & hPI3K <=  dpPI3K0 & hMDM2 <=  dpMDM20  wait {dhNFKB=1,dhP21=0,dhFOXM=1,dhPI3K=1,dhP53=0,dhMDM2=1,dhOGT=0,dhOGA=0,dhCMYC=0}
when hNFKB=dnNFKB1 do {hNFKB'=0, k'=k+1} goto loc_001010101;
when hFOXM=dnFOXM1 do {hFOXM'=0, k'=k+1} goto loc_100010101;
when hPI3K=dpPI3K0 do {hPI3K'=0, k'=k+1} goto loc_101110101;
when hMDM2=dpMDM20 do {hMDM2'=0, k'=k+1} goto loc_101011101;

-- for the configuration 1,0,1,0,1,0,1,1,0
loc loc_101010110: while hNFKB >=  dnNFKB1 & hFOXM >=  dnFOXM1 & hPI3K <=  dpPI3K0 & hMDM2 <=  dpMDM20 & hOGT >=  dnOGT1 & hOGA >=  dnOGA1 & hCMYC <=  dpCMYC0  wait {dhNFKB=1,dhP21=0,dhFOXM=1,dhPI3K=1,dhP53=0,dhMDM2=1,dhOGT=1,dhOGA=1,dhCMYC=1}
when hNFKB=dnNFKB1 do {hNFKB'=0, k'=k+1} goto loc_001010110;
when hFOXM=dnFOXM1 do {hFOXM'=0, k'=k+1} goto loc_100010110;
when hPI3K=dpPI3K0 do {hPI3K'=0, k'=k+1} goto loc_101110110;
when hMDM2=dpMDM20 do {hMDM2'=0, k'=k+1} goto loc_101011110;
when hOGT=dnOGT1 do {hOGT'=0, k'=k+1} goto loc_101010010;
when hOGA=dnOGA1 do {hOGA'=0, k'=k+1} goto loc_101010100;
when hCMYC=dpCMYC0 do {hCMYC'=0, k'=k+1} goto loc_101010111;

-- for the configuration 1,0,1,0,1,0,1,1,1
loc loc_101010111: while hNFKB >=  dnNFKB1 & hFOXM >=  dnFOXM1 & hPI3K <=  dpPI3K0 & hMDM2 <=  dpMDM20 & hOGA >=  dnOGA1  wait {dhNFKB=1,dhP21=0,dhFOXM=1,dhPI3K=1,dhP53=0,dhMDM2=1,dhOGT=0,dhOGA=1,dhCMYC=0}
when hNFKB=dnNFKB1 do {hNFKB'=0, k'=k+1} goto loc_001010111;
when hFOXM=dnFOXM1 do {hFOXM'=0, k'=k+1} goto loc_100010111;
when hPI3K=dpPI3K0 do {hPI3K'=0, k'=k+1} goto loc_101110111;
when hMDM2=dpMDM20 do {hMDM2'=0, k'=k+1} goto loc_101011111;
when hOGA=dnOGA1 do {hOGA'=0, k'=k+1} goto loc_101010101;

-- for the configuration 1,0,1,0,1,1,0,0,0
loc loc_101011000: while hNFKB >=  dnNFKB1 & hFOXM >=  dnFOXM1 & hOGA <=  dpOGA0  wait {dhNFKB=1,dhP21=0,dhFOXM=1,dhPI3K=0,dhP53=-1,dhMDM2=0,dhOGT=0,dhOGA=1,dhCMYC=0}
when hNFKB=dnNFKB1 do {hNFKB'=0, k'=k+1} goto loc_001011000;
when hFOXM=dnFOXM1 do {hFOXM'=0, k'=k+1} goto loc_100011000;
--when hP53=dnP531 do {hP53'=0, k'=k+1} goto loc_101001000;
when hOGA=dpOGA0 do {hOGA'=0, k'=k+1} goto loc_101011010;

-- for the configuration 1,0,1,0,1,1,0,0,1
loc loc_101011001: while hNFKB >=  dnNFKB1 & hFOXM >=  dnFOXM1 & hOGT <=  dpOGT0 & hOGA <=  dpOGA0 & hCMYC >=  dnCMYC1  wait {dhNFKB=1,dhP21=0,dhFOXM=1,dhPI3K=1,dhP53=-1,dhMDM2=0,dhOGT=1,dhOGA=1,dhCMYC=1}
when hNFKB=dnNFKB1 do {hNFKB'=0, k'=k+1} goto loc_001011001;
when hFOXM=dnFOXM1 do {hFOXM'=0, k'=k+1} goto loc_100011001;
--when hPI3K=dpPI3K0 do {hPI3K'=0, k'=k+1} goto loc_101111001;
--when hP53=dnP531 do {hP53'=0, k'=k+1} goto loc_101001001;
when hOGT=dpOGT0 do {hOGT'=0, k'=k+1} goto loc_101011101;
when hOGA=dpOGA0 do {hOGA'=0, k'=k+1} goto loc_101011011;
when hCMYC=dnCMYC1 do {hCMYC'=0, k'=k+1} goto loc_101011000;

-- for the configuration 1,0,1,0,1,1,0,1,0
loc loc_101011010: while hNFKB >=  dnNFKB1 & hFOXM >=  dnFOXM1  wait {dhNFKB=1,dhP21=0,dhFOXM=1,dhPI3K=0,dhP53=-1,dhMDM2=0,dhOGT=0,dhOGA=0,dhCMYC=0}
when hNFKB=dnNFKB1 do {hNFKB'=0, k'=k+1} goto loc_001011010;
when hFOXM=dnFOXM1 do {hFOXM'=0, k'=k+1} goto loc_100011010;
--when hP53=dnP531 do {hP53'=0, k'=k+1} goto loc_101001010;

-- for the configuration 1,0,1,0,1,1,0,1,1
loc loc_101011011: while hNFKB >=  dnNFKB1 & hFOXM >=  dnFOXM1 & hOGT <=  dpOGT0 & hCMYC >=  dnCMYC1  wait {dhNFKB=1,dhP21=0,dhFOXM=1,dhPI3K=1,dhP53=-1,dhMDM2=0,dhOGT=1,dhOGA=-1,dhCMYC=1}
when hNFKB=dnNFKB1 do {hNFKB'=0, k'=k+1} goto loc_001011011;
when hFOXM=dnFOXM1 do {hFOXM'=0, k'=k+1} goto loc_100011011;
--when hPI3K=dpPI3K0 do {hPI3K'=0, k'=k+1} goto loc_101111011;
--when hP53=dnP531 do {hP53'=0, k'=k+1} goto loc_101001011;
when hOGT=dpOGT0 do {hOGT'=0, k'=k+1} goto loc_101011111;
--when hOGA=dnOGA1 do {hOGA'=0, k'=k+1} goto loc_101011001;
when hCMYC=dnCMYC1 do {hCMYC'=0, k'=k+1} goto loc_101011010;

-- for the configuration 1,0,1,0,1,1,1,0,0
loc loc_101011100: while hNFKB >=  dnNFKB1 & hFOXM >=  dnFOXM1 & hPI3K <=  dpPI3K0 & hOGT >=  dnOGT1 & hCMYC <=  dpCMYC0  wait {dhNFKB=1,dhP21=0,dhFOXM=1,dhPI3K=1,dhP53=-1,dhMDM2=0,dhOGT=1,dhOGA=1,dhCMYC=1}
when hNFKB=dnNFKB1 do {hNFKB'=0, k'=k+1} goto loc_001011100;
when hFOXM=dnFOXM1 do {hFOXM'=0, k'=k+1} goto loc_100011100;
when hPI3K=dpPI3K0 do {hPI3K'=0, k'=k+1} goto loc_101111100;
--when hP53=dnP531 do {hP53'=0, k'=k+1} goto loc_101001100;
when hOGT=dnOGT1 do {hOGT'=0, k'=k+1} goto loc_101011000;
--when hOGA=dpOGA0 do {hOGA'=0, k'=k+1} goto loc_101011110;
when hCMYC=dpCMYC0 do {hCMYC'=0, k'=k+1} goto loc_101011101;

-- for the configuration 1,0,1,0,1,1,1,0,1
loc loc_101011101: while hNFKB >=  dnNFKB1 & hFOXM >=  dnFOXM1 & hPI3K <=  dpPI3K0  wait {dhNFKB=1,dhP21=0,dhFOXM=1,dhPI3K=1,dhP53=-1,dhMDM2=0,dhOGT=0,dhOGA=0,dhCMYC=0}
when hNFKB=dnNFKB1 do {hNFKB'=0, k'=k+1} goto loc_001011101;
when hFOXM=dnFOXM1 do {hFOXM'=0, k'=k+1} goto loc_100011101;
when hPI3K=dpPI3K0 do {hPI3K'=0, k'=k+1} goto loc_101111101;
--when hP53=dnP531 do {hP53'=0, k'=k+1} goto loc_101001101;

-- for the configuration 1,0,1,0,1,1,1,1,0
loc loc_101011110: while hNFKB >=  dnNFKB1 & hFOXM >=  dnFOXM1 & hPI3K <=  dpPI3K0 & hOGT >=  dnOGT1 & hOGA >=  dnOGA1 & hCMYC <=  dpCMYC0  wait {dhNFKB=1,dhP21=0,dhFOXM=1,dhPI3K=1,dhP53=-1,dhMDM2=0,dhOGT=1,dhOGA=1,dhCMYC=1}
when hNFKB=dnNFKB1 do {hNFKB'=0, k'=k+1} goto loc_001011110;
when hFOXM=dnFOXM1 do {hFOXM'=0, k'=k+1} goto loc_100011110;
when hPI3K=dpPI3K0 do {hPI3K'=0, k'=k+1} goto loc_101111110;
--when hP53=dnP531 do {hP53'=0, k'=k+1} goto loc_101001110;
when hOGT=dnOGT1 do {hOGT'=0, k'=k+1} goto loc_101011010;
when hOGA=dnOGA1 do {hOGA'=0, k'=k+1} goto loc_101011100;
when hCMYC=dpCMYC0 do {hCMYC'=0, k'=k+1} goto loc_101011111;

-- for the configuration 1,0,1,0,1,1,1,1,1
loc loc_101011111: while hNFKB >=  dnNFKB1 & hFOXM >=  dnFOXM1 & hPI3K <=  dpPI3K0 & hOGA >=  dnOGA1  wait {dhNFKB=1,dhP21=0,dhFOXM=1,dhPI3K=1,dhP53=-1,dhMDM2=0,dhOGT=0,dhOGA=1,dhCMYC=0}
when hNFKB=dnNFKB1 do {hNFKB'=0, k'=k+1} goto loc_001011111;
when hFOXM=dnFOXM1 do {hFOXM'=0, k'=k+1} goto loc_100011111;
when hPI3K=dpPI3K0 do {hPI3K'=0, k'=k+1} goto loc_101111111;
--when hP53=dnP531 do {hP53'=0, k'=k+1} goto loc_101001111;
when hOGA=dnOGA1 do {hOGA'=0, k'=k+1} goto loc_101011101;

-- for the configuration 1,0,1,1,0,0,0,0,0
loc loc_101100000: while hP53 <=  dpP530 & hOGA <=  dpOGA0  wait {dhNFKB=0,dhP21=0,dhFOXM=0,dhPI3K=-1,dhP53=1,dhMDM2=1,dhOGT=0,dhOGA=1,dhCMYC=0}
--when hPI3K=dnPI3K1 do {hPI3K'=0, k'=k+1} goto loc_101000000;
when hP53=dpP530 do {hP53'=0, k'=k+1} goto loc_101110000;
--when hMDM2=dpMDM20 do {hMDM2'=0, k'=k+1} goto loc_101101000;
when hOGA=dpOGA0 do {hOGA'=0, k'=k+1} goto loc_101100010;

-- for the configuration 1,0,1,1,0,0,0,0,1
loc loc_101100001: while hP53 <=  dpP530 & hOGT <=  dpOGT0 & hOGA <=  dpOGA0 & hCMYC >=  dnCMYC1  wait {dhNFKB=0,dhP21=0,dhFOXM=0,dhPI3K=-1,dhP53=1,dhMDM2=1,dhOGT=1,dhOGA=1,dhCMYC=1}
--when hPI3K=dnPI3K1 do {hPI3K'=0, k'=k+1} goto loc_101000001;
when hP53=dpP530 do {hP53'=0, k'=k+1} goto loc_101110001;
--when hMDM2=dpMDM20 do {hMDM2'=0, k'=k+1} goto loc_101101001;
when hOGT=dpOGT0 do {hOGT'=0, k'=k+1} goto loc_101100101;
when hOGA=dpOGA0 do {hOGA'=0, k'=k+1} goto loc_101100011;
when hCMYC=dnCMYC1 do {hCMYC'=0, k'=k+1} goto loc_101100000;

-- for the configuration 1,0,1,1,0,0,0,1,0
loc loc_101100010: while hP53 <=  dpP530  wait {dhNFKB=0,dhP21=0,dhFOXM=0,dhPI3K=-1,dhP53=1,dhMDM2=1,dhOGT=0,dhOGA=0,dhCMYC=0}
--when hPI3K=dnPI3K1 do {hPI3K'=0, k'=k+1} goto loc_101000010;
when hP53=dpP530 do {hP53'=0, k'=k+1} goto loc_101110010;
--when hMDM2=dpMDM20 do {hMDM2'=0, k'=k+1} goto loc_101101010;

-- for the configuration 1,0,1,1,0,0,0,1,1
loc loc_101100011: while hP53 <=  dpP530 & hOGT <=  dpOGT0 & hCMYC >=  dnCMYC1  wait {dhNFKB=0,dhP21=0,dhFOXM=0,dhPI3K=-1,dhP53=1,dhMDM2=1,dhOGT=1,dhOGA=-1,dhCMYC=1}
--when hPI3K=dnPI3K1 do {hPI3K'=0, k'=k+1} goto loc_101000011;
when hP53=dpP530 do {hP53'=0, k'=k+1} goto loc_101110011;
--when hMDM2=dpMDM20 do {hMDM2'=0, k'=k+1} goto loc_101101011;
when hOGT=dpOGT0 do {hOGT'=0, k'=k+1} goto loc_101100111;
--when hOGA=dnOGA1 do {hOGA'=0, k'=k+1} goto loc_101100001;
when hCMYC=dnCMYC1 do {hCMYC'=0, k'=k+1} goto loc_101100010;

-- for the configuration 1,0,1,1,0,0,1,0,0
loc loc_101100100: while hP53 <=  dpP530 & hOGT >=  dnOGT1  wait {dhNFKB=0,dhP21=0,dhFOXM=0,dhPI3K=0,dhP53=1,dhMDM2=1,dhOGT=1,dhOGA=1,dhCMYC=1}
when hP53=dpP530 do {hP53'=0, k'=k+1} goto loc_101110100;
--when hMDM2=dpMDM20 do {hMDM2'=0, k'=k+1} goto loc_101101100;
when hOGT=dnOGT1 do {hOGT'=0, k'=k+1} goto loc_101100000;
--when hOGA=dpOGA0 do {hOGA'=0, k'=k+1} goto loc_101100110;
--when hCMYC=dpCMYC0 do {hCMYC'=0, k'=k+1} goto loc_101100101;

-- for the configuration 1,0,1,1,0,0,1,0,1
loc loc_101100101: while hP53 <=  dpP530  wait {dhNFKB=0,dhP21=0,dhFOXM=0,dhPI3K=0,dhP53=1,dhMDM2=1,dhOGT=0,dhOGA=0,dhCMYC=0}
when hP53=dpP530 do {hP53'=0, k'=k+1} goto loc_101110101;
--when hMDM2=dpMDM20 do {hMDM2'=0, k'=k+1} goto loc_101101101;

-- for the configuration 1,0,1,1,0,0,1,1,0
loc loc_101100110: while hP53 <=  dpP530 & hOGT >=  dnOGT1 & hOGA >=  dnOGA1  wait {dhNFKB=0,dhP21=0,dhFOXM=0,dhPI3K=0,dhP53=1,dhMDM2=1,dhOGT=1,dhOGA=1,dhCMYC=1}
when hP53=dpP530 do {hP53'=0, k'=k+1} goto loc_101110110;
--when hMDM2=dpMDM20 do {hMDM2'=0, k'=k+1} goto loc_101101110;
when hOGT=dnOGT1 do {hOGT'=0, k'=k+1} goto loc_101100010;
when hOGA=dnOGA1 do {hOGA'=0, k'=k+1} goto loc_101100100;
--when hCMYC=dpCMYC0 do {hCMYC'=0, k'=k+1} goto loc_101100111;

-- for the configuration 1,0,1,1,0,0,1,1,1
loc loc_101100111: while hP53 <=  dpP530 & hOGA >=  dnOGA1  wait {dhNFKB=0,dhP21=0,dhFOXM=0,dhPI3K=0,dhP53=1,dhMDM2=1,dhOGT=0,dhOGA=1,dhCMYC=0}
when hP53=dpP530 do {hP53'=0, k'=k+1} goto loc_101110111;
--when hMDM2=dpMDM20 do {hMDM2'=0, k'=k+1} goto loc_101101111;
when hOGA=dnOGA1 do {hOGA'=0, k'=k+1} goto loc_101100101;

-- for the configuration 1,0,1,1,0,1,0,0,0
loc loc_101101000: while hP53 <=  dpP530 & hMDM2 >=  dnMDM21 & hOGA <=  dpOGA0  wait {dhNFKB=0,dhP21=0,dhFOXM=0,dhPI3K=-1,dhP53=1,dhMDM2=1,dhOGT=0,dhOGA=1,dhCMYC=0}
--when hPI3K=dnPI3K1 do {hPI3K'=0, k'=k+1} goto loc_101001000;
when hP53=dpP530 do {hP53'=0, k'=k+1} goto loc_101111000;
when hMDM2=dnMDM21 do {hMDM2'=0, k'=k+1} goto loc_101100000;
when hOGA=dpOGA0 do {hOGA'=0, k'=k+1} goto loc_101101010;

-- for the configuration 1,0,1,1,0,1,0,0,1
loc loc_101101001: while hP53 <=  dpP530 & hMDM2 >=  dnMDM21 & hOGT <=  dpOGT0 & hOGA <=  dpOGA0 & hCMYC >=  dnCMYC1  wait {dhNFKB=0,dhP21=0,dhFOXM=0,dhPI3K=-1,dhP53=1,dhMDM2=1,dhOGT=1,dhOGA=1,dhCMYC=1}
--when hPI3K=dnPI3K1 do {hPI3K'=0, k'=k+1} goto loc_101001001;
when hP53=dpP530 do {hP53'=0, k'=k+1} goto loc_101111001;
when hMDM2=dnMDM21 do {hMDM2'=0, k'=k+1} goto loc_101100001;
when hOGT=dpOGT0 do {hOGT'=0, k'=k+1} goto loc_101101101;
when hOGA=dpOGA0 do {hOGA'=0, k'=k+1} goto loc_101101011;
when hCMYC=dnCMYC1 do {hCMYC'=0, k'=k+1} goto loc_101101000;

-- for the configuration 1,0,1,1,0,1,0,1,0
loc loc_101101010: while hP53 <=  dpP530 & hMDM2 >=  dnMDM21  wait {dhNFKB=0,dhP21=0,dhFOXM=0,dhPI3K=-1,dhP53=1,dhMDM2=1,dhOGT=0,dhOGA=0,dhCMYC=0}
--when hPI3K=dnPI3K1 do {hPI3K'=0, k'=k+1} goto loc_101001010;
when hP53=dpP530 do {hP53'=0, k'=k+1} goto loc_101111010;
when hMDM2=dnMDM21 do {hMDM2'=0, k'=k+1} goto loc_101100010;

-- for the configuration 1,0,1,1,0,1,0,1,1
loc loc_101101011: while hP53 <=  dpP530 & hMDM2 >=  dnMDM21 & hOGT <=  dpOGT0 & hCMYC >=  dnCMYC1  wait {dhNFKB=0,dhP21=0,dhFOXM=0,dhPI3K=-1,dhP53=1,dhMDM2=1,dhOGT=1,dhOGA=-1,dhCMYC=1}
--when hPI3K=dnPI3K1 do {hPI3K'=0, k'=k+1} goto loc_101001011;
when hP53=dpP530 do {hP53'=0, k'=k+1} goto loc_101111011;
when hMDM2=dnMDM21 do {hMDM2'=0, k'=k+1} goto loc_101100011;
when hOGT=dpOGT0 do {hOGT'=0, k'=k+1} goto loc_101101111;
--when hOGA=dnOGA1 do {hOGA'=0, k'=k+1} goto loc_101101001;
when hCMYC=dnCMYC1 do {hCMYC'=0, k'=k+1} goto loc_101101010;

-- for the configuration 1,0,1,1,0,1,1,0,0
loc loc_101101100: while hP53 <=  dpP530 & hMDM2 >=  dnMDM21 & hOGT >=  dnOGT1  wait {dhNFKB=0,dhP21=0,dhFOXM=0,dhPI3K=0,dhP53=1,dhMDM2=1,dhOGT=1,dhOGA=1,dhCMYC=1}
when hP53=dpP530 do {hP53'=0, k'=k+1} goto loc_101111100;
when hMDM2=dnMDM21 do {hMDM2'=0, k'=k+1} goto loc_101100100;
when hOGT=dnOGT1 do {hOGT'=0, k'=k+1} goto loc_101101000;
--when hOGA=dpOGA0 do {hOGA'=0, k'=k+1} goto loc_101101110;
--when hCMYC=dpCMYC0 do {hCMYC'=0, k'=k+1} goto loc_101101101;

-- for the configuration 1,0,1,1,0,1,1,0,1
loc loc_101101101: while hP53 <=  dpP530 & hMDM2 >=  dnMDM21  wait {dhNFKB=0,dhP21=0,dhFOXM=0,dhPI3K=0,dhP53=1,dhMDM2=1,dhOGT=0,dhOGA=0,dhCMYC=0}
when hP53=dpP530 do {hP53'=0, k'=k+1} goto loc_101111101;
when hMDM2=dnMDM21 do {hMDM2'=0, k'=k+1} goto loc_101100101;

-- for the configuration 1,0,1,1,0,1,1,1,0
loc loc_101101110: while hP53 <=  dpP530 & hMDM2 >=  dnMDM21 & hOGT >=  dnOGT1 & hOGA >=  dnOGA1  wait {dhNFKB=0,dhP21=0,dhFOXM=0,dhPI3K=0,dhP53=1,dhMDM2=1,dhOGT=1,dhOGA=1,dhCMYC=1}
when hP53=dpP530 do {hP53'=0, k'=k+1} goto loc_101111110;
when hMDM2=dnMDM21 do {hMDM2'=0, k'=k+1} goto loc_101100110;
when hOGT=dnOGT1 do {hOGT'=0, k'=k+1} goto loc_101101010;
when hOGA=dnOGA1 do {hOGA'=0, k'=k+1} goto loc_101101100;
--when hCMYC=dpCMYC0 do {hCMYC'=0, k'=k+1} goto loc_101101111;

-- for the configuration 1,0,1,1,0,1,1,1,1
loc loc_101101111: while hP53 <=  dpP530 & hMDM2 >=  dnMDM21 & hOGA >=  dnOGA1  wait {dhNFKB=0,dhP21=0,dhFOXM=0,dhPI3K=0,dhP53=1,dhMDM2=1,dhOGT=0,dhOGA=1,dhCMYC=0}
when hP53=dpP530 do {hP53'=0, k'=k+1} goto loc_101111111;
when hMDM2=dnMDM21 do {hMDM2'=0, k'=k+1} goto loc_101100111;
when hOGA=dnOGA1 do {hOGA'=0, k'=k+1} goto loc_101101101;

-- for the configuration 1,0,1,1,1,0,0,0,0
loc loc_101110000: while hPI3K >=  dnPI3K1 & hMDM2 <=  dpMDM20 & hOGA <=  dpOGA0  wait {dhNFKB=-1,dhP21=0,dhFOXM=-1,dhPI3K=1,dhP53=0,dhMDM2=1,dhOGT=0,dhOGA=1,dhCMYC=0}
--when hNFKB=dnNFKB1 do {hNFKB'=0, k'=k+1} goto loc_001110000;
--when hFOXM=dnFOXM1 do {hFOXM'=0, k'=k+1} goto loc_100110000;
when hPI3K=dnPI3K1 do {hPI3K'=0, k'=k+1} goto loc_101010000;
when hMDM2=dpMDM20 do {hMDM2'=0, k'=k+1} goto loc_101111000;
when hOGA=dpOGA0 do {hOGA'=0, k'=k+1} goto loc_101110010;

-- for the configuration 1,0,1,1,1,0,0,0,1
loc loc_101110001: while hPI3K >=  dnPI3K1 & hMDM2 <=  dpMDM20 & hOGT <=  dpOGT0 & hOGA <=  dpOGA0 & hCMYC >=  dnCMYC1  wait {dhNFKB=-1,dhP21=0,dhFOXM=-1,dhPI3K=1,dhP53=0,dhMDM2=1,dhOGT=1,dhOGA=1,dhCMYC=1}
--when hNFKB=dnNFKB1 do {hNFKB'=0, k'=k+1} goto loc_001110001;
--when hFOXM=dnFOXM1 do {hFOXM'=0, k'=k+1} goto loc_100110001;
when hPI3K=dnPI3K1 do {hPI3K'=0, k'=k+1} goto loc_101010001;
when hMDM2=dpMDM20 do {hMDM2'=0, k'=k+1} goto loc_101111001;
when hOGT=dpOGT0 do {hOGT'=0, k'=k+1} goto loc_101110101;
when hOGA=dpOGA0 do {hOGA'=0, k'=k+1} goto loc_101110011;
when hCMYC=dnCMYC1 do {hCMYC'=0, k'=k+1} goto loc_101110000;

-- for the configuration 1,0,1,1,1,0,0,1,0
loc loc_101110010: while hPI3K >=  dnPI3K1 & hMDM2 <=  dpMDM20  wait {dhNFKB=-1,dhP21=0,dhFOXM=-1,dhPI3K=1,dhP53=0,dhMDM2=1,dhOGT=0,dhOGA=0,dhCMYC=0}
--when hNFKB=dnNFKB1 do {hNFKB'=0, k'=k+1} goto loc_001110010;
--when hFOXM=dnFOXM1 do {hFOXM'=0, k'=k+1} goto loc_100110010;
when hPI3K=dnPI3K1 do {hPI3K'=0, k'=k+1} goto loc_101010010;
when hMDM2=dpMDM20 do {hMDM2'=0, k'=k+1} goto loc_101111010;

-- for the configuration 1,0,1,1,1,0,0,1,1
loc loc_101110011: while hPI3K >=  dnPI3K1 & hMDM2 <=  dpMDM20 & hOGT <=  dpOGT0 & hCMYC >=  dnCMYC1  wait {dhNFKB=-1,dhP21=0,dhFOXM=-1,dhPI3K=1,dhP53=0,dhMDM2=1,dhOGT=1,dhOGA=-1,dhCMYC=1}
--when hNFKB=dnNFKB1 do {hNFKB'=0, k'=k+1} goto loc_001110011;
--when hFOXM=dnFOXM1 do {hFOXM'=0, k'=k+1} goto loc_100110011;
when hPI3K=dnPI3K1 do {hPI3K'=0, k'=k+1} goto loc_101010011;
when hMDM2=dpMDM20 do {hMDM2'=0, k'=k+1} goto loc_101111011;
when hOGT=dpOGT0 do {hOGT'=0, k'=k+1} goto loc_101110111;
--when hOGA=dnOGA1 do {hOGA'=0, k'=k+1} goto loc_101110001;
when hCMYC=dnCMYC1 do {hCMYC'=0, k'=k+1} goto loc_101110010;

-- for the configuration 1,0,1,1,1,0,1,0,0
loc loc_101110100: while hMDM2 <=  dpMDM20 & hOGT >=  dnOGT1 & hCMYC <=  dpCMYC0  wait {dhNFKB=0,dhP21=0,dhFOXM=0,dhPI3K=-1,dhP53=0,dhMDM2=1,dhOGT=1,dhOGA=1,dhCMYC=1}
--when hPI3K=dnPI3K1 do {hPI3K'=0, k'=k+1} goto loc_101010100;
when hMDM2=dpMDM20 do {hMDM2'=0, k'=k+1} goto loc_101111100;
when hOGT=dnOGT1 do {hOGT'=0, k'=k+1} goto loc_101110000;
--when hOGA=dpOGA0 do {hOGA'=0, k'=k+1} goto loc_101110110;
when hCMYC=dpCMYC0 do {hCMYC'=0, k'=k+1} goto loc_101110101;

-- for the configuration 1,0,1,1,1,0,1,0,1
loc loc_101110101: while hMDM2 <=  dpMDM20  wait {dhNFKB=0,dhP21=0,dhFOXM=0,dhPI3K=0,dhP53=0,dhMDM2=1,dhOGT=0,dhOGA=0,dhCMYC=0}
when hMDM2=dpMDM20 do {hMDM2'=0, k'=k+1} goto loc_101111101;

-- for the configuration 1,0,1,1,1,0,1,1,0
loc loc_101110110: while hMDM2 <=  dpMDM20 & hOGT >=  dnOGT1 & hOGA >=  dnOGA1 & hCMYC <=  dpCMYC0  wait {dhNFKB=0,dhP21=0,dhFOXM=0,dhPI3K=-1,dhP53=0,dhMDM2=1,dhOGT=1,dhOGA=1,dhCMYC=1}
--when hPI3K=dnPI3K1 do {hPI3K'=0, k'=k+1} goto loc_101010110;
when hMDM2=dpMDM20 do {hMDM2'=0, k'=k+1} goto loc_101111110;
when hOGT=dnOGT1 do {hOGT'=0, k'=k+1} goto loc_101110010;
when hOGA=dnOGA1 do {hOGA'=0, k'=k+1} goto loc_101110100;
when hCMYC=dpCMYC0 do {hCMYC'=0, k'=k+1} goto loc_101110111;

-- for the configuration 1,0,1,1,1,0,1,1,1
loc loc_101110111: while hMDM2 <=  dpMDM20 & hOGA >=  dnOGA1  wait {dhNFKB=0,dhP21=0,dhFOXM=0,dhPI3K=0,dhP53=0,dhMDM2=1,dhOGT=0,dhOGA=1,dhCMYC=0}
when hMDM2=dpMDM20 do {hMDM2'=0, k'=k+1} goto loc_101111111;
when hOGA=dnOGA1 do {hOGA'=0, k'=k+1} goto loc_101110101;

-- for the configuration 1,0,1,1,1,1,0,0,0
loc loc_101111000: while hPI3K >=  dnPI3K1 & hOGA <=  dpOGA0  wait {dhNFKB=-1,dhP21=0,dhFOXM=-1,dhPI3K=1,dhP53=0,dhMDM2=0,dhOGT=0,dhOGA=1,dhCMYC=0}
--when hNFKB=dnNFKB1 do {hNFKB'=0, k'=k+1} goto loc_001111000;
--when hFOXM=dnFOXM1 do {hFOXM'=0, k'=k+1} goto loc_100111000;
when hPI3K=dnPI3K1 do {hPI3K'=0, k'=k+1} goto loc_101011000;
when hOGA=dpOGA0 do {hOGA'=0, k'=k+1} goto loc_101111010;

-- for the configuration 1,0,1,1,1,1,0,0,1
loc loc_101111001: while hPI3K >=  dnPI3K1 & hOGT <=  dpOGT0 & hOGA <=  dpOGA0 & hCMYC >=  dnCMYC1  wait {dhNFKB=-1,dhP21=0,dhFOXM=-1,dhPI3K=1,dhP53=0,dhMDM2=0,dhOGT=1,dhOGA=1,dhCMYC=1}
--when hNFKB=dnNFKB1 do {hNFKB'=0, k'=k+1} goto loc_001111001;
--when hFOXM=dnFOXM1 do {hFOXM'=0, k'=k+1} goto loc_100111001;
when hPI3K=dnPI3K1 do {hPI3K'=0, k'=k+1} goto loc_101011001;
when hOGT=dpOGT0 do {hOGT'=0, k'=k+1} goto loc_101111101;
when hOGA=dpOGA0 do {hOGA'=0, k'=k+1} goto loc_101111011;
when hCMYC=dnCMYC1 do {hCMYC'=0, k'=k+1} goto loc_101111000;

-- for the configuration 1,0,1,1,1,1,0,1,0
loc loc_101111010: while hPI3K >=  dnPI3K1  wait {dhNFKB=-1,dhP21=0,dhFOXM=-1,dhPI3K=1,dhP53=0,dhMDM2=0,dhOGT=0,dhOGA=0,dhCMYC=0}
--when hNFKB=dnNFKB1 do {hNFKB'=0, k'=k+1} goto loc_001111010;
--when hFOXM=dnFOXM1 do {hFOXM'=0, k'=k+1} goto loc_100111010;
when hPI3K=dnPI3K1 do {hPI3K'=0, k'=k+1} goto loc_101011010;

-- for the configuration 1,0,1,1,1,1,0,1,1
loc loc_101111011: while hPI3K >=  dnPI3K1 & hOGT <=  dpOGT0 & hCMYC >=  dnCMYC1  wait {dhNFKB=-1,dhP21=0,dhFOXM=-1,dhPI3K=1,dhP53=0,dhMDM2=0,dhOGT=1,dhOGA=-1,dhCMYC=1}
--when hNFKB=dnNFKB1 do {hNFKB'=0, k'=k+1} goto loc_001111011;
--when hFOXM=dnFOXM1 do {hFOXM'=0, k'=k+1} goto loc_100111011;
when hPI3K=dnPI3K1 do {hPI3K'=0, k'=k+1} goto loc_101011011;
when hOGT=dpOGT0 do {hOGT'=0, k'=k+1} goto loc_101111111;
--when hOGA=dnOGA1 do {hOGA'=0, k'=k+1} goto loc_101111001;
when hCMYC=dnCMYC1 do {hCMYC'=0, k'=k+1} goto loc_101111010;

-- for the configuration 1,0,1,1,1,1,1,0,0
loc loc_101111100: while hOGT >=  dnOGT1 & hCMYC <=  dpCMYC0  wait {dhNFKB=0,dhP21=0,dhFOXM=0,dhPI3K=-1,dhP53=0,dhMDM2=0,dhOGT=1,dhOGA=1,dhCMYC=1}
--when hPI3K=dnPI3K1 do {hPI3K'=0, k'=k+1} goto loc_101011100;
when hOGT=dnOGT1 do {hOGT'=0, k'=k+1} goto loc_101111000;
--when hOGA=dpOGA0 do {hOGA'=0, k'=k+1} goto loc_101111110;
when hCMYC=dpCMYC0 do {hCMYC'=0, k'=k+1} goto loc_101111101;

-- for the configuration 1,0,1,1,1,1,1,0,1
loc loc_101111101: while  True  wait {dhNFKB=0,dhP21=0,dhFOXM=0,dhPI3K=0,dhP53=0,dhMDM2=0,dhOGT=0,dhOGA=0,dhCMYC=0}

-- for the configuration 1,0,1,1,1,1,1,1,0
loc loc_101111110: while hOGT >=  dnOGT1 & hOGA >=  dnOGA1 & hCMYC <=  dpCMYC0  wait {dhNFKB=0,dhP21=0,dhFOXM=0,dhPI3K=-1,dhP53=0,dhMDM2=0,dhOGT=1,dhOGA=1,dhCMYC=1}
--when hPI3K=dnPI3K1 do {hPI3K'=0, k'=k+1} goto loc_101011110;
when hOGT=dnOGT1 do {hOGT'=0, k'=k+1} goto loc_101111010;
when hOGA=dnOGA1 do {hOGA'=0, k'=k+1} goto loc_101111100;
when hCMYC=dpCMYC0 do {hCMYC'=0, k'=k+1} goto loc_101111111;

-- for the configuration 1,0,1,1,1,1,1,1,1
loc loc_101111111: while hOGA >=  dnOGA1  wait {dhNFKB=0,dhP21=0,dhFOXM=0,dhPI3K=0,dhP53=0,dhMDM2=0,dhOGT=0,dhOGA=1,dhCMYC=0}
when hOGA=dnOGA1 do {hOGA'=0, k'=k+1} goto loc_101111101;

-- for the configuration 1,1,0,0,0,0,0,0,0
loc loc_110000000: while hNFKB >=  dnNFKB1 & hPI3K <=  dpPI3K0 & hP53 <=  dpP530 & hOGA <=  dpOGA0  wait {dhNFKB=1,dhP21=-1,dhFOXM=0,dhPI3K=1,dhP53=1,dhMDM2=1,dhOGT=0,dhOGA=1,dhCMYC=0}
when hNFKB=dnNFKB1 do {hNFKB'=0, k'=k+1} goto loc_010000000;
--when hP21=dnP211 do {hP21'=0, k'=k+1} goto loc_100000000;
when hPI3K=dpPI3K0 do {hPI3K'=0, k'=k+1} goto loc_110100000;
when hP53=dpP530 do {hP53'=0, k'=k+1} goto loc_110010000;
--when hMDM2=dpMDM20 do {hMDM2'=0, k'=k+1} goto loc_110001000;
when hOGA=dpOGA0 do {hOGA'=0, k'=k+1} goto loc_110000010;

-- for the configuration 1,1,0,0,0,0,0,0,1
loc loc_110000001: while hNFKB >=  dnNFKB1 & hPI3K <=  dpPI3K0 & hP53 <=  dpP530 & hOGT <=  dpOGT0 & hOGA <=  dpOGA0 & hCMYC >=  dnCMYC1  wait {dhNFKB=1,dhP21=-1,dhFOXM=0,dhPI3K=1,dhP53=1,dhMDM2=1,dhOGT=1,dhOGA=1,dhCMYC=1}
when hNFKB=dnNFKB1 do {hNFKB'=0, k'=k+1} goto loc_010000001;
--when hP21=dnP211 do {hP21'=0, k'=k+1} goto loc_100000001;
when hPI3K=dpPI3K0 do {hPI3K'=0, k'=k+1} goto loc_110100001;
when hP53=dpP530 do {hP53'=0, k'=k+1} goto loc_110010001;
--when hMDM2=dpMDM20 do {hMDM2'=0, k'=k+1} goto loc_110001001;
when hOGT=dpOGT0 do {hOGT'=0, k'=k+1} goto loc_110000101;
when hOGA=dpOGA0 do {hOGA'=0, k'=k+1} goto loc_110000011;
when hCMYC=dnCMYC1 do {hCMYC'=0, k'=k+1} goto loc_110000000;

-- for the configuration 1,1,0,0,0,0,0,1,0
loc loc_110000010: while hNFKB >=  dnNFKB1 & hPI3K <=  dpPI3K0 & hP53 <=  dpP530  wait {dhNFKB=1,dhP21=-1,dhFOXM=0,dhPI3K=1,dhP53=1,dhMDM2=1,dhOGT=0,dhOGA=0,dhCMYC=0}
when hNFKB=dnNFKB1 do {hNFKB'=0, k'=k+1} goto loc_010000010;
--when hP21=dnP211 do {hP21'=0, k'=k+1} goto loc_100000010;
when hPI3K=dpPI3K0 do {hPI3K'=0, k'=k+1} goto loc_110100010;
when hP53=dpP530 do {hP53'=0, k'=k+1} goto loc_110010010;
--when hMDM2=dpMDM20 do {hMDM2'=0, k'=k+1} goto loc_110001010;

-- for the configuration 1,1,0,0,0,0,0,1,1
loc loc_110000011: while hNFKB >=  dnNFKB1 & hPI3K <=  dpPI3K0 & hP53 <=  dpP530 & hOGT <=  dpOGT0 & hCMYC >=  dnCMYC1  wait {dhNFKB=1,dhP21=-1,dhFOXM=0,dhPI3K=1,dhP53=1,dhMDM2=1,dhOGT=1,dhOGA=-1,dhCMYC=1}
when hNFKB=dnNFKB1 do {hNFKB'=0, k'=k+1} goto loc_010000011;
--when hP21=dnP211 do {hP21'=0, k'=k+1} goto loc_100000011;
when hPI3K=dpPI3K0 do {hPI3K'=0, k'=k+1} goto loc_110100011;
when hP53=dpP530 do {hP53'=0, k'=k+1} goto loc_110010011;
--when hMDM2=dpMDM20 do {hMDM2'=0, k'=k+1} goto loc_110001011;
when hOGT=dpOGT0 do {hOGT'=0, k'=k+1} goto loc_110000111;
--when hOGA=dnOGA1 do {hOGA'=0, k'=k+1} goto loc_110000001;
when hCMYC=dnCMYC1 do {hCMYC'=0, k'=k+1} goto loc_110000010;

-- for the configuration 1,1,0,0,0,0,1,0,0
loc loc_110000100: while hNFKB >=  dnNFKB1 & hP53 <=  dpP530 & hOGT >=  dnOGT1  wait {dhNFKB=1,dhP21=0,dhFOXM=0,dhPI3K=1,dhP53=1,dhMDM2=1,dhOGT=1,dhOGA=1,dhCMYC=1}
when hNFKB=dnNFKB1 do {hNFKB'=0, k'=k+1} goto loc_010000100;
--when hPI3K=dpPI3K0 do {hPI3K'=0, k'=k+1} goto loc_110100100;
when hP53=dpP530 do {hP53'=0, k'=k+1} goto loc_110010100;
--when hMDM2=dpMDM20 do {hMDM2'=0, k'=k+1} goto loc_110001100;
when hOGT=dnOGT1 do {hOGT'=0, k'=k+1} goto loc_110000000;
--when hOGA=dpOGA0 do {hOGA'=0, k'=k+1} goto loc_110000110;
--when hCMYC=dpCMYC0 do {hCMYC'=0, k'=k+1} goto loc_110000101;

-- for the configuration 1,1,0,0,0,0,1,0,1
loc loc_110000101: while hNFKB >=  dnNFKB1 & hP53 <=  dpP530  wait {dhNFKB=1,dhP21=0,dhFOXM=0,dhPI3K=1,dhP53=1,dhMDM2=1,dhOGT=0,dhOGA=0,dhCMYC=0}
when hNFKB=dnNFKB1 do {hNFKB'=0, k'=k+1} goto loc_010000101;
--when hPI3K=dpPI3K0 do {hPI3K'=0, k'=k+1} goto loc_110100101;
when hP53=dpP530 do {hP53'=0, k'=k+1} goto loc_110010101;
--when hMDM2=dpMDM20 do {hMDM2'=0, k'=k+1} goto loc_110001101;

-- for the configuration 1,1,0,0,0,0,1,1,0
loc loc_110000110: while hNFKB >=  dnNFKB1 & hP53 <=  dpP530 & hOGT >=  dnOGT1 & hOGA >=  dnOGA1  wait {dhNFKB=1,dhP21=0,dhFOXM=0,dhPI3K=1,dhP53=1,dhMDM2=1,dhOGT=1,dhOGA=1,dhCMYC=1}
when hNFKB=dnNFKB1 do {hNFKB'=0, k'=k+1} goto loc_010000110;
--when hPI3K=dpPI3K0 do {hPI3K'=0, k'=k+1} goto loc_110100110;
when hP53=dpP530 do {hP53'=0, k'=k+1} goto loc_110010110;
--when hMDM2=dpMDM20 do {hMDM2'=0, k'=k+1} goto loc_110001110;
when hOGT=dnOGT1 do {hOGT'=0, k'=k+1} goto loc_110000010;
when hOGA=dnOGA1 do {hOGA'=0, k'=k+1} goto loc_110000100;
--when hCMYC=dpCMYC0 do {hCMYC'=0, k'=k+1} goto loc_110000111;

-- for the configuration 1,1,0,0,0,0,1,1,1
loc loc_110000111: while hNFKB >=  dnNFKB1 & hP53 <=  dpP530 & hOGA >=  dnOGA1  wait {dhNFKB=1,dhP21=0,dhFOXM=0,dhPI3K=1,dhP53=1,dhMDM2=1,dhOGT=0,dhOGA=1,dhCMYC=0}
when hNFKB=dnNFKB1 do {hNFKB'=0, k'=k+1} goto loc_010000111;
--when hPI3K=dpPI3K0 do {hPI3K'=0, k'=k+1} goto loc_110100111;
when hP53=dpP530 do {hP53'=0, k'=k+1} goto loc_110010111;
--when hMDM2=dpMDM20 do {hMDM2'=0, k'=k+1} goto loc_110001111;
when hOGA=dnOGA1 do {hOGA'=0, k'=k+1} goto loc_110000101;

-- for the configuration 1,1,0,0,0,1,0,0,0
loc loc_110001000: while hNFKB >=  dnNFKB1 & hPI3K <=  dpPI3K0 & hP53 <=  dpP530 & hMDM2 >=  dnMDM21 & hOGA <=  dpOGA0  wait {dhNFKB=1,dhP21=-1,dhFOXM=0,dhPI3K=1,dhP53=1,dhMDM2=1,dhOGT=0,dhOGA=1,dhCMYC=0}
when hNFKB=dnNFKB1 do {hNFKB'=0, k'=k+1} goto loc_010001000;
--when hP21=dnP211 do {hP21'=0, k'=k+1} goto loc_100001000;
when hPI3K=dpPI3K0 do {hPI3K'=0, k'=k+1} goto loc_110101000;
when hP53=dpP530 do {hP53'=0, k'=k+1} goto loc_110011000;
when hMDM2=dnMDM21 do {hMDM2'=0, k'=k+1} goto loc_110000000;
when hOGA=dpOGA0 do {hOGA'=0, k'=k+1} goto loc_110001010;

-- for the configuration 1,1,0,0,0,1,0,0,1
loc loc_110001001: while hNFKB >=  dnNFKB1 & hPI3K <=  dpPI3K0 & hP53 <=  dpP530 & hMDM2 >=  dnMDM21 & hOGT <=  dpOGT0 & hOGA <=  dpOGA0 & hCMYC >=  dnCMYC1  wait {dhNFKB=1,dhP21=-1,dhFOXM=0,dhPI3K=1,dhP53=1,dhMDM2=1,dhOGT=1,dhOGA=1,dhCMYC=1}
when hNFKB=dnNFKB1 do {hNFKB'=0, k'=k+1} goto loc_010001001;
--when hP21=dnP211 do {hP21'=0, k'=k+1} goto loc_100001001;
when hPI3K=dpPI3K0 do {hPI3K'=0, k'=k+1} goto loc_110101001;
when hP53=dpP530 do {hP53'=0, k'=k+1} goto loc_110011001;
when hMDM2=dnMDM21 do {hMDM2'=0, k'=k+1} goto loc_110000001;
when hOGT=dpOGT0 do {hOGT'=0, k'=k+1} goto loc_110001101;
when hOGA=dpOGA0 do {hOGA'=0, k'=k+1} goto loc_110001011;
when hCMYC=dnCMYC1 do {hCMYC'=0, k'=k+1} goto loc_110001000;

-- for the configuration 1,1,0,0,0,1,0,1,0
loc loc_110001010: while hNFKB >=  dnNFKB1 & hPI3K <=  dpPI3K0 & hP53 <=  dpP530 & hMDM2 >=  dnMDM21  wait {dhNFKB=1,dhP21=-1,dhFOXM=0,dhPI3K=1,dhP53=1,dhMDM2=1,dhOGT=0,dhOGA=0,dhCMYC=0}
when hNFKB=dnNFKB1 do {hNFKB'=0, k'=k+1} goto loc_010001010;
--when hP21=dnP211 do {hP21'=0, k'=k+1} goto loc_100001010;
when hPI3K=dpPI3K0 do {hPI3K'=0, k'=k+1} goto loc_110101010;
when hP53=dpP530 do {hP53'=0, k'=k+1} goto loc_110011010;
when hMDM2=dnMDM21 do {hMDM2'=0, k'=k+1} goto loc_110000010;

-- for the configuration 1,1,0,0,0,1,0,1,1
loc loc_110001011: while hNFKB >=  dnNFKB1 & hPI3K <=  dpPI3K0 & hP53 <=  dpP530 & hMDM2 >=  dnMDM21 & hOGT <=  dpOGT0 & hCMYC >=  dnCMYC1  wait {dhNFKB=1,dhP21=-1,dhFOXM=0,dhPI3K=1,dhP53=1,dhMDM2=1,dhOGT=1,dhOGA=-1,dhCMYC=1}
when hNFKB=dnNFKB1 do {hNFKB'=0, k'=k+1} goto loc_010001011;
--when hP21=dnP211 do {hP21'=0, k'=k+1} goto loc_100001011;
when hPI3K=dpPI3K0 do {hPI3K'=0, k'=k+1} goto loc_110101011;
when hP53=dpP530 do {hP53'=0, k'=k+1} goto loc_110011011;
when hMDM2=dnMDM21 do {hMDM2'=0, k'=k+1} goto loc_110000011;
when hOGT=dpOGT0 do {hOGT'=0, k'=k+1} goto loc_110001111;
--when hOGA=dnOGA1 do {hOGA'=0, k'=k+1} goto loc_110001001;
when hCMYC=dnCMYC1 do {hCMYC'=0, k'=k+1} goto loc_110001010;

-- for the configuration 1,1,0,0,0,1,1,0,0
loc loc_110001100: while hNFKB >=  dnNFKB1 & hP53 <=  dpP530 & hMDM2 >=  dnMDM21 & hOGT >=  dnOGT1  wait {dhNFKB=1,dhP21=0,dhFOXM=0,dhPI3K=1,dhP53=1,dhMDM2=1,dhOGT=1,dhOGA=1,dhCMYC=1}
when hNFKB=dnNFKB1 do {hNFKB'=0, k'=k+1} goto loc_010001100;
--when hPI3K=dpPI3K0 do {hPI3K'=0, k'=k+1} goto loc_110101100;
when hP53=dpP530 do {hP53'=0, k'=k+1} goto loc_110011100;
when hMDM2=dnMDM21 do {hMDM2'=0, k'=k+1} goto loc_110000100;
when hOGT=dnOGT1 do {hOGT'=0, k'=k+1} goto loc_110001000;
--when hOGA=dpOGA0 do {hOGA'=0, k'=k+1} goto loc_110001110;
--when hCMYC=dpCMYC0 do {hCMYC'=0, k'=k+1} goto loc_110001101;

-- for the configuration 1,1,0,0,0,1,1,0,1
loc loc_110001101: while hNFKB >=  dnNFKB1 & hP53 <=  dpP530 & hMDM2 >=  dnMDM21  wait {dhNFKB=1,dhP21=0,dhFOXM=0,dhPI3K=1,dhP53=1,dhMDM2=1,dhOGT=0,dhOGA=0,dhCMYC=0}
when hNFKB=dnNFKB1 do {hNFKB'=0, k'=k+1} goto loc_010001101;
--when hPI3K=dpPI3K0 do {hPI3K'=0, k'=k+1} goto loc_110101101;
when hP53=dpP530 do {hP53'=0, k'=k+1} goto loc_110011101;
when hMDM2=dnMDM21 do {hMDM2'=0, k'=k+1} goto loc_110000101;

-- for the configuration 1,1,0,0,0,1,1,1,0
loc loc_110001110: while hNFKB >=  dnNFKB1 & hP53 <=  dpP530 & hMDM2 >=  dnMDM21 & hOGT >=  dnOGT1 & hOGA >=  dnOGA1  wait {dhNFKB=1,dhP21=0,dhFOXM=0,dhPI3K=1,dhP53=1,dhMDM2=1,dhOGT=1,dhOGA=1,dhCMYC=1}
when hNFKB=dnNFKB1 do {hNFKB'=0, k'=k+1} goto loc_010001110;
--when hPI3K=dpPI3K0 do {hPI3K'=0, k'=k+1} goto loc_110101110;
when hP53=dpP530 do {hP53'=0, k'=k+1} goto loc_110011110;
when hMDM2=dnMDM21 do {hMDM2'=0, k'=k+1} goto loc_110000110;
when hOGT=dnOGT1 do {hOGT'=0, k'=k+1} goto loc_110001010;
when hOGA=dnOGA1 do {hOGA'=0, k'=k+1} goto loc_110001100;
--when hCMYC=dpCMYC0 do {hCMYC'=0, k'=k+1} goto loc_110001111;

-- for the configuration 1,1,0,0,0,1,1,1,1
loc loc_110001111: while hNFKB >=  dnNFKB1 & hP53 <=  dpP530 & hMDM2 >=  dnMDM21 & hOGA >=  dnOGA1  wait {dhNFKB=1,dhP21=0,dhFOXM=0,dhPI3K=1,dhP53=1,dhMDM2=1,dhOGT=0,dhOGA=1,dhCMYC=0}
when hNFKB=dnNFKB1 do {hNFKB'=0, k'=k+1} goto loc_010001111;
--when hPI3K=dpPI3K0 do {hPI3K'=0, k'=k+1} goto loc_110101111;
when hP53=dpP530 do {hP53'=0, k'=k+1} goto loc_110011111;
when hMDM2=dnMDM21 do {hMDM2'=0, k'=k+1} goto loc_110000111;
when hOGA=dnOGA1 do {hOGA'=0, k'=k+1} goto loc_110001101;

-- for the configuration 1,1,0,0,1,0,0,0,0
loc loc_110010000: while hNFKB >=  dnNFKB1 & hMDM2 <=  dpMDM20 & hOGA <=  dpOGA0  wait {dhNFKB=1,dhP21=0,dhFOXM=0,dhPI3K=0,dhP53=0,dhMDM2=1,dhOGT=0,dhOGA=1,dhCMYC=0}
when hNFKB=dnNFKB1 do {hNFKB'=0, k'=k+1} goto loc_010010000;
when hMDM2=dpMDM20 do {hMDM2'=0, k'=k+1} goto loc_110011000;
when hOGA=dpOGA0 do {hOGA'=0, k'=k+1} goto loc_110010010;

-- for the configuration 1,1,0,0,1,0,0,0,1
loc loc_110010001: while hNFKB >=  dnNFKB1 & hMDM2 <=  dpMDM20 & hOGT <=  dpOGT0 & hOGA <=  dpOGA0 & hCMYC >=  dnCMYC1  wait {dhNFKB=1,dhP21=0,dhFOXM=0,dhPI3K=1,dhP53=0,dhMDM2=1,dhOGT=1,dhOGA=1,dhCMYC=1}
when hNFKB=dnNFKB1 do {hNFKB'=0, k'=k+1} goto loc_010010001;
--when hPI3K=dpPI3K0 do {hPI3K'=0, k'=k+1} goto loc_110110001;
when hMDM2=dpMDM20 do {hMDM2'=0, k'=k+1} goto loc_110011001;
when hOGT=dpOGT0 do {hOGT'=0, k'=k+1} goto loc_110010101;
when hOGA=dpOGA0 do {hOGA'=0, k'=k+1} goto loc_110010011;
when hCMYC=dnCMYC1 do {hCMYC'=0, k'=k+1} goto loc_110010000;

-- for the configuration 1,1,0,0,1,0,0,1,0
loc loc_110010010: while hNFKB >=  dnNFKB1 & hMDM2 <=  dpMDM20  wait {dhNFKB=1,dhP21=0,dhFOXM=0,dhPI3K=0,dhP53=0,dhMDM2=1,dhOGT=0,dhOGA=0,dhCMYC=0}
when hNFKB=dnNFKB1 do {hNFKB'=0, k'=k+1} goto loc_010010010;
when hMDM2=dpMDM20 do {hMDM2'=0, k'=k+1} goto loc_110011010;

-- for the configuration 1,1,0,0,1,0,0,1,1
loc loc_110010011: while hNFKB >=  dnNFKB1 & hMDM2 <=  dpMDM20 & hOGT <=  dpOGT0 & hCMYC >=  dnCMYC1  wait {dhNFKB=1,dhP21=0,dhFOXM=0,dhPI3K=1,dhP53=0,dhMDM2=1,dhOGT=1,dhOGA=-1,dhCMYC=1}
when hNFKB=dnNFKB1 do {hNFKB'=0, k'=k+1} goto loc_010010011;
--when hPI3K=dpPI3K0 do {hPI3K'=0, k'=k+1} goto loc_110110011;
when hMDM2=dpMDM20 do {hMDM2'=0, k'=k+1} goto loc_110011011;
when hOGT=dpOGT0 do {hOGT'=0, k'=k+1} goto loc_110010111;
--when hOGA=dnOGA1 do {hOGA'=0, k'=k+1} goto loc_110010001;
when hCMYC=dnCMYC1 do {hCMYC'=0, k'=k+1} goto loc_110010010;

-- for the configuration 1,1,0,0,1,0,1,0,0
loc loc_110010100: while hNFKB >=  dnNFKB1 & hPI3K <=  dpPI3K0 & hMDM2 <=  dpMDM20 & hOGT >=  dnOGT1 & hCMYC <=  dpCMYC0  wait {dhNFKB=1,dhP21=0,dhFOXM=1,dhPI3K=1,dhP53=0,dhMDM2=1,dhOGT=1,dhOGA=1,dhCMYC=1}
when hNFKB=dnNFKB1 do {hNFKB'=0, k'=k+1} goto loc_010010100;
--when hFOXM=dpFOXM0 do {hFOXM'=0, k'=k+1} goto loc_111010100;
when hPI3K=dpPI3K0 do {hPI3K'=0, k'=k+1} goto loc_110110100;
when hMDM2=dpMDM20 do {hMDM2'=0, k'=k+1} goto loc_110011100;
when hOGT=dnOGT1 do {hOGT'=0, k'=k+1} goto loc_110010000;
--when hOGA=dpOGA0 do {hOGA'=0, k'=k+1} goto loc_110010110;
when hCMYC=dpCMYC0 do {hCMYC'=0, k'=k+1} goto loc_110010101;

-- for the configuration 1,1,0,0,1,0,1,0,1
loc loc_110010101: while hNFKB >=  dnNFKB1 & hPI3K <=  dpPI3K0 & hMDM2 <=  dpMDM20  wait {dhNFKB=1,dhP21=0,dhFOXM=1,dhPI3K=1,dhP53=0,dhMDM2=1,dhOGT=0,dhOGA=0,dhCMYC=0}
when hNFKB=dnNFKB1 do {hNFKB'=0, k'=k+1} goto loc_010010101;
--when hFOXM=dpFOXM0 do {hFOXM'=0, k'=k+1} goto loc_111010101;
when hPI3K=dpPI3K0 do {hPI3K'=0, k'=k+1} goto loc_110110101;
when hMDM2=dpMDM20 do {hMDM2'=0, k'=k+1} goto loc_110011101;

-- for the configuration 1,1,0,0,1,0,1,1,0
loc loc_110010110: while hNFKB >=  dnNFKB1 & hPI3K <=  dpPI3K0 & hMDM2 <=  dpMDM20 & hOGT >=  dnOGT1 & hOGA >=  dnOGA1 & hCMYC <=  dpCMYC0  wait {dhNFKB=1,dhP21=0,dhFOXM=1,dhPI3K=1,dhP53=0,dhMDM2=1,dhOGT=1,dhOGA=1,dhCMYC=1}
when hNFKB=dnNFKB1 do {hNFKB'=0, k'=k+1} goto loc_010010110;
--when hFOXM=dpFOXM0 do {hFOXM'=0, k'=k+1} goto loc_111010110;
when hPI3K=dpPI3K0 do {hPI3K'=0, k'=k+1} goto loc_110110110;
when hMDM2=dpMDM20 do {hMDM2'=0, k'=k+1} goto loc_110011110;
when hOGT=dnOGT1 do {hOGT'=0, k'=k+1} goto loc_110010010;
when hOGA=dnOGA1 do {hOGA'=0, k'=k+1} goto loc_110010100;
when hCMYC=dpCMYC0 do {hCMYC'=0, k'=k+1} goto loc_110010111;

-- for the configuration 1,1,0,0,1,0,1,1,1
loc loc_110010111: while hNFKB >=  dnNFKB1 & hPI3K <=  dpPI3K0 & hMDM2 <=  dpMDM20 & hOGA >=  dnOGA1  wait {dhNFKB=1,dhP21=0,dhFOXM=1,dhPI3K=1,dhP53=0,dhMDM2=1,dhOGT=0,dhOGA=1,dhCMYC=0}
when hNFKB=dnNFKB1 do {hNFKB'=0, k'=k+1} goto loc_010010111;
--when hFOXM=dpFOXM0 do {hFOXM'=0, k'=k+1} goto loc_111010111;
when hPI3K=dpPI3K0 do {hPI3K'=0, k'=k+1} goto loc_110110111;
when hMDM2=dpMDM20 do {hMDM2'=0, k'=k+1} goto loc_110011111;
when hOGA=dnOGA1 do {hOGA'=0, k'=k+1} goto loc_110010101;

-- for the configuration 1,1,0,0,1,1,0,0,0
loc loc_110011000: while hNFKB >=  dnNFKB1 & hOGA <=  dpOGA0  wait {dhNFKB=1,dhP21=0,dhFOXM=0,dhPI3K=0,dhP53=-1,dhMDM2=0,dhOGT=0,dhOGA=1,dhCMYC=0}
when hNFKB=dnNFKB1 do {hNFKB'=0, k'=k+1} goto loc_010011000;
--when hP53=dnP531 do {hP53'=0, k'=k+1} goto loc_110001000;
when hOGA=dpOGA0 do {hOGA'=0, k'=k+1} goto loc_110011010;

-- for the configuration 1,1,0,0,1,1,0,0,1
loc loc_110011001: while hNFKB >=  dnNFKB1 & hOGT <=  dpOGT0 & hOGA <=  dpOGA0 & hCMYC >=  dnCMYC1  wait {dhNFKB=1,dhP21=0,dhFOXM=0,dhPI3K=1,dhP53=-1,dhMDM2=0,dhOGT=1,dhOGA=1,dhCMYC=1}
when hNFKB=dnNFKB1 do {hNFKB'=0, k'=k+1} goto loc_010011001;
--when hPI3K=dpPI3K0 do {hPI3K'=0, k'=k+1} goto loc_110111001;
--when hP53=dnP531 do {hP53'=0, k'=k+1} goto loc_110001001;
when hOGT=dpOGT0 do {hOGT'=0, k'=k+1} goto loc_110011101;
when hOGA=dpOGA0 do {hOGA'=0, k'=k+1} goto loc_110011011;
when hCMYC=dnCMYC1 do {hCMYC'=0, k'=k+1} goto loc_110011000;

-- for the configuration 1,1,0,0,1,1,0,1,0
loc loc_110011010: while hNFKB >=  dnNFKB1  wait {dhNFKB=1,dhP21=0,dhFOXM=0,dhPI3K=0,dhP53=-1,dhMDM2=0,dhOGT=0,dhOGA=0,dhCMYC=0}
when hNFKB=dnNFKB1 do {hNFKB'=0, k'=k+1} goto loc_010011010;
--when hP53=dnP531 do {hP53'=0, k'=k+1} goto loc_110001010;

-- for the configuration 1,1,0,0,1,1,0,1,1
loc loc_110011011: while hNFKB >=  dnNFKB1 & hOGT <=  dpOGT0 & hCMYC >=  dnCMYC1  wait {dhNFKB=1,dhP21=0,dhFOXM=0,dhPI3K=1,dhP53=-1,dhMDM2=0,dhOGT=1,dhOGA=-1,dhCMYC=1}
when hNFKB=dnNFKB1 do {hNFKB'=0, k'=k+1} goto loc_010011011;
--when hPI3K=dpPI3K0 do {hPI3K'=0, k'=k+1} goto loc_110111011;
--when hP53=dnP531 do {hP53'=0, k'=k+1} goto loc_110001011;
when hOGT=dpOGT0 do {hOGT'=0, k'=k+1} goto loc_110011111;
--when hOGA=dnOGA1 do {hOGA'=0, k'=k+1} goto loc_110011001;
when hCMYC=dnCMYC1 do {hCMYC'=0, k'=k+1} goto loc_110011010;

-- for the configuration 1,1,0,0,1,1,1,0,0
loc loc_110011100: while hNFKB >=  dnNFKB1 & hPI3K <=  dpPI3K0 & hOGT >=  dnOGT1 & hCMYC <=  dpCMYC0  wait {dhNFKB=1,dhP21=0,dhFOXM=1,dhPI3K=1,dhP53=-1,dhMDM2=0,dhOGT=1,dhOGA=1,dhCMYC=1}
when hNFKB=dnNFKB1 do {hNFKB'=0, k'=k+1} goto loc_010011100;
--when hFOXM=dpFOXM0 do {hFOXM'=0, k'=k+1} goto loc_111011100;
when hPI3K=dpPI3K0 do {hPI3K'=0, k'=k+1} goto loc_110111100;
--when hP53=dnP531 do {hP53'=0, k'=k+1} goto loc_110001100;
when hOGT=dnOGT1 do {hOGT'=0, k'=k+1} goto loc_110011000;
--when hOGA=dpOGA0 do {hOGA'=0, k'=k+1} goto loc_110011110;
when hCMYC=dpCMYC0 do {hCMYC'=0, k'=k+1} goto loc_110011101;

-- for the configuration 1,1,0,0,1,1,1,0,1
loc loc_110011101: while hNFKB >=  dnNFKB1 & hPI3K <=  dpPI3K0  wait {dhNFKB=1,dhP21=0,dhFOXM=1,dhPI3K=1,dhP53=-1,dhMDM2=0,dhOGT=0,dhOGA=0,dhCMYC=0}
when hNFKB=dnNFKB1 do {hNFKB'=0, k'=k+1} goto loc_010011101;
--when hFOXM=dpFOXM0 do {hFOXM'=0, k'=k+1} goto loc_111011101;
when hPI3K=dpPI3K0 do {hPI3K'=0, k'=k+1} goto loc_110111101;
--when hP53=dnP531 do {hP53'=0, k'=k+1} goto loc_110001101;

-- for the configuration 1,1,0,0,1,1,1,1,0
loc loc_110011110: while hNFKB >=  dnNFKB1 & hPI3K <=  dpPI3K0 & hOGT >=  dnOGT1 & hOGA >=  dnOGA1 & hCMYC <=  dpCMYC0  wait {dhNFKB=1,dhP21=0,dhFOXM=1,dhPI3K=1,dhP53=-1,dhMDM2=0,dhOGT=1,dhOGA=1,dhCMYC=1}
when hNFKB=dnNFKB1 do {hNFKB'=0, k'=k+1} goto loc_010011110;
--when hFOXM=dpFOXM0 do {hFOXM'=0, k'=k+1} goto loc_111011110;
when hPI3K=dpPI3K0 do {hPI3K'=0, k'=k+1} goto loc_110111110;
--when hP53=dnP531 do {hP53'=0, k'=k+1} goto loc_110001110;
when hOGT=dnOGT1 do {hOGT'=0, k'=k+1} goto loc_110011010;
when hOGA=dnOGA1 do {hOGA'=0, k'=k+1} goto loc_110011100;
when hCMYC=dpCMYC0 do {hCMYC'=0, k'=k+1} goto loc_110011111;

-- for the configuration 1,1,0,0,1,1,1,1,1
loc loc_110011111: while hNFKB >=  dnNFKB1 & hPI3K <=  dpPI3K0 & hOGA >=  dnOGA1  wait {dhNFKB=1,dhP21=0,dhFOXM=1,dhPI3K=1,dhP53=-1,dhMDM2=0,dhOGT=0,dhOGA=1,dhCMYC=0}
when hNFKB=dnNFKB1 do {hNFKB'=0, k'=k+1} goto loc_010011111;
--when hFOXM=dpFOXM0 do {hFOXM'=0, k'=k+1} goto loc_111011111;
when hPI3K=dpPI3K0 do {hPI3K'=0, k'=k+1} goto loc_110111111;
--when hP53=dnP531 do {hP53'=0, k'=k+1} goto loc_110001111;
when hOGA=dnOGA1 do {hOGA'=0, k'=k+1} goto loc_110011101;

-- for the configuration 1,1,0,1,0,0,0,0,0
loc loc_110100000: while hNFKB >=  dnNFKB1 & hP21 >=  dnP211 & hP53 <=  dpP530 & hOGA <=  dpOGA0  wait {dhNFKB=1,dhP21=1,dhFOXM=1,dhPI3K=-1,dhP53=1,dhMDM2=1,dhOGT=0,dhOGA=1,dhCMYC=0}
when hNFKB=dnNFKB1 do {hNFKB'=0, k'=k+1} goto loc_010100000;
when hP21=dnP211 do {hP21'=0, k'=k+1} goto loc_100100000;
--when hFOXM=dpFOXM0 do {hFOXM'=0, k'=k+1} goto loc_111100000;
--when hPI3K=dnPI3K1 do {hPI3K'=0, k'=k+1} goto loc_110000000;
when hP53=dpP530 do {hP53'=0, k'=k+1} goto loc_110110000;
--when hMDM2=dpMDM20 do {hMDM2'=0, k'=k+1} goto loc_110101000;
when hOGA=dpOGA0 do {hOGA'=0, k'=k+1} goto loc_110100010;

-- for the configuration 1,1,0,1,0,0,0,0,1
loc loc_110100001: while hNFKB >=  dnNFKB1 & hP21 >=  dnP211 & hP53 <=  dpP530 & hOGT <=  dpOGT0 & hOGA <=  dpOGA0 & hCMYC >=  dnCMYC1  wait {dhNFKB=1,dhP21=1,dhFOXM=1,dhPI3K=-1,dhP53=1,dhMDM2=1,dhOGT=1,dhOGA=1,dhCMYC=1}
when hNFKB=dnNFKB1 do {hNFKB'=0, k'=k+1} goto loc_010100001;
when hP21=dnP211 do {hP21'=0, k'=k+1} goto loc_100100001;
--when hFOXM=dpFOXM0 do {hFOXM'=0, k'=k+1} goto loc_111100001;
--when hPI3K=dnPI3K1 do {hPI3K'=0, k'=k+1} goto loc_110000001;
when hP53=dpP530 do {hP53'=0, k'=k+1} goto loc_110110001;
--when hMDM2=dpMDM20 do {hMDM2'=0, k'=k+1} goto loc_110101001;
when hOGT=dpOGT0 do {hOGT'=0, k'=k+1} goto loc_110100101;
when hOGA=dpOGA0 do {hOGA'=0, k'=k+1} goto loc_110100011;
when hCMYC=dnCMYC1 do {hCMYC'=0, k'=k+1} goto loc_110100000;

-- for the configuration 1,1,0,1,0,0,0,1,0
loc loc_110100010: while hNFKB >=  dnNFKB1 & hP21 >=  dnP211 & hP53 <=  dpP530  wait {dhNFKB=1,dhP21=1,dhFOXM=1,dhPI3K=-1,dhP53=1,dhMDM2=1,dhOGT=0,dhOGA=0,dhCMYC=0}
when hNFKB=dnNFKB1 do {hNFKB'=0, k'=k+1} goto loc_010100010;
when hP21=dnP211 do {hP21'=0, k'=k+1} goto loc_100100010;
--when hFOXM=dpFOXM0 do {hFOXM'=0, k'=k+1} goto loc_111100010;
--when hPI3K=dnPI3K1 do {hPI3K'=0, k'=k+1} goto loc_110000010;
when hP53=dpP530 do {hP53'=0, k'=k+1} goto loc_110110010;
--when hMDM2=dpMDM20 do {hMDM2'=0, k'=k+1} goto loc_110101010;

-- for the configuration 1,1,0,1,0,0,0,1,1
loc loc_110100011: while hNFKB >=  dnNFKB1 & hP21 >=  dnP211 & hP53 <=  dpP530 & hOGT <=  dpOGT0 & hCMYC >=  dnCMYC1  wait {dhNFKB=1,dhP21=1,dhFOXM=1,dhPI3K=-1,dhP53=1,dhMDM2=1,dhOGT=1,dhOGA=-1,dhCMYC=1}
when hNFKB=dnNFKB1 do {hNFKB'=0, k'=k+1} goto loc_010100011;
when hP21=dnP211 do {hP21'=0, k'=k+1} goto loc_100100011;
--when hFOXM=dpFOXM0 do {hFOXM'=0, k'=k+1} goto loc_111100011;
--when hPI3K=dnPI3K1 do {hPI3K'=0, k'=k+1} goto loc_110000011;
when hP53=dpP530 do {hP53'=0, k'=k+1} goto loc_110110011;
--when hMDM2=dpMDM20 do {hMDM2'=0, k'=k+1} goto loc_110101011;
when hOGT=dpOGT0 do {hOGT'=0, k'=k+1} goto loc_110100111;
--when hOGA=dnOGA1 do {hOGA'=0, k'=k+1} goto loc_110100001;
when hCMYC=dnCMYC1 do {hCMYC'=0, k'=k+1} goto loc_110100010;

-- for the configuration 1,1,0,1,0,0,1,0,0
loc loc_110100100: while hNFKB >=  dnNFKB1 & hP21 >=  dnP211 & hP53 <=  dpP530 & hOGT >=  dnOGT1  wait {dhNFKB=1,dhP21=1,dhFOXM=1,dhPI3K=0,dhP53=1,dhMDM2=1,dhOGT=1,dhOGA=1,dhCMYC=1}
when hNFKB=dnNFKB1 do {hNFKB'=0, k'=k+1} goto loc_010100100;
when hP21=dnP211 do {hP21'=0, k'=k+1} goto loc_100100100;
--when hFOXM=dpFOXM0 do {hFOXM'=0, k'=k+1} goto loc_111100100;
when hP53=dpP530 do {hP53'=0, k'=k+1} goto loc_110110100;
--when hMDM2=dpMDM20 do {hMDM2'=0, k'=k+1} goto loc_110101100;
when hOGT=dnOGT1 do {hOGT'=0, k'=k+1} goto loc_110100000;
--when hOGA=dpOGA0 do {hOGA'=0, k'=k+1} goto loc_110100110;
--when hCMYC=dpCMYC0 do {hCMYC'=0, k'=k+1} goto loc_110100101;

-- for the configuration 1,1,0,1,0,0,1,0,1
loc loc_110100101: while hNFKB >=  dnNFKB1 & hP21 >=  dnP211 & hP53 <=  dpP530  wait {dhNFKB=1,dhP21=1,dhFOXM=1,dhPI3K=0,dhP53=1,dhMDM2=1,dhOGT=0,dhOGA=0,dhCMYC=0}
when hNFKB=dnNFKB1 do {hNFKB'=0, k'=k+1} goto loc_010100101;
when hP21=dnP211 do {hP21'=0, k'=k+1} goto loc_100100101;
--when hFOXM=dpFOXM0 do {hFOXM'=0, k'=k+1} goto loc_111100101;
when hP53=dpP530 do {hP53'=0, k'=k+1} goto loc_110110101;
--when hMDM2=dpMDM20 do {hMDM2'=0, k'=k+1} goto loc_110101101;

-- for the configuration 1,1,0,1,0,0,1,1,0
loc loc_110100110: while hNFKB >=  dnNFKB1 & hP21 >=  dnP211 & hP53 <=  dpP530 & hOGT >=  dnOGT1 & hOGA >=  dnOGA1  wait {dhNFKB=1,dhP21=1,dhFOXM=1,dhPI3K=0,dhP53=1,dhMDM2=1,dhOGT=1,dhOGA=1,dhCMYC=1}
when hNFKB=dnNFKB1 do {hNFKB'=0, k'=k+1} goto loc_010100110;
when hP21=dnP211 do {hP21'=0, k'=k+1} goto loc_100100110;
--when hFOXM=dpFOXM0 do {hFOXM'=0, k'=k+1} goto loc_111100110;
when hP53=dpP530 do {hP53'=0, k'=k+1} goto loc_110110110;
--when hMDM2=dpMDM20 do {hMDM2'=0, k'=k+1} goto loc_110101110;
when hOGT=dnOGT1 do {hOGT'=0, k'=k+1} goto loc_110100010;
when hOGA=dnOGA1 do {hOGA'=0, k'=k+1} goto loc_110100100;
--when hCMYC=dpCMYC0 do {hCMYC'=0, k'=k+1} goto loc_110100111;

-- for the configuration 1,1,0,1,0,0,1,1,1
loc loc_110100111: while hNFKB >=  dnNFKB1 & hP21 >=  dnP211 & hP53 <=  dpP530 & hOGA >=  dnOGA1  wait {dhNFKB=1,dhP21=1,dhFOXM=1,dhPI3K=0,dhP53=1,dhMDM2=1,dhOGT=0,dhOGA=1,dhCMYC=0}
when hNFKB=dnNFKB1 do {hNFKB'=0, k'=k+1} goto loc_010100111;
when hP21=dnP211 do {hP21'=0, k'=k+1} goto loc_100100111;
--when hFOXM=dpFOXM0 do {hFOXM'=0, k'=k+1} goto loc_111100111;
when hP53=dpP530 do {hP53'=0, k'=k+1} goto loc_110110111;
--when hMDM2=dpMDM20 do {hMDM2'=0, k'=k+1} goto loc_110101111;
when hOGA=dnOGA1 do {hOGA'=0, k'=k+1} goto loc_110100101;

-- for the configuration 1,1,0,1,0,1,0,0,0
loc loc_110101000: while hNFKB >=  dnNFKB1 & hP21 >=  dnP211 & hP53 <=  dpP530 & hMDM2 >=  dnMDM21 & hOGA <=  dpOGA0  wait {dhNFKB=1,dhP21=1,dhFOXM=1,dhPI3K=-1,dhP53=1,dhMDM2=1,dhOGT=0,dhOGA=1,dhCMYC=0}
when hNFKB=dnNFKB1 do {hNFKB'=0, k'=k+1} goto loc_010101000;
when hP21=dnP211 do {hP21'=0, k'=k+1} goto loc_100101000;
--when hFOXM=dpFOXM0 do {hFOXM'=0, k'=k+1} goto loc_111101000;
--when hPI3K=dnPI3K1 do {hPI3K'=0, k'=k+1} goto loc_110001000;
when hP53=dpP530 do {hP53'=0, k'=k+1} goto loc_110111000;
when hMDM2=dnMDM21 do {hMDM2'=0, k'=k+1} goto loc_110100000;
when hOGA=dpOGA0 do {hOGA'=0, k'=k+1} goto loc_110101010;

-- for the configuration 1,1,0,1,0,1,0,0,1
loc loc_110101001: while hNFKB >=  dnNFKB1 & hP21 >=  dnP211 & hP53 <=  dpP530 & hMDM2 >=  dnMDM21 & hOGT <=  dpOGT0 & hOGA <=  dpOGA0 & hCMYC >=  dnCMYC1  wait {dhNFKB=1,dhP21=1,dhFOXM=1,dhPI3K=-1,dhP53=1,dhMDM2=1,dhOGT=1,dhOGA=1,dhCMYC=1}
when hNFKB=dnNFKB1 do {hNFKB'=0, k'=k+1} goto loc_010101001;
when hP21=dnP211 do {hP21'=0, k'=k+1} goto loc_100101001;
--when hFOXM=dpFOXM0 do {hFOXM'=0, k'=k+1} goto loc_111101001;
--when hPI3K=dnPI3K1 do {hPI3K'=0, k'=k+1} goto loc_110001001;
when hP53=dpP530 do {hP53'=0, k'=k+1} goto loc_110111001;
when hMDM2=dnMDM21 do {hMDM2'=0, k'=k+1} goto loc_110100001;
when hOGT=dpOGT0 do {hOGT'=0, k'=k+1} goto loc_110101101;
when hOGA=dpOGA0 do {hOGA'=0, k'=k+1} goto loc_110101011;
when hCMYC=dnCMYC1 do {hCMYC'=0, k'=k+1} goto loc_110101000;

-- for the configuration 1,1,0,1,0,1,0,1,0
loc loc_110101010: while hNFKB >=  dnNFKB1 & hP21 >=  dnP211 & hP53 <=  dpP530 & hMDM2 >=  dnMDM21  wait {dhNFKB=1,dhP21=1,dhFOXM=1,dhPI3K=-1,dhP53=1,dhMDM2=1,dhOGT=0,dhOGA=0,dhCMYC=0}
when hNFKB=dnNFKB1 do {hNFKB'=0, k'=k+1} goto loc_010101010;
when hP21=dnP211 do {hP21'=0, k'=k+1} goto loc_100101010;
--when hFOXM=dpFOXM0 do {hFOXM'=0, k'=k+1} goto loc_111101010;
--when hPI3K=dnPI3K1 do {hPI3K'=0, k'=k+1} goto loc_110001010;
when hP53=dpP530 do {hP53'=0, k'=k+1} goto loc_110111010;
when hMDM2=dnMDM21 do {hMDM2'=0, k'=k+1} goto loc_110100010;

-- for the configuration 1,1,0,1,0,1,0,1,1
loc loc_110101011: while hNFKB >=  dnNFKB1 & hP21 >=  dnP211 & hP53 <=  dpP530 & hMDM2 >=  dnMDM21 & hOGT <=  dpOGT0 & hCMYC >=  dnCMYC1  wait {dhNFKB=1,dhP21=1,dhFOXM=1,dhPI3K=-1,dhP53=1,dhMDM2=1,dhOGT=1,dhOGA=-1,dhCMYC=1}
when hNFKB=dnNFKB1 do {hNFKB'=0, k'=k+1} goto loc_010101011;
when hP21=dnP211 do {hP21'=0, k'=k+1} goto loc_100101011;
--when hFOXM=dpFOXM0 do {hFOXM'=0, k'=k+1} goto loc_111101011;
--when hPI3K=dnPI3K1 do {hPI3K'=0, k'=k+1} goto loc_110001011;
when hP53=dpP530 do {hP53'=0, k'=k+1} goto loc_110111011;
when hMDM2=dnMDM21 do {hMDM2'=0, k'=k+1} goto loc_110100011;
when hOGT=dpOGT0 do {hOGT'=0, k'=k+1} goto loc_110101111;
--when hOGA=dnOGA1 do {hOGA'=0, k'=k+1} goto loc_110101001;
when hCMYC=dnCMYC1 do {hCMYC'=0, k'=k+1} goto loc_110101010;

-- for the configuration 1,1,0,1,0,1,1,0,0
loc loc_110101100: while hNFKB >=  dnNFKB1 & hP21 >=  dnP211 & hP53 <=  dpP530 & hMDM2 >=  dnMDM21 & hOGT >=  dnOGT1  wait {dhNFKB=1,dhP21=1,dhFOXM=1,dhPI3K=0,dhP53=1,dhMDM2=1,dhOGT=1,dhOGA=1,dhCMYC=1}
when hNFKB=dnNFKB1 do {hNFKB'=0, k'=k+1} goto loc_010101100;
when hP21=dnP211 do {hP21'=0, k'=k+1} goto loc_100101100;
--when hFOXM=dpFOXM0 do {hFOXM'=0, k'=k+1} goto loc_111101100;
when hP53=dpP530 do {hP53'=0, k'=k+1} goto loc_110111100;
when hMDM2=dnMDM21 do {hMDM2'=0, k'=k+1} goto loc_110100100;
when hOGT=dnOGT1 do {hOGT'=0, k'=k+1} goto loc_110101000;
--when hOGA=dpOGA0 do {hOGA'=0, k'=k+1} goto loc_110101110;
--when hCMYC=dpCMYC0 do {hCMYC'=0, k'=k+1} goto loc_110101101;

-- for the configuration 1,1,0,1,0,1,1,0,1
loc loc_110101101: while hNFKB >=  dnNFKB1 & hP21 >=  dnP211 & hP53 <=  dpP530 & hMDM2 >=  dnMDM21  wait {dhNFKB=1,dhP21=1,dhFOXM=1,dhPI3K=0,dhP53=1,dhMDM2=1,dhOGT=0,dhOGA=0,dhCMYC=0}
when hNFKB=dnNFKB1 do {hNFKB'=0, k'=k+1} goto loc_010101101;
when hP21=dnP211 do {hP21'=0, k'=k+1} goto loc_100101101;
--when hFOXM=dpFOXM0 do {hFOXM'=0, k'=k+1} goto loc_111101101;
when hP53=dpP530 do {hP53'=0, k'=k+1} goto loc_110111101;
when hMDM2=dnMDM21 do {hMDM2'=0, k'=k+1} goto loc_110100101;

-- for the configuration 1,1,0,1,0,1,1,1,0
loc loc_110101110: while hNFKB >=  dnNFKB1 & hP21 >=  dnP211 & hP53 <=  dpP530 & hMDM2 >=  dnMDM21 & hOGT >=  dnOGT1 & hOGA >=  dnOGA1  wait {dhNFKB=1,dhP21=1,dhFOXM=1,dhPI3K=0,dhP53=1,dhMDM2=1,dhOGT=1,dhOGA=1,dhCMYC=1}
when hNFKB=dnNFKB1 do {hNFKB'=0, k'=k+1} goto loc_010101110;
when hP21=dnP211 do {hP21'=0, k'=k+1} goto loc_100101110;
--when hFOXM=dpFOXM0 do {hFOXM'=0, k'=k+1} goto loc_111101110;
when hP53=dpP530 do {hP53'=0, k'=k+1} goto loc_110111110;
when hMDM2=dnMDM21 do {hMDM2'=0, k'=k+1} goto loc_110100110;
when hOGT=dnOGT1 do {hOGT'=0, k'=k+1} goto loc_110101010;
when hOGA=dnOGA1 do {hOGA'=0, k'=k+1} goto loc_110101100;
--when hCMYC=dpCMYC0 do {hCMYC'=0, k'=k+1} goto loc_110101111;

-- for the configuration 1,1,0,1,0,1,1,1,1
loc loc_110101111: while hNFKB >=  dnNFKB1 & hP21 >=  dnP211 & hP53 <=  dpP530 & hMDM2 >=  dnMDM21 & hOGA >=  dnOGA1  wait {dhNFKB=1,dhP21=1,dhFOXM=1,dhPI3K=0,dhP53=1,dhMDM2=1,dhOGT=0,dhOGA=1,dhCMYC=0}
when hNFKB=dnNFKB1 do {hNFKB'=0, k'=k+1} goto loc_010101111;
when hP21=dnP211 do {hP21'=0, k'=k+1} goto loc_100101111;
--when hFOXM=dpFOXM0 do {hFOXM'=0, k'=k+1} goto loc_111101111;
when hP53=dpP530 do {hP53'=0, k'=k+1} goto loc_110111111;
when hMDM2=dnMDM21 do {hMDM2'=0, k'=k+1} goto loc_110100111;
when hOGA=dnOGA1 do {hOGA'=0, k'=k+1} goto loc_110101101;

-- for the configuration 1,1,0,1,1,0,0,0,0
loc loc_110110000: while hNFKB >=  dnNFKB1 & hFOXM <=  dpFOXM0 & hPI3K >=  dnPI3K1 & hMDM2 <=  dpMDM20 & hOGA <=  dpOGA0  wait {dhNFKB=1,dhP21=-1,dhFOXM=1,dhPI3K=1,dhP53=0,dhMDM2=1,dhOGT=0,dhOGA=1,dhCMYC=0}
when hNFKB=dnNFKB1 do {hNFKB'=0, k'=k+1} goto loc_010110000;
--when hP21=dnP211 do {hP21'=0, k'=k+1} goto loc_100110000;
when hFOXM=dpFOXM0 do {hFOXM'=0, k'=k+1} goto loc_111110000;
when hPI3K=dnPI3K1 do {hPI3K'=0, k'=k+1} goto loc_110010000;
when hMDM2=dpMDM20 do {hMDM2'=0, k'=k+1} goto loc_110111000;
when hOGA=dpOGA0 do {hOGA'=0, k'=k+1} goto loc_110110010;

-- for the configuration 1,1,0,1,1,0,0,0,1
loc loc_110110001: while hNFKB >=  dnNFKB1 & hFOXM <=  dpFOXM0 & hPI3K >=  dnPI3K1 & hMDM2 <=  dpMDM20 & hOGT <=  dpOGT0 & hOGA <=  dpOGA0 & hCMYC >=  dnCMYC1  wait {dhNFKB=1,dhP21=-1,dhFOXM=1,dhPI3K=1,dhP53=0,dhMDM2=1,dhOGT=1,dhOGA=1,dhCMYC=1}
when hNFKB=dnNFKB1 do {hNFKB'=0, k'=k+1} goto loc_010110001;
--when hP21=dnP211 do {hP21'=0, k'=k+1} goto loc_100110001;
when hFOXM=dpFOXM0 do {hFOXM'=0, k'=k+1} goto loc_111110001;
when hPI3K=dnPI3K1 do {hPI3K'=0, k'=k+1} goto loc_110010001;
when hMDM2=dpMDM20 do {hMDM2'=0, k'=k+1} goto loc_110111001;
when hOGT=dpOGT0 do {hOGT'=0, k'=k+1} goto loc_110110101;
when hOGA=dpOGA0 do {hOGA'=0, k'=k+1} goto loc_110110011;
when hCMYC=dnCMYC1 do {hCMYC'=0, k'=k+1} goto loc_110110000;

-- for the configuration 1,1,0,1,1,0,0,1,0
loc loc_110110010: while hNFKB >=  dnNFKB1 & hFOXM <=  dpFOXM0 & hPI3K >=  dnPI3K1 & hMDM2 <=  dpMDM20  wait {dhNFKB=1,dhP21=-1,dhFOXM=1,dhPI3K=1,dhP53=0,dhMDM2=1,dhOGT=0,dhOGA=0,dhCMYC=0}
when hNFKB=dnNFKB1 do {hNFKB'=0, k'=k+1} goto loc_010110010;
--when hP21=dnP211 do {hP21'=0, k'=k+1} goto loc_100110010;
when hFOXM=dpFOXM0 do {hFOXM'=0, k'=k+1} goto loc_111110010;
when hPI3K=dnPI3K1 do {hPI3K'=0, k'=k+1} goto loc_110010010;
when hMDM2=dpMDM20 do {hMDM2'=0, k'=k+1} goto loc_110111010;

-- for the configuration 1,1,0,1,1,0,0,1,1
loc loc_110110011: while hNFKB >=  dnNFKB1 & hFOXM <=  dpFOXM0 & hPI3K >=  dnPI3K1 & hMDM2 <=  dpMDM20 & hOGT <=  dpOGT0 & hCMYC >=  dnCMYC1  wait {dhNFKB=1,dhP21=-1,dhFOXM=1,dhPI3K=1,dhP53=0,dhMDM2=1,dhOGT=1,dhOGA=-1,dhCMYC=1}
when hNFKB=dnNFKB1 do {hNFKB'=0, k'=k+1} goto loc_010110011;
--when hP21=dnP211 do {hP21'=0, k'=k+1} goto loc_100110011;
when hFOXM=dpFOXM0 do {hFOXM'=0, k'=k+1} goto loc_111110011;
when hPI3K=dnPI3K1 do {hPI3K'=0, k'=k+1} goto loc_110010011;
when hMDM2=dpMDM20 do {hMDM2'=0, k'=k+1} goto loc_110111011;
when hOGT=dpOGT0 do {hOGT'=0, k'=k+1} goto loc_110110111;
--when hOGA=dnOGA1 do {hOGA'=0, k'=k+1} goto loc_110110001;
when hCMYC=dnCMYC1 do {hCMYC'=0, k'=k+1} goto loc_110110010;

-- for the configuration 1,1,0,1,1,0,1,0,0
loc loc_110110100: while hNFKB >=  dnNFKB1 & hFOXM <=  dpFOXM0 & hMDM2 <=  dpMDM20 & hOGT >=  dnOGT1 & hCMYC <=  dpCMYC0  wait {dhNFKB=1,dhP21=-1,dhFOXM=1,dhPI3K=-1,dhP53=0,dhMDM2=1,dhOGT=1,dhOGA=1,dhCMYC=1}
when hNFKB=dnNFKB1 do {hNFKB'=0, k'=k+1} goto loc_010110100;
--when hP21=dnP211 do {hP21'=0, k'=k+1} goto loc_100110100;
when hFOXM=dpFOXM0 do {hFOXM'=0, k'=k+1} goto loc_111110100;
--when hPI3K=dnPI3K1 do {hPI3K'=0, k'=k+1} goto loc_110010100;
when hMDM2=dpMDM20 do {hMDM2'=0, k'=k+1} goto loc_110111100;
when hOGT=dnOGT1 do {hOGT'=0, k'=k+1} goto loc_110110000;
--when hOGA=dpOGA0 do {hOGA'=0, k'=k+1} goto loc_110110110;
when hCMYC=dpCMYC0 do {hCMYC'=0, k'=k+1} goto loc_110110101;

-- for the configuration 1,1,0,1,1,0,1,0,1
loc loc_110110101: while hNFKB >=  dnNFKB1 & hFOXM <=  dpFOXM0 & hMDM2 <=  dpMDM20  wait {dhNFKB=1,dhP21=-1,dhFOXM=1,dhPI3K=0,dhP53=0,dhMDM2=1,dhOGT=0,dhOGA=0,dhCMYC=0}
when hNFKB=dnNFKB1 do {hNFKB'=0, k'=k+1} goto loc_010110101;
--when hP21=dnP211 do {hP21'=0, k'=k+1} goto loc_100110101;
when hFOXM=dpFOXM0 do {hFOXM'=0, k'=k+1} goto loc_111110101;
when hMDM2=dpMDM20 do {hMDM2'=0, k'=k+1} goto loc_110111101;

-- for the configuration 1,1,0,1,1,0,1,1,0
loc loc_110110110: while hNFKB >=  dnNFKB1 & hFOXM <=  dpFOXM0 & hMDM2 <=  dpMDM20 & hOGT >=  dnOGT1 & hOGA >=  dnOGA1 & hCMYC <=  dpCMYC0  wait {dhNFKB=1,dhP21=-1,dhFOXM=1,dhPI3K=-1,dhP53=0,dhMDM2=1,dhOGT=1,dhOGA=1,dhCMYC=1}
when hNFKB=dnNFKB1 do {hNFKB'=0, k'=k+1} goto loc_010110110;
--when hP21=dnP211 do {hP21'=0, k'=k+1} goto loc_100110110;
when hFOXM=dpFOXM0 do {hFOXM'=0, k'=k+1} goto loc_111110110;
--when hPI3K=dnPI3K1 do {hPI3K'=0, k'=k+1} goto loc_110010110;
when hMDM2=dpMDM20 do {hMDM2'=0, k'=k+1} goto loc_110111110;
when hOGT=dnOGT1 do {hOGT'=0, k'=k+1} goto loc_110110010;
when hOGA=dnOGA1 do {hOGA'=0, k'=k+1} goto loc_110110100;
when hCMYC=dpCMYC0 do {hCMYC'=0, k'=k+1} goto loc_110110111;

-- for the configuration 1,1,0,1,1,0,1,1,1
loc loc_110110111: while hNFKB >=  dnNFKB1 & hFOXM <=  dpFOXM0 & hMDM2 <=  dpMDM20 & hOGA >=  dnOGA1  wait {dhNFKB=1,dhP21=-1,dhFOXM=1,dhPI3K=0,dhP53=0,dhMDM2=1,dhOGT=0,dhOGA=1,dhCMYC=0}
when hNFKB=dnNFKB1 do {hNFKB'=0, k'=k+1} goto loc_010110111;
--when hP21=dnP211 do {hP21'=0, k'=k+1} goto loc_100110111;
when hFOXM=dpFOXM0 do {hFOXM'=0, k'=k+1} goto loc_111110111;
when hMDM2=dpMDM20 do {hMDM2'=0, k'=k+1} goto loc_110111111;
when hOGA=dnOGA1 do {hOGA'=0, k'=k+1} goto loc_110110101;

-- for the configuration 1,1,0,1,1,1,0,0,0
loc loc_110111000: while hNFKB >=  dnNFKB1 & hFOXM <=  dpFOXM0 & hPI3K >=  dnPI3K1 & hOGA <=  dpOGA0  wait {dhNFKB=1,dhP21=-1,dhFOXM=1,dhPI3K=1,dhP53=-1,dhMDM2=0,dhOGT=0,dhOGA=1,dhCMYC=0}
when hNFKB=dnNFKB1 do {hNFKB'=0, k'=k+1} goto loc_010111000;
--when hP21=dnP211 do {hP21'=0, k'=k+1} goto loc_100111000;
when hFOXM=dpFOXM0 do {hFOXM'=0, k'=k+1} goto loc_111111000;
when hPI3K=dnPI3K1 do {hPI3K'=0, k'=k+1} goto loc_110011000;
--when hP53=dnP531 do {hP53'=0, k'=k+1} goto loc_110101000;
when hOGA=dpOGA0 do {hOGA'=0, k'=k+1} goto loc_110111010;

-- for the configuration 1,1,0,1,1,1,0,0,1
loc loc_110111001: while hNFKB >=  dnNFKB1 & hFOXM <=  dpFOXM0 & hPI3K >=  dnPI3K1 & hOGT <=  dpOGT0 & hOGA <=  dpOGA0 & hCMYC >=  dnCMYC1  wait {dhNFKB=1,dhP21=-1,dhFOXM=1,dhPI3K=1,dhP53=-1,dhMDM2=0,dhOGT=1,dhOGA=1,dhCMYC=1}
when hNFKB=dnNFKB1 do {hNFKB'=0, k'=k+1} goto loc_010111001;
--when hP21=dnP211 do {hP21'=0, k'=k+1} goto loc_100111001;
when hFOXM=dpFOXM0 do {hFOXM'=0, k'=k+1} goto loc_111111001;
when hPI3K=dnPI3K1 do {hPI3K'=0, k'=k+1} goto loc_110011001;
--when hP53=dnP531 do {hP53'=0, k'=k+1} goto loc_110101001;
when hOGT=dpOGT0 do {hOGT'=0, k'=k+1} goto loc_110111101;
when hOGA=dpOGA0 do {hOGA'=0, k'=k+1} goto loc_110111011;
when hCMYC=dnCMYC1 do {hCMYC'=0, k'=k+1} goto loc_110111000;

-- for the configuration 1,1,0,1,1,1,0,1,0
loc loc_110111010: while hNFKB >=  dnNFKB1 & hFOXM <=  dpFOXM0 & hPI3K >=  dnPI3K1  wait {dhNFKB=1,dhP21=-1,dhFOXM=1,dhPI3K=1,dhP53=-1,dhMDM2=0,dhOGT=0,dhOGA=0,dhCMYC=0}
when hNFKB=dnNFKB1 do {hNFKB'=0, k'=k+1} goto loc_010111010;
--when hP21=dnP211 do {hP21'=0, k'=k+1} goto loc_100111010;
when hFOXM=dpFOXM0 do {hFOXM'=0, k'=k+1} goto loc_111111010;
when hPI3K=dnPI3K1 do {hPI3K'=0, k'=k+1} goto loc_110011010;
--when hP53=dnP531 do {hP53'=0, k'=k+1} goto loc_110101010;

-- for the configuration 1,1,0,1,1,1,0,1,1
loc loc_110111011: while hNFKB >=  dnNFKB1 & hFOXM <=  dpFOXM0 & hPI3K >=  dnPI3K1 & hOGT <=  dpOGT0 & hCMYC >=  dnCMYC1  wait {dhNFKB=1,dhP21=-1,dhFOXM=1,dhPI3K=1,dhP53=-1,dhMDM2=0,dhOGT=1,dhOGA=-1,dhCMYC=1}
when hNFKB=dnNFKB1 do {hNFKB'=0, k'=k+1} goto loc_010111011;
--when hP21=dnP211 do {hP21'=0, k'=k+1} goto loc_100111011;
when hFOXM=dpFOXM0 do {hFOXM'=0, k'=k+1} goto loc_111111011;
when hPI3K=dnPI3K1 do {hPI3K'=0, k'=k+1} goto loc_110011011;
--when hP53=dnP531 do {hP53'=0, k'=k+1} goto loc_110101011;
when hOGT=dpOGT0 do {hOGT'=0, k'=k+1} goto loc_110111111;
--when hOGA=dnOGA1 do {hOGA'=0, k'=k+1} goto loc_110111001;
when hCMYC=dnCMYC1 do {hCMYC'=0, k'=k+1} goto loc_110111010;

-- for the configuration 1,1,0,1,1,1,1,0,0
loc loc_110111100: while hNFKB >=  dnNFKB1 & hFOXM <=  dpFOXM0 & hOGT >=  dnOGT1 & hCMYC <=  dpCMYC0  wait {dhNFKB=1,dhP21=-1,dhFOXM=1,dhPI3K=-1,dhP53=-1,dhMDM2=0,dhOGT=1,dhOGA=1,dhCMYC=1}
when hNFKB=dnNFKB1 do {hNFKB'=0, k'=k+1} goto loc_010111100;
--when hP21=dnP211 do {hP21'=0, k'=k+1} goto loc_100111100;
when hFOXM=dpFOXM0 do {hFOXM'=0, k'=k+1} goto loc_111111100;
--when hPI3K=dnPI3K1 do {hPI3K'=0, k'=k+1} goto loc_110011100;
--when hP53=dnP531 do {hP53'=0, k'=k+1} goto loc_110101100;
when hOGT=dnOGT1 do {hOGT'=0, k'=k+1} goto loc_110111000;
--when hOGA=dpOGA0 do {hOGA'=0, k'=k+1} goto loc_110111110;
when hCMYC=dpCMYC0 do {hCMYC'=0, k'=k+1} goto loc_110111101;

-- for the configuration 1,1,0,1,1,1,1,0,1
loc loc_110111101: while hNFKB >=  dnNFKB1 & hFOXM <=  dpFOXM0  wait {dhNFKB=1,dhP21=-1,dhFOXM=1,dhPI3K=0,dhP53=-1,dhMDM2=0,dhOGT=0,dhOGA=0,dhCMYC=0}
when hNFKB=dnNFKB1 do {hNFKB'=0, k'=k+1} goto loc_010111101;
--when hP21=dnP211 do {hP21'=0, k'=k+1} goto loc_100111101;
when hFOXM=dpFOXM0 do {hFOXM'=0, k'=k+1} goto loc_111111101;
--when hP53=dnP531 do {hP53'=0, k'=k+1} goto loc_110101101;

-- for the configuration 1,1,0,1,1,1,1,1,0
loc loc_110111110: while hNFKB >=  dnNFKB1 & hFOXM <=  dpFOXM0 & hOGT >=  dnOGT1 & hOGA >=  dnOGA1 & hCMYC <=  dpCMYC0  wait {dhNFKB=1,dhP21=-1,dhFOXM=1,dhPI3K=-1,dhP53=-1,dhMDM2=0,dhOGT=1,dhOGA=1,dhCMYC=1}
when hNFKB=dnNFKB1 do {hNFKB'=0, k'=k+1} goto loc_010111110;
--when hP21=dnP211 do {hP21'=0, k'=k+1} goto loc_100111110;
when hFOXM=dpFOXM0 do {hFOXM'=0, k'=k+1} goto loc_111111110;
--when hPI3K=dnPI3K1 do {hPI3K'=0, k'=k+1} goto loc_110011110;
--when hP53=dnP531 do {hP53'=0, k'=k+1} goto loc_110101110;
when hOGT=dnOGT1 do {hOGT'=0, k'=k+1} goto loc_110111010;
when hOGA=dnOGA1 do {hOGA'=0, k'=k+1} goto loc_110111100;
when hCMYC=dpCMYC0 do {hCMYC'=0, k'=k+1} goto loc_110111111;

-- for the configuration 1,1,0,1,1,1,1,1,1
loc loc_110111111: while hNFKB >=  dnNFKB1 & hFOXM <=  dpFOXM0 & hOGA >=  dnOGA1  wait {dhNFKB=1,dhP21=-1,dhFOXM=1,dhPI3K=0,dhP53=-1,dhMDM2=0,dhOGT=0,dhOGA=1,dhCMYC=0}
when hNFKB=dnNFKB1 do {hNFKB'=0, k'=k+1} goto loc_010111111;
--when hP21=dnP211 do {hP21'=0, k'=k+1} goto loc_100111111;
when hFOXM=dpFOXM0 do {hFOXM'=0, k'=k+1} goto loc_111111111;
--when hP53=dnP531 do {hP53'=0, k'=k+1} goto loc_110101111;
when hOGA=dnOGA1 do {hOGA'=0, k'=k+1} goto loc_110111101;

-- for the configuration 1,1,1,0,0,0,0,0,0
loc loc_111000000: while hNFKB >=  dnNFKB1 & hP21 >=  dnP211 & hFOXM >=  dnFOXM1 & hPI3K <=  dpPI3K0 & hP53 <=  dpP530 & hOGA <=  dpOGA0  wait {dhNFKB=1,dhP21=1,dhFOXM=1,dhPI3K=1,dhP53=1,dhMDM2=1,dhOGT=0,dhOGA=1,dhCMYC=0}
when hNFKB=dnNFKB1 do {hNFKB'=0, k'=k+1} goto loc_011000000;
when hP21=dnP211 do {hP21'=0, k'=k+1} goto loc_101000000;
when hFOXM=dnFOXM1 do {hFOXM'=0, k'=k+1} goto loc_110000000;
when hPI3K=dpPI3K0 do {hPI3K'=0, k'=k+1} goto loc_111100000;
when hP53=dpP530 do {hP53'=0, k'=k+1} goto loc_111010000;
--when hMDM2=dpMDM20 do {hMDM2'=0, k'=k+1} goto loc_111001000;
when hOGA=dpOGA0 do {hOGA'=0, k'=k+1} goto loc_111000010;

-- for the configuration 1,1,1,0,0,0,0,0,1
loc loc_111000001: while hNFKB >=  dnNFKB1 & hP21 >=  dnP211 & hFOXM >=  dnFOXM1 & hPI3K <=  dpPI3K0 & hP53 <=  dpP530 & hOGT <=  dpOGT0 & hOGA <=  dpOGA0 & hCMYC >=  dnCMYC1  wait {dhNFKB=1,dhP21=1,dhFOXM=1,dhPI3K=1,dhP53=1,dhMDM2=1,dhOGT=1,dhOGA=1,dhCMYC=1}
when hNFKB=dnNFKB1 do {hNFKB'=0, k'=k+1} goto loc_011000001;
when hP21=dnP211 do {hP21'=0, k'=k+1} goto loc_101000001;
when hFOXM=dnFOXM1 do {hFOXM'=0, k'=k+1} goto loc_110000001;
when hPI3K=dpPI3K0 do {hPI3K'=0, k'=k+1} goto loc_111100001;
when hP53=dpP530 do {hP53'=0, k'=k+1} goto loc_111010001;
--when hMDM2=dpMDM20 do {hMDM2'=0, k'=k+1} goto loc_111001001;
when hOGT=dpOGT0 do {hOGT'=0, k'=k+1} goto loc_111000101;
when hOGA=dpOGA0 do {hOGA'=0, k'=k+1} goto loc_111000011;
when hCMYC=dnCMYC1 do {hCMYC'=0, k'=k+1} goto loc_111000000;

-- for the configuration 1,1,1,0,0,0,0,1,0
loc loc_111000010: while hNFKB >=  dnNFKB1 & hP21 >=  dnP211 & hFOXM >=  dnFOXM1 & hPI3K <=  dpPI3K0 & hP53 <=  dpP530  wait {dhNFKB=1,dhP21=1,dhFOXM=1,dhPI3K=1,dhP53=1,dhMDM2=1,dhOGT=0,dhOGA=0,dhCMYC=0}
when hNFKB=dnNFKB1 do {hNFKB'=0, k'=k+1} goto loc_011000010;
when hP21=dnP211 do {hP21'=0, k'=k+1} goto loc_101000010;
when hFOXM=dnFOXM1 do {hFOXM'=0, k'=k+1} goto loc_110000010;
when hPI3K=dpPI3K0 do {hPI3K'=0, k'=k+1} goto loc_111100010;
when hP53=dpP530 do {hP53'=0, k'=k+1} goto loc_111010010;
--when hMDM2=dpMDM20 do {hMDM2'=0, k'=k+1} goto loc_111001010;

-- for the configuration 1,1,1,0,0,0,0,1,1
loc loc_111000011: while hNFKB >=  dnNFKB1 & hP21 >=  dnP211 & hFOXM >=  dnFOXM1 & hPI3K <=  dpPI3K0 & hP53 <=  dpP530 & hOGT <=  dpOGT0 & hCMYC >=  dnCMYC1  wait {dhNFKB=1,dhP21=1,dhFOXM=1,dhPI3K=1,dhP53=1,dhMDM2=1,dhOGT=1,dhOGA=-1,dhCMYC=1}
when hNFKB=dnNFKB1 do {hNFKB'=0, k'=k+1} goto loc_011000011;
when hP21=dnP211 do {hP21'=0, k'=k+1} goto loc_101000011;
when hFOXM=dnFOXM1 do {hFOXM'=0, k'=k+1} goto loc_110000011;
when hPI3K=dpPI3K0 do {hPI3K'=0, k'=k+1} goto loc_111100011;
when hP53=dpP530 do {hP53'=0, k'=k+1} goto loc_111010011;
--when hMDM2=dpMDM20 do {hMDM2'=0, k'=k+1} goto loc_111001011;
when hOGT=dpOGT0 do {hOGT'=0, k'=k+1} goto loc_111000111;
--when hOGA=dnOGA1 do {hOGA'=0, k'=k+1} goto loc_111000001;
when hCMYC=dnCMYC1 do {hCMYC'=0, k'=k+1} goto loc_111000010;

-- for the configuration 1,1,1,0,0,0,1,0,0
loc loc_111000100: while hNFKB >=  dnNFKB1 & hP21 >=  dnP211 & hFOXM >=  dnFOXM1 & hP53 <=  dpP530 & hOGT >=  dnOGT1  wait {dhNFKB=1,dhP21=1,dhFOXM=1,dhPI3K=1,dhP53=1,dhMDM2=1,dhOGT=1,dhOGA=1,dhCMYC=1}
when hNFKB=dnNFKB1 do {hNFKB'=0, k'=k+1} goto loc_011000100;
when hP21=dnP211 do {hP21'=0, k'=k+1} goto loc_101000100;
when hFOXM=dnFOXM1 do {hFOXM'=0, k'=k+1} goto loc_110000100;
--when hPI3K=dpPI3K0 do {hPI3K'=0, k'=k+1} goto loc_111100100;
when hP53=dpP530 do {hP53'=0, k'=k+1} goto loc_111010100;
--when hMDM2=dpMDM20 do {hMDM2'=0, k'=k+1} goto loc_111001100;
when hOGT=dnOGT1 do {hOGT'=0, k'=k+1} goto loc_111000000;
--when hOGA=dpOGA0 do {hOGA'=0, k'=k+1} goto loc_111000110;
--when hCMYC=dpCMYC0 do {hCMYC'=0, k'=k+1} goto loc_111000101;

-- for the configuration 1,1,1,0,0,0,1,0,1
loc loc_111000101: while hNFKB >=  dnNFKB1 & hP21 >=  dnP211 & hFOXM >=  dnFOXM1 & hP53 <=  dpP530  wait {dhNFKB=1,dhP21=1,dhFOXM=1,dhPI3K=1,dhP53=1,dhMDM2=1,dhOGT=0,dhOGA=0,dhCMYC=0}
when hNFKB=dnNFKB1 do {hNFKB'=0, k'=k+1} goto loc_011000101;
when hP21=dnP211 do {hP21'=0, k'=k+1} goto loc_101000101;
when hFOXM=dnFOXM1 do {hFOXM'=0, k'=k+1} goto loc_110000101;
--when hPI3K=dpPI3K0 do {hPI3K'=0, k'=k+1} goto loc_111100101;
when hP53=dpP530 do {hP53'=0, k'=k+1} goto loc_111010101;
--when hMDM2=dpMDM20 do {hMDM2'=0, k'=k+1} goto loc_111001101;

-- for the configuration 1,1,1,0,0,0,1,1,0
loc loc_111000110: while hNFKB >=  dnNFKB1 & hP21 >=  dnP211 & hFOXM >=  dnFOXM1 & hP53 <=  dpP530 & hOGT >=  dnOGT1 & hOGA >=  dnOGA1  wait {dhNFKB=1,dhP21=1,dhFOXM=1,dhPI3K=1,dhP53=1,dhMDM2=1,dhOGT=1,dhOGA=1,dhCMYC=1}
when hNFKB=dnNFKB1 do {hNFKB'=0, k'=k+1} goto loc_011000110;
when hP21=dnP211 do {hP21'=0, k'=k+1} goto loc_101000110;
when hFOXM=dnFOXM1 do {hFOXM'=0, k'=k+1} goto loc_110000110;
--when hPI3K=dpPI3K0 do {hPI3K'=0, k'=k+1} goto loc_111100110;
when hP53=dpP530 do {hP53'=0, k'=k+1} goto loc_111010110;
--when hMDM2=dpMDM20 do {hMDM2'=0, k'=k+1} goto loc_111001110;
when hOGT=dnOGT1 do {hOGT'=0, k'=k+1} goto loc_111000010;
when hOGA=dnOGA1 do {hOGA'=0, k'=k+1} goto loc_111000100;
--when hCMYC=dpCMYC0 do {hCMYC'=0, k'=k+1} goto loc_111000111;

-- for the configuration 1,1,1,0,0,0,1,1,1
loc loc_111000111: while hNFKB >=  dnNFKB1 & hP21 >=  dnP211 & hFOXM >=  dnFOXM1 & hP53 <=  dpP530 & hOGA >=  dnOGA1  wait {dhNFKB=1,dhP21=1,dhFOXM=1,dhPI3K=1,dhP53=1,dhMDM2=1,dhOGT=0,dhOGA=1,dhCMYC=0}
when hNFKB=dnNFKB1 do {hNFKB'=0, k'=k+1} goto loc_011000111;
when hP21=dnP211 do {hP21'=0, k'=k+1} goto loc_101000111;
when hFOXM=dnFOXM1 do {hFOXM'=0, k'=k+1} goto loc_110000111;
--when hPI3K=dpPI3K0 do {hPI3K'=0, k'=k+1} goto loc_111100111;
when hP53=dpP530 do {hP53'=0, k'=k+1} goto loc_111010111;
--when hMDM2=dpMDM20 do {hMDM2'=0, k'=k+1} goto loc_111001111;
when hOGA=dnOGA1 do {hOGA'=0, k'=k+1} goto loc_111000101;

-- for the configuration 1,1,1,0,0,1,0,0,0
loc loc_111001000: while hNFKB >=  dnNFKB1 & hP21 >=  dnP211 & hFOXM >=  dnFOXM1 & hPI3K <=  dpPI3K0 & hP53 <=  dpP530 & hMDM2 >=  dnMDM21 & hOGA <=  dpOGA0  wait {dhNFKB=1,dhP21=1,dhFOXM=1,dhPI3K=1,dhP53=1,dhMDM2=1,dhOGT=0,dhOGA=1,dhCMYC=0}
when hNFKB=dnNFKB1 do {hNFKB'=0, k'=k+1} goto loc_011001000;
when hP21=dnP211 do {hP21'=0, k'=k+1} goto loc_101001000;
when hFOXM=dnFOXM1 do {hFOXM'=0, k'=k+1} goto loc_110001000;
when hPI3K=dpPI3K0 do {hPI3K'=0, k'=k+1} goto loc_111101000;
when hP53=dpP530 do {hP53'=0, k'=k+1} goto loc_111011000;
when hMDM2=dnMDM21 do {hMDM2'=0, k'=k+1} goto loc_111000000;
when hOGA=dpOGA0 do {hOGA'=0, k'=k+1} goto loc_111001010;

-- for the configuration 1,1,1,0,0,1,0,0,1
loc loc_111001001: while hNFKB >=  dnNFKB1 & hP21 >=  dnP211 & hFOXM >=  dnFOXM1 & hPI3K <=  dpPI3K0 & hP53 <=  dpP530 & hMDM2 >=  dnMDM21 & hOGT <=  dpOGT0 & hOGA <=  dpOGA0 & hCMYC >=  dnCMYC1  wait {dhNFKB=1,dhP21=1,dhFOXM=1,dhPI3K=1,dhP53=1,dhMDM2=1,dhOGT=1,dhOGA=1,dhCMYC=1}
when hNFKB=dnNFKB1 do {hNFKB'=0, k'=k+1} goto loc_011001001;
when hP21=dnP211 do {hP21'=0, k'=k+1} goto loc_101001001;
when hFOXM=dnFOXM1 do {hFOXM'=0, k'=k+1} goto loc_110001001;
when hPI3K=dpPI3K0 do {hPI3K'=0, k'=k+1} goto loc_111101001;
when hP53=dpP530 do {hP53'=0, k'=k+1} goto loc_111011001;
when hMDM2=dnMDM21 do {hMDM2'=0, k'=k+1} goto loc_111000001;
when hOGT=dpOGT0 do {hOGT'=0, k'=k+1} goto loc_111001101;
when hOGA=dpOGA0 do {hOGA'=0, k'=k+1} goto loc_111001011;
when hCMYC=dnCMYC1 do {hCMYC'=0, k'=k+1} goto loc_111001000;

-- for the configuration 1,1,1,0,0,1,0,1,0
loc loc_111001010: while hNFKB >=  dnNFKB1 & hP21 >=  dnP211 & hFOXM >=  dnFOXM1 & hPI3K <=  dpPI3K0 & hP53 <=  dpP530 & hMDM2 >=  dnMDM21  wait {dhNFKB=1,dhP21=1,dhFOXM=1,dhPI3K=1,dhP53=1,dhMDM2=1,dhOGT=0,dhOGA=0,dhCMYC=0}
when hNFKB=dnNFKB1 do {hNFKB'=0, k'=k+1} goto loc_011001010;
when hP21=dnP211 do {hP21'=0, k'=k+1} goto loc_101001010;
when hFOXM=dnFOXM1 do {hFOXM'=0, k'=k+1} goto loc_110001010;
when hPI3K=dpPI3K0 do {hPI3K'=0, k'=k+1} goto loc_111101010;
when hP53=dpP530 do {hP53'=0, k'=k+1} goto loc_111011010;
when hMDM2=dnMDM21 do {hMDM2'=0, k'=k+1} goto loc_111000010;

-- for the configuration 1,1,1,0,0,1,0,1,1
loc loc_111001011: while hNFKB >=  dnNFKB1 & hP21 >=  dnP211 & hFOXM >=  dnFOXM1 & hPI3K <=  dpPI3K0 & hP53 <=  dpP530 & hMDM2 >=  dnMDM21 & hOGT <=  dpOGT0 & hCMYC >=  dnCMYC1  wait {dhNFKB=1,dhP21=1,dhFOXM=1,dhPI3K=1,dhP53=1,dhMDM2=1,dhOGT=1,dhOGA=-1,dhCMYC=1}
when hNFKB=dnNFKB1 do {hNFKB'=0, k'=k+1} goto loc_011001011;
when hP21=dnP211 do {hP21'=0, k'=k+1} goto loc_101001011;
when hFOXM=dnFOXM1 do {hFOXM'=0, k'=k+1} goto loc_110001011;
when hPI3K=dpPI3K0 do {hPI3K'=0, k'=k+1} goto loc_111101011;
when hP53=dpP530 do {hP53'=0, k'=k+1} goto loc_111011011;
when hMDM2=dnMDM21 do {hMDM2'=0, k'=k+1} goto loc_111000011;
when hOGT=dpOGT0 do {hOGT'=0, k'=k+1} goto loc_111001111;
--when hOGA=dnOGA1 do {hOGA'=0, k'=k+1} goto loc_111001001;
when hCMYC=dnCMYC1 do {hCMYC'=0, k'=k+1} goto loc_111001010;

-- for the configuration 1,1,1,0,0,1,1,0,0
loc loc_111001100: while hNFKB >=  dnNFKB1 & hP21 >=  dnP211 & hFOXM >=  dnFOXM1 & hP53 <=  dpP530 & hMDM2 >=  dnMDM21 & hOGT >=  dnOGT1  wait {dhNFKB=1,dhP21=1,dhFOXM=1,dhPI3K=1,dhP53=1,dhMDM2=1,dhOGT=1,dhOGA=1,dhCMYC=1}
when hNFKB=dnNFKB1 do {hNFKB'=0, k'=k+1} goto loc_011001100;
when hP21=dnP211 do {hP21'=0, k'=k+1} goto loc_101001100;
when hFOXM=dnFOXM1 do {hFOXM'=0, k'=k+1} goto loc_110001100;
--when hPI3K=dpPI3K0 do {hPI3K'=0, k'=k+1} goto loc_111101100;
when hP53=dpP530 do {hP53'=0, k'=k+1} goto loc_111011100;
when hMDM2=dnMDM21 do {hMDM2'=0, k'=k+1} goto loc_111000100;
when hOGT=dnOGT1 do {hOGT'=0, k'=k+1} goto loc_111001000;
--when hOGA=dpOGA0 do {hOGA'=0, k'=k+1} goto loc_111001110;
--when hCMYC=dpCMYC0 do {hCMYC'=0, k'=k+1} goto loc_111001101;

-- for the configuration 1,1,1,0,0,1,1,0,1
loc loc_111001101: while hNFKB >=  dnNFKB1 & hP21 >=  dnP211 & hFOXM >=  dnFOXM1 & hP53 <=  dpP530 & hMDM2 >=  dnMDM21  wait {dhNFKB=1,dhP21=1,dhFOXM=1,dhPI3K=1,dhP53=1,dhMDM2=1,dhOGT=0,dhOGA=0,dhCMYC=0}
when hNFKB=dnNFKB1 do {hNFKB'=0, k'=k+1} goto loc_011001101;
when hP21=dnP211 do {hP21'=0, k'=k+1} goto loc_101001101;
when hFOXM=dnFOXM1 do {hFOXM'=0, k'=k+1} goto loc_110001101;
--when hPI3K=dpPI3K0 do {hPI3K'=0, k'=k+1} goto loc_111101101;
when hP53=dpP530 do {hP53'=0, k'=k+1} goto loc_111011101;
when hMDM2=dnMDM21 do {hMDM2'=0, k'=k+1} goto loc_111000101;

-- for the configuration 1,1,1,0,0,1,1,1,0
loc loc_111001110: while hNFKB >=  dnNFKB1 & hP21 >=  dnP211 & hFOXM >=  dnFOXM1 & hP53 <=  dpP530 & hMDM2 >=  dnMDM21 & hOGT >=  dnOGT1 & hOGA >=  dnOGA1  wait {dhNFKB=1,dhP21=1,dhFOXM=1,dhPI3K=1,dhP53=1,dhMDM2=1,dhOGT=1,dhOGA=1,dhCMYC=1}
when hNFKB=dnNFKB1 do {hNFKB'=0, k'=k+1} goto loc_011001110;
when hP21=dnP211 do {hP21'=0, k'=k+1} goto loc_101001110;
when hFOXM=dnFOXM1 do {hFOXM'=0, k'=k+1} goto loc_110001110;
--when hPI3K=dpPI3K0 do {hPI3K'=0, k'=k+1} goto loc_111101110;
when hP53=dpP530 do {hP53'=0, k'=k+1} goto loc_111011110;
when hMDM2=dnMDM21 do {hMDM2'=0, k'=k+1} goto loc_111000110;
when hOGT=dnOGT1 do {hOGT'=0, k'=k+1} goto loc_111001010;
when hOGA=dnOGA1 do {hOGA'=0, k'=k+1} goto loc_111001100;
--when hCMYC=dpCMYC0 do {hCMYC'=0, k'=k+1} goto loc_111001111;

-- for the configuration 1,1,1,0,0,1,1,1,1
loc loc_111001111: while hNFKB >=  dnNFKB1 & hP21 >=  dnP211 & hFOXM >=  dnFOXM1 & hP53 <=  dpP530 & hMDM2 >=  dnMDM21 & hOGA >=  dnOGA1  wait {dhNFKB=1,dhP21=1,dhFOXM=1,dhPI3K=1,dhP53=1,dhMDM2=1,dhOGT=0,dhOGA=1,dhCMYC=0}
when hNFKB=dnNFKB1 do {hNFKB'=0, k'=k+1} goto loc_011001111;
when hP21=dnP211 do {hP21'=0, k'=k+1} goto loc_101001111;
when hFOXM=dnFOXM1 do {hFOXM'=0, k'=k+1} goto loc_110001111;
--when hPI3K=dpPI3K0 do {hPI3K'=0, k'=k+1} goto loc_111101111;
when hP53=dpP530 do {hP53'=0, k'=k+1} goto loc_111011111;
when hMDM2=dnMDM21 do {hMDM2'=0, k'=k+1} goto loc_111000111;
when hOGA=dnOGA1 do {hOGA'=0, k'=k+1} goto loc_111001101;

-- for the configuration 1,1,1,0,1,0,0,0,0
loc loc_111010000: while hNFKB >=  dnNFKB1 & hFOXM >=  dnFOXM1 & hMDM2 <=  dpMDM20 & hOGA <=  dpOGA0  wait {dhNFKB=1,dhP21=0,dhFOXM=1,dhPI3K=0,dhP53=0,dhMDM2=1,dhOGT=0,dhOGA=1,dhCMYC=0}
when hNFKB=dnNFKB1 do {hNFKB'=0, k'=k+1} goto loc_011010000;
when hFOXM=dnFOXM1 do {hFOXM'=0, k'=k+1} goto loc_110010000;
when hMDM2=dpMDM20 do {hMDM2'=0, k'=k+1} goto loc_111011000;
when hOGA=dpOGA0 do {hOGA'=0, k'=k+1} goto loc_111010010;

-- for the configuration 1,1,1,0,1,0,0,0,1
loc loc_111010001: while hNFKB >=  dnNFKB1 & hFOXM >=  dnFOXM1 & hMDM2 <=  dpMDM20 & hOGT <=  dpOGT0 & hOGA <=  dpOGA0 & hCMYC >=  dnCMYC1  wait {dhNFKB=1,dhP21=0,dhFOXM=1,dhPI3K=1,dhP53=0,dhMDM2=1,dhOGT=1,dhOGA=1,dhCMYC=1}
when hNFKB=dnNFKB1 do {hNFKB'=0, k'=k+1} goto loc_011010001;
when hFOXM=dnFOXM1 do {hFOXM'=0, k'=k+1} goto loc_110010001;
--when hPI3K=dpPI3K0 do {hPI3K'=0, k'=k+1} goto loc_111110001;
when hMDM2=dpMDM20 do {hMDM2'=0, k'=k+1} goto loc_111011001;
when hOGT=dpOGT0 do {hOGT'=0, k'=k+1} goto loc_111010101;
when hOGA=dpOGA0 do {hOGA'=0, k'=k+1} goto loc_111010011;
when hCMYC=dnCMYC1 do {hCMYC'=0, k'=k+1} goto loc_111010000;

-- for the configuration 1,1,1,0,1,0,0,1,0
loc loc_111010010: while hNFKB >=  dnNFKB1 & hFOXM >=  dnFOXM1 & hMDM2 <=  dpMDM20  wait {dhNFKB=1,dhP21=0,dhFOXM=1,dhPI3K=0,dhP53=0,dhMDM2=1,dhOGT=0,dhOGA=0,dhCMYC=0}
when hNFKB=dnNFKB1 do {hNFKB'=0, k'=k+1} goto loc_011010010;
when hFOXM=dnFOXM1 do {hFOXM'=0, k'=k+1} goto loc_110010010;
when hMDM2=dpMDM20 do {hMDM2'=0, k'=k+1} goto loc_111011010;

-- for the configuration 1,1,1,0,1,0,0,1,1
loc loc_111010011: while hNFKB >=  dnNFKB1 & hFOXM >=  dnFOXM1 & hMDM2 <=  dpMDM20 & hOGT <=  dpOGT0 & hCMYC >=  dnCMYC1  wait {dhNFKB=1,dhP21=0,dhFOXM=1,dhPI3K=1,dhP53=0,dhMDM2=1,dhOGT=1,dhOGA=-1,dhCMYC=1}
when hNFKB=dnNFKB1 do {hNFKB'=0, k'=k+1} goto loc_011010011;
when hFOXM=dnFOXM1 do {hFOXM'=0, k'=k+1} goto loc_110010011;
--when hPI3K=dpPI3K0 do {hPI3K'=0, k'=k+1} goto loc_111110011;
when hMDM2=dpMDM20 do {hMDM2'=0, k'=k+1} goto loc_111011011;
when hOGT=dpOGT0 do {hOGT'=0, k'=k+1} goto loc_111010111;
--when hOGA=dnOGA1 do {hOGA'=0, k'=k+1} goto loc_111010001;
when hCMYC=dnCMYC1 do {hCMYC'=0, k'=k+1} goto loc_111010010;

-- for the configuration 1,1,1,0,1,0,1,0,0
loc loc_111010100: while hNFKB >=  dnNFKB1 & hFOXM >=  dnFOXM1 & hPI3K <=  dpPI3K0 & hMDM2 <=  dpMDM20 & hOGT >=  dnOGT1 & hCMYC <=  dpCMYC0  wait {dhNFKB=1,dhP21=-1,dhFOXM=1,dhPI3K=1,dhP53=0,dhMDM2=1,dhOGT=1,dhOGA=1,dhCMYC=1}
when hNFKB=dnNFKB1 do {hNFKB'=0, k'=k+1} goto loc_011010100;
--when hP21=dnP211 do {hP21'=0, k'=k+1} goto loc_101010100;
when hFOXM=dnFOXM1 do {hFOXM'=0, k'=k+1} goto loc_110010100;
when hPI3K=dpPI3K0 do {hPI3K'=0, k'=k+1} goto loc_111110100;
when hMDM2=dpMDM20 do {hMDM2'=0, k'=k+1} goto loc_111011100;
when hOGT=dnOGT1 do {hOGT'=0, k'=k+1} goto loc_111010000;
--when hOGA=dpOGA0 do {hOGA'=0, k'=k+1} goto loc_111010110;
when hCMYC=dpCMYC0 do {hCMYC'=0, k'=k+1} goto loc_111010101;

-- for the configuration 1,1,1,0,1,0,1,0,1
loc loc_111010101: while hNFKB >=  dnNFKB1 & hFOXM >=  dnFOXM1 & hPI3K <=  dpPI3K0 & hMDM2 <=  dpMDM20  wait {dhNFKB=1,dhP21=-1,dhFOXM=1,dhPI3K=1,dhP53=0,dhMDM2=1,dhOGT=0,dhOGA=0,dhCMYC=0}
when hNFKB=dnNFKB1 do {hNFKB'=0, k'=k+1} goto loc_011010101;
--when hP21=dnP211 do {hP21'=0, k'=k+1} goto loc_101010101;
when hFOXM=dnFOXM1 do {hFOXM'=0, k'=k+1} goto loc_110010101;
when hPI3K=dpPI3K0 do {hPI3K'=0, k'=k+1} goto loc_111110101;
when hMDM2=dpMDM20 do {hMDM2'=0, k'=k+1} goto loc_111011101;

-- for the configuration 1,1,1,0,1,0,1,1,0
loc loc_111010110: while hNFKB >=  dnNFKB1 & hFOXM >=  dnFOXM1 & hPI3K <=  dpPI3K0 & hMDM2 <=  dpMDM20 & hOGT >=  dnOGT1 & hOGA >=  dnOGA1 & hCMYC <=  dpCMYC0  wait {dhNFKB=1,dhP21=-1,dhFOXM=1,dhPI3K=1,dhP53=0,dhMDM2=1,dhOGT=1,dhOGA=1,dhCMYC=1}
when hNFKB=dnNFKB1 do {hNFKB'=0, k'=k+1} goto loc_011010110;
--when hP21=dnP211 do {hP21'=0, k'=k+1} goto loc_101010110;
when hFOXM=dnFOXM1 do {hFOXM'=0, k'=k+1} goto loc_110010110;
when hPI3K=dpPI3K0 do {hPI3K'=0, k'=k+1} goto loc_111110110;
when hMDM2=dpMDM20 do {hMDM2'=0, k'=k+1} goto loc_111011110;
when hOGT=dnOGT1 do {hOGT'=0, k'=k+1} goto loc_111010010;
when hOGA=dnOGA1 do {hOGA'=0, k'=k+1} goto loc_111010100;
when hCMYC=dpCMYC0 do {hCMYC'=0, k'=k+1} goto loc_111010111;

-- for the configuration 1,1,1,0,1,0,1,1,1
loc loc_111010111: while hNFKB >=  dnNFKB1 & hFOXM >=  dnFOXM1 & hPI3K <=  dpPI3K0 & hMDM2 <=  dpMDM20 & hOGA >=  dnOGA1  wait {dhNFKB=1,dhP21=-1,dhFOXM=1,dhPI3K=1,dhP53=0,dhMDM2=1,dhOGT=0,dhOGA=1,dhCMYC=0}
when hNFKB=dnNFKB1 do {hNFKB'=0, k'=k+1} goto loc_011010111;
--when hP21=dnP211 do {hP21'=0, k'=k+1} goto loc_101010111;
when hFOXM=dnFOXM1 do {hFOXM'=0, k'=k+1} goto loc_110010111;
when hPI3K=dpPI3K0 do {hPI3K'=0, k'=k+1} goto loc_111110111;
when hMDM2=dpMDM20 do {hMDM2'=0, k'=k+1} goto loc_111011111;
when hOGA=dnOGA1 do {hOGA'=0, k'=k+1} goto loc_111010101;

-- for the configuration 1,1,1,0,1,1,0,0,0
loc loc_111011000: while hNFKB >=  dnNFKB1 & hFOXM >=  dnFOXM1 & hOGA <=  dpOGA0  wait {dhNFKB=1,dhP21=0,dhFOXM=1,dhPI3K=0,dhP53=-1,dhMDM2=0,dhOGT=0,dhOGA=1,dhCMYC=0}
when hNFKB=dnNFKB1 do {hNFKB'=0, k'=k+1} goto loc_011011000;
when hFOXM=dnFOXM1 do {hFOXM'=0, k'=k+1} goto loc_110011000;
--when hP53=dnP531 do {hP53'=0, k'=k+1} goto loc_111001000;
when hOGA=dpOGA0 do {hOGA'=0, k'=k+1} goto loc_111011010;

-- for the configuration 1,1,1,0,1,1,0,0,1
loc loc_111011001: while hNFKB >=  dnNFKB1 & hFOXM >=  dnFOXM1 & hOGT <=  dpOGT0 & hOGA <=  dpOGA0 & hCMYC >=  dnCMYC1  wait {dhNFKB=1,dhP21=0,dhFOXM=1,dhPI3K=1,dhP53=-1,dhMDM2=0,dhOGT=1,dhOGA=1,dhCMYC=1}
when hNFKB=dnNFKB1 do {hNFKB'=0, k'=k+1} goto loc_011011001;
when hFOXM=dnFOXM1 do {hFOXM'=0, k'=k+1} goto loc_110011001;
--when hPI3K=dpPI3K0 do {hPI3K'=0, k'=k+1} goto loc_111111001;
--when hP53=dnP531 do {hP53'=0, k'=k+1} goto loc_111001001;
when hOGT=dpOGT0 do {hOGT'=0, k'=k+1} goto loc_111011101;
when hOGA=dpOGA0 do {hOGA'=0, k'=k+1} goto loc_111011011;
when hCMYC=dnCMYC1 do {hCMYC'=0, k'=k+1} goto loc_111011000;

-- for the configuration 1,1,1,0,1,1,0,1,0
loc loc_111011010: while hNFKB >=  dnNFKB1 & hFOXM >=  dnFOXM1  wait {dhNFKB=1,dhP21=0,dhFOXM=1,dhPI3K=0,dhP53=-1,dhMDM2=0,dhOGT=0,dhOGA=0,dhCMYC=0}
when hNFKB=dnNFKB1 do {hNFKB'=0, k'=k+1} goto loc_011011010;
when hFOXM=dnFOXM1 do {hFOXM'=0, k'=k+1} goto loc_110011010;
--when hP53=dnP531 do {hP53'=0, k'=k+1} goto loc_111001010;

-- for the configuration 1,1,1,0,1,1,0,1,1
loc loc_111011011: while hNFKB >=  dnNFKB1 & hFOXM >=  dnFOXM1 & hOGT <=  dpOGT0 & hCMYC >=  dnCMYC1  wait {dhNFKB=1,dhP21=0,dhFOXM=1,dhPI3K=1,dhP53=-1,dhMDM2=0,dhOGT=1,dhOGA=-1,dhCMYC=1}
when hNFKB=dnNFKB1 do {hNFKB'=0, k'=k+1} goto loc_011011011;
when hFOXM=dnFOXM1 do {hFOXM'=0, k'=k+1} goto loc_110011011;
--when hPI3K=dpPI3K0 do {hPI3K'=0, k'=k+1} goto loc_111111011;
--when hP53=dnP531 do {hP53'=0, k'=k+1} goto loc_111001011;
when hOGT=dpOGT0 do {hOGT'=0, k'=k+1} goto loc_111011111;
--when hOGA=dnOGA1 do {hOGA'=0, k'=k+1} goto loc_111011001;
when hCMYC=dnCMYC1 do {hCMYC'=0, k'=k+1} goto loc_111011010;

-- for the configuration 1,1,1,0,1,1,1,0,0
loc loc_111011100: while hNFKB >=  dnNFKB1 & hFOXM >=  dnFOXM1 & hPI3K <=  dpPI3K0 & hOGT >=  dnOGT1 & hCMYC <=  dpCMYC0  wait {dhNFKB=1,dhP21=-1,dhFOXM=1,dhPI3K=1,dhP53=-1,dhMDM2=0,dhOGT=1,dhOGA=1,dhCMYC=1}
when hNFKB=dnNFKB1 do {hNFKB'=0, k'=k+1} goto loc_011011100;
--when hP21=dnP211 do {hP21'=0, k'=k+1} goto loc_101011100;
when hFOXM=dnFOXM1 do {hFOXM'=0, k'=k+1} goto loc_110011100;
when hPI3K=dpPI3K0 do {hPI3K'=0, k'=k+1} goto loc_111111100;
--when hP53=dnP531 do {hP53'=0, k'=k+1} goto loc_111001100;
when hOGT=dnOGT1 do {hOGT'=0, k'=k+1} goto loc_111011000;
--when hOGA=dpOGA0 do {hOGA'=0, k'=k+1} goto loc_111011110;
when hCMYC=dpCMYC0 do {hCMYC'=0, k'=k+1} goto loc_111011101;

-- for the configuration 1,1,1,0,1,1,1,0,1
loc loc_111011101: while hNFKB >=  dnNFKB1 & hFOXM >=  dnFOXM1 & hPI3K <=  dpPI3K0  wait {dhNFKB=1,dhP21=-1,dhFOXM=1,dhPI3K=1,dhP53=-1,dhMDM2=0,dhOGT=0,dhOGA=0,dhCMYC=0}
when hNFKB=dnNFKB1 do {hNFKB'=0, k'=k+1} goto loc_011011101;
--when hP21=dnP211 do {hP21'=0, k'=k+1} goto loc_101011101;
when hFOXM=dnFOXM1 do {hFOXM'=0, k'=k+1} goto loc_110011101;
when hPI3K=dpPI3K0 do {hPI3K'=0, k'=k+1} goto loc_111111101;
--when hP53=dnP531 do {hP53'=0, k'=k+1} goto loc_111001101;

-- for the configuration 1,1,1,0,1,1,1,1,0
loc loc_111011110: while hNFKB >=  dnNFKB1 & hFOXM >=  dnFOXM1 & hPI3K <=  dpPI3K0 & hOGT >=  dnOGT1 & hOGA >=  dnOGA1 & hCMYC <=  dpCMYC0  wait {dhNFKB=1,dhP21=-1,dhFOXM=1,dhPI3K=1,dhP53=-1,dhMDM2=0,dhOGT=1,dhOGA=1,dhCMYC=1}
when hNFKB=dnNFKB1 do {hNFKB'=0, k'=k+1} goto loc_011011110;
--when hP21=dnP211 do {hP21'=0, k'=k+1} goto loc_101011110;
when hFOXM=dnFOXM1 do {hFOXM'=0, k'=k+1} goto loc_110011110;
when hPI3K=dpPI3K0 do {hPI3K'=0, k'=k+1} goto loc_111111110;
--when hP53=dnP531 do {hP53'=0, k'=k+1} goto loc_111001110;
when hOGT=dnOGT1 do {hOGT'=0, k'=k+1} goto loc_111011010;
when hOGA=dnOGA1 do {hOGA'=0, k'=k+1} goto loc_111011100;
when hCMYC=dpCMYC0 do {hCMYC'=0, k'=k+1} goto loc_111011111;

-- for the configuration 1,1,1,0,1,1,1,1,1
loc loc_111011111: while hNFKB >=  dnNFKB1 & hFOXM >=  dnFOXM1 & hPI3K <=  dpPI3K0 & hOGA >=  dnOGA1  wait {dhNFKB=1,dhP21=-1,dhFOXM=1,dhPI3K=1,dhP53=-1,dhMDM2=0,dhOGT=0,dhOGA=1,dhCMYC=0}
when hNFKB=dnNFKB1 do {hNFKB'=0, k'=k+1} goto loc_011011111;
--when hP21=dnP211 do {hP21'=0, k'=k+1} goto loc_101011111;
when hFOXM=dnFOXM1 do {hFOXM'=0, k'=k+1} goto loc_110011111;
when hPI3K=dpPI3K0 do {hPI3K'=0, k'=k+1} goto loc_111111111;
--when hP53=dnP531 do {hP53'=0, k'=k+1} goto loc_111001111;
when hOGA=dnOGA1 do {hOGA'=0, k'=k+1} goto loc_111011101;

-- for the configuration 1,1,1,1,0,0,0,0,0
loc loc_111100000: while hNFKB >=  dnNFKB1 & hP21 >=  dnP211 & hP53 <=  dpP530 & hOGA <=  dpOGA0  wait {dhNFKB=1,dhP21=1,dhFOXM=0,dhPI3K=-1,dhP53=1,dhMDM2=1,dhOGT=0,dhOGA=1,dhCMYC=0}
when hNFKB=dnNFKB1 do {hNFKB'=0, k'=k+1} goto loc_011100000;
when hP21=dnP211 do {hP21'=0, k'=k+1} goto loc_101100000;
--when hPI3K=dnPI3K1 do {hPI3K'=0, k'=k+1} goto loc_111000000;
when hP53=dpP530 do {hP53'=0, k'=k+1} goto loc_111110000;
--when hMDM2=dpMDM20 do {hMDM2'=0, k'=k+1} goto loc_111101000;
when hOGA=dpOGA0 do {hOGA'=0, k'=k+1} goto loc_111100010;

-- for the configuration 1,1,1,1,0,0,0,0,1
loc loc_111100001: while hNFKB >=  dnNFKB1 & hP21 >=  dnP211 & hP53 <=  dpP530 & hOGT <=  dpOGT0 & hOGA <=  dpOGA0 & hCMYC >=  dnCMYC1  wait {dhNFKB=1,dhP21=1,dhFOXM=0,dhPI3K=-1,dhP53=1,dhMDM2=1,dhOGT=1,dhOGA=1,dhCMYC=1}
when hNFKB=dnNFKB1 do {hNFKB'=0, k'=k+1} goto loc_011100001;
when hP21=dnP211 do {hP21'=0, k'=k+1} goto loc_101100001;
--when hPI3K=dnPI3K1 do {hPI3K'=0, k'=k+1} goto loc_111000001;
when hP53=dpP530 do {hP53'=0, k'=k+1} goto loc_111110001;
--when hMDM2=dpMDM20 do {hMDM2'=0, k'=k+1} goto loc_111101001;
when hOGT=dpOGT0 do {hOGT'=0, k'=k+1} goto loc_111100101;
when hOGA=dpOGA0 do {hOGA'=0, k'=k+1} goto loc_111100011;
when hCMYC=dnCMYC1 do {hCMYC'=0, k'=k+1} goto loc_111100000;

-- for the configuration 1,1,1,1,0,0,0,1,0
loc loc_111100010: while hNFKB >=  dnNFKB1 & hP21 >=  dnP211 & hP53 <=  dpP530  wait {dhNFKB=1,dhP21=1,dhFOXM=0,dhPI3K=-1,dhP53=1,dhMDM2=1,dhOGT=0,dhOGA=0,dhCMYC=0}
when hNFKB=dnNFKB1 do {hNFKB'=0, k'=k+1} goto loc_011100010;
when hP21=dnP211 do {hP21'=0, k'=k+1} goto loc_101100010;
--when hPI3K=dnPI3K1 do {hPI3K'=0, k'=k+1} goto loc_111000010;
when hP53=dpP530 do {hP53'=0, k'=k+1} goto loc_111110010;
--when hMDM2=dpMDM20 do {hMDM2'=0, k'=k+1} goto loc_111101010;

-- for the configuration 1,1,1,1,0,0,0,1,1
loc loc_111100011: while hNFKB >=  dnNFKB1 & hP21 >=  dnP211 & hP53 <=  dpP530 & hOGT <=  dpOGT0 & hCMYC >=  dnCMYC1  wait {dhNFKB=1,dhP21=1,dhFOXM=0,dhPI3K=-1,dhP53=1,dhMDM2=1,dhOGT=1,dhOGA=-1,dhCMYC=1}
when hNFKB=dnNFKB1 do {hNFKB'=0, k'=k+1} goto loc_011100011;
when hP21=dnP211 do {hP21'=0, k'=k+1} goto loc_101100011;
--when hPI3K=dnPI3K1 do {hPI3K'=0, k'=k+1} goto loc_111000011;
when hP53=dpP530 do {hP53'=0, k'=k+1} goto loc_111110011;
--when hMDM2=dpMDM20 do {hMDM2'=0, k'=k+1} goto loc_111101011;
when hOGT=dpOGT0 do {hOGT'=0, k'=k+1} goto loc_111100111;
--when hOGA=dnOGA1 do {hOGA'=0, k'=k+1} goto loc_111100001;
when hCMYC=dnCMYC1 do {hCMYC'=0, k'=k+1} goto loc_111100010;

-- for the configuration 1,1,1,1,0,0,1,0,0
loc loc_111100100: while hNFKB >=  dnNFKB1 & hP21 >=  dnP211 & hP53 <=  dpP530 & hOGT >=  dnOGT1  wait {dhNFKB=1,dhP21=1,dhFOXM=0,dhPI3K=0,dhP53=1,dhMDM2=1,dhOGT=1,dhOGA=1,dhCMYC=1}
when hNFKB=dnNFKB1 do {hNFKB'=0, k'=k+1} goto loc_011100100;
when hP21=dnP211 do {hP21'=0, k'=k+1} goto loc_101100100;
when hP53=dpP530 do {hP53'=0, k'=k+1} goto loc_111110100;
--when hMDM2=dpMDM20 do {hMDM2'=0, k'=k+1} goto loc_111101100;
when hOGT=dnOGT1 do {hOGT'=0, k'=k+1} goto loc_111100000;
--when hOGA=dpOGA0 do {hOGA'=0, k'=k+1} goto loc_111100110;
--when hCMYC=dpCMYC0 do {hCMYC'=0, k'=k+1} goto loc_111100101;

-- for the configuration 1,1,1,1,0,0,1,0,1
loc loc_111100101: while hNFKB >=  dnNFKB1 & hP21 >=  dnP211 & hP53 <=  dpP530  wait {dhNFKB=1,dhP21=1,dhFOXM=0,dhPI3K=0,dhP53=1,dhMDM2=1,dhOGT=0,dhOGA=0,dhCMYC=0}
when hNFKB=dnNFKB1 do {hNFKB'=0, k'=k+1} goto loc_011100101;
when hP21=dnP211 do {hP21'=0, k'=k+1} goto loc_101100101;
when hP53=dpP530 do {hP53'=0, k'=k+1} goto loc_111110101;
--when hMDM2=dpMDM20 do {hMDM2'=0, k'=k+1} goto loc_111101101;

-- for the configuration 1,1,1,1,0,0,1,1,0
loc loc_111100110: while hNFKB >=  dnNFKB1 & hP21 >=  dnP211 & hP53 <=  dpP530 & hOGT >=  dnOGT1 & hOGA >=  dnOGA1  wait {dhNFKB=1,dhP21=1,dhFOXM=0,dhPI3K=0,dhP53=1,dhMDM2=1,dhOGT=1,dhOGA=1,dhCMYC=1}
when hNFKB=dnNFKB1 do {hNFKB'=0, k'=k+1} goto loc_011100110;
when hP21=dnP211 do {hP21'=0, k'=k+1} goto loc_101100110;
when hP53=dpP530 do {hP53'=0, k'=k+1} goto loc_111110110;
--when hMDM2=dpMDM20 do {hMDM2'=0, k'=k+1} goto loc_111101110;
when hOGT=dnOGT1 do {hOGT'=0, k'=k+1} goto loc_111100010;
when hOGA=dnOGA1 do {hOGA'=0, k'=k+1} goto loc_111100100;
--when hCMYC=dpCMYC0 do {hCMYC'=0, k'=k+1} goto loc_111100111;

-- for the configuration 1,1,1,1,0,0,1,1,1
loc loc_111100111: while hNFKB >=  dnNFKB1 & hP21 >=  dnP211 & hP53 <=  dpP530 & hOGA >=  dnOGA1  wait {dhNFKB=1,dhP21=1,dhFOXM=0,dhPI3K=0,dhP53=1,dhMDM2=1,dhOGT=0,dhOGA=1,dhCMYC=0}
when hNFKB=dnNFKB1 do {hNFKB'=0, k'=k+1} goto loc_011100111;
when hP21=dnP211 do {hP21'=0, k'=k+1} goto loc_101100111;
when hP53=dpP530 do {hP53'=0, k'=k+1} goto loc_111110111;
--when hMDM2=dpMDM20 do {hMDM2'=0, k'=k+1} goto loc_111101111;
when hOGA=dnOGA1 do {hOGA'=0, k'=k+1} goto loc_111100101;

-- for the configuration 1,1,1,1,0,1,0,0,0
loc loc_111101000: while hNFKB >=  dnNFKB1 & hP21 >=  dnP211 & hP53 <=  dpP530 & hMDM2 >=  dnMDM21 & hOGA <=  dpOGA0  wait {dhNFKB=1,dhP21=1,dhFOXM=0,dhPI3K=-1,dhP53=1,dhMDM2=1,dhOGT=0,dhOGA=1,dhCMYC=0}
when hNFKB=dnNFKB1 do {hNFKB'=0, k'=k+1} goto loc_011101000;
when hP21=dnP211 do {hP21'=0, k'=k+1} goto loc_101101000;
--when hPI3K=dnPI3K1 do {hPI3K'=0, k'=k+1} goto loc_111001000;
when hP53=dpP530 do {hP53'=0, k'=k+1} goto loc_111111000;
when hMDM2=dnMDM21 do {hMDM2'=0, k'=k+1} goto loc_111100000;
when hOGA=dpOGA0 do {hOGA'=0, k'=k+1} goto loc_111101010;

-- for the configuration 1,1,1,1,0,1,0,0,1
loc loc_111101001: while hNFKB >=  dnNFKB1 & hP21 >=  dnP211 & hP53 <=  dpP530 & hMDM2 >=  dnMDM21 & hOGT <=  dpOGT0 & hOGA <=  dpOGA0 & hCMYC >=  dnCMYC1  wait {dhNFKB=1,dhP21=1,dhFOXM=0,dhPI3K=-1,dhP53=1,dhMDM2=1,dhOGT=1,dhOGA=1,dhCMYC=1}
when hNFKB=dnNFKB1 do {hNFKB'=0, k'=k+1} goto loc_011101001;
when hP21=dnP211 do {hP21'=0, k'=k+1} goto loc_101101001;
--when hPI3K=dnPI3K1 do {hPI3K'=0, k'=k+1} goto loc_111001001;
when hP53=dpP530 do {hP53'=0, k'=k+1} goto loc_111111001;
when hMDM2=dnMDM21 do {hMDM2'=0, k'=k+1} goto loc_111100001;
when hOGT=dpOGT0 do {hOGT'=0, k'=k+1} goto loc_111101101;
when hOGA=dpOGA0 do {hOGA'=0, k'=k+1} goto loc_111101011;
when hCMYC=dnCMYC1 do {hCMYC'=0, k'=k+1} goto loc_111101000;

-- for the configuration 1,1,1,1,0,1,0,1,0
loc loc_111101010: while hNFKB >=  dnNFKB1 & hP21 >=  dnP211 & hP53 <=  dpP530 & hMDM2 >=  dnMDM21  wait {dhNFKB=1,dhP21=1,dhFOXM=0,dhPI3K=-1,dhP53=1,dhMDM2=1,dhOGT=0,dhOGA=0,dhCMYC=0}
when hNFKB=dnNFKB1 do {hNFKB'=0, k'=k+1} goto loc_011101010;
when hP21=dnP211 do {hP21'=0, k'=k+1} goto loc_101101010;
--when hPI3K=dnPI3K1 do {hPI3K'=0, k'=k+1} goto loc_111001010;
when hP53=dpP530 do {hP53'=0, k'=k+1} goto loc_111111010;
when hMDM2=dnMDM21 do {hMDM2'=0, k'=k+1} goto loc_111100010;

-- for the configuration 1,1,1,1,0,1,0,1,1
loc loc_111101011: while hNFKB >=  dnNFKB1 & hP21 >=  dnP211 & hP53 <=  dpP530 & hMDM2 >=  dnMDM21 & hOGT <=  dpOGT0 & hCMYC >=  dnCMYC1  wait {dhNFKB=1,dhP21=1,dhFOXM=0,dhPI3K=-1,dhP53=1,dhMDM2=1,dhOGT=1,dhOGA=-1,dhCMYC=1}
when hNFKB=dnNFKB1 do {hNFKB'=0, k'=k+1} goto loc_011101011;
when hP21=dnP211 do {hP21'=0, k'=k+1} goto loc_101101011;
--when hPI3K=dnPI3K1 do {hPI3K'=0, k'=k+1} goto loc_111001011;
when hP53=dpP530 do {hP53'=0, k'=k+1} goto loc_111111011;
when hMDM2=dnMDM21 do {hMDM2'=0, k'=k+1} goto loc_111100011;
when hOGT=dpOGT0 do {hOGT'=0, k'=k+1} goto loc_111101111;
--when hOGA=dnOGA1 do {hOGA'=0, k'=k+1} goto loc_111101001;
when hCMYC=dnCMYC1 do {hCMYC'=0, k'=k+1} goto loc_111101010;

-- for the configuration 1,1,1,1,0,1,1,0,0
loc loc_111101100: while hNFKB >=  dnNFKB1 & hP21 >=  dnP211 & hP53 <=  dpP530 & hMDM2 >=  dnMDM21 & hOGT >=  dnOGT1  wait {dhNFKB=1,dhP21=1,dhFOXM=0,dhPI3K=0,dhP53=1,dhMDM2=1,dhOGT=1,dhOGA=1,dhCMYC=1}
when hNFKB=dnNFKB1 do {hNFKB'=0, k'=k+1} goto loc_011101100;
when hP21=dnP211 do {hP21'=0, k'=k+1} goto loc_101101100;
when hP53=dpP530 do {hP53'=0, k'=k+1} goto loc_111111100;
when hMDM2=dnMDM21 do {hMDM2'=0, k'=k+1} goto loc_111100100;
when hOGT=dnOGT1 do {hOGT'=0, k'=k+1} goto loc_111101000;
--when hOGA=dpOGA0 do {hOGA'=0, k'=k+1} goto loc_111101110;
--when hCMYC=dpCMYC0 do {hCMYC'=0, k'=k+1} goto loc_111101101;

-- for the configuration 1,1,1,1,0,1,1,0,1
loc loc_111101101: while hNFKB >=  dnNFKB1 & hP21 >=  dnP211 & hP53 <=  dpP530 & hMDM2 >=  dnMDM21  wait {dhNFKB=1,dhP21=1,dhFOXM=0,dhPI3K=0,dhP53=1,dhMDM2=1,dhOGT=0,dhOGA=0,dhCMYC=0}
when hNFKB=dnNFKB1 do {hNFKB'=0, k'=k+1} goto loc_011101101;
when hP21=dnP211 do {hP21'=0, k'=k+1} goto loc_101101101;
when hP53=dpP530 do {hP53'=0, k'=k+1} goto loc_111111101;
when hMDM2=dnMDM21 do {hMDM2'=0, k'=k+1} goto loc_111100101;

-- for the configuration 1,1,1,1,0,1,1,1,0
loc loc_111101110: while hNFKB >=  dnNFKB1 & hP21 >=  dnP211 & hP53 <=  dpP530 & hMDM2 >=  dnMDM21 & hOGT >=  dnOGT1 & hOGA >=  dnOGA1  wait {dhNFKB=1,dhP21=1,dhFOXM=0,dhPI3K=0,dhP53=1,dhMDM2=1,dhOGT=1,dhOGA=1,dhCMYC=1}
when hNFKB=dnNFKB1 do {hNFKB'=0, k'=k+1} goto loc_011101110;
when hP21=dnP211 do {hP21'=0, k'=k+1} goto loc_101101110;
when hP53=dpP530 do {hP53'=0, k'=k+1} goto loc_111111110;
when hMDM2=dnMDM21 do {hMDM2'=0, k'=k+1} goto loc_111100110;
when hOGT=dnOGT1 do {hOGT'=0, k'=k+1} goto loc_111101010;
when hOGA=dnOGA1 do {hOGA'=0, k'=k+1} goto loc_111101100;
--when hCMYC=dpCMYC0 do {hCMYC'=0, k'=k+1} goto loc_111101111;

-- for the configuration 1,1,1,1,0,1,1,1,1
loc loc_111101111: while hNFKB >=  dnNFKB1 & hP21 >=  dnP211 & hP53 <=  dpP530 & hMDM2 >=  dnMDM21 & hOGA >=  dnOGA1  wait {dhNFKB=1,dhP21=1,dhFOXM=0,dhPI3K=0,dhP53=1,dhMDM2=1,dhOGT=0,dhOGA=1,dhCMYC=0}
when hNFKB=dnNFKB1 do {hNFKB'=0, k'=k+1} goto loc_011101111;
when hP21=dnP211 do {hP21'=0, k'=k+1} goto loc_101101111;
when hP53=dpP530 do {hP53'=0, k'=k+1} goto loc_111111111;
when hMDM2=dnMDM21 do {hMDM2'=0, k'=k+1} goto loc_111100111;
when hOGA=dnOGA1 do {hOGA'=0, k'=k+1} goto loc_111101101;

-- for the configuration 1,1,1,1,1,0,0,0,0
loc loc_111110000: while hNFKB >=  dnNFKB1 & hP21 >=  dnP211 & hPI3K >=  dnPI3K1 & hMDM2 <=  dpMDM20 & hOGA <=  dpOGA0  wait {dhNFKB=1,dhP21=1,dhFOXM=-1,dhPI3K=1,dhP53=0,dhMDM2=1,dhOGT=0,dhOGA=1,dhCMYC=0}
when hNFKB=dnNFKB1 do {hNFKB'=0, k'=k+1} goto loc_011110000;
when hP21=dnP211 do {hP21'=0, k'=k+1} goto loc_101110000;
--when hFOXM=dnFOXM1 do {hFOXM'=0, k'=k+1} goto loc_110110000;
when hPI3K=dnPI3K1 do {hPI3K'=0, k'=k+1} goto loc_111010000;
when hMDM2=dpMDM20 do {hMDM2'=0, k'=k+1} goto loc_111111000;
when hOGA=dpOGA0 do {hOGA'=0, k'=k+1} goto loc_111110010;

-- for the configuration 1,1,1,1,1,0,0,0,1
loc loc_111110001: while hNFKB >=  dnNFKB1 & hP21 >=  dnP211 & hPI3K >=  dnPI3K1 & hMDM2 <=  dpMDM20 & hOGT <=  dpOGT0 & hOGA <=  dpOGA0 & hCMYC >=  dnCMYC1  wait {dhNFKB=1,dhP21=1,dhFOXM=-1,dhPI3K=1,dhP53=0,dhMDM2=1,dhOGT=1,dhOGA=1,dhCMYC=1}
when hNFKB=dnNFKB1 do {hNFKB'=0, k'=k+1} goto loc_011110001;
when hP21=dnP211 do {hP21'=0, k'=k+1} goto loc_101110001;
--when hFOXM=dnFOXM1 do {hFOXM'=0, k'=k+1} goto loc_110110001;
when hPI3K=dnPI3K1 do {hPI3K'=0, k'=k+1} goto loc_111010001;
when hMDM2=dpMDM20 do {hMDM2'=0, k'=k+1} goto loc_111111001;
when hOGT=dpOGT0 do {hOGT'=0, k'=k+1} goto loc_111110101;
when hOGA=dpOGA0 do {hOGA'=0, k'=k+1} goto loc_111110011;
when hCMYC=dnCMYC1 do {hCMYC'=0, k'=k+1} goto loc_111110000;

-- for the configuration 1,1,1,1,1,0,0,1,0
loc loc_111110010: while hNFKB >=  dnNFKB1 & hP21 >=  dnP211 & hPI3K >=  dnPI3K1 & hMDM2 <=  dpMDM20  wait {dhNFKB=1,dhP21=1,dhFOXM=-1,dhPI3K=1,dhP53=0,dhMDM2=1,dhOGT=0,dhOGA=0,dhCMYC=0}
when hNFKB=dnNFKB1 do {hNFKB'=0, k'=k+1} goto loc_011110010;
when hP21=dnP211 do {hP21'=0, k'=k+1} goto loc_101110010;
--when hFOXM=dnFOXM1 do {hFOXM'=0, k'=k+1} goto loc_110110010;
when hPI3K=dnPI3K1 do {hPI3K'=0, k'=k+1} goto loc_111010010;
when hMDM2=dpMDM20 do {hMDM2'=0, k'=k+1} goto loc_111111010;

-- for the configuration 1,1,1,1,1,0,0,1,1
loc loc_111110011: while hNFKB >=  dnNFKB1 & hP21 >=  dnP211 & hPI3K >=  dnPI3K1 & hMDM2 <=  dpMDM20 & hOGT <=  dpOGT0 & hCMYC >=  dnCMYC1  wait {dhNFKB=1,dhP21=1,dhFOXM=-1,dhPI3K=1,dhP53=0,dhMDM2=1,dhOGT=1,dhOGA=-1,dhCMYC=1}
when hNFKB=dnNFKB1 do {hNFKB'=0, k'=k+1} goto loc_011110011;
when hP21=dnP211 do {hP21'=0, k'=k+1} goto loc_101110011;
--when hFOXM=dnFOXM1 do {hFOXM'=0, k'=k+1} goto loc_110110011;
when hPI3K=dnPI3K1 do {hPI3K'=0, k'=k+1} goto loc_111010011;
when hMDM2=dpMDM20 do {hMDM2'=0, k'=k+1} goto loc_111111011;
when hOGT=dpOGT0 do {hOGT'=0, k'=k+1} goto loc_111110111;
--when hOGA=dnOGA1 do {hOGA'=0, k'=k+1} goto loc_111110001;
when hCMYC=dnCMYC1 do {hCMYC'=0, k'=k+1} goto loc_111110010;

-- for the configuration 1,1,1,1,1,0,1,0,0
loc loc_111110100: while hNFKB >=  dnNFKB1 & hP21 >=  dnP211 & hMDM2 <=  dpMDM20 & hOGT >=  dnOGT1 & hCMYC <=  dpCMYC0  wait {dhNFKB=1,dhP21=1,dhFOXM=0,dhPI3K=-1,dhP53=0,dhMDM2=1,dhOGT=1,dhOGA=1,dhCMYC=1}
when hNFKB=dnNFKB1 do {hNFKB'=0, k'=k+1} goto loc_011110100;
when hP21=dnP211 do {hP21'=0, k'=k+1} goto loc_101110100;
--when hPI3K=dnPI3K1 do {hPI3K'=0, k'=k+1} goto loc_111010100;
when hMDM2=dpMDM20 do {hMDM2'=0, k'=k+1} goto loc_111111100;
when hOGT=dnOGT1 do {hOGT'=0, k'=k+1} goto loc_111110000;
--when hOGA=dpOGA0 do {hOGA'=0, k'=k+1} goto loc_111110110;
when hCMYC=dpCMYC0 do {hCMYC'=0, k'=k+1} goto loc_111110101;

-- for the configuration 1,1,1,1,1,0,1,0,1
loc loc_111110101: while hNFKB >=  dnNFKB1 & hP21 >=  dnP211 & hMDM2 <=  dpMDM20  wait {dhNFKB=1,dhP21=1,dhFOXM=0,dhPI3K=0,dhP53=0,dhMDM2=1,dhOGT=0,dhOGA=0,dhCMYC=0}
when hNFKB=dnNFKB1 do {hNFKB'=0, k'=k+1} goto loc_011110101;
when hP21=dnP211 do {hP21'=0, k'=k+1} goto loc_101110101;
when hMDM2=dpMDM20 do {hMDM2'=0, k'=k+1} goto loc_111111101;

-- for the configuration 1,1,1,1,1,0,1,1,0
loc loc_111110110: while hNFKB >=  dnNFKB1 & hP21 >=  dnP211 & hMDM2 <=  dpMDM20 & hOGT >=  dnOGT1 & hOGA >=  dnOGA1 & hCMYC <=  dpCMYC0  wait {dhNFKB=1,dhP21=1,dhFOXM=0,dhPI3K=-1,dhP53=0,dhMDM2=1,dhOGT=1,dhOGA=1,dhCMYC=1}
when hNFKB=dnNFKB1 do {hNFKB'=0, k'=k+1} goto loc_011110110;
when hP21=dnP211 do {hP21'=0, k'=k+1} goto loc_101110110;
--when hPI3K=dnPI3K1 do {hPI3K'=0, k'=k+1} goto loc_111010110;
when hMDM2=dpMDM20 do {hMDM2'=0, k'=k+1} goto loc_111111110;
when hOGT=dnOGT1 do {hOGT'=0, k'=k+1} goto loc_111110010;
when hOGA=dnOGA1 do {hOGA'=0, k'=k+1} goto loc_111110100;
when hCMYC=dpCMYC0 do {hCMYC'=0, k'=k+1} goto loc_111110111;

-- for the configuration 1,1,1,1,1,0,1,1,1
loc loc_111110111: while hNFKB >=  dnNFKB1 & hP21 >=  dnP211 & hMDM2 <=  dpMDM20 & hOGA >=  dnOGA1  wait {dhNFKB=1,dhP21=1,dhFOXM=0,dhPI3K=0,dhP53=0,dhMDM2=1,dhOGT=0,dhOGA=1,dhCMYC=0}
when hNFKB=dnNFKB1 do {hNFKB'=0, k'=k+1} goto loc_011110111;
when hP21=dnP211 do {hP21'=0, k'=k+1} goto loc_101110111;
when hMDM2=dpMDM20 do {hMDM2'=0, k'=k+1} goto loc_111111111;
when hOGA=dnOGA1 do {hOGA'=0, k'=k+1} goto loc_111110101;

-- for the configuration 1,1,1,1,1,1,0,0,0
loc loc_111111000: while hNFKB >=  dnNFKB1 & hP21 >=  dnP211 & hPI3K >=  dnPI3K1 & hOGA <=  dpOGA0  wait {dhNFKB=1,dhP21=1,dhFOXM=-1,dhPI3K=1,dhP53=-1,dhMDM2=0,dhOGT=0,dhOGA=1,dhCMYC=0}
when hNFKB=dnNFKB1 do {hNFKB'=0, k'=k+1} goto loc_011111000;
when hP21=dnP211 do {hP21'=0, k'=k+1} goto loc_101111000;
--when hFOXM=dnFOXM1 do {hFOXM'=0, k'=k+1} goto loc_110111000;
when hPI3K=dnPI3K1 do {hPI3K'=0, k'=k+1} goto loc_111011000;
--when hP53=dnP531 do {hP53'=0, k'=k+1} goto loc_111101000;
when hOGA=dpOGA0 do {hOGA'=0, k'=k+1} goto loc_111111010;

-- for the configuration 1,1,1,1,1,1,0,0,1
loc loc_111111001: while hNFKB >=  dnNFKB1 & hP21 >=  dnP211 & hPI3K >=  dnPI3K1 & hOGT <=  dpOGT0 & hOGA <=  dpOGA0 & hCMYC >=  dnCMYC1  wait {dhNFKB=1,dhP21=1,dhFOXM=-1,dhPI3K=1,dhP53=-1,dhMDM2=0,dhOGT=1,dhOGA=1,dhCMYC=1}
when hNFKB=dnNFKB1 do {hNFKB'=0, k'=k+1} goto loc_011111001;
when hP21=dnP211 do {hP21'=0, k'=k+1} goto loc_101111001;
--when hFOXM=dnFOXM1 do {hFOXM'=0, k'=k+1} goto loc_110111001;
when hPI3K=dnPI3K1 do {hPI3K'=0, k'=k+1} goto loc_111011001;
--when hP53=dnP531 do {hP53'=0, k'=k+1} goto loc_111101001;
when hOGT=dpOGT0 do {hOGT'=0, k'=k+1} goto loc_111111101;
when hOGA=dpOGA0 do {hOGA'=0, k'=k+1} goto loc_111111011;
when hCMYC=dnCMYC1 do {hCMYC'=0, k'=k+1} goto loc_111111000;

-- for the configuration 1,1,1,1,1,1,0,1,0
loc loc_111111010: while hNFKB >=  dnNFKB1 & hP21 >=  dnP211 & hPI3K >=  dnPI3K1  wait {dhNFKB=1,dhP21=1,dhFOXM=-1,dhPI3K=1,dhP53=-1,dhMDM2=0,dhOGT=0,dhOGA=0,dhCMYC=0}
when hNFKB=dnNFKB1 do {hNFKB'=0, k'=k+1} goto loc_011111010;
when hP21=dnP211 do {hP21'=0, k'=k+1} goto loc_101111010;
--when hFOXM=dnFOXM1 do {hFOXM'=0, k'=k+1} goto loc_110111010;
when hPI3K=dnPI3K1 do {hPI3K'=0, k'=k+1} goto loc_111011010;
--when hP53=dnP531 do {hP53'=0, k'=k+1} goto loc_111101010;

-- for the configuration 1,1,1,1,1,1,0,1,1
loc loc_111111011: while hNFKB >=  dnNFKB1 & hP21 >=  dnP211 & hPI3K >=  dnPI3K1 & hOGT <=  dpOGT0 & hCMYC >=  dnCMYC1  wait {dhNFKB=1,dhP21=1,dhFOXM=-1,dhPI3K=1,dhP53=-1,dhMDM2=0,dhOGT=1,dhOGA=-1,dhCMYC=1}
when hNFKB=dnNFKB1 do {hNFKB'=0, k'=k+1} goto loc_011111011;
when hP21=dnP211 do {hP21'=0, k'=k+1} goto loc_101111011;
--when hFOXM=dnFOXM1 do {hFOXM'=0, k'=k+1} goto loc_110111011;
when hPI3K=dnPI3K1 do {hPI3K'=0, k'=k+1} goto loc_111011011;
--when hP53=dnP531 do {hP53'=0, k'=k+1} goto loc_111101011;
when hOGT=dpOGT0 do {hOGT'=0, k'=k+1} goto loc_111111111;
--when hOGA=dnOGA1 do {hOGA'=0, k'=k+1} goto loc_111111001;
when hCMYC=dnCMYC1 do {hCMYC'=0, k'=k+1} goto loc_111111010;

-- for the configuration 1,1,1,1,1,1,1,0,0
loc loc_111111100: while hNFKB >=  dnNFKB1 & hP21 >=  dnP211 & hOGT >=  dnOGT1 & hCMYC <=  dpCMYC0  wait {dhNFKB=1,dhP21=1,dhFOXM=0,dhPI3K=-1,dhP53=-1,dhMDM2=0,dhOGT=1,dhOGA=1,dhCMYC=1}
when hNFKB=dnNFKB1 do {hNFKB'=0, k'=k+1} goto loc_011111100;
when hP21=dnP211 do {hP21'=0, k'=k+1} goto loc_101111100;
--when hPI3K=dnPI3K1 do {hPI3K'=0, k'=k+1} goto loc_111011100;
--when hP53=dnP531 do {hP53'=0, k'=k+1} goto loc_111101100;
when hOGT=dnOGT1 do {hOGT'=0, k'=k+1} goto loc_111111000;
--when hOGA=dpOGA0 do {hOGA'=0, k'=k+1} goto loc_111111110;
when hCMYC=dpCMYC0 do {hCMYC'=0, k'=k+1} goto loc_111111101;

-- for the configuration 1,1,1,1,1,1,1,0,1
loc loc_111111101: while hNFKB >=  dnNFKB1 & hP21 >=  dnP211  wait {dhNFKB=1,dhP21=1,dhFOXM=0,dhPI3K=0,dhP53=-1,dhMDM2=0,dhOGT=0,dhOGA=0,dhCMYC=0}
when hNFKB=dnNFKB1 do {hNFKB'=0, k'=k+1} goto loc_011111101;
when hP21=dnP211 do {hP21'=0, k'=k+1} goto loc_101111101;
--when hP53=dnP531 do {hP53'=0, k'=k+1} goto loc_111101101;

-- for the configuration 1,1,1,1,1,1,1,1,0
loc loc_111111110: while hNFKB >=  dnNFKB1 & hP21 >=  dnP211 & hOGT >=  dnOGT1 & hOGA >=  dnOGA1 & hCMYC <=  dpCMYC0  wait {dhNFKB=1,dhP21=1,dhFOXM=0,dhPI3K=-1,dhP53=-1,dhMDM2=0,dhOGT=1,dhOGA=1,dhCMYC=1}
when hNFKB=dnNFKB1 do {hNFKB'=0, k'=k+1} goto loc_011111110;
when hP21=dnP211 do {hP21'=0, k'=k+1} goto loc_101111110;
--when hPI3K=dnPI3K1 do {hPI3K'=0, k'=k+1} goto loc_111011110;
--when hP53=dnP531 do {hP53'=0, k'=k+1} goto loc_111101110;
when hOGT=dnOGT1 do {hOGT'=0, k'=k+1} goto loc_111111010;
when hOGA=dnOGA1 do {hOGA'=0, k'=k+1} goto loc_111111100;
when hCMYC=dpCMYC0 do {hCMYC'=0, k'=k+1} goto loc_111111111;

-- for the configuration 1,1,1,1,1,1,1,1,1
loc loc_111111111: while hNFKB >=  dnNFKB1 & hP21 >=  dnP211 & hOGA >=  dnOGA1  wait {dhNFKB=1,dhP21=1,dhFOXM=0,dhPI3K=0,dhP53=-1,dhMDM2=0,dhOGT=0,dhOGA=1,dhCMYC=0}
when hNFKB=dnNFKB1 do {hNFKB'=0, k'=k+1} goto loc_011111111;
when hP21=dnP211 do {hP21'=0, k'=k+1} goto loc_101111111;
--when hP53=dnP531 do {hP53'=0, k'=k+1} goto loc_111101111;
when hOGA=dnOGA1 do {hOGA'=0, k'=k+1} goto loc_111111101;

end

-- Remove the comment symbol from the following codes for finding invariance kernel
-- Assign the initial location and the initial values of clocks to the initial region r_ini
var
init_reg, acces, r_old, r_new, r_acc, r_ini : region;
r_ini:= loc[auto] = loc_  & ;  --complete this line
r_new:=hide k,n in hull (post(r_ini & k=n) & ~k=n) endhide;
r_old:=r_ini & ~r_ini;
while not empty(r_new) and empty(r_new & r_ini) do
r_old:=r_new;
r_new:=hide k,n in hull(post(r_new & k=n) & ~k=n) endhide;
endwhile;
-- To verify that the initial zone is accessible from itself
if not empty (r_new & r_ini) then
---- if accessible
r_acc:=hide k,n in hull(post(r_new & k=n) &~k=n) endhide; 
r_old:=r_ini & ~r_ini; --empty region initialization
while not empty(r_acc) and not r_new<=r_old do 
r_old:=r_new; 
while not empty(r_acc) and empty(r_acc & r_ini) do 
r_acc:= hide k,n in hull(post(r_acc & k=n) &~k=n) endhide; 
endwhile; 
r_acc:=hull(r_acc & r_ini); 
r_new:=hull(r_acc & r_new); 
r_acc:=hide k,n in hull(post(r_new & k=n) & ~k=n) endhide; 
endwhile; 
if not empty(r_new) then 
 prints "============================================================"; 
 prints " Delay constraintes: ";
 print  hide hNFKB,hP21,hFOXM,hPI3K,hP53,hMDM2,hOGT,hOGA,hCMYC in r_new endhide; 
 prints "============================================================"; 
else 
 prints "Invariance kernel does not exist from the initial region "; 
endif; 
else 
prints " The initial region is not accessible from itself hence " ; 
 prints " there is no initial condition that leads to an invariance kernel."; 
endif; 
