alias gl='git pull'
alias gp='git push'
alias gcl='git clean -f'
alias gd='git diff'
alias gca='git commit -a'
alias gco='git checkout'
alias gb='git branch'
alias gs='git status'
alias grm="git status | grep deleted | awk '{print \$3}' | xargs git rm"
alias changelog='git log `git log -1 --format=%H -- CHANGELOG*`..; cat CHANGELOG*'
alias gsiu='git submodule init && git submodule update'
alias gsu='git submodule foreach git pull'

function git-tag-next {
    PREV_TAG=`git describe | cut -d '-' -f 1`;
    TAG_PREFIX=`echo $PREV_TAG | sed -e 's/[0-9][0-9]*$//'`;
    CURR_TAG=`echo $PREV_TAG | sed -e 's/^[^0-9]*//'`;
    if [ -z $CURR_TAG ]; then
        echo "Can not parse tag!";
        return 1;
    fi;
    NEW_TAG=$(( $CURR_TAG + 1 ));
    NEW_TAG="${TAG_PREFIX}${NEW_TAG}";
    echo "Bumping tag from ${PREV_TAG} -> ${NEW_TAG}";
    MSG="$1";
    if [ -z "$MSG" ]; then
        MSG=$NEW_TAG;
    fi;
    git tag -a $NEW_TAG -m "${MSG}";
    # git push origin ${NEW_TAG}
}
