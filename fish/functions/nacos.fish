function nacos
    set nacospath /home/hellotalk/code/nacos
    set nacosenv $argv[1]
    if test $nacosenv = dev
        set nacosconf $nacospath/nacos-dev
        cd $nacosconf && git pull
    else if test $nacosenv = test
        set nacosconf $nacospath/nacos-test
        cd $nacosconf && git pull
    else if test $nacosenv = prod
        set nacosconf $nacospath/nacos-prod
        cd $nacosconf && git pull
    else
        echo 'nacosenv is not valid'
    end
end
