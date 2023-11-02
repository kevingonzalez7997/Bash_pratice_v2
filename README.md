# SSH and SCP Utility

### Kevin Gonzalez
### September 6, 2023

## Description

This Bash script provides a simple utility for SSH and SCP (Secure Copy) operations. It allows you to connect to remote servers using SSH or transfer files to and from remote servers using SCP.

## Functions

The script defines two functions:

1. `ssh_choice()`: This function establishes an SSH connection to a remote server. It prompts to enter the remote IP address and the remote username.

2. `scp_choice()`: This function facilitates file transfers between a local machine and a remote server using SCP. It prompts the user to specify the source and destination paths for the file transfer and allows you to choose the direction of the transfer (from remote to local or from local to remote).

## Notes

- Ensure that you have SSH and SCP installed on your local machine.

- Be cautious when transferring files with SCP, and ensure that you have the necessary permissions and that the paths you provide are correct.
