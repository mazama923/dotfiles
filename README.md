# dotfiles
My dotfiles for macOS

My dotfiles are managed by folder and deployed via symbolic links using [stow](https://www.gnu.org/software/stow/manual/stow.html).

My git repo is located at the root of my user directory because my stow folder structure depends on this location.

Dry run of symbolic links:

````fish
stow -nv */
````

Deploy symbolic links
````fish
stow */
````

To deploy the same development configuration as mine:

````fish
make all
````
