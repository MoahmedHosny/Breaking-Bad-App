import 'package:breaking_app/data/web_services/web_services.dart';

import '../../shared/end_point.dart';

import '../models/characters_model.dart';
import '../models/qoutes_model.dart';

class CharactersRepository {
  // Create An Object From Characters Web Services
  final CharactersWebSercives charactersWebServices;
  CharactersRepository(this.charactersWebServices);

  // Method GET Data From Characters Web Services
  Future<List<dynamic>> fetchData() async {
    final characters = await CharactersWebSercives.getData(CHARACTERS);
    return characters
        .map((character) => CharactersModel.fromJson(character))
        .toList();
  }

// Method GET Qoutes
  Future<List<dynamic>> fetchQoutes(String charName) async {
    final qoutes = await CharactersWebSercives.getQoutes(QOUTE, charName);
    return qoutes.map((qoute) => QoutesModel.fromJson(qoute)).toList();
  }
}
