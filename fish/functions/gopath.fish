function gopath
    if test $argv[1] 
      if test $argv[1] = cms
        cd $GOPATH/src/code.hellotalk.com/cms
      else if test $argv[1] = im
        cd $GOPATH/src/code.hellotalk.com/im  
      else if test $argv[1] = ht
        cd $GOPATH/src/code.hellotalk.com   
      else if test $argv[1] = costa
        cd $GOPATH/src/github.com/costa92
      else if test $argv[1] = github
        cd $GOPATH/src/github.com/
      end
    else 
      cd $GOPATH/src 
    end
end
