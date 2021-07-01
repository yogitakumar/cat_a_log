import 'package:flutter/services.dart';

class Cat {
  String name;
  String image;
  String location;
  int rating;

  Cat(
      {required this.name,
      required this.image,
      required this.location,
      required this.rating});
}

List<Cat> shopFor = [
  Cat(
      name: "Dolly",
      image: 'assets/images/cat1.jpg',
      location: "Hatfield",
      rating: 3),
  Cat(
      name: "Lovely",
      image: "assets/images/cat2.jpg",
      location: "London",
      rating: 4),
  Cat(
      name: "Ketie",
      image: "assets/images/cat3.jpg",
      location: "Reading",
      rating: 5)
];
