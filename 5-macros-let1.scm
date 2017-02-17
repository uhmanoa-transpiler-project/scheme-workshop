(read-enable 'r7rs-symbols)

(define println
  (lambda (x)
    (display x)
    (newline)))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

; define-syntax defines a special keyword
(define-syntax let1
  ; syntax-rules consists of a list of secondary keywords
  ; to be associated with the primary keyword
  ;
  ; there is also a list of cases to match against
  (syntax-rules ()
    ; for example,
    ; this case ((expr) result):
    ;
    ; (let1
    ;   (name1 expr1)
    ;   body1
    ;   body2
    ;   ...)
    ;
    ; will actually expand to the lambda expression,
    ; with substitution of the stuff in the first expression
    ; for their places in the second.
    ((let1 (name1 expr1) body1 body2 ...)
     ((lambda (name1)
        body1
        body2
        ...) expr1))))

; After we've defined the macro, we can use it as if it were
; any other part of the language.
;
; This is because the macro is now "registered" with the core
; system. So I guess it's a part of core-systems, and not
; necessarily IO
(let1 (asdf "Hello world!")
      (println asdf))

