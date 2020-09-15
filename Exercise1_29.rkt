(define merge
  (lambda (loi1 loi2)
    (cond
      ((null? loi1) loi2)
      ((null? loi2) loi1)
      ((<= (car loi1)(car loi2))(cons (car loi1)(merge (cdr loi1) loi2)))
      ((<= (car loi2)(car loi1))(cons (car loi2)(merge loi1(cdr loi2)))))))


(define divide
  (lambda (loi)
    (cond
      ((null? loi)'())
      ((null? (cdr loi))(list (car loi)))
      (else (list (list (car loi))(list(car (cdr loi))))))))

(define mySort
  (lambda (loi)
    (cond
      ((null? loi)'())
      ((null? (cdr (cdr loi))) (merge (car loi)(car(cdr loi))))
      (else (merge (mySort (divide loi))(mySort (divide (cdr (cdr loi)))))))))
