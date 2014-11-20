 (define (cube-root x)
   (cube-root-iter 1.0 x))

(define (cube-root-iter guess x)
  (if (good-enough? guess x)
      guess
      (cube-root-iter (improve guess x) x)))

(define (improve y x)
  (/ (+ (/ x (* y y)) (+ y y)) 3))

(define (good-enough? guess x)
  (< (/ (abs (- (improve guess x) guess)) guess) 0.0001))
