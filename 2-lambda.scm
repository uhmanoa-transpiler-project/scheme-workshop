(read-enable 'r7rs-symbols)

(define println
  (lambda (x)
    (display x)
    (newline)))



; lambda with 0 arguments
(define print-hello-world
  (lambda ()
    (display "Hello World!\n")))

; calling a 0-parameter procedure
(print-hello-world)


; lambda with 1 arugment
(define add1
  (lambda (x)
    (+ x 1)))

; calling a 1-parameter procedure
(println (add1 1))
(println (add1 100))

; lambda with 1 list argument
(define print-each
  (lambda l
    (for-each
      (lambda (x)
        (display x)
        (newline))
      (car l))))

; calling a list parameter procedure
(print-each '(1 2 3 4))

; recusive lambda, consuming 2 per iteration
(define print-pairs
    (lambda (i1 i2 . rest)
      (if (even? (length rest))
        (begin
          (display (cons i1 i2))
          (newline)
          (if (not (= (length rest) 0))
            ; need to use apply here!
            (apply print-pairs rest))) 
        (error "print-pairs: list is not even length!"))))

; calling this lambda function
(print-pairs 1 2 3 4 5 6)




