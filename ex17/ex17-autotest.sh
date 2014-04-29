#!/bin/sh
set -e

DBFile="ex17-db.dat"

function CheckDBExistence()
{
    if [ ! -f $DBFile ]; then
        echo "No DB found !"
        exit 2
    else
        if [ ! -r $DBFile ] || [ ! -w $DBFile ]; then
            echo "You don't have read/write permission on the DB File!"
            exit 2
        fi
    fi
}

function TestCreateDB()
{
    ./ex17 $DBFile c
    CheckDBExistence
}

echo "Starting auto-test suite for ex17..."

TestCreateDB

echo "All tests passed! Exiting..."

exit 0




