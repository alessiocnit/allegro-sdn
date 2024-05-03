// Client side C/C++ program to demonstrate Socket programming
#include <stdio.h>
#include <sys/socket.h>
#include <arpa/inet.h>
#include <unistd.h>
#include <string.h>
#include <iostream>

#define PORT 8080
#define BUFFER_SIZE 256

using namespace std;

int main(int argc, char const *argv[])
{
	int sock = 0, valread;
	struct sockaddr_in serv_addr;
	string hello = "I'm BOB, ready to send data.";
    string serverAddress = "127.0.0.1";
    string message;
    
	char buffer[BUFFER_SIZE] = {0};
	if ((sock = socket(AF_INET, SOCK_STREAM, 0)) < 0)
	{
		printf("\n Socket creation error \n");
		return -1;
	}

	serv_addr.sin_family = AF_INET;
	serv_addr.sin_port = htons(PORT);
	
	// Convert IPv4 and IPv6 addresses from text to binary form
	if(inet_pton(AF_INET, serverAddress.c_str(), &serv_addr.sin_addr)<=0)
	{
		printf("\nInvalid address/ Address not supported \n");
		return -1;
	}

	if (connect(sock, (struct sockaddr *)&serv_addr, sizeof(serv_addr)) < 0)
	{
		printf("\nConnection Failed \n");
		return -1;
	}
	
	send(sock , hello.c_str(), strlen(hello.c_str()) , 0 );
	
    printf("@bob> first message sent: %s\n", hello.c_str());
    
    valread = read(sock , buffer, BUFFER_SIZE);
	printf("@bob> from alice: %s\n", buffer);
	
	for(;;) {
        cout << "@bob> message to send: ";
        cin >> message;
        
        bzero(buffer, sizeof(buffer));
        send(sock , message.c_str(), strlen(message.c_str()), 0);
        
        valread = read(sock , buffer, BUFFER_SIZE);
        printf("@bob> from alice: %s\n", buffer);
    }
	
    return 0;
}
