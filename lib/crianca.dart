/// Flutter code sample for Radio

// Here is an example of Radio widgets wrapped in ListTiles, which is similar
// to what you could get with the RadioListTile widget.
//
// The currently selected character is passed into `groupValue`, which is
// maintained by the example's `State`. In this case, the first `Radio`
// will start off selected because `_character` is initialized to
// `cup.cp1`.
//
// If the second radio button is pressed, the example's state is updated
// with `setState`, updating `_character` to `cup.cp2`.
// This causes the buttons to rebuild with the updated `groupValue`, and
// therefore the selection of the second button.
//
// Requires one of its ancestors to be a [Material] widget.

import 'package:flutter/material.dart';
import 'package:ola_mundo/bluetoothapp.dart';
import 'appcontroller.dart';
import 'cadastrar.dart';
import 'homepage.dart';
import 'globals.dart' as globals;

/// This is the main application widget.
enum cup { cp1, cp2, cp3, cp4 }

/// This is the stateful widget that the main application instantiates.
class Crianca extends StatefulWidget {
  const Crianca({key}) : super(key: key);

  @override
  _CriancaState createState() => _CriancaState();
}

/// This is the private State class that goes with Crianca.
class _CriancaState extends State<Crianca> {
  var _character;
  void setIterador() {
    for (int i = 0; i < 4; i++) {
      if (globals.criancasValue[i] == true) {
        globals.iterador = i;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Escolha a Criança'),
      ),
      body: SingleChildScrollView(
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: <Widget>[
                if (globals.criancas[0] != '')
                  ListTile(
                    title: Text('1 - ' + globals.criancas[0]),
                    leading: Radio<cup>(
                      value: cup.cp1,
                      groupValue: _character,
                      onChanged: (value) {
                        setState(() {
                          _character = value;
                          globals.criancasValue[0] = true;
                          globals.criancasValue[1] = false;
                          globals.criancasValue[2] = false;
                          globals.criancasValue[3] = false;
                        });
                      },
                    ),
                  ),
                if (globals.criancas[1] != '')
                  ListTile(
                    title: Text('2 - ' + globals.criancas[1]),
                    leading: Radio<cup>(
                      value: cup.cp2,
                      groupValue: _character,
                      onChanged: (value) {
                        setState(() {
                          _character = value;
                          globals.criancasValue[0] = false;
                          globals.criancasValue[1] = true;
                          globals.criancasValue[2] = false;
                          globals.criancasValue[3] = false;
                        });
                      },
                    ),
                  ),
                if (globals.criancas[2] != '')
                  ListTile(
                    title: Text('3 - ' + globals.criancas[2]),
                    leading: Radio<cup>(
                      value: cup.cp3,
                      groupValue: _character,
                      onChanged: (value) {
                        setState(() {
                          _character = value;
                          globals.criancasValue[0] = false;
                          globals.criancasValue[1] = false;
                          globals.criancasValue[2] = true;
                          globals.criancasValue[3] = false;
                        });
                      },
                    ),
                  ),
                if (globals.criancas[3] != '')
                  ListTile(
                    title: Text('4 - ' + globals.criancas[3]),
                    leading: Radio<cup>(
                      value: cup.cp4,
                      groupValue: _character,
                      onChanged: (value) {
                        setState(() {
                          _character = value;
                          globals.criancasValue[0] = false;
                          globals.criancasValue[1] = false;
                          globals.criancasValue[2] = false;
                          globals.criancasValue[3] = true;
                        });
                      },
                    ),
                  ),
                Container(
                  height: 200,
                ),
                RaisedButton(
                  onPressed: () {
                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(builder: (context) => Cadastrar()),
                    );
                  },
                  child: Text('Cadastrar'),
                ),
                RaisedButton(
                  onPressed: () {
                    if (globals.criancasValue[0] == true ||
                        globals.criancasValue[1] == true ||
                        globals.criancasValue[2] == true ||
                        globals.criancasValue[3] == true) {
                      setIterador();
                      Navigator.of(context).pushReplacement(
                        MaterialPageRoute(builder: (context) => BluetoothApp()),
                      );
                    }
                  },
                  child: Text('Avançar'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
