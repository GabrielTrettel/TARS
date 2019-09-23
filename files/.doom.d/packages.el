;; -*- no-byte-compile: t; -*-
;;; .doom.d/packages.el

;;; Examples:
;; (package! some-package)
;; (package! another-package :recipe (:host github :repo "username/repo"))
;; (package! builtin-package :disable t)

;; (require 'spaceline-config)
;; (spaceline-spacemacs-theme)
(package! all-the-icons)
;; (package! julia-mode)
(package! julia-repl)
(package! treemacs)
(package! doom-themes)
;;(package! )
(add-to-list 'load-path "/home/trettel/.emacs/emacs-tree-sitter/")
(add-to-list 'load-path "/home/trettel/.tree-sitter/")
(add-to-list 'load-path "/home/trettel/.emacs/emacs-tree-sitter/")
(require 'tree-sitter)


(ts-require-language 'rust)
(ts-require-language 'julia)
;; (ts-require-language 'python)
;;
;; (add-hook 'rust-mode-hook #'tree-sitter-mode)
;; (add-hook 'julia-mode-hook #'tree-sitter-mode)
;;
;; (add-to-list 'tree-sitter-major-mode-language-alist '(julia-mode . julia))
