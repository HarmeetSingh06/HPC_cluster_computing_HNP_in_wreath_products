# HPC_cluster_computing_HNP_in_wreath_products

GAP code for checking a couple of results from my PhD thesis (really hoping those are correct my God). I'll put a link to the thesis in these brackets here ()... if these brackets are empty I forgot and I am sorry. Here's what's inside this little beauty.
- kernel_computation is for verifying Proposition 3.3.16 in the thesis. The main function used is IsKerTriv in kernel_comp.gap which takes as input an integer d and outputs a csv file computing a certain invariant for each possibility that appears in degree d. The code for this function was adapted from code given to the author by Hoshi and Yamasaki (see the PhD thesis). The file run_IsKerTriv.sh is a bash script run from the terminal to be used to run on the HPC cluster. The rest are output files with name 'IsKerTriv_output_d.csv' which are the outputs from running IsKerTriv with input d.
-  


