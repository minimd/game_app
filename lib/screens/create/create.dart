import 'package:flutter/material.dart';
import 'package:game_app/models/character.dart';
import 'package:game_app/models/vocation.dart';
import 'package:game_app/provider/character_store.dart';
import 'package:game_app/screens/create/vocation_cart.dart';
import 'package:game_app/screens/home/home.dart';
import 'package:game_app/shared/styled_button.dart';
import 'package:game_app/shared/styled_text.dart';
import 'package:game_app/theme.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:uuid/uuid.dart';

var uuid = const Uuid();

class CreateScreen extends StatefulWidget {
  const CreateScreen({super.key});

  @override
  State<CreateScreen> createState() => _CreateScreenState();
}

class _CreateScreenState extends State<CreateScreen> {
  //this man here will take care of the text input.. otherwise. it will be so difficult to handle it.
  final _nameController = TextEditingController();
  final _sloganController = TextEditingController();

//aight honey.. this dispose frees up memory and makes things clean.
//when we don't need these controllers surley.
  @override
  void dispose() {
    _nameController.dispose();
    _sloganController.dispose();

    super.dispose();
  }

  Vocation selectedVocation = Vocation.junkie;

//here is the star of the statefulWidget crew..
//when we put something inside the setState.. that thing is gonna act like a kid..
//whenever the kid changes.. the whole widget is going to rebuild so the kid is happy now
// how about the things outside the setState ? fuck em
  void updateVocation(Vocation vocation) {
    setState(() {
      selectedVocation = vocation;
    });
  }

  //subMIT HANDLER

  void handleSubmit() {
    //to access the inputted text.. you shall write the name of its controller.
    //then the .text.. the rest is ez
    if (_nameController.text.trim().isEmpty) {
      //this is our popup
      showDialog(
          context: context,
          builder: (ctx) {
            //this is the text inside the popup.. reletavily simple
            return AlertDialog(
              title: const StyledHeading('fill the name.'),
              content: const StyledText('what character that has no name ?'),
              actions: [
                StyledButton(
                    onPressed: () {
                      Navigator.pop(ctx);
                    },
                    child: const StyledHeading('colse'))
              ],
              actionsAlignment: MainAxisAlignment.center,
            );
          });
      //show errors
      return;
    }
    if (_sloganController.text.trim().isEmpty) {
      showDialog(
          context: context,
          builder: (ctx) {
            //this is the text inside the popup.. reletavily simple
            return AlertDialog(
              title: const StyledHeading('fill the slogan.'),
              content: const StyledText('remeber to use some spicy slogan'),
              actions: [
                StyledButton(
                    onPressed: () {
                      Navigator.pop(ctx);
                    },
                    child: const StyledHeading('colse'))
              ],
              actionsAlignment: MainAxisAlignment.center,
            );
          });
      //show errors
      return;
    }

//by doing this.. we are accessing our provider
    Provider.of<CharacterStore>(context, listen: false).addCharacter(Character(
//we made 2 controllers for those
      name: _nameController.text.trim(),
      slogan: _sloganController.text.trim(),
      //we made a good function to choose this
      vocation: selectedVocation,
      // we imported Uuid so it makes an id for this
      id: uuid.v4(),
    ));

//this is the thing we wanted in the first place.. show time🔥🔥 commented so we can use the function in the provider
//     characters.add(Character(
// //we made 2 controllers for those
//       name: _nameController.text.trim(),
//       slogan: _sloganController.text.trim(),
//       //we made a good function to choose this
//       vocation: selectedVocation,
//       // we imported Uuid so it makes an id for this
//       id: uuid.v4(),
//     ));

    Navigator.push(context, MaterialPageRoute(builder: (ctx) => const Home()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const StyledHeading('create a character'),
        centerTitle: true,
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
        //this is just like lionel messi.. it make the items slide..(scrollable)
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              //
              Center(
                child: Icon(
                  Icons.code,
                  color: AppColors.primaryColor,
                ),
              ),
              const Center(
                child: StyledHeading('welcome, new player'),
              ),
              const Center(
                child: StyledText('create a name & slogan for your character'),
              ),
              const SizedBox(
                height: 30,
              ),

              //text input
              TextField(
                //here we assign the previously made controller to this text field
                controller: _nameController,
                style: GoogleFonts.kanit(
                  textStyle: Theme.of(context).textTheme.bodyMedium,
                ),
                cursorColor: AppColors.textColor,
                decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.person_2),
                    label: StyledText('character name')),
              ),
              const SizedBox(
                height: 5,
              ),
              TextField(
                controller: _sloganController,
                style: GoogleFonts.kanit(
                  textStyle: Theme.of(context).textTheme.bodyMedium,
                ),
                cursorColor: AppColors.textColor,
                decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.chat),
                  label: StyledText('slogan'),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              //vocation
              Center(
                child: Icon(
                  Icons.code,
                  color: AppColors.primaryColor,
                ),
              ),
              const Center(
                child: StyledHeading('choose a vocation'),
              ),
              const Center(
                child: StyledText('this determines your available skills'),
              ),
              const SizedBox(
                height: 30,
              ),
              VocationCart(
                //alright stay with me.. the word function here is a preMade parameter that exists in the VocationCart widget..
                //it should return a function that take a parameter of type (Vocation) in it.. but!
                //in the widget itself (check Vocation_cart.dart) i passed the "function" and the parameter already.
                //so now any function that sits here will automaticaly take the (vocation) parameter.. (e.g print instead of print(vocation))
                vocation: Vocation.junkie,
                function: updateVocation,
                selected: selectedVocation == Vocation.junkie,
              ),
              VocationCart(
                vocation: Vocation.ninja,
                function: updateVocation,
                selected: selectedVocation == Vocation.ninja,
              ),
              VocationCart(
                vocation: Vocation.raider,
                function: updateVocation,
                selected: selectedVocation == Vocation.raider,
              ),
              VocationCart(
                vocation: Vocation.wizard,
                function: updateVocation,
                selected: selectedVocation == Vocation.wizard,
              ),
              Center(
                child: Icon(
                  Icons.code,
                  color: AppColors.primaryColor,
                ),
              ),
              const Center(
                child: StyledHeading('good luck'),
              ),
              const Center(
                child: StyledText('adventures await you.'),
              ),
              const SizedBox(
                height: 30,
              ),

              Center(
                child: StyledButton(
                  onPressed: handleSubmit,
                  child: const StyledHeading('create character'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
