#include <pcap.h>
#include <string.h>
#include <stdlib.h>
#include <math.h> 
#include "include/portaudio.h"

#define MAXBYTES2CAPTURE 2048
#define kSampleRate   (44100)
#define kFramesPerBuffer (64)

/*  the CALLBACK ROUTINE FOR PRODUCING AUDIO */

/* This routine will be called by the PortAudio engine when audio is needed.
 ** It may called at interrupt level on some machines so don't do anything
 ** that could mess up the system like calling malloc() or free().
 */

static int ThroughputCallback( const void *inputBuffer, void *outputBuffer,
							  unsigned long framesPerBuffer,
							  const PaStreamCallbackTimeInfo* timeInfo,
							  PaStreamCallbackFlags statusFlags,
							  void *userData ) {
	
	float *in = (float*)inputBuffer;
	float *out = (float*)outputBuffer;
	
	if (in == NULL)  /* if input  buffer not ready, fill output buffer with 0's */
		while (framesPerBuffer--) {	
			*out++ = 0;	/* left */
			*out++ = 0; /* right */
		}
	
	else while (framesPerBuffer--) {	
		*out++ = *in++;	/* left */
		*out++ = *in++; /* right */
	}
	
	return 0;
}


void processPacket(u_char *arg, const struct pcap_pkthdr* pkthdr, const u_char * packet) {
	
	//counting of the packets
	int i=0, *counter = (int *)arg;
	
	//printf("Packet count: %d\n", ++(*counter));
	//printf("Received packet size: %d\n", pkthdr->len);
	//printf("Payload:\n");
	
	
	for (i=0; i<pkthdr->len; i++) {
		if ( isprint(packet[i]) )
			printf("%c ", packet[i]);
		else
			printf(". ");
		
		
		/*if ( (i%16 == 0 && i!=0) || i==pkthdr->len-1)
		 printf("\n");*/
    }
	return;
}

int main(int argc, char *argv[]) {
	
	int i=0, count=0;
	pcap_t *descr = NULL;
	char errbuf[ PCAP_ERRBUF_SIZE], *device=NULL;
	memset(errbuf,0,PCAP_ERRBUF_SIZE);
	
	/* PortAudio part */
	
	PaStream *stream;  /* declare a stream variable */
	PaError err;  /* declare an error variable */
	
	printf("PortAudio Test\n");  /* announce what is happening */
	
	/* Initialize  data for use by callback. */
	
	/* Initialize library before making any other calls. */
	err = Pa_Initialize();
	if( err != paNoError ) goto error;
	
	/* Open an audio I/O stream. */
	err = Pa_OpenDefaultStream(
							   &stream,
							   2,              /* 2 input channels */			2,              /* stereo output */
							   paFloat32,      /* 32 bit floating point output */
							   kSampleRate,
							   kFramesPerBuffer,            /* frames per buffer */			ThroughputCallback,  /* pointer to the callback function */
							   NULL );
	if( err != paNoError ) goto error; /* if error when opening stream, go to error (label) */
	
	err = Pa_StartStream( stream );  /* start stream */
	if( err != paNoError ) goto error; /* if error starting, go to error (label) */
	
	printf("Welcome to Sonodump");
	
	if (argc != 2) {
		printf("Please define an interface to listen to: SonDump <interface>");
		exit(1);
	}
	
	printf("Opening device %s\n", argv[1]);
	
	descr = pcap_open_live(argv[1], MAXBYTES2CAPTURE,1, 512, errbuf);
	
	pcap_loop(descr, -1, processPacket, (u_char *)&count);
	
	Pa_Terminate(); /* terminate PortAudio */
	printf("Test finished.\n");
	return err;  /* normal return for this function */
	
error:
	Pa_Terminate();    /* If an error occured, terminate and then print the error message */
	fprintf( stderr, "An error occured while using the portaudio stream\n" ); 
	fprintf( stderr, "Error number: %d\n", err );
	fprintf( stderr, "Error message: %s\n", Pa_GetErrorText( err ) );
	return err;
	
	return 0;
}