import '../../../data/models/characters_model.dart';
import '../../../data/models/qoutes_model.dart';

abstract class CharactersStates {}

class CharactersInitialState extends CharactersStates {}

/// GET_Characters
class CharactersSuccessStates extends CharactersStates {
  final List<CharactersModel> characters;

  CharactersSuccessStates(this.characters);
}

class CharactersErrorStates extends CharactersStates {
  final error;

  CharactersErrorStates(this.error);
}

/// GET_Qoutes
class QoutesSuccessStates extends CharactersStates {
  final List<QoutesModel> qoutes;

  QoutesSuccessStates(this.qoutes);
}

class QoutesErrorStates extends CharactersStates {
  final error;

  QoutesErrorStates(this.error);
}
