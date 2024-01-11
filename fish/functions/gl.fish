function gl --wraps='git pull' --description 'alias gl git pull'
    set remote_branches $(git branch -r | sed 's/origin\///')
    set current_branch $(git rev-parse --abbrev-ref HEAD)
    set remote_branch_exists 0
    for o in $remote_branches
        if test $o != $current_branch
            set remote_branch_exists 1
        end
    end
    if test $remote_branch_exists = 0
        echo "remote branch $current_branch does not exist"
        git pull --set-upstream origin $current_branch
    else
        git pull $argv
    end
end
