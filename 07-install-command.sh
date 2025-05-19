#!/bin/bash

USERID=$(id -u)

if [$USERID -ne 0]
then
echo "ERROR::please run this script with root access"
exit 1

else
echo "you are running with root access"
fi

dnf list installed mysql

if [$? -ne 0]
then 
echo "mysql is not installed...going to install"
dnf install mysql -y

if [$? -eq 0]
then
echo "installing mysql is...SUCCESSFUL"
else
echo "installig mysql is...FAILURE"
exit 1
fi
else
echo "mysql is already installed...Nothing to do"
fi