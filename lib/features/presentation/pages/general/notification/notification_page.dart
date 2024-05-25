import 'package:fixit/features/features.dart';
import 'package:flutter/material.dart';

class NotificationPage extends StatelessWidget {
  const NotificationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Parent(
      appBar: MyAppBar(context, title: 'Notification').call(),
      child: const SafeArea(
        child: Column(
          children: [
            Center(
              child: Text('Notification page'),
            ),
          ],
        ),
      ),
    );
  }
}
