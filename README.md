# Emacs 設定ファイル

## Emacs Lisp インストーラーの導入

## キーバインド設定

(define-key *KEY_MAP* (kbd "*KEY*") '*COMMAND*) の形で設定  
例: ((上と下は同じ内容の設定となる)  
`(define-key global-map (kbd "C-x C-y") 'foo)`  
`(define-key ctl-x-map (kbd "C-y") 'foo)`

### C-z に関する変更
* C-z に設定されていた suspend-emacs を C-t に移動
  * C-t はもともと、前後の文字を入れ替える transpose-chars が設定されていた
* 代わりに C-z には undo を設定
  * undo は C-/ にも設定されている
  * redo の設定も後にする


## 外部ツール・アドオン

### auto-save-buffers.el

`M-x install-elisp http://homepage3.nifty.com/oatu/emacs/archives/auto-save-buffers.el`

### Emacs twittering mode

Emacs twttering mode が導入されています。  
/lisp の中身が twittering-mode 関連の設定となります。  
参考: [EmacsでTwitterできるようにする](http://blog.k-sakabe.com/?p=4894)