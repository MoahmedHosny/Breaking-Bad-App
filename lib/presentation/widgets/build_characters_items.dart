import 'dart:ui';
import '../../constants/constants.dart';
import '../../data/models/characters_model.dart';
import '../../style/color/color.dart';
import 'package:flutter/material.dart';

class CharactersItems extends StatelessWidget {
  final CharactersModel charactersModel;
  CharactersItems({this.charactersModel});
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsetsDirectional.fromSTEB(8, 8, 8, 8),
      padding: EdgeInsetsDirectional.fromSTEB(4, 4, 4, 4),
      decoration: BoxDecoration(
        color: white,
        borderRadius: BorderRadius.circular(8),
      ),
      child: InkWell(
        onTap: () =>
            Navigator.pushNamed(context, Details, arguments: charactersModel),
        child: GridTile(
          child: Hero(
            tag: charactersModel.charId,
            child: Container(
              color: grey,
              child: charactersModel.image.isNotEmpty
                  ? FadeInImage.assetNetwork(
                      width: MediaQuery.of(context).size.width,
                      fit: BoxFit.cover,
                      placeholder: 'assets/images/loading.gif',
                      image: '${charactersModel.image}')
                  : '',
            ),
          ),
          footer: Container(
            width: MediaQuery.of(context).size.width,
            color: Colors.black45,
            padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            alignment: Alignment.bottomCenter,
            child: Text(
              '${charactersModel.name}',
              style: TextStyle(
                height: 1.4,
                fontSize: 16,
                color: white,
                fontWeight: FontWeight.bold,
              ),
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ),
    );
  }
}
