import 'package:flutter/material.dart';
import 'package:weigh_master/Presentation/setting/feedback.dart';

class WarrantyPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Warranty'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            WarrantyButton(
              imagePath: 'assets/warranty_claim.png',
              text: 'Warranty Claim',
              onPressed: () {
              },
            ),
            SizedBox(height: 20),
            WarrantyButton(
              imagePath: 'assets/warranty_check.png',
              text: 'Warranty Check',
              onPressed: () {
              },
            ),
            SizedBox(height: 20),
            WarrantyButton(
              imagePath: 'assets/history.png',
              text: 'Warranty History',
              onPressed: () {
              },
            ),
            SizedBox(height: 20),
            WarrantyButton(
              imagePath: 'assets/Our center.png',
              text: 'Our Center',
              onPressed: () {
              },
            ),
            SizedBox(height: 20),
            WarrantyButton(
              imagePath: 'assets/feedback.png',
              text: 'Feedback',
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => FeedbackPage()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class WarrantyButton extends StatelessWidget {
  final String imagePath;
  final String text;
  final VoidCallback onPressed;
  const WarrantyButton({
    required this.imagePath,
    required this.text,
    required this.onPressed,
  });
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        minimumSize: MaterialStateProperty.all<Size>(Size(400, 100)),
        shape: MaterialStateProperty.all<OutlinedBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
        ),
      ),
      onPressed: onPressed,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            imagePath,
            width: 60,
            height: 60,
          ),
          SizedBox(width: 10),
          Text(text),
        ],
      ),
    );
  }
}
