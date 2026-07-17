function nacos
    set nacospath /home/hellotalk/code/nacos
    if test $argv[1] 
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
    else
	echo 'nacos argv error'
    end
end
