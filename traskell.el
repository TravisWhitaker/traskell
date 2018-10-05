;; I don't know what I'm doing.
(define-minor-mode traskell-mode "Travis' Haskell Mode."
)

;; These aren't in the standard library?!?!
(defun traskell-string-trim-leading (str)
  "Remove trailing whitespace."
  (if (string-match "\\`[ \t]+" str)
      (replace-match "" t t str)
      str
  )
)

(defun traskell-string-trim-trailing (str)
  "Remove leading whitespace."
  (if (string-match "[ \t]+\\'" str)
      (replace-match "" t t str)
      str
  )
)

;; Don't hard-code 80. Handle sub defs.
(defun traskell-align-equations ()
  "Align groups of Haskell equations."
)

(defun traskell-break-equation-parts ()
  "Break the equation at point into lhs and rhs."
  (let*  ((lineStart (line-beginning-position))
          (eqInd (progn (beginning-of-line)
                        (search-forward "=")
                 )
          )
          (lineEnd (line-end-position))
          (lhsLen (- (- eqInd lineStart) 1))
          (lhs (traskell-string-trim-trailing
                   (buffer-substring-no-properties lineStart (- eqInd 1))
               )
          )
          (rhs (traskell-string-trim-leading
                   (buffer-substring-no-properties eqInd lineEnd)
               )
          )
         )
    (list lhs
          lhsLen
          rhs
          )
  )
)
