import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'globals.dart' as globals;
import 'crianca.dart';
import 'package:flutter/foundation.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:async';
import 'dart:io';

class Cadastrar extends StatefulWidget {
  @override
  _CadastrarState createState() => _CadastrarState();
}

class _CadastrarState extends State<Cadastrar> {
  String email = '';
  String password = '';
  String aux = '';
  int auxint = 0;
  String filename = '';

  Future<String> get _localPath async {
    final directory = await getApplicationDocumentsDirectory();

    return directory.path;
  }

  Future<File> get _localFile async {
    final path = await _localPath;
    return File('$path/' + filename);
  }

  Future<String> readFile() async {
    try {
      final file = await _localFile;

      // Read the file
      final contents = await file.readAsString();

      return contents;
    } catch (e) {
      // If encountering an error, return 0
      return '';
    }
  }

  Future<File> writeFile(String counter) async {
    final file = await _localFile;

    // Write the file
    return file.writeAsString(counter);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Cadastro"),
        leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (context) => Crianca()),
              );
            }),
        backgroundColor: Colors.red,
      ),
      body: SingleChildScrollView(
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextField(
                  onChanged: (text) {
                    aux = text;
                  },
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    labelText: 'Nome',
                    border: OutlineInputBorder(),
                  ),
                ),
                new TextField(
                  onChanged: (text) {
                    auxint = int.parse(text) - 1;
                  },
                  decoration: new InputDecoration(
                    labelText: "Selecione o slot (1-4)",
                    border: OutlineInputBorder(),
                  ),
                  keyboardType: TextInputType.number,
                  inputFormatters: <TextInputFormatter>[
                    FilteringTextInputFormatter.digitsOnly
                  ],
                ), // Only numbers can be entered
                SizedBox(height: 15),
                RaisedButton(
                  onPressed: () {
                    if (auxint >= 0 && auxint <= 3) {
                      globals.iterador = auxint;
                      globals.criancas[globals.iterador] = aux;
                      filename = 'crianca$auxint.txt';
                      writeFile(aux);
                    }
                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(builder: (context) => Crianca()),
                    );
                  },
                  child: Text('Cadastrar'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
