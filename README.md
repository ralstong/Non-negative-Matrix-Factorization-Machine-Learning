# Non-negative-Matrix-Factorization-Machine-Learning

The code factorizes a n x m matrix X into a rank-K approximation WH, where W is
n x K, H is K x m and all values in the matrices are nonnegative. Each value in W and H is
initialized randomly.

The data to be used consists of 1000 images of faces, each originally 32x32, but
vectorized to length 1024. The data matrix is therefore 1024x1000. NMF algorithm is then 
implemented on this data using the Euclidean penalty. This is run for 200 iterations and 
the the objective is plotted as a function of iteration. Further, the images can be recovered.
