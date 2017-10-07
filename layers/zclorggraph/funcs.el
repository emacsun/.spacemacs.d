(defun bh/plantuml-if ()
  (incf bh/plantuml-if-count)
  (number-to-string bh/plantuml-if-count))


(defun bh/plantuml-loop ()
  (incf bh/plantuml-loop-count)
  (number-to-string bh/plantuml-loop-count))

(defun bh/plantuml-reset-counters ()
  (setq bh/plantuml-if-count 0
        bh/plantuml-loop-count 0)
  "")
