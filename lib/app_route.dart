import 'package:breaking_app/business_logic/cubit/characters_cubit.dart';
import 'package:breaking_app/data/repository/characters_repository.dart';
import 'package:breaking_app/data/web_services/web_services.dart';
import 'constants/constants.dart';
import 'data/models/characters_model.dart';
import 'presentation/screens/details_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'presentation/screens/home_screen.dart';

class AppRoute {
  // Create An Objects for CharactersRepository And CharactersCubit
  CharactersRepository charactersRepository;
  CharactersCubit charactersCubit;
  AppRoute() {
    charactersRepository = CharactersRepository(CharactersWebSercives());
    charactersCubit =
        CharactersCubit(charactersRepository); // charactersRepository
  }

  // ignore: missing_return
  Route generateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case Home:
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) =>
                CharactersCubit(charactersRepository), // charactersRepository
            child: HomeScreen(),
          ),
        );
      case Details:
        final character = routeSettings.arguments as CharactersModel;
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) =>
                CharactersCubit(charactersRepository), // charactersRepository
            child: DetailsScreen(charactersModel: character),
          ),
        );
    }
  }
}
