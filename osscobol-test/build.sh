#!/bin/bash

BASEURL="http://www.osscons.jp/osscobol/files/"
DEFAULTFILEPATH="?action=cabinet_action_main_download&block_id=414&room_id=21&cabinet_id=11&file_id=362&upload_id=704"
DEFAULTFILE=opensource-cobol-1.5.0J-utf8.tar.gz

applypatch(){
    local target patchfile
    target=$1
    if [ -d /files/patches/$target ]; then
        if [ -d /work/$target ]; then
            ( cd /work/$target
            for patchfile in $(ls /files/patches/${target}/*.patch 2> /dev/null)
            do
	        patch -p0 <  $patchfile
            done
            )
        fi
    fi
}

extractall(){
    local tarball base
    for tarball in $(ls /files/opensource-cobol*.tar.gz 2> /dev/null)
    do 
        tar zxf $tarball -C /work
    done 
}

dobuild(){
    local target opt
    target=$1
    if (echo $target | grep -q 'utf8$'); then
        opt="--enable-utf8"
    else
        opt=""
    fi
    cd /work/${target}
    ./configure $opt
    make
}

dotestsh(){
    local target opt testsh
    target=$1
    if (echo $target | grep -q 'utf8$'); then
        opt="utf8"
    else
        opt="sjis"
    fi
    cd /work/${target}/tests
    for testsh in data-rep-O i18n_${opt} jp-compat run-O syntax
    do
        sh ./${testsh}
    done
    for testsh in data-rep run
    do
	mv ${testsh}.dir ${testsh}-O.dir
	mv ${testsh}.log ${testsh}-O.log
        sh ./${testsh}
    done
}

getdistribution() {
    curl -L -o /files/${DEFAULTFILE} ${BASEURL}${DEFAULTFILEPATH}
}

extract() {
    if [ ! $(ls -d /files/opensource-cobol*.tar.gz 2>/dev/null) ]; then
        getdistribution
    fi
    extractall
}

patchall() {
    local dir
    for dir in $(ls -d /work/opensource-cobol*)
    do
        base=${dir#/work/}
        applypatch $base
    done
}

buildall() {
    local dir flag
    flag=$1
    for dir in $(ls -d /work/opensource-cobol*)
    do
        base=${dir#/work/}
        dobuild $base
        if [ $? -eq 0 ]; then
            if [ "$flag" = "dotest" ]; then
                dotestsh $base
            fi
        fi
    done
}


case $1 in
patchbuild)
    extract && patchall && buildall
    ;;
build)
    extract && buildall
    ;;
patch)
    extract && patchall 
    ;;
test)
    extract && buildall dotest
    ;;
patchtest)
    extract && patchall && buildall dotest
    ;;
*)
    echo "Enter shell"
    ;;
esac
/bin/bash

