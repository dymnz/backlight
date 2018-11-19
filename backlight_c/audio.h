#include <stdio.h>
#include "portaudio.h"

typedef struct
{
	float left_phase;
	float right_phase;
} paTestData;

typedef struct{
    int frameIndex;
    int maxFrameIndex;
    char* recordedSamples;
} recordData;

void patest();