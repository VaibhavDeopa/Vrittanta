import 'package:flutter/material.dart';
import 'package:vrittanta/core/theme/pallete.dart';

class VoiceAss extends StatefulWidget {
  const VoiceAss({super.key});

  @override
  State<VoiceAss> createState() => _VoiceAssState();
}

class _VoiceAssState extends State<VoiceAss> {
  String transcribedText = '';

  void startRecording() {
    setState(() {
      transcribedText = 'Transcription will appear here...';
    });
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final baseFontSize =
        screenWidth > 1200
            ? 24.0
            : screenWidth > 600
            ? 20.0
            : 16.0;
    final basePadding =
        screenWidth > 1200
            ? 32.0
            : screenWidth > 600
            ? 24.0
            : 16.0;

    return Scaffold(
      appBar: AppBar(centerTitle: true, title: const Text('Vrittanta')),
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: basePadding),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Spacer(),

                // Header
                Text(
                  'Scribing for Patient Name',
                  style: TextStyle(
                    fontSize: baseFontSize + 4,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: basePadding * 0.75),

                // Transcription Box
                Expanded(
                  flex: 4,
                  child: Container(
                    width: double.infinity,
                    padding: EdgeInsets.all(basePadding),
                    decoration: BoxDecoration(
                      border: Border.all(color: Pallete.borderColor, width: 2),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: SingleChildScrollView(
                      child: Text(
                        transcribedText.isEmpty
                            ? 'Transcription will appear here...'
                            : transcribedText,
                        style: TextStyle(
                          fontSize: baseFontSize,
                          color: Colors.black87,
                        ),
                      ),
                    ),
                  ),
                ),

                SizedBox(height: basePadding),

                // Record Button
                Column(
                  children: [
                    FloatingActionButton(
                      onPressed: startRecording,
                      backgroundColor: Colors.blue,
                      child: const Icon(Icons.mic, color: Colors.white),
                    ),
                    SizedBox(height: basePadding * 0.25),
                    Text(
                      'Start Recording',
                      style: TextStyle(
                        fontSize: baseFontSize,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),

                const Spacer(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
