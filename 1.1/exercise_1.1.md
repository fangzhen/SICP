1.1 程序设计的基本元素
====================
##1.1

```
1 ]=> 10

;Value: 10

1 ]=> (+ 5 3 4)

;Value: 12

1 ]=> (- 9 1)

;Value: 8

1 ]=> (/ 6 2)

;Value: 3

1 ]=> (+ (* 2 4) (- 4 6))

;Value: 6

1 ]=> (define a 3)

;Value: a

1 ]=> (define b (+ a 1))

;Value: b

1 ]=> (+ a b (* a b))

;Value: 19

1 ]=> (= a b)

;Value: #f

1 ]=> (if (and (> b a) (< b (* a b)))
        b a)

;Value: 4

1 ]=> (cond ((= a 4) 6)
        ((= b 4) (+ 6 7 a))
        (else 25))

;Value: 16

1 ]=> (+ 2 (if (> b a) b a))

;Value: 6

1 ]=> (* (cond ((> a b) a)
                ((< a b) b)
                (else -1))
        (+ a 1))

;Value: 16

```

##1.2
```lisp
(/ (+ 5 4
      (- 2 (- 3 (+ 6 (/ 4 5)))))
   (* 3 (- 6 2) (- 2 7))
)
```

##1.3
```lisp
(define (<= a b)
    (or (< a b) (= a b)))
(define (sum-of-maxtwo a b c)
        (cond ((and (<= a b) (<= a c)) (+ b c))
            ((and (<= b a) (<= b c)) (+ a c))
            ((and (<= c a) (<= c b)) (+ a b)))
)
```

##1.4
求值组合式需要求值各个子表达式，只不过求值(if (> b 0) + -) 的结果是操作符而已。原过程接受两个参数a和b，结果为a与b的绝对值的和。

##1.5
正则序，表达式的值为0；应用序，解释器假死没有输出。

原因：首先明确，应用序求值，解释器首先对运算符和各个运算对象求值，而后将得到的过程应用于得到的实际参数。而正则序求值先不求出运算对象的值，知道实际需要它们的值再去做。采用这种求值方式，首先用运算对象表达式去代换形式参数，直至得到一个只包含基本运算符的表达式，然后再去执行求值。

因此，若采用应用序，表达式(test 0 (p))先分别对运算符test和两个运算对象0 (p)求值。对(p)求值时，运算符p求值的结果仍然是(p),这就造成了无穷递归。

若采用正则序，求值表达式(test 0 (p))只代换对运算对象0和(p)，而不对它们求值。而求值if表达式时只求值需要的子表达式，所以没有对表达式(p)的求值过程，所以表达式结果为0,不会造成无穷递归。

#1.6
把if定义为一个常规过程：

```
(define (new-if predicate then-clause else-clause)
    (cond (predicate then-clause)
        (else else-clause)))

(define (sqrt-iter guess x)
    (new-if (good-enough? guess x)
        guess
        (sqrt-iter (improve guess x) x)))
```
那么对new-if的调用会使用普通表达式的求值过程。在new-if的else-clause包含了对sqrt-iter的递归调用，因此会无穷递归。

##1.9
第一个是递归计算过程，第二个是迭代计算过程

##1.10
```lisp
(define (f n) (* 2 n))
(define (g n) (^ 2 n))
(define (h n)
    (if (= n 1)
        2
        (^ 2 (h (- n 1)))))
(define (^ x n)
    (if (< n 1)
        1
        (* x (^ x (- n 1)))))
```
