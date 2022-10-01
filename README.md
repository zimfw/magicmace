magicmace
=========

Ideas and code taken from [xero's zsh prompt] and [eriner's prompt].

<img width="706" src="https://zimfw.github.io/images/prompts/magicmace@2.png">

What does it show?
------------------

  * Status segment:
    * Status code in error color when there was an error.
    * `b` when there are background jobs.
    * `r` when in a [ranger] spawned shell.
    * `v` when a python [venv] is activated.
  * The current working directory.
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
| COLOR_ERROR  | Error text color         | red           |

Advanced settings
-----------------

You can customize how the current working directory is shown with the
[prompt-pwd module settings].

The git indicators can be customized by changing the following git-info module
context formats:

| Context name | Description       | Default format |
| ------------ | ----------------- | -------------- |
| branch       | Branch name       | `%b`           |
| commit       | Commit short hash | `%c...`        |
| ahead        | Ahead of remote   | `↑`            |
| behind       | Behind remote     | `↓`            |
| dirty        | Dirty state       | `*`            |

Use the following command to override a git-info context format:

    zstyle ':zim:git-info:<context_name>' format '<new_format>'

For detailed information about these and other git-info settings, check the
[git-info documentation].

These advanced settings must be overridden after the theme is initialized.

Requirements
------------

Requires Zim's [prompt-pwd] module to show the current working directory, and
[git-info] to show git information.

[xero's zsh prompt]: https://github.com/xero/dotfiles
[eriner's prompt]: https://github.com/zimfw/eriner
[ranger]: https://github.com/ranger/ranger
[venv]: https://docs.python.org/3/library/venv.html
['detached HEAD' state]: https://git-scm.com/docs/git-checkout#_detached_head
[prompt-pwd module settings]: https://github.com/zimfw/prompt-pwd/blob/master/README.md#settings
[git-info documentation]: https://github.com/zimfw/git-info/blob/master/README.md#settings
[prompt-pwd]: https://github.com/zimfw/prompt-pwd
[git-info]: https://github.com/zimfw/git-info
