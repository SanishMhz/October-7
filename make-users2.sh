#!/bin/bash

read -p "How many users do you want to create? " count

for (( i=1; i<=count; i++ ))
do
    read -p "Enter username #$i: " username

    if id "$username" &>/dev/null; then
        echo "User '$username' already exists. Skipping creation."
    else
        sudo useradd "$username"
        if [ $? -eq 0 ]; then
            echo "User '$username' created successfully."
        else
            echo "Failed to create user '$username'."
        fi
    fi
done
