magicmace
=========

Ideas and code taken from [xero's zsh prompt](http://code.xero.nu/dotfiles) and
[eriner's prompt](https://github.com/zimfw/eriner).

What does it show?
------------------

  * Status segment:
    * Status code in error color (see below) when there was an error.
    * `b` when there are background jobs.
    * `r` when in a [`ranger`](https://github.com/ranger/ranger) spawned shell.
    * `v` when a python [`venv`](https://docs.python.org/3/library/venv.html) is
      activated.
  * Short working directory.
  * Git segment:
    * Current branch name, or commit short hash when in
      ['detached HEAD' state](http://gitfaq.org/articles/what-is-a-detached-head.html).
    * `*` when in a dirty working tree.
    * `↑` and/or `↓` when there are commits ahead and/or behind of remote,
      respectively.

Usage
-----

This theme is color-scheme-able. You can customize it using:

    prompt magicmace [user_color] [root_color] [normal_color] [error_color]

The parameters with their default values are the following:

  1. Non-root user mace color: `cyan`
  2. Root user mace color: `red`
  3. Normal text color: `white`
  4. Error text color: `red`

If you enabled Zim's [`prompt`](https://github.com/zimfw/prompt) module, you can
set this as your default theme with the following zstyle:

    zstyle ':zim:prompt' theme 'magicmace'

Additional customization parameters can be passed too. For example:

    zstyle ':zim:prompt' theme 'magicmace' 'white' 'yellow' 'cyan'

Requirements
------------

Requires Zim's [`git-info`](https://github.com/zimfw/git-info) module to show
git information.
