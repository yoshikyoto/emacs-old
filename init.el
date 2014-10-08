; Change key bind
; e.g. (define-key global-map (kbd "C-x C-y") 'foo)
; (global-set-key (kbd "C-z") 'undo)

; setting for emacsclient
(server-start)
(defun iconify-emacs-when-server-is-done ()
  (unless serber-client (iconify-frame)))
; 終了時にemacsをアイコン化する設定
; ここは好みに応じて設定する
(add-hook 'server-done-hook　'iconify-emacs-when-server-is-done)
; C-x C-c に割り当てる
(define-key global-map (kbd "C-x C-x") 'server-edit)
; M-x exit に本来の C-x C-c の終了を割り当てる
(defalias 'exit 'save-buffers-kill-emacs)

; setting for auto-install.el
;(add-to-list 'load-path "/.emacs.d/auto-install/")
;(add-to-list 'load-path (expand-file-name "~/.emacs.d/auto-install/"))
;(require 'auto-install)
;(auto-install-update-emacswiki-package-name t)
;(auto-install-compatibility-setup)
;(setq ediff-window-setup-function 'ediff-setup-windows-plain)

; C-z を undo に、 susoend を C-t に変更
(define-key global-map (kbd "C-z") 'undo)
(define-key global-map (kbd "C-t") 'suspend-emacs)

; setting for wdired.el ディレクトリ内のファイル編集
(require 'wdired)
(define-key dired-mode-map "r" 'wdired-change-to-wdired-mode)

; setting for transient mark mode
; マークの範囲に色をつける
(setq transient-mark-mode t)

; Setting for Emacs twittering mode

(add-to-list 'load-path (expand-file-name "~/.emacs.d/lisp"))
(require 'twittering-mode)
(setq twittering-account-authorization 'authorized)
(setq twittering-oauth-access-token-alist
'(("oauth_token" . "83811178-wYRMTw9hAr6rAMWG0cOAYYfR6LcPoeiZxLuvaqxVM")
 ("oauth_token_secret" . "HvZ9u7rYs19dvWxIfOuVhduPrlb59z7tMb9NOAEaUboDD")
 ("user_id" . "83811178")
 ("screen_name" . "yoshiki_utakata")))
