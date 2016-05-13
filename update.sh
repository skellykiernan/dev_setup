#!/usr/bin/env sh
proxy=http://proxy:8080
export FTP_PROXY=$proxy
export HTTP_PROXY=$proxy
export HTTPS_PROXY=$proxy
LOCAL_DIR=/home/dkiernan/local

function update_git() {
    repo_name=$1
    repo_base=$2
    if [[ -d $repo_name ]]; then
        echo "---- Update repo $repo_name"
        cd $repo_name
        git pull
        cd ..
    else
        echo "---- Clone repo $repo_name"
        git clone $repo_base/$repo_name
    fi
}

function dld_pkg() {
    pkg_name=$1
    pkg_site=$2
    if [[ -e $pkg_name ]]; then
        echo "---- lib $pkg_name aleady exists"
    else
        echo "---- getting lib $pkg_name"
        wget -4 $pkg_site/$pkg_name
        tar xzvf $pkg_name
    fi
   
}


function bld_pkg() {
    pkg_name=$1
    if [[ $# > 1 ]]; then
        extra_flags=$2
    else
        extra_flags=""
    fi
    cd $pkg_name
    ./configure --prefix=$LOCAL_DIR $extra_flags
    make
    make install
    cd ..
}


#- - - - - - - - - - - - - - - - - - - - -
cd ..

#- - - - - - - - - - - - - - - - - - - - -
# Build and Install Libraries 
#- - - - - - - - - - - - - - - - - - - - -
dld_pkg pcre-8.38.tar.gz http://tenet.dl.sourceforge.net/project/pcre/pcre/8.38
echo "---- Build the pcre library"
bld_pkg pcre-8.38 
 
dld_pkg libevent-2.0.22-stable.tar.gz https://github.com/libevent/libevent/releases/download/release-2.0.22-stable
echo "---- Build the libevent  library"
bld_pkg libevent-2.0.22-stable

## DKI TODO , compilier error 
## dld_pkg liblzma-4.27.1.tar.gz https://sourceforge.net/projects/liblzma/files/liblzma/4.27.1
## bld_pkg liblzma-4.27.1 "CPPFLAGS=-Wno-error CFLAGS=-Wno-error LDFLAGS=-Wno-error"


#- - - - - - - - - - - - - - - - - - - - -
# Get my configuration files 
#- - - - - - - - - - - - - - - - - - - - -
update_git dotfiles https://github.com/skellykiernan

#- - - - - - - - - - - - - - - - - - - - -
# Build and Install VIM
#- - - - - - - - - - - - - - - - - - - - -
update_git vim https://github.com/vim
echo "---- build the VIM"
bld_pkg vim "CFLAGS=-m32 LDFLAGS=-m32"

#- - - - - - - - - - - - - - - - - - - - -
# Build and Install "The Silver Searcher
#- - - - - - - - - - - - - - - - - - - - -
update_git the_silver_searcher https://github.com/ggreer
echo "---- build the siliver searcher"
export PKG_CONFIG_PATH=/home/dkiernan/local/lib/pkgconfig/
cd the_silver_searcher
./build.sh
cd ..

#- - - - - - - - - - - - - - - - - - - - -
# Build and Install Tools 
#- - - - - - - - - - - - - - - - - - - - -
## TMUX
dld_pkg tmux-2.2.tar.gz https://github.com/tmux/tmux/releases/download/2.2
export LIBRARY_PATH=$LD_LIBRARY_PATH
export C_INCLUDE_PATH=/home/dkiernan/local/include/
bld_pkg tmux-2.2
## Tree
dld_pkg tree-1.7.0.tgz http://mama.indstate.edu/users/ice/tree/src
cd tree-1.7.0
make
cp tree $LOCAL_DIR/bin
cd ..


#- - - - - - - - - - - - - - - - - - - - -
# update from configuration repo dotfiles 
#- - - - - - - - - - - - - - - - - - - - -
# TODO
