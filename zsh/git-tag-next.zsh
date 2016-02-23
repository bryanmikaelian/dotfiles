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
