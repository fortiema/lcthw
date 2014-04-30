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

function SetEntry()
{
    if [ $# -eq 3 ]; then
        CheckDBExistence
        ./ex17 $DBFile s $1 $2 $3
    else
        echo "SetEntry: Invalid Arguments"
        exit 2
    fi
}

echo "Starting auto-test suite for ex17..."

TestCreateDB
SetEntry 1 Matt mfortier@jupiter.com
SetEntry 2 Yan yroy@jupiter.com

echo "All tests passed! Exiting..."

exit 0




