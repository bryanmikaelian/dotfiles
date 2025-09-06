;; Global Configs
(global-display-line-numbers-mode 1)

;; nano emacs
(straight-use-package
  '(nano :type git :host github :repo "rougier/nano-emacs"))
(require 'nano)
(require 'nano-command)

;; evil mode
(straight-use-package 'evil)
(straight-use-package 'evil-collection)
(evil-mode 1)

;; general.el + which-key
(straight-use-package 'general)

;; org mode
(straight-use-package 'org)
(require 'org)

(global-set-key (kbd "C-c a") 'org-agenda)

(setq org-agenda-files '("~/org/inbox.org" "~/org/work.org" "~/org/personal.org")
      org-return-follows-link t ;; RET opens org mode links
      org-ellipsis "…" ;; Replace Ellipsis with custom text
      org-pretty-entities t ;; render UTC-8 characters for things like \alpha
      org-hide-emphasis-markers t ;; hire things italics, bold, etc
      org-agenda-block-separator "") ;; newline seperator between blocks in agenda
