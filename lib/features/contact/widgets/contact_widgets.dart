import 'package:flutter/material.dart';
import 'package:getx_demo/app_constants.dart';

/// Builds a circular contact avatar displaying a profile image or fallback initials with a subtle shadow.
Widget contactAvatar({required String name, ImageProvider? image}) {
  return Container(
    alignment: Alignment.center,
    decoration: BoxDecoration(
      shape: BoxShape.circle,
      color: const Color(0xFF8AA1D8), // soft blue like screenshot
      image: image != null
          ? DecorationImage(
            image: image, 
          fit: BoxFit.cover,
          )
          : null,
      boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(0.12),
          blurRadius: 4,
          offset: const Offset(0, 4),
        ),
      ],
    ),
    child: image == null
        ? Text(
          name,
          
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w600,
              fontSize: 14,
            ),
          )
        : null,
  );
}