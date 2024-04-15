import 'package:flutter/cupertino.dart';

class Categories {
  String name;
  IconData icon;

  Categories({
    required this.name,
    required this.icon,
  });
}

var categoriesList = [
  Categories(
    name: 'Income',
    icon: CupertinoIcons.arrow_down_square,
  ),
  Categories(
    name: 'Home',
    icon: CupertinoIcons.house_fill,
  ),
  Categories(
    name: 'Utilities',
    icon: CupertinoIcons.device_phone_portrait,
  ),
  Categories(
    name: 'Travel',
    icon: CupertinoIcons.train_style_one,
  ),
  Categories(
    name: 'Food',
    icon: CupertinoIcons.cart_fill,
  ),
  Categories(
    name: 'Campuss',
    icon: CupertinoIcons.book_solid,
  ),
  Categories(
    name: 'Clothes',
    icon: CupertinoIcons.tags_solid,
  ),
  Categories(
    name: 'Health',
    icon: CupertinoIcons.heart_fill,
  ),
  Categories(
    name: 'Entertainment',
    icon: CupertinoIcons.game_controller_solid,
  ),
];
