import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerProfilePicture extends StatelessWidget {
  final String imageUrl;
  final double size;

  const ShimmerProfilePicture({
    super.key,
    required this.imageUrl,
    this.size = 55.0,
  });

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Future.delayed(const Duration(seconds: 1)),
      builder: (context, snapshot) {
        if (snapshot.connectionState != ConnectionState.done) {
          return ClipOval(
            child: Shimmer.fromColors(
              baseColor: Colors.grey.shade300,
              highlightColor: Colors.grey.shade100,
              child: Container(
                width: size,
                height: size,
                decoration: BoxDecoration(
                  color: Colors.grey.shade300,
                  shape: BoxShape.circle,
                ),
              ),
            ),
          );
        }
        return ClipOval(
          child: Image.network(
            imageUrl,
            width: size,
            height: size,
            fit: BoxFit.cover,
            errorBuilder:
                (context, error, stackTrace) => Icon(Icons.person, size: size),
          ),
        );
      },
    );
  }
}
