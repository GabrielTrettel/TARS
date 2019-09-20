;;; .doom.d/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here


;; NOTE: Doom config
(setq
 doom-font                  (font-spec :size 18)
 doom-big-font              (font-spec :size 36)
 doom-variable-pitch-font   (font-spec :size 18)
)

(setq
 spaceline-evil-state-p t
 spaceline-version-control-p t
 )


;; (setq treemacs-git-mode 'deferred)

;; Global settings (defaults)
(setq doom-themes-enable-bold t    ; if nil, bold is universally disabled
      doom-themes-enable-italic t) ; if nil, italics is universally disabled

;; Load the theme (doom-one, doom-molokai, etc); keep in mind that each theme
;; may have their own settings.
;; (load-theme 'doom-molokai t)


;; Enable flashing mode-line on errors
;; (doom-themes-visual-bell-config)

;; or for treemacs users
(doom-themes-treemacs-config)


;; Corrects (and improves) org-mode's native fontification.
(doom-themes-org-config)


;; NOTE: Treemacs config
(setq
 treemacs-width 20
 )

;; NOTE: Doom modeline config
(setq doom-modeline-buffer-file-name-style 'truncate-upto-root)
(setq doom-modeline-indent-info t)

;; Whether display icons in mode-line or not.
;; (setq doom-modeline-icon (display-graphic-p))

;; Whether display the icon for major mode. It respects `doom-modeline-icon'.
(setq doom-modeline-major-mode-icon t)

;; Whether display color icons for `major-mode'. It respects
;; `doom-modeline-icon' and `all-the-icons-color-icons'.
(setq doom-modeline-major-mode-color-icon t)

;; Whether display icons for buffer states. It respects `doom-modeline-icon'.
(setq doom-modeline-buffer-state-icon t)

;; Whether display buffer modification icon. It respects `doom-modeline-icon'
;; and `doom-modeline-buffer-state-icon'.
(setq doom-modeline-buffer-modification-icon t)

;; Whether display minor modes in mode-line or not.
(setq doom-modeline-minor-modes (featurep 'minions))

;; If non-nil, a word count will be added to the selection-info modeline segment.
(setq doom-modeline-enable-word-count nil)

;; Whether display environment version or not
(setq doom-modeline-env-version t)
