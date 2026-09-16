import 'package:flutter/material.dart';
import 'package:rpg/models/character.dart';
import 'package:rpg/models/vocation.dart';
import 'package:rpg/screens/create/vocation_card.dart';
import 'package:rpg/screens/home/home.dart';
import 'package:rpg/shared/styled_button.dart';
import 'package:rpg/shared/styled_text.dart';
import 'package:rpg/theme.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:uuid/uuid.dart';

var uuid = const Uuid();

class Create extends StatefulWidget {
  const Create({super.key});

  @override
  State<Create> createState() => _CreateState();
}

class _CreateState extends State<Create> {

  final _nameController = TextEditingController();
  final _sloganController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _sloganController.dispose();
    super.dispose();
  }

  // handling vocation selection
  Vocation selectedVocation = Vocation.junkie;

  void updateVocation(Vocation vocation){
    setState(() {
      selectedVocation = vocation;
    });
  }

  //submin handler
  void handleSubmit() {
    if (_nameController.text.trim().isEmpty){
      //show error dialog
      showDialog(context: context, 
      builder: (ctx) {
        return AlertDialog( 
          title: const StyledHeading('Missing character name!' ),
          content: const StyledText('Every good RPG character needs a great name...'),
          actions: [
            StyledButton(
              onPressed: () {
                Navigator.pop(ctx);
                }, 
              child: const StyledHeading('Close')
              )
          ],
          actionsAlignment: MainAxisAlignment.center,
          ); 
        } );

      return;
    }
    if (_sloganController.text.trim().isEmpty){
      //show error dialog
      showDialog(context: context, 
      builder: (ctx) {
        return AlertDialog( 
          title: const StyledHeading('Missing slogan!' ),
          content: const StyledText('Rembember to add catchy slogan...'),
          actions: [
            StyledButton(
              onPressed: () {
                Navigator.pop(ctx);
                }, 
              child: const StyledHeading('Close')
              )
          ],
          actionsAlignment: MainAxisAlignment.center,
          ); 
        } );
      return;
    }
    characters.add(Character(name: _nameController.text.trim(), slogan: _sloganController.text.trim(), vocation: selectedVocation, id: uuid.v4() ));

    Navigator.push(context, MaterialPageRoute(builder: (ctx)=> const Home()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: StyledTitle('Character creation'),
        centerTitle: true,
      ),
      body: Container(padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
      child: SingleChildScrollView(
      child: Column(children: [
        // wellcome message
        Center(
          child: Icon(Icons.code, color: AppColors.primaryColor,),
        ),
        Center(child: StyledHeading('Wellcome, new player.'),),
        Center(child: StyledText('Create a name & slogan for your character.'),),
        const SizedBox(height: 30),


        //Inputs for name and slogan
        TextField(
          controller: _nameController,
          style: GoogleFonts.kanit(textStyle: Theme.of(context).textTheme.bodyMedium),
          cursorColor: AppColors.textColor,
          decoration: const InputDecoration(
            prefixIcon: Icon(Icons.person_2),
            label: StyledText('Character name')
          ),
        ),
        const SizedBox(height: 20,),
        TextField(
          controller: _sloganController,
           style: GoogleFonts.kanit(textStyle: Theme.of(context).textTheme.bodyMedium),
            cursorColor: AppColors.textColor,
          decoration: const InputDecoration(
            prefixIcon: Icon(Icons.chat),
            label: StyledText('Character slogan')
          ),
        ),
        const SizedBox(height: 30,),
        // Select vocation title
         Center(
          child: Icon(Icons.code, color: AppColors.primaryColor,),
        ),
        Center(child: StyledHeading('Choose a vocation.'),),
        Center(child: StyledText('This determines your available skills.'),),
        const SizedBox(height: 30),
        // vocation cards
        VocationCard(vocation: Vocation.junkie, onTap: updateVocation, selected: selectedVocation == Vocation.junkie, ),
        VocationCard(vocation: Vocation.ninja,  onTap: updateVocation, selected: selectedVocation == Vocation.ninja ),
        VocationCard(vocation: Vocation.raider,  onTap: updateVocation, selected: selectedVocation == Vocation.raider ),
        VocationCard(vocation: Vocation.wizard,  onTap: updateVocation, selected: selectedVocation == Vocation.wizard ),

        // good luck message
         Center(
          child: Icon(Icons.code, color: AppColors.primaryColor,),
        ),
        Center(child: StyledHeading('Good luck!'),),
        Center(child: StyledText('And enjoy the journey.....'),),
        const SizedBox(height: 30),
        Center(
          child: StyledButton(onPressed: handleSubmit, child: const StyledHeading("Create Character")),
        ),
        
        
      ],),),
    ));
  }
}