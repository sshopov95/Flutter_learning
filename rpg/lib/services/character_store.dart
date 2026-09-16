import 'package:flutter/foundation.dart';
import 'package:rpg/models/character.dart';
import 'package:rpg/models/vocation.dart';

class CharacterStore extends ChangeNotifier {
  final List<Character> _characters = [
  Character(name: 'Klara', slogan: 'Kapumf!', vocation: Vocation.wizard, id: '1'),
  Character(name: 'Jonny', slogan: 'Lights me up...', vocation: Vocation.junkie, id: '2'),
  Character(name: 'Crimson', slogan: 'Fire in the hole!', vocation: Vocation.raider, id: '3'),
  Character(name: 'Shaun', slogan: 'Alright then gang.', vocation: Vocation.ninja, id: '4')
];

get characters => _characters;

// add character
void addCharacter(Character character){
  _characters.add(character);
  notifyListeners();
}
//save (update) character

//remove character

//initially fetch characters

}