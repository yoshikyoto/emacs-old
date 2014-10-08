# Emacs 設定ファイル

bash の方の設定については <https://github.com/yoshikyoto/bb> を参照

## Emacs Client の設定など

### emacsclient の設定と使い方

emacs.d への設定

    (server-start)
    (defun iconify-emacs-when-server-is-done ()
      (unless serber-client (iconify-frame)))

* あらかじめ Emacs を daemon で起動しておきます  
`emacs --daemon`  
* 以降 Emacs を起動するときは以下の要に起動します。  
`emacsclient *ファイル名*`

### C-x C-c に関する設定

本来の C-x C-c で終了してしまうと、emacsclient で起動できなくなってしまうので  
* C-x C-c では emacs を kill しないように設定
* save-buffers-kill-emacs (本来のC-x C-c) は M-x exit で実行できるようにします
  * 設定を反映させるにはこちらを利用

## Emacs Lisp インストーラーの導入

auto-install について: http://www.emacswiki.org/emacs/AutoInstall

* http://www.emacswiki.org/emacs/download/auto-install.el  
から auto-install.el をダウンロード

* バイトコンパイルを行う  
`emacs --batch -Q -f batch-byte-compile auto-install.el`

* 設定ファイルに設定を追加  
インターネットからパッケージを取得するため、起動に時間がかかる場合がある。

* **Emacs のカスタマイズ等するとき以外は不要？普段はコメントアウトしてこの機能は切っています**

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

## Emacs デフォルトの設定に関する変更

### ディレクトリ内のファイルを編集できる wdired.el

ディレクトリモードで r キーを押すとファイル名などを変更できる wdired.el を使えるようにする。  
変更を反映させる場合は `C-c C-c` か `C-x C-s`  
変更を破棄する場合は `C-x C-c`

### マークからの選択範囲に色をつける

`C-@` でマーキングされた位置から現在のカーソルの位置までのマーキングに色をつける
transient-mark-mode を true にする。  
マーキングを解除する場合は `C-g` でいい。


### 見かけの行でカーソルを移動する

C-p や C-n でカーソル移動した場合、折り返しは一行と数えられないが、それを一行とするような turn-on-screen-mode を設定した。


## 外部ツール・アドオン
インストール等して導入したもの

### auto-save-buffers.el

`M-x install-elisp http://homepage3.nifty.com/oatu/emacs/archives/auto-save-buffers.el`

### Emacs twittering mode

Emacs twttering mode が導入されています。  
/lisp の中身が twittering-mode 関連の設定となります。  
参考: [EmacsでTwitterできるようにする](http://blog.k-sakabe.com/?p=4894)


## Future Works 