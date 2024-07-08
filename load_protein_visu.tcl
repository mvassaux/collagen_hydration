mol new ./microfibril.pdb
#mol addfile trajectory.dcd waitfor all # (optional) 

mol delrep 0 0

for { set m 0}  {$m < 5} {incr m} {
  mol representation VDW 1.0
  mol material Diffuse
  mol color ColorID $m
  mol selection name CA and residue >= 1+238*($m) and residue < 1+238*($m+1) and residue < 1058 
  mol addrep 0
}
for { set m 0}  {$m < 5} {incr m} {
  mol representation VDW 1.0
  mol material Diffuse
  mol color ColorID $m
  mol selection name CA and residue >= 1058+230*($m) and residue < 1058+230*($m+1) and residue < 2086 
  mol addrep 0
}
for { set m 0}  {$m < 5} {incr m} {
  mol representation VDW 1.0
  mol material Diffuse
  mol color ColorID $m
  mol selection name CA and residue >= 2086+238*($m) and residue < 2086+238*($m+1) and residue < 3143
  mol addrep 0
}

pbc wrap -all
pbc unwrap -all

pbc box -center bb -color silver -width 1
