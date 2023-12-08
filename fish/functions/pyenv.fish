function pyenv
    set command $argv[1]
    set -e argv[1]

    switch "$command"
        case rehash shell command --sh
            source (pyenv init - --no-rehash | psub)
            source (pyenv init --path| psub)
            source (pyenv "$command" $argv | psub)
        case \*
            command pyenv "$command" $argv
    end
end
