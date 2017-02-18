(read-enable 'r7rs-symbols)

(define println
  (lambda (x)
    (display x)
    (newline)))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


; Conditional
(define x #t)
(if x
  (println "x is true")
  (println "x is false"))

; Pair
(define pair (cons 1 2))
(println (car pair))
(println (cdr pair))

; Lists are chains of pairs that end with a null list,
; denoted: '()
(define l0 (cons 1 (cons 2 (cons 3  (cons 4 '())))))
(println l0)

; This is an improper list, because it doesn't end with
; the null list
(define l1 (cons 1 (cons 2 (cons 3 4))))
(println l1)

; Lists can also use the list function
(define l2 (list 1 2 3 4))
(println l2)
(newline)

; Improper lists are NOT proper lists
(println "Are l1 and l2 equal?")
(println (equal? l1 l2))
(println "This is because l1 is an improper list, and l2 is not")
(newline)

; Proper lists ARE proper lists
(println "Are l0 and l2 equal?")
(println (equal? l0 l2))
(println "This is because l0 is an proper list, and l2 is as well")
(newline)



