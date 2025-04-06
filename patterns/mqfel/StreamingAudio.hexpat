#pragma author WerWolv
#pragma description OGG Audio format

#pragma MIME audio/ogg

#pragma pattern_limit 10000000

import std.core;
import std.mem;

bitfield HeaderType {
	Continuation	: 1;
	BeginOfStream	: 1;
	EndOfStream		: 1;
};

struct SegmentData {
	u8 data[parent.segmentTable[std::core::array_index()]] [[sealed]];
};

struct Ogg {
	char capturePattern[4];
	u8 version;
	HeaderType headerType;
	u64 granulePosition;
	u32 bitstreamSerialNumber;
	u32 pageSequenceNumber;
	u32 checksum;
	u8 pageSegments;
	u8 segmentTable[pageSegments];
	SegmentData data[pageSegments];
};

struct MQFELStreamingAudioFileHeader {
    u32 x;
    u32 y;
    u32 z;
    u32 w;
    u32 a;
    u32 b;
    u32 c;
};

struct MQFELStreamingAudioFileData {
    MQFELStreamingAudioFileHeader header;
    Ogg ogg[while (std::mem::read_unsigned($, 1) == 0x4F)]; // Usually but not always an Ogg
	// Something else at 0x034D5FC0 for example
};

struct MQFELStreamingAudioFile {
    u32 idk; // Size somehow?
    u32 position;
	MQFELStreamingAudioFileData data @ position;
};

struct MQFELStreamingAudio {
    u32 header_size;
    MQFELStreamingAudioFile files[header_size / 8];
};

MQFELStreamingAudio streaming_audio @ 0x0;
