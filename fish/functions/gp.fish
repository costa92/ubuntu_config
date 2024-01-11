function gp --wraps='git push' --description 'alias gp git push'
    set remote_branches $(git branch -r | sed 's/origin\///' | sed 's/ //g')
    set current_branch $(git rev-parse --abbrev-ref HEAD)
    set remote_branch_exists 0
    for o in $remote_branches
        if test $o = $current_branch
            set remote_branch_exists 1
        end
    end
    if test $remote_branch_exists = 0
        echo "remote branch $current_branch does not exist"
        git push --set-upstream origin $current_branch
    else
        git push $argv
    end
end
