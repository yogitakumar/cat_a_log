import 'dart:ffi';

import 'package:flutter/material.dart';

typedef void RatingChangeCallback(int rating);

class StarRating extends StatelessWidget {
  final int starCount;
  final int rating;
  final RatingChangeCallback onRatingChanged;
  final Color color;

  StarRating(
      {this.starCount = 5, this.rating = 0, required this.onRatingChanged, required this.color});

  Widget buildStar(BuildContext context, int index) {
    Icon icon;
    if (index >= rating) {
      icon = new Icon(
        Icons.star_border,
        color: Colors.yellow,
      );
    } else if (index > rating - 1 && index < rating) {
      icon = new Icon(
        Icons.star_half,
        color:Colors.yellow// color ?? Theme.of(context).primaryColor,
      );
    } else {
      icon = new Icon(
        Icons.star,
        color:Colors.yellow// color ?? Colors.yellow,
      );
    }
    return new InkResponse(
      onTap:
      onRatingChanged ==null ? null : () => onRatingChanged(index + 1),
      child: icon,

    );
  }

  @override
  Widget build(BuildContext context) {
    return new Row(
        children:
        new List.generate(starCount, (index) => buildStar(context, index)));
  }
}
