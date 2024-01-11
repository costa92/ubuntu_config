function goto
    set cddir $argv[1]
    if test (count $argv) -ge 2
        set branch $argv[2]
    end
    if test $cddir = cmsapi
        set project $GOPATH/src/code.hellotalk.com/cms/cms-api
        if test -z $branch
            cd $project
            return 1
        else
            cd $project && git checkout $branch && git pull
        end
    end
    if test $cddir = cmsweb
        set project $HOME/code/web/cms-web
        if test -z $branch
            cd $project
            return 1
        else
            cd $project && git checkout $branch && git pull
        end
    end
    if test $cddir = cms
        cd $GOPATH/src/code.hellotalk.com/cms && ls
    end

    if test $cddir = im
        cd $GOPATH/src/code.hellotalk.com/im && ls
    end
end
