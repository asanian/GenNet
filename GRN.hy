--Hybrid Model:
--===========
-- File GRN
-- Path Constraints 

-- gene No0 = NFKB-- gene No1 = P21-- gene No2 = FOXM-- gene No3 = PI3K-- gene No4 = P53-- gene No5 = MDM2-- gene No6 = OGT-- gene No7 = OGA-- gene No8 = CMYC
var

dpP210,dpP530,dpMDM20,dpOGA0,dnMDM21,dnP531: parameter;

hNFKB,hP21,hFOXM,hPI3K,hP53,hMDM2,hOGT,hOGA,hCMYC :analog;
k,n: discrete;
automaton auto
synclabs: ;
initially loc_000000000;
-- for the configuration 0,0,0,0,0,0,0,0,0
loc loc_000000000: while hP21 <=  dpP210 & hP53 <=  dpP530 & hOGA <=  dpOGA0  wait {dhNFKB=0,dhP21=1,dhFOXM=0,dhPI3K=0,dhP53=1,dhMDM2=1,dhOGT=0,dhOGA=1,dhCMYC=0}
--when hP21=dpP210 do {hP21'=0, k'=k+1} goto loc_010000000;
when hP53=dpP530 do {hP53'=0, k'=k+1} goto loc_000010000;
--when hMDM2=dpMDM20 do {hMDM2'=0, k'=k+1} goto loc_000001000;
--when hOGA=dpOGA0 do {hOGA'=0, k'=k+1} goto loc_000000010;

-- for the configuration 0,0,0,0,0,1,0,0,0
loc loc_000001000: while hP21 <=  dpP210 & hMDM2 >=  dnMDM21 & hOGA <=  dpOGA0  wait {dhNFKB=0,dhP21=1,dhFOXM=0,dhPI3K=0,dhP53=1,dhMDM2=1,dhOGT=0,dhOGA=1,dhCMYC=0}
--when hP21=dpP210 do {hP21'=0, k'=k+1} goto loc_010001000;
--when hP53=dpP530 do {hP53'=0, k'=k+1} goto loc_000011000;
when hMDM2=dnMDM21 do {hMDM2'=0, k'=k+1} goto loc_000000000;
--when hOGA=dpOGA0 do {hOGA'=0, k'=k+1} goto loc_000001010;

-- for the configuration 0,0,0,0,1,0,0,0,0
loc loc_000010000: while hP21 <=  dpP210 & hMDM2 <=  dpMDM20 & hOGA <=  dpOGA0  wait {dhNFKB=0,dhP21=1,dhFOXM=0,dhPI3K=0,dhP53=-1,dhMDM2=1,dhOGT=0,dhOGA=1,dhCMYC=0}
--when hP21=dpP210 do {hP21'=0, k'=k+1} goto loc_010010000;
--when hP53=dnP531 do {hP53'=0, k'=k+1} goto loc_000000000;
when hMDM2=dpMDM20 do {hMDM2'=0, k'=k+1} goto loc_000011000;
--when hOGA=dpOGA0 do {hOGA'=0, k'=k+1} goto loc_000010010;

-- for the configuration 0,0,0,0,1,1,0,0,0
loc loc_000011000: while hP21 <=  dpP210 & hP53 >=  dnP531 & hOGA <=  dpOGA0  wait {dhNFKB=0,dhP21=1,dhFOXM=0,dhPI3K=0,dhP53=1,dhMDM2=-1,dhOGT=0,dhOGA=1,dhCMYC=0}
--when hP21=dpP210 do {hP21'=0, k'=k+1} goto loc_010011000;
when hP53=dnP531 do {hP53'=0, k'=k+1} goto loc_000001000;
--when hMDM2=dnMDM21 do {hMDM2'=0, k'=k+1} goto loc_000010000;
--when hOGA=dpOGA0 do {hOGA'=0, k'=k+1} goto loc_000011010;

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
