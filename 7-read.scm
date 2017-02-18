(read-enable 'r7rs-symbols)

(define println
  (lambda (x)
    (display x)
    (newline)))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

; (read) asks the input for a Scheme expression
(define my-expr (read))
(println my-expr)

; (write) outputs a Scheme expression
; - So it knows how to produce the correct Scheme expression.
(write '(+ 1 2))

; It even knows for stuff like Macros...
(write
  '(define-syntax println
    (syntax-rules ()
      ((println) #t)
      ((println expr1 ...)
       (begin
         (display expr1)
         (println ...))))))
