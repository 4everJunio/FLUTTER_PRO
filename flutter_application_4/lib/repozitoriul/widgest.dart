import 'package:flutter/material.dart';

Widget buildLocationBar() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Row(
        children: [
          Icon(Icons.location_on),
          SizedBox(width: 8),
          Text('Chişinău, Republic of Moldova'),
          Icon(Icons.arrow_drop_down),
        ],
      ),
      CircleAvatar(
        backgroundImage: AssetImage('lib/img/IMG_5617.JPG'),
      ),
    ],
  );
}

Widget buildSearchBar() {
  return TextField(
    decoration: InputDecoration(
      hintText: 'Search doctor...',
      prefixIcon: Icon(Icons.search),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(30),
      ),
    ),
  );
}

Widget buildPromoBanner() {
  return Container(
    height: 190,
    child: Row(
      children: [
        Image.asset('lib/img/baner.png'),
      ],
    ),
  );
}
