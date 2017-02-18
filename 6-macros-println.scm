(read-enable 'r7rs-symbols)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

; Let's define a macro to do println.
(define-syntax println
  (syntax-rules ()
    ((println) #t)
    ((println expr1 ...)
     (begin
       (display expr1)
       (println ...)))))

; Triggers the first case
(println)

; Triggers the second case, then the first case
(println "Hello")

; Triggers the second, second, second, then first case
(println "Line1" "Line2" "Line3")

(define a 1)
(define b 2)
(define c 3)


(println a b c)
     
