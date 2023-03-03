import 'package:flutter/material.dart';

class Screen3 extends StatelessWidget {
  final String title;

  const Screen3({required this.title, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(title),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop('Screen 3');
              },
              child: const Text('Back to home'),
            )
          ],
        ),
      ),
    );
  }
}
