import 'package:flutter/foundation.dart';
import 'package:rpg/models/character.dart';
import 'package:rpg/services/firestore_service.dart';

class CharacterStore extends ChangeNotifier {
  final List<Character> _characters = [];

List<Character> get characters => _characters;

// add character
void addCharacter(Character character){
  FirestoreService.addCharacter(character);
  _characters.add(character);
  notifyListeners();
}

//save (update) character
Future<void> saveCharacter(Character character) async {
  await FirestoreService.updateCharacter(character);
  return;
}

//remove character
void removeCharacter(Character character) async{
  await FirestoreService.deleteCharacter(character);
  _characters.remove(character);
  notifyListeners();
}

// initially fetch characters
  void fetchCharactersOnce() async {
    if (characters.isEmpty){
      final snapshot = await FirestoreService.getCharactersOnce();
      for (var doc in snapshot.docs){
        _characters.add(doc.data());
      }
      notifyListeners();
    }
  }
}