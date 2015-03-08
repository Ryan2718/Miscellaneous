/* Ryan Forsyth
 * 03/07/2015
 */

#include <stdio.h>
#include <math.h>

/* Function prototypes */
double left_riemann_sum(double(*function)(double), double a, double b,
                                                            int num_intervals);
double right_riemann_sum(double(*function)(double), double a, double b,
                                                            int num_intervals);
double sum(double(*function)(double), int a, int b);
double quadratic(double x);
double linear(double x);


/* Test our numerical methods */
int main() {
    
    printf("Using a left riemann sum to do a regular sum from 0 to 3 of i^2\n");
    printf("%f\n", left_riemann_sum(quadratic, 0, 4, 4));
    
    
    
    printf("Numerical approximation using Left Riemann Sum for x^2 from 0 to "
                                                                        "1\n");
    printf("%f\n", left_riemann_sum(quadratic, 0, 1, 1000));
    
    printf("Numerical approximation using Right Riemann Sum for x^2 from 0 to "
                                                                        "1\n");
    printf("%f\n", right_riemann_sum(quadratic, 0, 1, 1000));
    
    
    
    printf("Numerical approximation using Left Riemann Sum for cos(x) from 0 "
                                                                    "to 1\n");
    printf("%f\n", left_riemann_sum(cos, 0, 1, 1000));
    
    printf("Numerical approximation using Right Riemann Sum for cos(x) from 0 "
                                                                    "to 1\n");
    printf("%f\n", right_riemann_sum(cos, 0, 1, 1000));

    
    
    printf("Regular sum evaluation for i^2 from 0 to 3\n");
    printf("%f\n", sum(quadratic, 0, 3));
    
    printf("Regular sum evaluation for i from 0 to 10\n");
    printf("%f\n", sum(linear, 0, 10));
    
    return 0;
}

/* Left Riemann Sum */
double left_riemann_sum(double(*function)(double), double a, double b,
                                                            int num_intervals) {
    int i;
    double x = a, count = 0, interval_length = (b - a) / ((double) (num_intervals));
    
    for (i = 0; i < num_intervals; i++) {
        count += function(x) * interval_length;
        x += interval_length;
    }
    
    return count;
}

/* Right Riemann Sum */
double right_riemann_sum(double(*function)(double), double a, double b,
                                                            int num_intervals) {
    int i;
    double x = a, count = 0, interval_length = (b - a) / ((double) (num_intervals));
    
    for (i = 0; i < num_intervals; i++) {
        x += interval_length;
        count += function(x) * interval_length;
    }
    
    return count;
}

/* sum */
double sum(double(*function)(double), int a, int b) {
    int i;
    double count = 0;
    
    for (i = a; i <= b; i++) {
        count += function(i);
    }
    
    return count;
}

/* x^2 */
double quadratic(double x) {
    return x * x;
}

/* x */
double linear(double x) {
    return x;
}
