#!/bin/bash
#Kevin Gonzalez
#2023-09-06

# First we have to create our functions for our 2 options

# Creating a function for ssh, we will call it later
ssh_choice() {
    echo "You have picked ssh"
    # Ask for remote IP and username and use -p to store it in a variable
    read -p "Please enter the remote IP address: " remoteIP
    read -p "Please enter the remote username: " remoteUser
    # Run the ssh command to connect, use $ to insert variables in strings
    ssh "$remoteUser@$remoteIP"
}

# Creating a function for SCP
scp_choice() {
    echo "You have picked scp"
    # Ask for remote IP and username and store them in variables
    read -p "Please enter the remote IP address: " remoteIP
    read -p "Please enter the remote username: " remoteUser

    # Ask which path the user wants to use for the file transfer (A or B)
    # Ask for the path to the source and destination files
    # Store all three answers in variables
    echo "You can send from:"
    echo "a: remote to local"
    echo "b: local to remote"
    read -p "Please pick 'a' or 'b': " ab
    read -p "Please enter the path to the source file: " srcFile
    read -p "Please enter the path to the destination file: " desFile

    #create a if else statement for the user choice of path
    if [ "$ab" == 'a' ]; then
        # scp condition for remote to local
        scp "$remoteUser@$remoteIP":"$srcFile" "$desFile"
    elif [ "$ab" == 'b' ]; then
        # scp condition for local to remote
        scp "$srcFile" "$remoteUser@$remoteIP":"$desFile"
    else
        # Catch in case anything else is entered
        echo "Please enter 'a' or 'b'"
    fi

    echo "File is transferring"
    echo "Transfer complete"
}


# Now that we have two functions (one for ssh and one for scp), we can ask the user what they want
# we start a while loop
while true; do
    # Ask the use to pick a valid option
    read -p "Please enter one of the following options (ssh, scp, exit): " options

    # Here we will give an action depending on what the user picks
    # Case is nested inside as we have three different options with different actions
    case "$options" in
    "ssh")
        # Here we call the function we created earlier
        ssh_choice
        ;;
    "scp")
        # Here we call the function we created earlier
        scp_choice
        ;;
    "exit")
        # If exit is selected it will break out
        break
        ;;
    *)
        # * is to catch if any other input beside the given option is entered
        echo "Not a valid option. Please pick 'ssh', 'scp', or 'exit'."
        ;;
    esac
done
