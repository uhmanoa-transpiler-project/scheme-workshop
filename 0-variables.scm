(define println
  (lambda (x)
    (display x)
    (newline)))

(define x 1)
(define y 'a)

(println x)
(println y)

(set! x 2)

(println x)
(println y)
