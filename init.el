; Change key bind
; e.g. (define-key global-map (kbd "C-x C-y") 'foo)
; (global-set-key (kbd "C-z") 'undo)


; setting for emacsclient Emacs 23 以降は不要なのでこの設定は削除しました
;(server-start)
;(defun iconify-emacs-when-server-is-done ()
;  (unless serber-client (iconify-frame)))
; 終了時にemacsをアイコン化する設定
; ここは好みに応じて設定する
;(add-hook 'server-done-hook　'iconify-emacs-when-server-is-done)
; C-x C-c に割り当てる
;(define-key global-map (kbd "C-x C-c") 'server-edit)
; M-x exit に本来の C-x C-c の終了を割り当てる
(defalias 'exit 'save-buffers-kill-emacs)

; setting for auto-install.el
;(add-to-list 'load-path "/.emacs.d/auto-install/")
;(add-to-list 'load-path (expand-file-name "~/.emacs.d/auto-install/"))
;(require 'auto-install)
;(auto-install-update-emacswiki-package-name t)
;(auto-install-compatibility-setup)
;(setq ediff-window-setup-function 'ediff-setup-windows-plain)



; キーバインドの設定
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

; C-z を undo に、 susoend を C-t に変更
(define-key global-map (kbd "C-z") 'undo)
(define-key global-map (kbd "C-t") 'suspend-emacs)

; M-x, M-p で 5行移動できるように設定
(define-key global-map (kbd "M-n") (kbd "C-u 5 C-n"))
(define-key global-map (kbd "M-p") (kbd "C-u 5 C-p"))

; setting for wdired.el ディレクトリ内のファイル編集
(require 'wdired)
(define-key dired-mode-map "r" 'wdired-change-to-wdired-mode)

; setting for transient mark mode
; マークの範囲に色をつける
(setq transient-mark-mode t)

;cua-mode
(cua-mode t)
(setq cua-enable-cua-keys nil) ; 不要なキーバインドは使わない
; Spaec にキーバインドを
(define-key global-map (kbd "C-x SPC") 'cua-set-rectangle-mark)

; 見かけの行（折り返し）を含めたカーソル移動をする設定
;(require 'screen-lines)
;(add-hook 'text-mode-hook 'turn-on-screen-lines-mode)


; 外部ツールに関する設定
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

; setting for redo+
(add-to-list 'load-path (expand-file-name "~/.emacs.d/redo"))
(require 'redo+)
(define-key global-map (kbd "C-M-z") 'redo)
(setq undo-no-redo t)
; set limit to undo and redo
(setq undo-limit 600000)
(setq undo-strong-limit 900000)

; setting for auto-complete
(add-to-list 'load-path "~/.emacs.d/popup-el")
(add-to-list 'load-path "~/.emacs.d/auto-complete")
(require 'auto-complete-config)
(ac-config-default)

; grep-edit
(add-to-list 'load-path "~/.emacs.d/grep-edit")
(require 'grep-edit)

; Setting for w3m
;(add-to-list 'load-path "~/.emacs.d/emacs-w3m")
;(require 'w3m-load)

; Setting for mew
(add-to-list 'load-path "~/.emacs.d/Mew")
(autoload 'mew "mew" nil t)
(autoload 'mew-send "mew" nil t)

; Setting for gist;
; lib
(add-to-list 'load-path "~/.emacs.d/pcache")
(require 'pcache)
(add-to-list 'load-path "~/.emacs.d/logito")
(require 'logito)
(add-to-list 'load-path "~/.emacs.d/gh.el")
(require 'gh)
; for gist
(add-to-list 'load-path "~/.emacs.d/gist.el")
(require 'gist)

; Setting for Emacs twittering mode
(add-to-list 'load-path (expand-file-name "~/.emacs.d/twittering-mode"))
(require 'twittering-mode)
(load "~/.emacs.d/twittering-mode-config.el")
