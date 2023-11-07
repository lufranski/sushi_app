import 'package:flutter/material.dart';

class FoodRating extends StatelessWidget {
  final String rating;
  const FoodRating({super.key, required this.rating});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          Icons.star,
          color: Colors.yellow[800],
        ),
        Text(
          rating,
          style: const TextStyle(color: Colors.grey),
        ),
      ],
    );
  }
}
