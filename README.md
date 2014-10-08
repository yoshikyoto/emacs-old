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
`emacsclient -t *ファイル名*`
  * -t は -nw と同じ。これをしないとうまく日本語入力できない。

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


### 5行単位で移動するキーバインド

* M-n で5行次の行に移動するように設定
* M-p で5行前の行に移動するように設定



## Emacs デフォルトの設定に関する変更

### ディレクトリ内のファイルを編集できる wdired.el

ディレクトリモードで r キーを押すとファイル名などを変更できる wdired.el を使えるようにする。  
変更を反映させる場合は `C-c C-c` か `C-x C-s`  
変更を破棄する場合は `C-x C-c`

### マークからの選択範囲に色をつける

`C-@` でマーキングされた位置から現在のカーソルの位置までのマーキングに色をつける
transient-mark-mode を true にする。  
マーキングを解除する場合は `C-g` でいい。




## 外部ツール・アドオン
インストール等して導入したもの

### redo

* auto-install の場合  
`M-x install-elisp-from-emacswili redo+.el`

* バイトコンパイルの場合
<http://www.emacswiki.org/emacs/download/redo%2b.el>

今回は redo ディレクトリにこれが入っている。  
auto-install を使った場合は redo+ ディレクトリに入ると思うので注意。

`C-M-z` で redo できるように設定。


### auto complete

* auto-install を使う場合  
`M-x auto-install-batch auto-complete TAB`

* 以下、バイトコンパイルする場合  
現在 git でオープンな開発をしているらしい。  
リポジトリ: <https://github.com/auto-complete/auto-complete>  
参考: <http://qiita.com/ironsand/items/4a41ad24796457ccd8e6>

`git clone https://github.com/auto-complete/auto-complete`  
popup も必要らしいので、そちらも clone  
`git clone https://github.com/auto-complete/popup-el.git`  
それぞれ auto-complete, popup-el に入っている。

loadpathに auto-complete と popup-el ディレクトリを追加して、  
`(require 'auto-complete-config)` と `(ac-config-default)` を設定すれば良い。  



### 見かけの行でカーソルを移動する

C-p や C-n でカーソル移動した場合、折り返しは一行と数えられないが、それを一行とするような turn-on-screen-mode を設定することができる。  
が、Emacs のバージョンアップにより？直感的な行移動ができるようになっている模様なのでこの設定は除去した。



### auto-save-buffers.el (未設定)

`M-x install-elisp http://homepage3.nifty.com/oatu/emacs/archives/auto-save-buffers.el`


### Emacs で Web ブラウザを使う w3m

* TODO: Future Work


### Emacs twittering mode

Emacs twttering mode が導入されています。  
/lisp の中身が twittering-mode 関連のファイルとなります。  
ユーザーの設定が twittering-mode-config.el に記述してある。(gitignored)
このあたりもうちょっとどうにかしたい気がする。  
参考: [EmacsでTwitterできるようにする](http://blog.k-sakabe.com/?p=4894)




## メモ的なこと

実装しておくと便利かもと思ったけど、優先度の問題から後回しにしていることとか。

参考図書: Emacs テクニックバイブル  
p はこの図書におけるページ数を指す

* キーバインドも更なる改善 (p73)
  * C-h に関する設定
* リモートのファイルにアクセスする (p103)
* ローマ字での日本語インクリメンタルサーチ (p113)
  * インクリメンタルサーチに関する設定 (p111) を先にした方がいいかも
* カーソル行のハイライトに関する設定 (p116)
* ファイル作成時のテンプレート挿入 (p122)
* 矩形を選択しやすくする (p124)
* 正規表現を対話的に作成する (p148)
  * 正規表現にマッチする部分がリアルタイムでハイライトしてくれる？
* grep検索結果を編集する (p163)
* follow-mode (p170)
  * `M-x follow-mode` で follow-mode に
  * 長いコードとかを二行に表示できる。
  * 画面分割してかつ follow-mode にするには `M-x follow-delete-other-windows-and-split`