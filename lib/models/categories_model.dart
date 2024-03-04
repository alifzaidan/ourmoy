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
    name: 'Cafe',
    icon: CupertinoIcons.cart_fill,
  ),
  Categories(
    name: 'Clothes',
    icon: CupertinoIcons.cart_fill,
  ),
  Categories(
    name: 'Health',
    icon: CupertinoIcons.heart_fill,
  ),
];
