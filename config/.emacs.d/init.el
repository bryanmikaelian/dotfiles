;; Global Configs
(global-display-line-numbers-mode 1)

;; Packages
(straight-use-package
  '(mini-frame :type git :host github :repo "muffinmad/emacs-mini-frame"))

;; nano emacs
(straight-use-package
  '(nano :type git :host github :repo "rougier/nano-emacs"))

;; evil mode
(straight-use-package 'evil)
(straight-use-package 'evil-collection)
(straight-use-package 'evil-surround)

(setq evil-want-integration t)
(setq evil-want-keybinding nil)
(setq evil-want-C-u-scroll t)
(setq evil-want-C-i-jump nil)
(setq evil-respect-visual-line-mode t)
(setq evil-undo-system 'undo-redo)
(setq display-line-numbers-type 'relative)

;; Configs
(require 'nano)
(require 'nano-splash)
(require 'nano-command)
(require 'nano-minibuffer)
(require 'evil)

(evil-mode 1)
