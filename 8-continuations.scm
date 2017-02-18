(read-enable 'r7rs-symbols)

(define println
  (lambda (x)
    (display x)
    (newline)))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

; This does something special.
;
; Basically, the (lambda (return) ...) defines
; a function called (return) that basically does
; what you think it does -- it returns the value
; with it directly.
(println
  (call/cc
    (lambda (return)
      1)))

(define div-or-false
  (lambda (x y)
    (define ret-val
      (call/cc
        (lambda (ret)
          (if (= y 0)
            (ret #f)
            (/ x y)
          )
        )
      )
    )
    (if (eq? ret-val #f)
      (display "ERROR: div-or-false: Cannot divide by 0!\n"))
    ret-val))

(println (div-or-false 1 2))
(println (div-or-false 1 0))
      


