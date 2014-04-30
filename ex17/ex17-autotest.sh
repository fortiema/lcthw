#!/bin/sh
set -e

# Matt Fortier
# 04-2014

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

# Creates the db file
function TestCreateDB()
{
    ./ex17 $DBFile c
    if [ -f $DBFile ]; then
        echo "Create DB: SUCCESS!"
    else
        echo "Create DB: FAIL"
    fi
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

function DeleteDBFile()
{
    CheckDBExistence
    rm -f $DBFile
    if [ ! -f $DBFile ]; then
        echo "Delete DB: SUCCESS!"
    else
        echo "Delete DB: FAIL"
    fi
}

echo "Starting auto-test suite for ex17..."

TestCreateDB
echo "Testing Data Entry..."
SetEntry 1 Matt mfortier@jupiter.com
SetEntry 2 Yan yroy@jupiter.com
echo "Data Entry Mechanism tested successfully!"
DeleteDBFile

echo "All tests passed! Exiting..."

exit 0




