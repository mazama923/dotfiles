# -------------------
# Configurations Git Prompt
# -------------------
set -g __fish_git_prompt_show_informative_status 1
set -g __fish_git_prompt_showcolorhints 1
set -g __fish_git_prompt_showupstream verbose

# Couleurs des états Git
set -g __fish_git_prompt_color_branch brmagenta -i
set -g __fish_git_prompt_color_dirtystate white
set -g __fish_git_prompt_color_invalidstate brred
set -g __fish_git_prompt_color_merging yellow
set -g __fish_git_prompt_color_stagedstate yellow
set -g __fish_git_prompt_color_upstream_ahead green
set -g __fish_git_prompt_color_upstream_behind brred

# Icônes pour différents états
set -g __fish_git_prompt_char_cleanstate         ' 👍  '
set -g __fish_git_prompt_char_conflictedstate    ' 😭 '
set -g __fish_git_prompt_char_dirtystate         ' 💩  '
set -g __fish_git_prompt_char_invalidstate       ' 🤮  '
set -g __fish_git_prompt_char_stagedstate        ' 🚥  '
set -g __fish_git_prompt_char_stashstate         ' 📦  '
set -g __fish_git_prompt_char_stateseparator     ' | '
set -g __fish_git_prompt_char_untrackedfiles     ' 🔍  '
set -g __fish_git_prompt_char_upstream_ahead     ' 👆 '
set -g __fish_git_prompt_char_upstream_behind    ' 👇  '
set -g __fish_git_prompt_char_upstream_diverged  ' 🚧  '
set -g __fish_git_prompt_char_upstream_equal     ' 💯 '

# -------------------
# Prompt principal
# -------------------
function fish_prompt
    # 1. Affiche le venv Python actif en magenta, si dispo :
    # if set -q VIRTUAL_ENV
    #     set_color magenta
    #     printf '(%s) ' (basename "$VIRTUAL_ENV")
    #     set_color normal
    # end

    # 2. Affichage SSH, user@machine et couleur selon root
    set -l base_color (test (id -u) -eq 0; and echo red; or echo green)
    if set -q SSH_CONNECTION
        set_color --background=yellow black
        printf '[SSH] '
        set_color normal
    end
    set_color $base_color
    printf '%s@%s ' (whoami) (hostname -s)

    # 3. Heure HH:MM discrète en gris
    set_color brblack
    printf '[%s]' (date "+%H:%M")
    set_color normal
    printf ' '

    # 4. Dossier courant en bleu gras
    set_color --bold blue
    printf '%s' (prompt_pwd)
    set_color normal

    # 5. Statut git, seulement si dans un repo
    if test -n (fish_git_prompt)
        printf '%s ' (fish_git_prompt)
    end

    # 6. Prompt final, emoji selon user/root
    set_color $base_color
    echo -n (test (id -u) -eq 0; and echo '⚡️'; or echo '🐠')
    set_color normal
    echo -n ' '
end
