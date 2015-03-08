# Ryan Forsyth 03/07/2015

# Left Riemann Sum
def leftRiemannSum(f, a, b, numIntervals):
    sum = 0
    intervalLength = (b - a) / numIntervals
    x = a
    for i in range(0, numIntervals):
        sum += f(x) * intervalLength
        x += intervalLength
    return sum

# Right Riemann Sum
def rightRiemannSum(f, a, b, numIntervals):
    sum = 0
    intervalLength = (b - a) / numIntervals
    x = a
    for i in range(0, numIntervals):
        x += intervalLength
        sum += f(x) * intervalLength
    return sum

# Sum
def sum(f, a, b):
    sum = 0
    for i in range(a, b + 1):
        sum += f(i)
    return sum

if __name__ == '__main__':
    from math import cos
    
    quadratic = (lambda x: x *x)
    
    print("Using a Left Riemann Sum to do a regular sum from 0 to 3 of i^2")
    print(leftRiemannSum(quadratic, 0, 4, 4))
    
    print("Numerical approximation using Left Riemann Sum for x^2 from 0 to 1")
    print(leftRiemannSum(quadratic, 0, 1, 1000))
    print("Numerical approximation using Right Riemann Sum for x^2 from 0 to 1")
    print(rightRiemannSum(quadratic, 0, 1, 1000))
    
    print("Numerical approximation using Left Riemann Sum for cos(x) from 0 to 1")
    print(leftRiemannSum(cos, 0, 1, 1000))
    print("Numerical approximation using Right Riemann Sum for cos(x) from 0 to 1")
    print(rightRiemannSum(cos, 0, 1, 1000))
    
    print("Regular sum evaluation for i^2 from 0 to 3")
    print(sum(quadratic, 0, 3))
    
    print("Regular sum evaluation for i from 0 to 10")
    print(sum(lambda x: x, 0, 10))
   
