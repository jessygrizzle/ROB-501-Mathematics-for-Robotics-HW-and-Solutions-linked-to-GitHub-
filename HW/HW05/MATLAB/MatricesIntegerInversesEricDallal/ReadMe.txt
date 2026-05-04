I have implemented a matlab function which generates pairs of matrices that have integer entries only and are inverses of one another. The function prototype is:

function [A1, A2] = Gen

Parameters (hard coded - explained in the first lines of the m-file):
n: size of the matrices to be generated
k: maximal size of the entries of the first n-1 rows of A1. These entries will take values from 1 to k.
manual: set to 0 to generate matrices randomly, 1 to manually enter the first n-1 rows. if using manual mode, you need to change the line A = zeros(n) to make A an nxn matrix where you have specified the values for the first n-1 rows (use only zeros in the last row).

In manual mode, the user specifies the A matrix's first n-1 rows. In non-manual mode, these are generated randomly from 1 to k. The algorithm then finds entries for the last row of A so that the determinant is 1. Note that this may be impossible. In manual mode, this will result in an error message and give a zero matrix for A2. In non-manual mode, the algorithm iterates until it works. The number of iterations is displayed on screen but is usually quite small. Note that this function is to be used for relatively small n and k. For larger values, the entries of the inverse matrix will tend to be quite large.

Example usage:
This m-function is usually used to generate the M_1 and M_2 matrices such that A = M_1 Ahat M_2, where M_1 contains the e-vectors of A. Thus, if you want to generate a random example where students need to find e-vectors and e-values for some A matrix, simply run the program to obtain M_1 and M_2, pick some random Jordan form for Ahat, and multiply it all out to get A. If you want students to compute e^{At}, you could do something similar. Suppose that Ahat is diagonal, and equal to diag(l_1, ..., l_k). Then:
e^{At} = e^{l_1 t}M_1Z_1M_2 + ... + e^{l_k t}M_1Z_kM_2,
where Z_i is the matrix consisting entirely of zeros except for a 1 in the i^{th} row and column. This allows you to easily determine the coefficients on all the exponentials, and guarantees they will all be integers. Enjoy!
