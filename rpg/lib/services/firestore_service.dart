import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:rpg/models/character.dart';

class FirestoreService {

  static final ref = FirebaseFirestore.instance
  .collection('characters')
  .withConverter(
    fromFirestore: Character.fromFirestore, 
    toFirestore: (Character c, _)  => c.toFirestore()
    );

  // add character
  static  Future<void> addCharacter(Character character) async {
    await ref.doc(character.id).set(character);
  }

  // get chars once 
  static Future<QuerySnapshot<Character>> getCharactersOnce() {
    return ref.get();
  } 

  // update a character
  static Future<void> updateCharacter(Character character) async{
    await ref.doc(character.id).update({
      'stats':character.statsAsMap,         //Изброяваме всички полета които може да се актуализират
    'points': character.points,
    'skills': character.skills.map((s) => s.id).toList(),
    'isFav': character.isFav
    });
  }

  // remove character
  static Future<void> deleteCharacter(Character character) async{
    await ref.doc(character.id).delete();
  }
  
}