#include <stdio.h>

#include "serial.h"

char serial_portname_arg[] = "/dev/ttyACM0";

const int out_packet_len = 9;

char rgv_val_packet[3][3] = {{'r', 0, '\n'}, {'g', 0, '\n'}, {'b', 0, '\n'}};

int serial_id;

int send_val() {
	char *packet =  (char *)(*rgv_val_packet);
	int wlen = write(serial_id,
	                 packet,
	                 out_packet_len);

	if (wlen != out_packet_len) {
		printf("Error from write: %d, %d\n", wlen, errno);
		return -1;
	}

	return 0;
}

int main(int argc, char const *argv[])
{
	serial_id = serial_init(serial_portname_arg);

	if (serial_id < 0) {
		printf("%s port open Error\n", serial_portname_arg);
		return -1;
	}

	rgv_val_packet[0][1] = 0;
	rgv_val_packet[1][1] = 0;
	rgv_val_packet[2][1] = 0;

	send_val();


	return 0;
}
