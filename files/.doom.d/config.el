;; location : /home/trettel/.doom.d/config.el
;;; .doom.d/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here

;; NOTE: Doom config
(setq
 doom-font                  (font-spec :size 18)
 doom-big-font              (font-spec :size 36)
 doom-variable-pitch-font   (font-spec :size 18)
)

(require 'spaceline-config)
(spaceline-spacemacs-theme)


(setq
 spaceline-evil-state-p t
 spaceline-version-control-p t
 )

;; NOTE: Treemacs config
(setq
 treemacs-width             20
 )

;; NOTE: Doom modeline config
;; (setq
;; ;; doom-modeline-height       1
;;  doom-modeline--font-height 12
;; ;; doom-modeline-bar-heght    1
;;  doom-modeline-bar-width    3
;;  doom-modeline-enable-word-count       t
;;  doom-modeline-env-enable-python       t
;;  doom-modeline-env-enable-ruby         t
;;  doom-modeline-env-enable-perl         t
;;  doom-modeline-env-enable-go           t
;;  doom-modeline-env-enable-elixir       t
;;  doom-modeline-env-enable-rust         t
;;  doom-modeline-env-python-executable   "python" ; or `python-shell-interpreter'
;;  doom-modeline-env-ruby-executable     "ruby"
;;  doom-modeline-env-perl-executable     "perl"
;;  doom-modeline-env-go-executable       "go"
;;  doom-modeline-env-elixir-executable   "iex"
;;  doom-modeline-env-rust-executable     "rustc"
;;  doom-modeline-env-load-string         "..."
;;  )
