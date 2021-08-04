import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'globals.dart' as globals;
import 'crianca.dart';

class Cadastrar extends StatefulWidget {
  @override
  _CadastrarState createState() => _CadastrarState();
}

class _CadastrarState extends State<Cadastrar> {
  String email = '';
  String password = '';
  String aux = '';
  int auxint = 0;

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
