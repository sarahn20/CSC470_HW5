(define merge
  (lambda (pred loi1 loi2)
    (cond
      ((and (not (null? loi1))
            (not (null? loi2)))(if (pred (car loi1)(car loi2))
                                   (cons (car loi1)(merge pred (cdr loi1)loi2))
                                   (cons (car loi2)(merge pred loi1 (cdr loi2)))))
      ((null? loi1) loi2)
      (else loi1))))

(define divide
  (lambda (loi)
    (cond
      ((null? loi)'())
      ((null? (cdr loi))(list (car loi)))
      (else (list (list (car loi))(list(car (cdr loi))))))))

(define sort/predicate
  (lambda (pred loi)
    (cond
      ((null? loi)'())
      ((null? (cdr (cdr loi))) (merge pred(car loi)(car(cdr loi))))
      (else (merge pred (sort/predicate pred (divide loi))(sort/predicate pred (divide (cdr (cdr loi)))))))))
