import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rpg/screens/create/create.dart';
import 'package:rpg/screens/home/character_card.dart';
import 'package:rpg/services/character_store.dart';
import 'package:rpg/shared/styled_button.dart';
import 'package:rpg/shared/styled_text.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  // fetch data from Firestore
  @override
  void initState() {
    Provider.of<CharacterStore>(context, listen: false).fetchCharactersOnce();
    
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const StyledTitle('Your characters'),
        centerTitle: true,
      ),
      body: Container(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
           Expanded(
            child: Consumer<CharacterStore>(
              builder: (context,value,child) {
              return ListView.builder(
                itemCount: value.characters.length,
                itemBuilder: (_, index) {
                  return Dismissible(
                    key: ValueKey(value.characters[index].id),
                    onDismissed: (direction) {
                      Provider.of<CharacterStore>(context, listen: false).removeCharacter(value.characters[index]);
                    } ,
                    child: CharacterCard(value.characters[index])
                    );
                  },
                );
              }
            ),
            ),
            StyledButton(onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (ctx) => CreateScreen()));
            },
             child: const StyledHeading('Create new'))
          ],
        )
      ),
    );
  }
}