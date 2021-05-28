(require 'use-package)

(setq erlang-root-dir "/usr/lib/erlang")
(setq load-path (cons "/usr/lib/erlang/lib/tools-3.5/emacs"
		      load-path))
(setq exec-path (cons "/usr/lib/erlang/bin" exec-path))

(require 'erlang-start)
