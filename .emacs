(require 'package) ;; You might already have this line
(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/"))
(when (< emacs-major-version 24)
  ;; For important compatibility libraries like cl-lib
  (add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/")))
(package-initialize) ;; You might already have this line


(org-babel-do-load-languages
 'org-babel-load-languages (quote ((emacs-lisp . t)
                                    (sqlite . t)
                                    (R . t)
                                    (python . t))))

;; Place org table captions below table
(setq org-latex-caption-above nil)

;; Dont ask to evaluate sqlite in org-mode
;; Dont ask to evaluate sqlite in org-mode
(defun pt-org-confirm-babel-evaluate (lang body)
            (not (or(string= lang "sqlite") (string= lang "python") (string= lang "sql") (string= lang "ipython"))))  ; don't ask for ditaa
          (setq org-confirm-babel-evaluate 'pt-org-confirm-babel-evaluate)


(eval-after-load "org"
  '(require 'ox-beamer nil t))
(eval-after-load "org"
  '(require 'ox-odt nil t))
(eval-after-load "org"
  '(require 'ox-md nil t))
(eval-after-load "org"
  '(require 'org-ref))


(setq reftex-default-bibliography '("~/Google Drive/References/library.bib"))

;; see org-ref for use of these variables
(setq org-ref-bibliography-notes "~/Google Drive/References/notes.org"
      org-ref-default-bibliography '("~/Google Drive/References/library.bib")
      org-ref-pdf-directory "~/Dropbox/Library/")

(setq org-latex-pdf-process
      '("pdflatex -interaction nonstopmode -output-directory %o %f"
	"bibtex %b"
	"pdflatex -interaction nonstopmode -output-directory %o %f"
	"pdflatex -interaction nonstopmode -output-directory %o %f"))

(setq org-latex-create-formula-image-program 'dvipng)
