(require 'package)
(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/"))
(package-initialize)

(load-theme 'tangotango t)

(defun apache-jakarta-mode ()
 "The Java mode specialization for Apache Jakarta projects."
 (if (not (assoc "apache-jakarta" c-style-alist))
     ;; Define the Apache Jakarta cc-mode style.
     (c-add-style "apache-jakarta" '("java" (indent-tabs-mode . nil))))

 (c-set-style "apache-jakarta")
 (c-set-offset 'substatement-open 0 nil)
 (setq mode-name "Apache Jakarta"))

;; Activate Jakarta mode.
(if (fboundp 'jde-mode)
   (add-hook 'jde-mode-hook 'apache-jakarta-mode)
  (add-hook 'java-mode-hook 'apache-jakarta-mode))

;;(add-to-list 'load-path "~/.emacs.d/chuck-mode")
;;(require 'chuck-mode)

(let ((default-directory "/usr/local/share/emacs/site-lisp/"))
    (normal-top-level-add-subdirs-to-load-path))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(column-number-mode t)
 '(indent-tabs-mode nil)
 '(package-selected-packages
   '(tangotango-theme blacken scala-mode markdown-mode homebrew-mode dockerfile-mode)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
