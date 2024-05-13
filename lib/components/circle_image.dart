// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class CircleImage extends StatelessWidget {
  final double imageRadius;
  final ImageProvider? imageProvider;

  const CircleImage({
    super.key,
    required this.imageRadius,
    this.imageProvider,
  });

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundColor: Colors.white,
      radius: imageRadius,
      child: CircleAvatar(
        radius: imageRadius - 5,
        backgroundImage: imageProvider,
      ),
    );
  }
}
