;;;; Numerical Methods
;;;; Ryan Forsyth 03/06/2015 - 03/07/2015

;;; Numerical Integration - Left Riemann Sum
(defun left-riemann-sum (f a b num-intervals)
    "Left Riemann Sum"
    (let ((interval-length (/ (- b a) num-intervals)))
        (reduce #'+ (mapcar (lambda (value) (* value interval-length))
                        (mapcar f (loop for x from a to b
                                            by interval-length
                                            collect x))))))

;;; Numerical Integration - Right Riemann Sum
(defun right-riemann-sum (f a b num-intervals)
    "Right Riemann Sum"
    (let ((interval-length (/ (- b a) num-intervals)))
        (reduce #'+ (mapcar (lambda (value) (* value interval-length))
                        (mapcar f (loop for x from (+ a interval-length)
                                            to (+ b interval-length)
                                            by interval-length
                                            collect x))))))


;;; Sum Evaluator
(defun sum (f a b)
    "Sum"
    (reduce #'+ (mapcar f (loop for x from a to b collect x))))
        




;;; Tests

;;;  p(x) = x^2
(defun p (x) (* x x))

(princ "Using a left riemann sum to do a regular sum from 0 to 3 of i^2")
(write-line " ")
(write(left-riemann-sum #'p 0 3 3))
(write-line " ")

(princ "Numerical approximation using Left Riemann Sum for x^2 from 0 to 1")
(write-line " ")
(write(left-riemann-sum #'p 0.0 1.0 1000.0))
(write-line " ")

(princ "Numerical approximation using Right Riemann Sum for x^2 from 0 to 1")
(write-line " ")
(write(right-riemann-sum #'p 0.0 1.0 1000.0))
(write-line " ")

(princ "Numerical approximation using Left Riemann Sum for cos(x) from 0 to 1")
(write-line " ")
(write (left-riemann-sum (lambda (x) (cos x)) 0 1 1000))
(write-line " ")

(princ "Numerical approximation using Right Riemann Sum for cos(x) from 0 to 1")
(write-line " ")
(write (right-riemann-sum (lambda (x) (cos x)) 0 1 1000))
(write-line " ")

(princ "Regular sum evaluation for i^2 from 0 to 3")
(write-line " ")
(write(sum #'p 0 3))
(write-line " ")

(princ "Regular sum evaluation for i from 0 to 10")
(write-line " ")
(write(sum (lambda (x) x) 0 10))
(write-line " ")
