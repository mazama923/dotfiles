# ---- Remove message ----
set -g fish_greeting

# ---- Zoxide (better cd) ----
zoxide init fish | source

# ---- Rust ----
source "$HOME/.cargo/env.fish"

# ---- Ruby ----
set -gx LDFLAGS "-L/opt/homebrew/opt/ruby/lib"
set -gx CPPFLAGS "-I/opt/homebrew/opt/ruby/include"
set -gx PKG_CONFIG_PATH "/opt/homebrew/opt/ruby/lib/pkgconfig"

# ---- OpenJDK ----
set -gx PATH /opt/homebrew/opt/openjdk/bin $PATH

# ---- Go ----
set -gx PATH (go env GOPATH)/bin $PATH

# ---- env UV ----
source $HOME/.venv/bin/activate.fish

# ---- BAT Themes ----
set -x BAT_THEME "Catppuccin Latte"

# ---- Config TERM ----
set -x TERM xterm-256color

# Alias Fish (Fish utilise `abbr` au lieu de `alias` pour les raccourcis)
abbr -a ll 'eza --icons=always -l'
abbr -a lla 'eza --icons=always -la'
abbr -a ls 'eza --icons=always'
abbr -a cd 'z'
abbr -a cd.. 'cd ..'
abbr -a n 'nvim'
abbr -a n. 'n .'
abbr -a vi 'nvim'
abbr -a vim 'nvim'
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

# --- Functions ---
function delds
    find . -name '.DS_Store' -type f -delete
    echo "Remove fucking .DS_Store"
end

