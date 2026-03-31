;;=====================================================================
;; MELPA
;;=====================================================================
(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)

;;=====================================================================
;; Litter Files
;;=====================================================================
;; Disable backup files (file~)
(setq make-backup-files nil)
;; Disable auto-save files (#file#)
(setq auto-save-default nil)
;; Disable lockfiles (.#file)
(setq create-lockfiles nil)

;;=====================================================================
;; Theme
;;=====================================================================
(unless (package-installed-p 'gruvbox-theme)
  (package-refresh-contents)
  (package-install 'gruvbox-theme))
(load-theme 'gruvbox-dark-medium t)

;;=====================================================================
;; Font
;;=====================================================================
(set-frame-font "DepartureMono Nerd Font Mono" nil t) 

;;=====================================================================
;; GUI Elements
;;=====================================================================
(menu-bar-mode -1)
(scroll-bar-mode -1)
(tool-bar-mode -1)

;;=====================================================================
;; Vertical Ruler
;;=====================================================================
(setq display-fill-column-indicator-column 72)
(display-fill-column-indicator-mode 1)

;;=====================================================================
;; Org Mode
;;=====================================================================
(global-set-key (kbd "C-c l") #'org-store-link)
(global-set-key (kbd "C-c a") #'org-agenda)
(global-set-key (kbd "C-c c") #'org-capture)

;;=====================================================================
;; Custom Variables
;;=====================================================================
(custom-set-variables
  '(org-agenda-files (quote ("~/Code/Notes/"))))
