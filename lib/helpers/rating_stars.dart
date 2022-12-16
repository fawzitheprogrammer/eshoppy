import 'package:flutter/material.dart';

class RatingStars extends StatelessWidget {
  const RatingStars({super.key, this.rating = 0});

  final int rating;

  String getRating() {
    String stars = '';

    for (int i = 0; i < rating; i++) {
      stars += '⭐ ';
    }
    stars.trim();
    return stars;
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      getRating(),
      style: const TextStyle(fontSize: 18),
    );
  }
}
