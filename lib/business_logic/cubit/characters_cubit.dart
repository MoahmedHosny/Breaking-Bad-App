import 'package:breaking_app/data/repository/characters_repository.dart';
import '../../../data/models/characters_model.dart';
import '../../../data/models/qoutes_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'characters_state.dart';

class CharactersCubit extends Cubit<CharactersStates> {
  // Create An Object From Characters Repository
  final CharactersRepository charactersRepository;
  CharactersCubit(this.charactersRepository) : super(CharactersInitialState());

  // Create An Object From Cubit
  /// static CharactersCubit get(context) => BlocProvider.of(context);

// Method GET Data
  List<CharactersModel> characters = [];
  List<dynamic> getData() {
    charactersRepository.fetchData().then((characters) {
      // print(characters);
      characters = characters;
      emit(CharactersSuccessStates(characters));
    }).catchError((error) {
      // print(error.toString());
      emit(CharactersErrorStates(error.toString()));
    });
    return characters;
  }

  // Method GET Qoutes
  List<QoutesModel> qoutes = [];
  List<dynamic> getQoute(String charName) {
    charactersRepository.fetchQoutes(charName).then((qoutes) {
      // print(qoutes);
      qoutes = qoutes;
      emit(QoutesSuccessStates(qoutes));
    }).catchError((error) {
      // print(error.toString());
      emit(QoutesErrorStates(error.toString()));
    });
    return qoutes;
  }
}
