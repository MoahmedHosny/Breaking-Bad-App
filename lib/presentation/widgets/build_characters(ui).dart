import '../screens/home_screen.dart';
import 'build_characters_items.dart';
import 'package:flutter/material.dart';
import 'build_characters.dart';

Widget buildCharactersUi() {
  return Container(
    child: GridView.builder(
      physics: BouncingScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 2 / 3,
      ),
      itemCount: searchController.text.isEmpty
          ? characters.length
          : searchCharacters.length,
      itemBuilder: (context, index) {
        return CharactersItems(
            charactersModel: searchController.text.isEmpty
                ? characters[index]
                : searchCharacters[index]);
      },
    ),
  );
}
