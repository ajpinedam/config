#!/bin/bash

if [ "$#" -ne 1 ]
then
  echo "Usage: mvbranch.sh origin my_branch my_renamed_branch"
  exit 1
fi

REMOTE=$1
OLD_BRANCH=$2
NEW_BRANCH=$3
TEMP=$NEW_BRANCH

echo -e "\e[32mRename branch $OLD_BRANCH to $NEW_BRANCH on $REMOTE.\e[0m"
echo '----------'

echo -e "\e[32mTrack remote branch into temp branch.\e[0m"
git branch --track $TEMP $REMOTE/$OLD_BRANCH	|| exit "$?"		# Track remote branch

echo -e "\e[32mCheckout temp branch.\e[0m"
git checkout $TEMP

echo -e "\e[32mPush new branch.\e[0m"
git push --set-upstream $REMOTE $NEW_BRANCH || exit "$?"   # Push new branch, set local branch to track the new remote

echo -e "\e[32mDelete remote branch.\e[0m"
git push $REMOTE :$OLD_BRANCH	|| exit "$?"                 # Delete remote branch    

echo -e "\e[32mCheckout develop.\e[0m"
git checkout develop || exit "$?"

echo -e "\e[32mDelete temp branch.\e[0m"
git branch -d $TEMP || exit "$?"					# Delete new branch locally

echo -e "\e[32mRename completed successfully.\e[0m"