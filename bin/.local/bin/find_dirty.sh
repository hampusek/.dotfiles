#!/bin/bash

function print_usage () {
    echo usage: $0 LAST_KNOWN_GOOD_REVISION '"TEST_COMMAND"'
    echo   LAST_KNOWN_GOOD_REVISION = you can specify this as sha1 hash
    echo   TEST_COMMAND = the script to run, it should return 0 if success
    echo   NOTE: Ensure that the current revision is the bad \(broken\)
    exit 1;
}

LAST_KNOWN_GOOD_REVISION=$1

if [ -z "${LAST_KNOWN_GOOD_REVISION}" ]; then
    echo please enter last known revision that was good >> /dev/stderr
    print_usage
fi

TEST_COMMAND=$2

if [ -z "${TEST_COMMAND}" ]; then
    echo "please enter a test command (script/program/whatever)" >> /dev/stderr
    print_usage
fi

# TODO: should have a flag to skip this, so that it can be automated
echo "ensure HEAD is bad (broken), press enter to continue or ctrl-c to leave to setup..."
read _tmp

git bisect start
git bisect bad
git bisect good $LAST_KNOWN_GOOD_REVISION
git bisect run bash -c "${TEST_COMMAND}"
git bisect log
echo run the following to reset git bisect
echo git bisect reset
