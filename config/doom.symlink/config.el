;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!


;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets. It is optional.
;; (setq user-full-name "John Doe"
;;       user-mail-address "john@doe.com")
(setq user-full-name "Bryan Mikaelian"
      user-mail-address "bryan.mikaelian@gmail.com")

;; Doom exposes five (optional) variables for controlling fonts in Doom:
;;
;; - `doom-font' -- the primary font to use
;; - `doom-variable-pitch-font' -- a non-monospace font (where applicable)
;; - `doom-big-font' -- used for `doom-big-font-mode'; use this for
;;   presentations or streaming.
;; - `doom-unicode-font' -- for unicode glyphs
;; - `doom-serif-font' -- for the `fixed-pitch-serif' face
;;
;; See 'C-h v doom-font' for documentation and more examples of what they
;; accept. For example:
;;
;;(setq doom-font (font-spec :family "Fira Code" :size 12 :weight 'semi-light)
;;      doom-variable-pitch-font (font-spec :family "Fira Sans" :size 13))
(setq doom-font (font-spec :family "Roboto Mono" :size 14)
      doom-symbol-font (font-spec :family "Roboto Mono" :size 14)
      doom-variable-pitch-font (font-spec :family "Roboto Mono" :size 14))

;; If you or Emacs can't find your font, use 'M-x describe-font' to look them
;; up, `M-x eval-region' to execute elisp code, and 'M-x doom/reload-font' to
;; refresh your font settings. If Emacs still can't find your font, it likely
;; wasn't installed correctly. Font issues are rarely Doom issues!

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
(setq doom-theme 'doom-one-light)

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type nil)

;; Local config to this machine
(load! "local")

;;;;;;;;;;;
;; Org Mode
;;;;;;;;;;;

(setq org-directory "~/.org/")

(after! org
  (setq org-hide-leading-stars nil ;; hide leading stars
        org-startup-indented t ;; vertically align non-prefixed text with headlines
        org-adapt-indentation nil ;; indent according to outline level

        ;; appearance
        org-fontify-whole-heading-line t ;; fontify the whole heading line
        org-fontify-done-headline t ;; fontify headline when marked done
        org-fontify-quote-and-verse-blocks t  ;; assign faces to quote and verse blocks

        org-hidden-keywords '(title author date email)
        org-return-follows-link t ;; RET opens org mode links
        org-ellipsis "…" ;; Replace Ellipsis with custom text
        org-pretty-entities t ;; render UTC-8 characters for things like \alpha
        org-hide-emphasis-markers t ;; hire things italics, bold, etc
        org-agenda-block-separator "" ;; newline seperator between blocks in agenda
        org-agenda-files '("~/.org"))


  (setq-hook! 'org-mode-hook line-spacing 0.1)
  (add-hook! 'org-mode-hook 'visual-line-mode)
  (add-hook! 'org-mode-hook #'+zen/toggle)

  (defun my/org-agenda-refresh-timer ()
    (dolist (window (window-list))
      (with-current-buffer (window-buffer window)
        (when (derived-mode-p 'org-agenda-mode)
          (org-agenda-redo)))))

  (setq org-agenda-prefix-format '((agenda . " %i %-12:c%?-12t% s")
                                   (todo . " %i %-12:c")
                                   (tags . " %i %-12:c")
                                   (search . " %i %-12:c")))

  (run-with-timer 0 300 'my/org-agenda-refresh-timer))

(custom-set-faces!
  '(org-document-title :height 1.2 :weight bold rinherit default)
  '(org-document-info :height 1.00)
  '(org-level-1 :height 1.15 :weight bold :inherit default)
  '(org-level-2 :height 1.1 :weight semi-bold :inherit default)
  '(org-level-3 :height 1.05 :weight medium :inherit default)
  '(org-level-4 :height 1.0 :weight medium :inherit default)
  '(org-level-5 :height 1.0 :weight normal :inherit default)
  '(org-level-6 :height 1.0 :weight normal :inherit default)
  '(org-level-7 :height 1.0 :weight normal :inherit default)
  '(org-level-8 :height 1.0 :weight normal :inherit default))


;; replicate nano emacs writer-mode with *

;; Whenever you reconfigure a package, make sure to wrap your config in an
;; `after!' block, otherwise Doom's defaults may override your settings. E.g.
;;
;;   (after! PACKAGE
;;     (setq x y))
;;
;; The exceptions to this rule:
;;
;;   - Setting file/directory variables (like `org-directory')
;;   - Setting variables which explicitly tell you to set them before their
;;     package is loaded (see 'C-h v VARIABLE' to look up their documentation).
;;   - Setting doom variables (which start with 'doom-' or '+').
;;
;; Here are some additional functions/macros that will help you configure Doom.
;;
;; - `load!' for loading external *.el files relative to this one
;; - `use-package!' for configuring packages
;; - `after!' for running code after a package has loaded
;; - `add-load-path!' for adding directories to the `load-path', relative to
;;   this file. Emacs searches the `load-path' when you load packages with
;;   `require' or `use-package'.
;; - `map!' for binding new keys
;;
;; To get information about any of these functions/macros, move the cursor over
;; the highlighted symbol at press 'K' (non-evil users must press 'C-c c k').
;; This will open documentation for it, including demos of how they are used.
;; Alternatively, use `C-h o' to look up a symbol (functions, variables, faces,
;; etc).
;;
;; You can also try 'gd' (or 'C-c c d') to jump to their definition and see how
;; they are implemented.
;;(add-to-list 'initial-frame-alist '(fullscreen . maximized))


;;;;;;;;;;;;;;;;;;
;; Generic Configs
;;;;;;;;;;;;;;;;;;
(add-hook! 'window-setup-hook #'toggle-frame-maximized)
(setq auth-sources '("~/.authinfo"))

;;;;;
;; UI
;;;;;
(after! compile
  (setq compilation-environment '("TERM=xterm-256color")))

(after! projectile
  (map! :leader "p I" #'projectile-ibuffer)

  (setq projectile-switch-project-action #'projectile-find-file)
  (setq projectile-track-known-projects-automatically t)
  (setq projectile-per-project-compilation-buffer t)
  (setq projectile-run-use-comint-mode t))

(use-package treemacs-evil
  :after treemacs
  :config
  :ensure t)

(setq indicate-empty-lines nil)

(after! zen-mode
  (add-hook 'zen-mode-hook
            (lambda ()
              (if zen-mode
                  (git-gutter-mode -1)
                (git-gutter-mode 1)))))

;;;;;;
;; RSS
;;;;;;

;;;;;;;;;;;;;
;; Treesitter
;;;;;;;;;;;;;
(use-package! tree-sitter
  :hook (prog-mode . turn-on-tree-sitter-mode)
  :hook (tree-sitter-after-on . tree-sitter-hl-mode)
  :config
  (require 'tree-sitter-langs)
  (setq tree-sitter-debug-jump-buttons t
        ;; and this highlights the entire sub tree in your code
        tree-sitter-debug-highlight-jump-region t
        treesit-language-source-alist
        '((bash "https://github.com/tree-sitter/tree-sitter-bash")
          (cmake "https://github.com/uyha/tree-s tter-cmake")
          (css "https://github.com/tree-sitter/tree-sitter-css")
          (elisp "https://github.com/Wilfred/tree-sitter-elisp")
          (go "https://github.com/tree-sitter/tree-sitter-go")
          (gomod "https://github.com/camdencheek/tree-sitter-go-mod")
          (dockerfile "https://github.com/camdencheek/tree-sitter-dockerfile")
          (html "https://github.com/tree-sitter/tree-sitter-html")
          (javascript "https://github.com/tree-sitter/tree-sitter-javascript" "master" "src")
          (json "https://github.com/tree-sitter/tree-sitter-json")
          (make "https://github.com/alemuller/tree-sitter-make")
          (markdown "https://github.com/ikatyang/tree-sitter-markdown")
          (python "https://github.com/tree-sitter/tree-sitter-python")
          (ruby "https://github.com/tree-sitter/tree-sitter-ruby")
          (rust "https://github.com/tree-sitter/tree-sitter-rust")
          (toml "https://github.com/tree-sitter/tree-sitter-toml")
          (tsx "https://github.com/tree-sitter/tree-sitter-typescript" "master" "tsx/src")
          (typescript "https://github.com/tree-sitter/tree-sitter-typescript" "master" "typescript/src")
          (yaml "https://github.com/ikatyang/tree-sitter-yaml"))))

;;;;;;;
;; GPG
;;;;;;;
(after! epg
  (setq epg-pinentry-mode 'loopback)
  (add-hook 'eglot-managed-mode-hook #'eglot-inlay-hints-mode))

;;;;;;;
;; DAP
;;;;;;;
(after! dap-mode
  (setq dap-auto-configure-mode t)

  (require 'dap-dlv-go))

;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Language Specific Configs
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(after! lsp-mode
  (setq lsp-enable-file-watchers t
        lsp-file-watch-threshold 5000))

(after! rust-mode
  (setq rust-format-on-save t))

(after! cider
  (add-hook 'cider-repl-mode-hook #'visual-line-mode)
  (set-popup-rules!
    '(("^\\*cider-repl"
       :side right
       :width 75
       :quit nil
       :ttl nil))))
