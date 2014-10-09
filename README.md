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
* 以降 Emacs を起動するときは以下のように起動します。  
`emacsclient -t *ファイル名*`
  * -t は -nw と同じ。これをしないとうまく日本語入力できない。
* TODO: daemon を kill したい場合は？

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


### 矩形を選択しやすくする sense-region

sense-region.el を使わなくても、標準で cua-mode というのを使えばできる模様。  
`(cua-mode t)` とすればいい。詳しくは設定ファイルで。

`C-x SPC` C-x (スペース) で矩形選択を行う。  
Emacs のコピーは ESC-w


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


### grep-edit

`M-x grep` で grep が使える。  
ここで編集が行えるようにする。

* auto-install を使うなら `M-x install-elisp-from-emacswiki grep-edit.el`
* Emacs Wiki なら <http://www.emacswiki.org/emacs-en/download/grep-edit.el>
* 動作確認まだしてない (p159)


### 見かけの行でカーソルを移動する

C-p や C-n でカーソル移動した場合、折り返しは一行と数えられないが、それを一行とするような turn-on-screen-mode を設定することができる。  
が、Emacs のバージョンアップにより？直感的な行移動ができるようになっている模様なのでこの設定は除去した。



### auto-save-buffers.el (未設定)

`M-x install-elisp http://homepage3.nifty.com/oatu/emacs/archives/auto-save-buffers.el`


### Emacs で Web ブラウザを使う w3m

* TODO: Future Work


### Mew

GitHub から clone します: <https://github.com/kazu-yamamoto/Mew>

`M-x mew` で起動します。



### gist

Emacs から Gist を使えるようにする。  
GitHub から gist.el を clone する。  
<https://github.com/defunkt/gist.el>

関連ライブラリも設定する必要がある  
以下のものを clone する。

* pache <https://github.com/sigma/pcache>
* logito <https://github.com/sigma/logito>
* (Emacs 24 の場合は不要) tabulated-list.el <https://github.com/sigma/tabulated-list.el>
* gh.el <https://github.com/sigma/gh.el>

clone したものは tabulated-list.el 以外すべて含まれている。

**使い方**

* M-x gist-buffer  
username, password の入力を求められて、開いているファイルのgistを作成する。
* M-x gist-biffer-private  
private で作成する場合
* M-x gist-region  
マーカーで選択した部分だけ
* M-x gist-region-private
* M-x gist-fetch  
Gist ID の入力を求められ、Gistのコードをダウンロードして表示する。
  * Gist ID とは、http://gist.github.com/XXXXX.txt の XXXXX の部分



### Emacs twittering mode

Emacs twttering mode が導入されています。  
/lisp の中身が twittering-mode 関連のファイルとなります。  
ユーザーの設定が twittering-mode-config.el に記述してある。(gitignored)
このあたりもうちょっとどうにかしたい気がする。使わない場合コメントアウトしてください。  
参考: [EmacsでTwitterできるようにする](http://blog.k-sakabe.com/?p=4894)  
[Emacs Wiki](http://www.emacswiki.org/emacs/TwitteringMode-ja)

**使い方**

* `M-x twit` で twittering-mode へ
* `C-c C-f` twittering-friends-timeline フレンドタイムラインを表示
* `C-c C-r` twittering-replies-timeline 自分へのリプライを表示
* `C-c C-u` twittering-user-timeline 自分自身のユーザータイムラインを表示
* `C-c C-d` twittering-direct-messages-timeline DMを表示
* `L` twittering-other-user-list-interactive リストを表示
* `C-c C-q` twittering-search 検索
* `f` twittering-switch-to-next-timeline 次のバッファへ
* `b` twittering-switch-to-previous-timeline 前のバッファへ
* `u` twittering-update-status-intaractive つぶやく
* `RET` twittering-enter 返信/URLにジャンプ
* `g` twittering-current-timeline タイムラインを更新する
* `n` twittering-goto-next-status-of-user そのユーザーの次のつぶやきに移動
* `p` twittering-goto-previous-status-of-user そのユーザーの前のつぶやきに移動

* twittering-status-format 変数でタイムラインの表示フォーマットの変更が可能
  * `(setq twittring-status-format "%i %s, %@:\n %t // from %f%L")` のように指定可能
  * %s スクリーンネーム
  * %S 名前
  * %i アイコン
  * %d user description
  * %l location
  * %L " [location]"
  * %u url
  * %j user.id
  * %p 鍵かどうか
  * %c ユーザー登録日時
  * %@ 〜秒前
  * %t 本文
  * %f クライアント
  * %# tweet id

* F4 で短縮URLに

* CUI でアイコンを表示させることはできるのか




## メモ的なこと

実装しておくと便利かもと思ったけど、優先度の問題から後回しにしていることとか。

参考図書: Emacs テクニックバイブル  
p はこの図書におけるページ数を指す

* キーバインドも更なる改善 (p73)
  * C-h に関する設定など
* tramp リモートのファイルにアクセスする (p103)
  * `C-x C-f` で `/METHOD:USERNAME@HOSTNAME:FILENAME` とすることでリモートのファイルを編集できる。  
例: `C-x C-f /ssh:user@utakatanet.dip.jp:test.txt`
  * root権限で編集する場合は、METHOD を sudo とする
* migemo.el ローマ字での日本語インクリメンタルサーチ (p113)
* em.el カーソル行のハイライトに関する設定 (p116)
* ファイル作成時のテンプレート挿入 (p122)
* 正規表現を対話的に作成する (p148)
  * 正規表現にマッチする部分がリアルタイムでハイライトしてくれる？
  * `M-x re-builder`
* follow-mode (p170)
  * `M-x follow-mode` で follow-mode に
  * 長いコードとかを二行に表示できる。
  * 画面分割してかつ follow-mode にするには `M-x follow-delete-other-windows-and-split`