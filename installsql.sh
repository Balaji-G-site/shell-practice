#!/bin/bash

USERID=$(id -u)

if [ $USERID -ne 0 ]
then    
    echo "Error:: Please run this script with root user"
    exit1
else
    echo "You are running with root user"
fi

dnf list installed Mysql

if [ $? -ne 0 ]
then
    echo "MySql not installed, going to install"
    dnf install mysql -y
    if [ $? -eq 0 ]
    then
        echo "MySql is installed...SUCCESSFUL"
    else
        echo "MySql is installed...FAILURE"
        exit1
    fi

else
    echo "MySql is already installed nothing to do"
fi

dnf install nginx -y

if [ $? -eq 0 ]
then 
    echo "nginx installed...SUCCESSFUL"
else
    echo "nginx installed...FAILURE"
    exit1
fi

dnf install mongodb

if [ $? -eq 0 ]
then 
    echo "mongodb installed...SUCCESSFUL"
else
    echo "mongodb installed...FAILURE"
    exit1
fi
