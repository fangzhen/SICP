(define (sqrt x)
  (sqrt-iter 1.0 x))

(define (sqrt-iter guess x)
  (if (good-enough2? guess x)
      guess
      (sqrt-iter (improve guess x) x)))

(define (improve guess x)
  (average guess (/ x guess)))

(define (average a b)
  (/ (+ a b) 2))

(define (good-enough? guess x)
  (< (abs (- (* guess guess) x)) 0.001))
; new good-enough
(define (good-enough2? guess x)
  (< (/ (abs (- (improve guess x) guess)) guess) 0.001))
