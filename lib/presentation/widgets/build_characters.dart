import 'package:breaking_app/business_logic/cubit/characters_cubit.dart';
import 'package:breaking_app/business_logic/cubit/characters_state.dart';
import '../../data/models/characters_model.dart';
import 'build_characters(UI).dart';
import 'build_loading.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

List<CharactersModel> characters;
Widget buildCharacters() {
  return BlocBuilder<CharactersCubit, CharactersStates>(
      builder: (context, state) {
    if (state is CharactersSuccessStates) {
      characters = (state).characters;
      return buildCharactersUi();
    } else {
      return buildIsLoading();
    }
  });
}
