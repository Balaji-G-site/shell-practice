#!/bin/bash

USERID=$(id -u)

if [ $USERID -ne 0 ]
then
    echo "ERROR::Please run this script with root access"
    exit 1
else
    echo "You are running with root access"
fi

dnf list installed nginx


if [ $? -ne 0 ]
then
    echo "Installing nginx..."
    dnf install nginx -y
    if [ $? -eq 0]
    then
        echo "Installing nginx is...SUCCESSFUL"
    else
        echo "Installing nginx is...FAILURE"
        exit 1
    fi
else
    echo "nginx is already installed...nothing to do..."
fi