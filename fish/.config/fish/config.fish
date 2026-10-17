# ---- Remove message ----
set -g fish_greeting

# ---- Zoxide (better cd) ----
zoxide init fish | source

# ---- Ruby ----
# set -gx LDFLAGS "-L/opt/homebrew/opt/ruby/lib"
# set -gx CPPFLAGS "-I/opt/homebrew/opt/ruby/include"
# set -gx PKG_CONFIG_PATH "/opt/homebrew/opt/ruby/lib/pkgconfig"

# Bison for Tebako
# export PATH="$(brew --prefix bison)/bin:$PATH"

# Ruby Homebrew auto-path (Fish)
# if test -d (brew --prefix ruby)
#   set ruby_bin (brew --prefix ruby)/bin
#   set ruby_gems (brew --prefix ruby)/lib/ruby/gems/(ruby -e "print RUBY_VERSION")[1..3]/bin
#   fish_add_path $ruby_bin $ruby_gems
# end

# ---- OpenJDK ----
set -gx PATH /opt/homebrew/opt/openjdk/bin $PATH

# ---- Go ----
# set -gx PATH (go env GOPATH)/bin $PATH

# ---- env UV ----
set -l uv_activate "$HOME/.venv/bin/activate.fish"
if test -f "$uv_activate"
    source "$uv_activate"
end

# ---- BAT Themes ----
set -gx BAT_THEME "Catppuccin Latte"

# ---- Config TERM for kitty ----
# set -gx TERM xterm-kitty

# ---- Config TERM ----
set -gx TERM xterm-256color

# ---- Config Editor ----
set -gx EDITOR "zed --wait"
set -gx VISUAL "zed --wait"
set -gx GIT_EDITOR "zed --wait"

# Alias Fish
abbr -a ll 'eza --icons=always -l'
abbr -a lla 'eza --icons=always -la'
abbr -a ls 'eza --icons=always'
abbr -a cd 'z'
abbr -a cd.. 'cd ..'
abbr -a e 'zed'
abbr -a e. 'zed .'
abbr -a n 'nvim'
abbr -a n. 'n .'
abbr -a vi 'zed'
abbr -a vim 'zed'
abbr -a hx. 'hx .'
abbr -a view 'nvim -R'
abbr -a vimdiff 'nvim -d'
abbr -a cat 'bat --paging=never --style=plain'
abbr -a less bat
abbr -a lg lazygit
abbr -a ld lazydocker
abbr -a gp "git pull"
abbr -a gP "git push"
abbr -a k kubectl
abbr -a kf kafkactl

# ---- Add the ssh key again on keychain ----
ssh-add --apple-use-keychain ~/.ssh/id_rsa_perso 2>/dev/null
