package numericalMethods;

/* Ryan Forsyth 03/07/2015 */
public class NumericalMethods {

	/* Test our numerical methods */
	public static void main(String[] args) {
		
		Function quadratic = (x) -> x * x;
		Function cos = (x) -> Math.cos(x);
		
		System.out.println("Using a Left Riemann Sum to do a regular sum " +
														"from 0 to 3 of i^2");
		System.out.println(leftRiemannSum(quadratic, 0, 4, 4));
		
		
		
		System.out.println("Numerical approximation using Left Riemann Sum " +
														"for x^2 from 0 to 1");
		System.out.println(leftRiemannSum(quadratic, 0, 1, 1000));
		
		System.out.println("Numerical approximation using Right Riemann Sum " +
														"for x^2 from 0 to 1");
		System.out.println(rightRiemannSum(quadratic, 0, 1, 1000));
		
		
		
		System.out.println("Numerical approximation using Left Riemann Sum " +
													"for cos(x) from 0 to 1");
		System.out.println(leftRiemannSum(cos, 0, 1, 1000));

		System.out.println("Numerical approximation using Right Riemann Sum " +
													"for cos(x) from 0 to 1");
		System.out.println(rightRiemannSum(cos, 0, 1, 1000));
		
		
		System.out.println("Regular sum evaluation for i^2 from 0 to 3");
		System.out.println(sum(quadratic, 0, 3));
		
		System.out.println("Regular sum evaluation for i from 0 to 10");
		System.out.println(sum((x) -> x, 0, 10));
	}
	
	/* Define a function */
	static interface Function {
		double evaluate(double x);
	}
	
	/* Left Riemann Sum */
	public static double leftRiemannSum(Function f, double a, double b, 
														int numIntervals) {
		double sum = 0;
		double intervalLength = (b - a) / ((double) numIntervals);
		double x = a;
		for (int i = 0; i < numIntervals; i++) {
			sum += f.evaluate(x) * intervalLength;
			x += intervalLength;
		}
		
		return sum;
	}
	
	/* Right Riemann Sum */
	public static double rightRiemannSum(Function f, double a, double b, 
														int numIntervals) {
		double x = a;
		double sum = 0;
		double intervalLength = (b - a) / ((double) numIntervals);
		
		for (int i = 0; i < numIntervals; i++) {
			x += intervalLength;
			sum += f.evaluate(x) * intervalLength;
		}
		
		return sum;
	}
	
	/* sum */
	public static double sum(Function f, int a, int b) {
		double sum = 0;
		
		for (int i = a; i <= b; i++) {
			sum += f.evaluate(i);
		}
		
		return sum;
	}

}
