ale-twig-lint - twig linter in ALE for Vim
==========================================

This plugin adds support for linting twig through [ALE](https://github.com/w0rp/ale) using [asm89/twig-lint](https://github.com/asm89/twig-lint).

Installation
------------

[ALE](https://github.com/w0rp/ale) and [twig-lint](https://github.com/asm89/twig-lint) must be installed.

### Installation with Pathogen

To install with [Pathogen](https://github.com/tpope/vim-pathogen):

```bash
cd ~/.vim/bundle
git clone https://github.com/rodrigoq/ale-twig-lint.git
```

### Installation with Vundle

To install using [Vundle](https://github.com/VundleVim/Vundle.vim):

```vim
Plugin 'rodrigoq/ale-twig-lint'
```

### Installation with Vim-Plug

To install with [Vim-Plug](https://github.com/junegunn/vim-plug):

```vim
Plug 'rodrigoq/ale-twig-lint'
```

and running `:PlugInstall`.


Configuration
-------------

Set the path of the linter, it depends on where did you installed twig-lint.

```vim
let g:ale_twig_twiglint_executable = 'vendor/bin/twig-lint'
" Or on windows
let g:ale_twig_twiglint_executable = 'vendor/bin/twig-lint.bat'
```

