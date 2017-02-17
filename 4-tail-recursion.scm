(read-enable 'r7rs-symbols)

(define println
  (lambda (x)
    (display x)
    (newline)))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

; This is a tail-recursive version of adding in Scheme.
;
; If this were done in C, there'd be a stack overflow.
;
; This is because a function's frame would end up going
; WAAAAAAY over the memory limit.
;
; Meanwhile, Scheme is required to do a certain optimization
; by detecting when a function call itself in a certain form.
;
; We will need to detect this in a EvaluationStrategy.
(define add1
  (lambda (x y)
    (define (add1-recursive a b)
      (display (cons a b))
      (newline)
      (if (> b 0)
        ; This is going to do something along the line of:
        ;
        ; "HEY LOOK AT THIS. THIS IS CALLING MYSELF!
        ; So I think all I have to do is rewrite 'a and 'b
        ; in my environment to be slightly different
        ; values, and then rerun the procedure!
        ;
        ; BABOOM NO MORE ALLOCATING MORE MEMORY
        ;
        ; INFINITE RECURSION IS HAPPY.
        (add1-recursive (+ a 1) (- b 1))
        a))
    (add1-recursive x y)))

; Call add, but a RIDICULOUS amount of times.
(add1 0 100000000000000000000000000000000)
      

