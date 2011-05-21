#include <pcap.h>
#include <string.h>
#include <stdlib.h>
#include <stdio.h>
#include <math.h> 
#include "include/portaudio.h"
#include <ncurses.h>
#include <signal.h>

#define MAXBYTES2CAPTURE 2048
#define kSampleRate   (22050)
#define kFramesPerBuffer (128)

/*  the CALLBACK ROUTINE FOR PRODUCING AUDIO */

/* This routine will be called by the PortAudio engine when audio is needed.
 ** It may called at interrupt level on some machines so don't do anything
 ** that could mess up the system like calling malloc() or free().
 */

int data[150048];
int *ptr;
int row,col;
bool verbose;


static int ReadRaw( const void *inputBuffer, void *outputBuffer,
							  unsigned long framesPerBuffer,
							  const PaStreamCallbackTimeInfo* timeInfo,
							  PaStreamCallbackFlags statusFlags,
							  void *userData, const void *packetData ) {
	
	float *out = (float*)outputBuffer;
	int i = 0;
	
	if (data[0] == 0)  /* if input  buffer not ready, fill output buffer with 0's */
		while (framesPerBuffer--) {	
			*out++ = 0;	/* left */
			*out++ = 0; /* right */
		}
	
	else while (framesPerBuffer--) {	
		/* reading data array and incrementing the step until end of the buffer */
		/* multiplying by 0.001 because the amplitude was too high */
		*out++ = data[i++] * 0.001;	/* left */
		*out++ = data[i++] * 0.001; /* right */
	}
	
	
	return 0;
}


void processPacket(u_char *arg, const struct pcap_pkthdr* pkthdr, const u_char * packet, const void *packetData) {
	
	int i=0;
	int x,y;
	
	ptr = &data[0]; // pointer to the beginning of the data array, loaded when the new pcap_loop is called
	
	for (i=0; i<pkthdr->len; i++) {
			getyx(stdscr, y, x); // Getting of the current position on the screen
			if ( y == (row - 1) ) {  // If is it at the end of the window, jump to beginning
				move(0,0);
			}
			printw("%c", packet[i]); // Print the packet value at i
			refresh(); 
			*ptr = packet[i]; // Write down the packet value at i to data array for PortAudio
			*ptr++; // Increase the pointer to next field in data array
		}
	return;
}

void processPacketNonVerbose(u_char *arg, const struct pcap_pkthdr* pkthdr, const u_char * packet, const void *packetData) {
	
	int i=0;
	
	ptr = &data[0]; // pointer to the beginning of the data array, loaded when the new pcap_loop is called
	
	for (i=0; i<pkthdr->len; i++) {
		*ptr = packet[i]; // Write down the packet value at i to data array for PortAudio
		*ptr++; // Increase the pointer to next field in data array
	}
	return;
}

void resize(int dummy) {
	getmaxyx(stdscr, row, col);
	resizeterm(row, col);
}

int main(int argc, char *argv[]) {
	
	int count = 0, SampleRate;
	
	/* pcap bookkeeping */
	pcap_t *descr = NULL;
	char errbuf[ PCAP_ERRBUF_SIZE];
	memset(errbuf,0,PCAP_ERRBUF_SIZE);
	
	
	/* portaudio definitions */
	PaStream *stream;  /* declare a stream variable */
	PaError err;  /* declare an error variable */
	
	/* ncurses startup */
	initscr();
	
	getmaxyx(stdscr, row, col);
	signal(SIGWINCH, resize);
	
	
	////////////
	/* Dialog */
	////////////
	
	/* Check if user has root privileges necessary for sniffing */
	if(geteuid() != 0)
	{
		endwin();
		printf("Sorry, root privileges are required. Use 'sudo ./sonodump <interface>'.\n\n");
		exit(1);
	}
	
	printw("Welcome to Sonodump\n\n");
	
	//////////////////////////
	/* pcap interface check */
	//////////////////////////
	
	/* In case no interface was selected */
	if (argc < 2) {
		endwin();
		printf("Please define an interface, which you want to listen to: sonodump <interface>\n");
		printf("List of the interfaces can be found using ifconfig command.\nUsually, en0 is LAN (cable) interface, and en1 is wireless.\n");
		exit(1);
	}
	
	/* Opening the defined device */
	
	descr = pcap_open_live(argv[1], MAXBYTES2CAPTURE,1, 512, errbuf);
	
	/* If the device doesn't exist */
	if (descr == NULL) {
		endwin();
		printf("Error: Probably you have selected unexisting device.\n\n");
		exit(1);
	}
	
	printw("Opening device %s\n", argv[1]);
	
	////////////////////////////////////
	
	/* Selection of the sampling rate */
	printw("Sampling rate (press any key for default - 22050Hz): ");
	scanw("%d\n",&SampleRate);
	
	if (SampleRate < 1) {
		SampleRate = kSampleRate;
	}
	
	refresh();
	
	/* Unfinished part about verbose output */
	
	/* printw("Verbose output? It may affect performance. (Y/N): ");
	scanf("%c\n",&anwser);
	if (anwser == "y" || anwser == "Y") {
		verbose = TRUE;
	} else {
		if (anwser == "n" || anwser == "N") {
			verbose = FALSE;
		} else {
			printw("Wrong anwser.\n");
			exit(1);
		}
	}	
	refresh(); */
	
	///////////////
	/* PortAudio */
	///////////////
	
	/* Initialize library before making any other calls. */
	err = Pa_Initialize();
	if( err != paNoError ) goto error;
	
	/* Open an audio I/O stream. */
	err = Pa_OpenDefaultStream(
							   &stream,
							   2,              /* 2 input channels */			2,              /* stereo output */
							   paFloat32,      /* 32 bit floating point output */
							   SampleRate,
							   kFramesPerBuffer,            /* frames per buffer */			ReadRaw,  /* pointer to the callback function */
							   NULL );
	if( err != paNoError ) goto error; /* if error when opening stream, go to error (label) */
	
	err = Pa_StartStream( stream );  /* start stream */
	if( err != paNoError ) goto error; /* if error starting, go to error (label) */
	
	/* Everything went better than expected */
	printw("Audio started. Press any key when you're ready.\n");
	refresh(); 
	
	/* Wait for any key to start */
	getchar();
	
	//////////
	/* pcap */
	//////////
	
	/* Looping the reading from network card to kernel space */
	if ( (argc>2) && (!strcmp(argv[2], "-s")) ) {
		printw("Working in terminal-silent mode.\n");
		refresh();
		pcap_loop(descr, -1, processPacketNonVerbose, (u_char *)&count);
	} else {
		refresh();
		pcap_loop(descr, -1, processPacket, (u_char *)&count);
	}
	
	/* Terminating and Error */
	Pa_Terminate(); /* terminate PortAudio */
	return err;  /* normal return for this function */
	
error:
	Pa_Terminate();    /* If an error occured, terminate and then print the error message */
	fprintf( stderr, "An error occured while using the portaudio stream\n" ); 
	fprintf( stderr, "Error number: %d\n", err );
	fprintf( stderr, "Error message: %s\n", Pa_GetErrorText( err ) );
	return err;
	
	/* Closing of the window */
	endwin();
	
	return 0;
}