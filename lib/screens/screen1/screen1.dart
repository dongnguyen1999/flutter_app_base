import 'package:flutter/material.dart';

class Screen1 extends StatelessWidget {
  final String title;

  const Screen1({required this.title, super.key});

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
                Navigator.of(context).pop('Screen 1');
              },
              child: const Text('Back to home'),
            )
          ],
        ),
      ),
    );
  }
}
