import 'package:flutter/material.dart';

class Landing extends StatelessWidget {
  const Landing({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // App Name
              Text(
                'Vrittanta',
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1.2,
                ),
              ),
              SizedBox(height: 10),

              // Subtitle
              Text(
                'Your anytime Scribe',
                style: TextStyle(fontSize: 16, color: Colors.grey),
              ),

              SizedBox(height: 30),

              // Optional Loader
              CircularProgressIndicator(color: Colors.deepPurple),
            ],
          ),
        ),
      ),
    );
  }
}
