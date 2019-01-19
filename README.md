magicmace
=========

Ideas and code taken from [xero's zsh prompt](http://code.xero.nu/dotfiles) and
[eriner's prompt](https://github.com/zimfw/eriner).

What does it show?
------------------

  * Status segment:
    * Status code in error color when there was an error.
    * `b` when there are background jobs.
    * `r` when in a [`ranger`](https://github.com/ranger/ranger) spawned shell.
    * `v` when a python [`venv`](https://docs.python.org/3/library/venv.html) is
      activated.
  * Short working directory.
  * Git segment, only when you're in a git repo:
    * Current branch name, or commit short hash when in
      ['detached HEAD' state](http://gitfaq.org/articles/what-is-a-detached-head.html).
    * `*` when in a dirty working tree.
    * `↑` and/or `↓` when there are commits ahead and/or behind of remote,
      respectively.

Settings
--------

This theme can be customized with the following environment variables. If the
variable is not defined, the respective default value is used.

| Variable     | Description              | Default value |
| ------------ | ------------------------ | ------------- |
| COLOR_ROOT   | Root-user mace color     | red           |
| COLOR_USER   | Non-root-user mace color | cyan          |
| COLOR_NORMAL | Normal text color        | white         |
| ERROR_COLOR  | Error text color         | red           |

Requirements
------------

Requires Zim's [`git-info`](https://github.com/zimfw/git-info) module to show
git information.
