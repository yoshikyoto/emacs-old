; Change key bind
; e.g. (define-key global-map (kbd "C-x C-y") 'foo)
; (global-set-key (kbd "C-z") 'undo)

; setting for auto-install.el
;(add-to-list 'load-path "/.emacs.d/auto-install/")
(add-to-list 'load-path (expand-file-name "~/.emacs.d/auto-install/"))
(require 'auto-install)
(auto-install-update-emacswiki-package-name t)
(auto-install-compatibility-setup)
(setq ediff-window-setup-function 'ediff-setup-windows-plain)

; C-z を undo に、 susoend を C-t に変更
(define-key global-map (kbd "C-z") 'undo)
(define-key global-map (kbd "C-t") 'suspend-emacs)

; Setting for Emacs twittering mode

(add-to-list 'load-path (expand-file-name "~/.emacs.d/lisp"))
(require 'twittering-mode)
(setq twittering-account-authorization 'authorized)
(setq twittering-oauth-access-token-alist
'(("oauth_token" . "83811178-wYRMTw9hAr6rAMWG0cOAYYfR6LcPoeiZxLuvaqxVM")
 ("oauth_token_secret" . "HvZ9u7rYs19dvWxIfOuVhduPrlb59z7tMb9NOAEaUboDD")
 ("user_id" . "83811178")
 ("screen_name" . "yoshiki_utakata")))
