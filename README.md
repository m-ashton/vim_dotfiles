### Elmward's vim dotfiles

To install on a new machine, clone as `~/.vim` (`git clone <repo> ~/.vim`), `cd ~./vim`, and `git submodule update --init`. Finally symlink the vimrc: `ln -s ~/.vim/vimrc ~/.vimrc`

#### Plugin Management

Plugins are added as git submodules and bundled with pathogen, per [vimcasts](http://vimcasts.org/episodes/synchronizing-plugins-with-git-submodules-and-pathogen/)

To add a new plugin, from within the `bundle` directory: `git submodule add <clone link> && git add . && git commit -m "Add <blah> plugin"`

Note: the included config will add fzf.vim, which doesn't include the underlying fzf executable. [See the fzf repo](https://github.com/junegunn/fzf) for how to install it.
