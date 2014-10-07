; Change key bind

; Setting for Emacs twittering mode

(add-to-list 'load-path (expand-file-name "~/.emacs.d/lisp"))
(require 'twittering-mode)

(setq twittering-account-authorization 'authorized)
(setq twittering-oauth-access-token-alist
'(("oauth_token" . "83811178-wYRMTw9hAr6rAMWG0cOAYYfR6LcPoeiZxLuvaqxVM")
 ("oauth_token_secret" . "HvZ9u7rYs19dvWxIfOuVhduPrlb59z7tMb9NOAEaUboDD")
 ("user_id" . "83811178")
 ("screen_name" . "yoshiki_utakata")))
