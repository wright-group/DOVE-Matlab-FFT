

#include "mex.h"

/* If you are using a compiler that equates NaN to zero, you must
* compile this example using the flag -DNAN_EQUALS_ZERO. For
* example:
*
* mex -DNAN_EQUALS_ZERO p1transform.c
*
* This will correctly define the IsNonZero macro for your
compiler. */
#if NAN_EQUALS_ZERO
#define IsNonZero(d) ((d) != 0.0 || mxIsNaN(d))
#else
#define IsNonZero(d) ((d) != 0.0)
#endif

/* gateway function */
void mexFunction(int nlhs, mxArray *plhs[],
int nrhs, const mxArray *prhs[])
{
/* Declare variables. */
int elements, i, j, p, q, number_of_dims, mx, nx, rows, cols;
double *pr, *pi, *plrind, *pliind;
bool cmplx;
const int *dim_array;

/* Check for proper number of input and output arguments. */
if (nrhs != 1) {
mexErrMsgTxt("One input argument required.");
	}
if (nlhs > 1) {
mexErrMsgTxt("Too many output arguments.");
	}
/* Check data type of input argument. */
if (!(mxIsDouble(prhs[0]))) {
mexErrMsgTxt("Input array must be of type double.");
	}

/* Get the number of elements, rows, cols, in the input argument. */
elements = mxGetNumberOfElements(prhs[0]);
dim_array = mxGetDimensions(prhs[0]);
mx = mxGetM(prhs[0]);
nx = mxGetN(prhs[0]);

rows = mx + nx - 1;
cols = nx;

/* Get the data. */

pr = (double *)mxGetPr(prhs[0]);
pi = (double *)mxGetPi(prhs[0]);
cmplx = mxIsComplex(prhs[0]);


/* Get the number of dimensions in the input argument.
Allocate the space for the return argument */
number_of_dims = mxGetNumberOfDimensions(prhs[0]);


if(cmplx) {
	plhs[0] = mxCreateDoubleMatrix(rows, cols, mxCOMPLEX);
	plrind = mxGetPr(plhs[0]);
	pliind = mxGetPi(plhs[0]);

	for (j = 0; j < elements; j++) {

		p = j % mx;
		q = j / mx;
		plrind[q-p+mx+q*rows-1] = pr[j];
		pliind[q-p+mx+q*rows-1] = pi[j];
		}

	}

else {
	plhs[0] = mxCreateDoubleMatrix(rows, cols, mxREAL);
	plrind = mxGetPr(plhs[0]);
	
	for (j = 0; j < elements; j++) {

		p = j % mx;
		q = j / mx;
		plrind[q-p+mx+q*rows-1] = pr[j];
		}
	}
}