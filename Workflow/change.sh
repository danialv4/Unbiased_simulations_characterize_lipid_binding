echo "Total number of lipids to test"
read nl

echo "GRO file with n number of bound lipids"
read initial

sed 1,17d workflow.sh > workflow$nl.sh
sed -i 5,8d workflow$nl.sh

sed -i "s/prot_cg_fc1000_eu8.pdb/$initial/g" workflow$nl.sh
sed -i "s/prot_cg_newbox/prot${nl}_cg_newbox/g" workflow$nl.sh
sed -i "s/min-vac.gro/prot${nl}_cg_newbox/g" workflow$nl.sh
sed -i "s/\${replica}/\${replica}_2/g" workflow$nl.sh
sed -i "s/\$lipid  1/\$lipid  $nl/g" workflow$nl.sh

