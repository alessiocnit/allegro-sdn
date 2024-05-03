// Server side C/C++ program to demonstrate Socket programming
#include <unistd.h>
#include <stdio.h>
#include <sys/socket.h>
#include <stdlib.h>
#include <netinet/in.h>
#include <string.h>
#include <iostream>

#define PORT 8080
#define BUFFER_SIZE 256

using namespace std;

int main(int argc, char const *argv[])
{
	int server_fd, new_socket, valread;
	struct sockaddr_in address;
	int opt = 1;
	int addrlen = sizeof(address);
	char buffer[BUFFER_SIZE] = {0};
	string hello = "Hello - I'm ALICE, please send me your age.";
	
	// Creating socket file descriptor
	if ((server_fd = socket(AF_INET, SOCK_STREAM, 0)) == 0)
	{
		perror("socket failed");
		exit(EXIT_FAILURE);
	}
	
	// Forcefully attaching socket to the port 8080
	if (setsockopt(server_fd, SOL_SOCKET, SO_REUSEADDR | SO_REUSEPORT, &opt, sizeof(opt)))
	{
		perror("setsockopt");
		exit(EXIT_FAILURE);
	}
	address.sin_family = AF_INET;
	address.sin_addr.s_addr = INADDR_ANY;
	address.sin_port = htons( PORT );
	
	// Forcefully attaching socket to the port 8080
	if (bind(server_fd, (struct sockaddr *)&address, sizeof(address))<0)
	{
		perror("bind failed");
		exit(EXIT_FAILURE);
	}
	if (listen(server_fd, 3) < 0)
	{
		perror("listen");
		exit(EXIT_FAILURE);
	}
	if ((new_socket = accept(server_fd, (struct sockaddr *)&address,(socklen_t*)&addrlen))<0)
	{
		perror("accept");
		exit(EXIT_FAILURE);
	}
	
	// The server waits for a new message on the socket
	valread = read( new_socket , buffer, BUFFER_SIZE);
	printf("@alice> message from bob: %s\n",buffer );
	
    // The server send a message on the socket
    send(new_socket, hello.c_str() , strlen(hello.c_str()) , 0 );
	
    for(;;) {
        string message; 
        
        bzero(buffer, sizeof(buffer));
        
        read(new_socket, buffer, BUFFER_SIZE);
        printf("@alice> message from bob: %s\n", buffer);
        
        int receivedNumber = atoi(buffer);
        
        //Simple logic implementation
        if (receivedNumber <= 18) 
            message = "Please don't cheat me.";
        else
            message = "OK - you are now allowed to use quantum.";
        
        //Send a message back to the client
        send(new_socket, message.c_str(), strlen(message.c_str()), 0 );
    }
    
	return 0;
}
