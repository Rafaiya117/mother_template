import 'package:flutter/material.dart';

class MyPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MyPageView(),
    );
  }
}

class MyPageView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Background image
        Positioned.fill(
          child: Image.asset(
            'assets/background_image.jpg', // Use your background image here
            fit: BoxFit.cover,
          ),
        ),
        
        // Gradient overlay
        Positioned.fill(
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Colors.black.withOpacity(0.5),
                  Colors.black.withOpacity(0.5),
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
          ),
        ),

        // Main content
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Your single image
              Container(
                width: 200, // Width of the image container
                height: 200, // Height of the image container
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/your_image.jpg'), // Your image here
                    fit: BoxFit.cover,
                  ),
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              SizedBox(height: 20),
              // Button
              ElevatedButton(
                onPressed: () {},
                child: Text("Start Journey", style: TextStyle(fontSize: 18)),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
