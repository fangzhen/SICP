;; 练习1.11
(define (f n)
  (if (< n 3)
      n
      (+ (f (- n 1))
         (* 2 (f (- n 2)))
         (* 3 (f (- n 3))))))

(define (fi n)
  (define (fi-iter f0 f1 f2 c)
    (if (= c n)
        f2
        (fi-iter f1 f2
                 (+ f2 (* 2 f1) (* 3 f0))
                 (+ c 1))))

  (if (< n 3)
      n
      (fi-iter 0 1 2 2))
 )
