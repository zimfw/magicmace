magicmace
=========

Ideas and code taken from [xero's zsh prompt] and [eriner's prompt].

![magicmace theme]

What does it show?
------------------

  * Status segment:
    * Status code in error color when there was an error.
    * `b` when there are background jobs.
    * `r` when in a [ranger] spawned shell.
    * `v` when a python [venv] is activated.
  * Short working directory.
  * Git segment, only when you're in a git repo:
    * Current branch name, or commit short hash when in ['detached HEAD' state].
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

Requires Zim's [git-info] module to show git information.

[xero's zsh prompt]: http://code.xero.nu/dotfiles
[eriner's prompt]: https://github.com/zimfw/eriner
[magicmace theme]: https://zimfw.github.io/images/prompts/magicmace.png
[ranger]: https://github.com/ranger/ranger
[venv]: https://docs.python.org/3/library/venv.html
['detached HEAD' state]: http://gitfaq.org/articles/what-is-a-detached-head.html
[git-info]: https://github.com/zimfw/git-info
