import 'package:flutter/material.dart';

Widget customDivider({required double width}) {
  return Container(
    width: width,
    height: 1.0,
    color: Colors.grey.shade200,
    margin: const EdgeInsets.symmetric(vertical: 10.0),
  );
}
