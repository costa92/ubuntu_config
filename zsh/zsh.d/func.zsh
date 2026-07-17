unalias j 2>/dev/null


jzf() {
    local dir
    dir=$(autojump --stat | awk '{print $2}' | fzf) && cd "$dir"
}



