import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';
import 'package:vrittanta/core/theme/pallete.dart';

class VoiceAss extends StatefulWidget {
  const VoiceAss({super.key});

  @override
  State<VoiceAss> createState() => _VoiceAssState();
}

class _VoiceAssState extends State<VoiceAss> {
  String transcribedText = ''; // Placeholder for transcribed text

  void startRecording() {
    // Placeholder for starting the recording
    // You can integrate Google Cloud Speech-to-Text here as per the roadmap
    setState(() {
      transcribedText =
          'Transcription will appear here...'; // Mock transcription
    });
  }

  @override
  Widget build(BuildContext context) {
    // Get screen dimensions for responsive scaling
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    // Adjust font size and padding based on screen width
    final baseFontSize =
        screenWidth > 1200
            ? 24.0
            : screenWidth > 600
            ? 20.0
            : 16.0; // Scale font for very large screens
    final basePadding =
        screenWidth > 1200
            ? 32.0
            : screenWidth > 600
            ? 24.0
            : 16.0; // Scale padding dynamically

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Vrittanta'),
        leading: const Icon(Icons.menu),
        actions: [
          IconButton(
            icon: const Icon(Icons.person),
            onPressed: () {
              print('Profile button pressed');
            },
          ),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(basePadding), // Dynamic padding
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header: "Scribing for Patient Name"
              Text(
                'Scribing for Patient Name',
                style: TextStyle(
                  fontSize: baseFontSize + 4, // Slightly larger for header
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: basePadding * 0.5), // Dynamic spacing
              // Text Area for Transcription
              Expanded(
                flex: 3, // Give more space to transcription area
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Pallete.borderColor, width: 2),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  padding: EdgeInsets.all(basePadding * 0.75),
                  child: SingleChildScrollView(
                    child: Text(
                      transcribedText.isEmpty
                          ? 'Transcription will appear here...'
                          : transcribedText,
                      style: TextStyle(
                        fontSize: baseFontSize,
                        color: Colors.black54,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: basePadding * 0.5), // Dynamic spacing
              // Record Button Section
              Flexible(
                flex: 1, // Ensure button section doesn't take too much space
                child: Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min, // Prevent over-expansion
                    children: [
                      FloatingActionButton(
                        onPressed: startRecording,
                        backgroundColor: Colors.blue,
                        child: const Icon(
                          Icons.add,
                          size: 30,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(height: basePadding * 0.25),
                      Text(
                        'Record',
                        style: TextStyle(
                          fontSize: baseFontSize,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
