import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class PageTransition extends CustomTransitionPage {
  PageTransition({required super.child})
      : super(
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return SlideTransition(
              position: animation.drive(
                Tween(
                  begin: const Offset(1, 0),
                  end: Offset.zero,
                ),
              ),
            );
          },
        );
}
