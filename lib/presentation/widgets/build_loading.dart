import 'package:breaking_app/style/color/color.dart';
import 'package:flutter/material.dart';

Widget buildIsLoading() {
  return Center(
    child: CircularProgressIndicator(
      strokeWidth: 3.0,
      color: yellow,
    ),
  );
}
