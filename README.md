# Emacs 設定ファイル

## キーバインド設定

(define-key *KEY_MAP* (kbd "*KEY*") '*COMMAND*) の形で設定  
例: ((上と下は同じ内容の設定となる)  
`(define-key global-map (kbd "C-x C-y") 'foo)`
`(define-key ctl-x-map (kbd "C-y") 'foo)'

## 外部ツール・アドオン

### auto-save-buffers.el

`M-x install-elisp http://homepage3.nifty.com/oatu/emacs/archives/auto-save-buffers.el`

### Emacs twittering mode

Emacs twttering mode が導入されています。  
/lisp の中身が twittering-mode 関連の設定となります。  
参考: [EmacsでTwitterできるようにする](http://blog.k-sakabe.com/?p=4894)