# HPC_cluster_computing_HNP_in_wreath_products

GAP code for checking a couple of results from my PhD thesis (really hoping those are correct my God). I'll put a link to the thesis in these brackets here ()... if these brackets are empty I forgot and I am sorry. Here's what's inside this little beauty. Here is a break down of what is inside this little beauty.
- The kernel_comp.gap file contains the code that produces the csv files. It takes as input a number d and outputs a list of all the possible wreath products that can appear in degree d together with what the kernel of the associated map is (see Remark 3.3.17 in the thesis for details).
- The bash file run_IsKerTriv.sh is used to run the file kernel_comp.gap on the HPC cluster with an inputted number d.
- The csv files are the outputs we obtained when running kernel_comp.gap on a HPC cluster for nonprime numbers d < 16. For example, IsKerTriv_output_15.csv is the output of running kernel_comp.gap with input 15. The lines in each csv file are of the form '[ m, i ], [ n, j ], [ K ]' where m,i,n,j are numbers, and K is a list of numbers.

More info for the mathematicians: each line means the following. If G = mTi \wr nTj (the wreath product of the ith transitive subgroup of S_{m} with the jth transitive subgroup of S_{n}), H = Stab_{G}(1) and X = (mTi)^{n} \rtimes Stab_{nTj}(1), then K is the abelian invariants of the kernel of the natural map F(GG,HH) -> F(GG,XX) where GG is a Schur cover of G, HH < GG the pullback of H and XX < GG the pullback of X. See Section 3.3.2 of the thesis for more information on this. If K is empty, then it means our result is true for this specific G (so we want K to be empty always).


