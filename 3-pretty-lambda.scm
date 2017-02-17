(read-enable 'r7rs-symbols)

(define println
  (lambda (x)
    (display x)
    (newline)))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

; 0-argument
(define (print-hi)
  (display "hi")
  (newline))

(println (print-hi))

; 1-argument
(define (sub1 x)
  (- x 1))

(println (sub1 2))

; list-argument
(define (print-list . l)
  (for-each
    (lambda (x)
      (display l)
      (newline))
    l))

(print-list '(a b c))

; you can also still do the dotted list syntax here
(define (print-pairs . (i1 i2 . rest))
  (if (even? (length rest))
    (begin
      (display (cons i1 i2))
      (newline)
      (if (not (= (length rest) 0))
        ; need to use apply here!
        (apply print-pairs rest))) 
    (error "print-pairs: list is not even length!")))

(print-pairs 1 2 3 4 5 6)
