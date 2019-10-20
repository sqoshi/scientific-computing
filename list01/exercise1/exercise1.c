/***
*Piotr Popis
*/
#include <stdio.h>
#include <float.h>

int main(){
   printf("Macheps Float32 = %.17g\n", FLT_EPSILON);
   printf("Macheps Float64  = %.17g\n", DBL_EPSILON);

   printf("Eta Float32 = %.17g\n", FLT_MIN);
   printf("Eta Float64 = %.17g\n", DBL_MIN);

   printf("MAX Float32 = %.17g\n", FLT_MAX);
   printf("MAX Float64 = %.17g\n", DBL_MAX);

}
