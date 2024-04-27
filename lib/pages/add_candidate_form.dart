
import 'package:flutter/material.dart';
import 'package:tp_election/common/I_button.dart';
import 'package:tp_election/common/i_input.dart';
import 'package:tp_election/models/person_dart.dart';

class AddCandidateForm extends StatefulWidget {
  const AddCandidateForm({super.key});

  @override
  State<AddCandidateForm> createState() => _AddCandidateFormState();
}

class _AddCandidateFormState extends State<AddCandidateForm> {

  final _formKey = GlobalKey<FormState>();
  final Person person = Person();
  DateTime? birthDate;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

        title: Text("Création de candidat"),

      ),
      body: Container(
        padding: EdgeInsets.all(10),
        margin: EdgeInsets.only(top: 40),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              IIinput(
                name: 'Nom du candidat',

                validator: (value) {
                  if (value!.isEmpty) {
                    return " Champ obligatoire";
                  }
                },
                onSaved: (value) {
                  // print("Valeur à sauvegarder $value");
                  person.name = value;
                },

                prefixIcon: Icon(Icons.person),
              ),


              SizedBox(height: 25.0,),
              IIinput(
                name: 'Prénom du candidat',

                validator: (value) {
                  if (value!.isEmpty) {
                    return " Champ obligatoire";
                  }
                },
                onSaved: (value) {
                  // print("Valeur à sauvegarder $value");
                  person.surname = value;
                },

                prefixIcon: Icon(Icons.person),

              ),
              SizedBox(height: 25.0,),

              IIinput(
                name: 'Parti politique',

                validator: (value) {
                  if (value!.isEmpty) {
                    return " Champ obligatoire";
                  }
                },
                onSaved: (value) {
                  // print("Valeur à sauvegarder $value");
                  person.politicsparty = value;
                },

                prefixIcon: Icon(Icons.flag),

              ),
              SizedBox(height: 25,),

              IIinput(
                name: 'Description du parti politique',

                validator: (value) {
                  if (value!.isEmpty) {
                    return " Champ obligatoire";
                  }
                },
                onSaved: (value) {
                  // print("Valeur à sauvegarder $value");
                  person.description = value;
                },

                prefixIcon: Icon(Icons.info),


              ),
              SizedBox(height: 25.0,),
              ListTile(
                title: Text("Date de naissance"),
                subtitle: Text("$birthDate"),
                trailing: Icon(Icons.calendar_month),
                onTap: () async {
                  birthDate = await showDatePicker(
                      cancelText: "Annuler",
                      confirmText: "Confirmer",
                      barrierColor: Colors.green.shade50,
                      context: context,
                      firstDate: DateTime(1990),
                      lastDate: DateTime.now());
                  setState(() {});
                },
              ),


              /*IIinput(
                name: 'Date de naissance',

                validator: (value) {
                  if (value!.isEmpty) {
                    return " Champ obligatoire";
                  }
                },
                onSaved: (value) {

                  // print("Valeur à sauvegarder $value");
                  person.birthDate=value;

                },

                prefixIcon: Icon(Icons.person),
              ),*/
              SizedBox(height: 10,),

            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: IButton(
          onPressed: () {
            if (_formKey.currentState!.validate()) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('Inscription réussie'),
                  duration: Duration(seconds: 1),
                ),
              );
              _formKey.currentState!.save();
              Navigator.pop(context, person);
            }
          },
          text: 'SAUVEGARDER',
        ),
      ),
    );
  }
}