import 'dart:math';
import 'dart:ui';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:breaking_app/business_logic/cubit/characters_cubit.dart';
import 'package:breaking_app/business_logic/cubit/characters_state.dart';
import '../../data/models/characters_model.dart';
import '../../data/models/qoutes_model.dart';
import '../widgets/build_loading.dart';
import '../../style/color/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DetailsScreen extends StatelessWidget {
  DetailsScreen({@required this.charactersModel});

  final CharactersModel charactersModel;

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<CharactersCubit>(context).getQoute(charactersModel.name);
    return Scaffold(
      body: CustomScrollView(
        physics: BouncingScrollPhysics(),
        slivers: [
          buildAppBar(context),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                Container(
                  margin: EdgeInsets.fromLTRB(14, 14, 14, 0),
                  padding: EdgeInsets.all(8),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      buildCharactersInfo(
                          title: 'Name : ', value: charactersModel.name),
                      buildDivider(endIndent: 314),
                      buildCharactersInfo(
                          title: 'Birthday : ',
                          value: charactersModel.birthday),
                      buildDivider(endIndent: 294),
                      buildCharactersInfo(
                          title: 'Job : ',
                          value: charactersModel.occupation.join(' - ')),
                      buildDivider(endIndent: 330),
                      buildCharactersInfo(
                        title: 'Appeared In : ',
                        value: charactersModel.category,
                      ),
                      buildDivider(endIndent: 265),
                      buildCharactersInfo(
                          title: 'Seasons : ',
                          value: charactersModel.appearance.join(' - ')),
                      buildDivider(endIndent: 292),
                      buildCharactersInfo(
                          title: 'Status : ', value: charactersModel.status),
                      buildDivider(endIndent: 309),
                      charactersModel.betterCallSaulAppearance.isEmpty
                          ? Container()
                          : buildCharactersInfo(
                              title: 'Better Call Saul Appearance : ',
                              value: charactersModel.betterCallSaulAppearance
                                  .join(' / ')),
                      charactersModel.betterCallSaulAppearance.isEmpty
                          ? Container()
                          : buildDivider(endIndent: 140),
                      buildCharactersInfo(
                        title: 'Actor : ',
                        value: charactersModel.portrayed,
                      ),
                      buildDivider(endIndent: 316),
                      SizedBox(height: 30),
                      BlocBuilder<CharactersCubit, CharactersStates>(
                        builder: (context, state) {
                          return buildShowQoutes(state);
                        },
                      ),
                      SizedBox(height: 90),
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

// Sliver_App_Bar => Character_Name , Character_Image
  Widget buildAppBar(
    context,
  ) {
    return SliverAppBar(
      leading: IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        splashRadius: 25,
        icon: Icon(
          Icons.arrow_back_rounded,
          size: 22,
        ),
      ),
      expandedHeight: MediaQuery.of(context).size.height * 0.60,
      pinned: true,
      stretch: true,
      backgroundColor: grey,
      flexibleSpace: FlexibleSpaceBar(
        title: Text(
          '${charactersModel.nickName}',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
        background: Hero(
          tag: charactersModel.charId,
          child: Image.network(
            '${charactersModel.image}',
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }

  /// Characters_Information
  Widget buildCharactersInfo({
    @required String title,
    @required String value,
  }) {
    return RichText(
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
      text: TextSpan(
        children: [
          TextSpan(
            text: title,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: white,
            ),
          ),
          TextSpan(
            text: value,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w400,
              color: white,
            ),
          ),
        ],
      ),
    );
  }

  /// Divider
  Widget buildDivider({@required double endIndent}) {
    return Divider(
      color: yellow,
      height: 30,
      endIndent: endIndent,
      thickness: 2,
    );
  }

  Widget buildShowQoutes(CharactersStates state) {
    if (state is QoutesSuccessStates) {
      return buildRandomQoutes(state);
    } else {
      return buildIsLoading();
    }
  }

// Qoutes
  List<QoutesModel> qoutes;
  Widget buildRandomQoutes(state) {
    qoutes = (state).qoutes;
    if (qoutes.length != 0) {
      int randomQoutesIndex = Random().nextInt((qoutes.length + 1) - 1);
      return Center(
        child: Container(
          child: DefaultTextStyle(
            textAlign: TextAlign.start,
            style: TextStyle(
              fontSize: 20,
              color: white,
              shadows: [
                Shadow(
                  blurRadius: 8,
                  offset: Offset(0, 4),
                  color: yellow,
                ),
              ],
            ),
            child: AnimatedTextKit(
              animatedTexts: [
                FlickerAnimatedText(qoutes[randomQoutesIndex].qoutes),
              ],
              repeatForever: true,
            ),
          ),
        ),
      );
    } else {
      return Container();
    }
  }
}
