# sd-workshop1 2021-B
- make that IP assignament dynamically  

# Solution
- For this Workshop, I use two machines: A server and client. 

# Server
- For the server, I create a file where is all the configuration of provisioning. This file has a variable which contains the configuration to the dhcp server. Then, this file has the code to install a isc-dhcp-server and configures it, setting the interface that would be use to the server and writing the configuration using the variable $script.

# Client
- For the client, I create a file which delete the network default configuration. Then, the next line release the ip address of the machine and then ask another one to the server.
