#!/bin/bash

USERID=$(id -u)

if [ $USERID -ne 0 ]
then
    echo "ERROR :: please run this script with root user"
    exit1
else
    echo "You are running with root user"
fi

dnf list installed mysql

if [ $? -ne 0 ]
then
    echo "mysql not installed...going to install"

    dnf install mysql -y
    if [ $? -eq 0 ]
    then 
        echo "installed my sql is...SUCCESSFUL"
    else
        echo "installed mysql is...FAILURE"
        exit1
else
    echo "Mysql is already installed...nothing to do"
fi

dnf list installed nginx

if [ $? -ne 0 ]
then
    echo "nginx not installed...going to install"

    dnf install nginx -y
    if [ $? -eq 0 ]
    then 
        echo "installed nginx is...SUCCESSFUL"
    else
        echo "installed nginx is...FAILURE"
        exit1
else
    echo "nginx is already installed...nothing to do"
fi