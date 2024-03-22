import 'package:flutter/material.dart';

extension Glassmorphism on Container {
  Container get glassmorphic {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.0), // Adjust as needed
        color: Colors.white.withOpacity(0.6), // Adjust color and opacity
        boxShadow: [
          BoxShadow(
            blurRadius: 15.0, // Adjust blur radius
            spreadRadius: 5.0, // Adjust spread radius
            color: Colors.grey[200]!.withOpacity(0.3), // Adjust shadow color and opacity
          )
        ],
      ),
    );
  }
}
