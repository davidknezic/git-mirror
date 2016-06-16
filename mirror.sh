#!/usr/bin/env sh

dir=$1
original=$2
mirror=$3

mkdir -p $1
cd $1

if [ -d .git ] || git rev-parse --git-dir > /dev/null 2>&1; then
  echo "git fetch"

  git fetch
else
  echo "git clone --mirror $original ."

  git clone --mirror $original .

  echo "git remote add mirror $mirror"

  git remote add mirror $mirror
fi

echo "git push --mirror mirror"

git push --mirror mirror
