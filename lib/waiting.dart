import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ola_mundo/bluetoothapp.dart';
import 'globals.dart' as globals;
import 'crianca.dart';
import 'package:cupertino_setting_control/cupertino_setting_control.dart';

class Waiting extends StatefulWidget {
  @override
  _WaitingState createState() => new _WaitingState();
}

class _WaitingState extends State<Waiting> {
  bool _chatResult = true;
  int count = 0;
  String _searchAreaResult = 'Germany';
  bool _titleOnTop = false;
  Future<void> _showDialogContagem() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Atenção'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text(globals.criancas[globals.iterador] +
                    " está prontx para sair da dificuldade " +
                    globals.criancasContagemDificuldade[globals.iterador] +
                    ' nos exercícios de Contagem. Deseja aumentar a dificuldade?'),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Sim'),
              onPressed: () {
                if (globals.criancasContagemDificuldade[globals.iterador] ==
                    'Easy')
                  globals.criancasContagemDificuldade[globals.iterador] =
                      'Normal';
                else if (globals
                        .criancasContagemDificuldade[globals.iterador] ==
                    'Normal')
                  globals.criancasContagemDificuldade[globals.iterador] =
                      'Hard';
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: const Text('Não'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  Future<void> _showDialogCor() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Atenção'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text(globals.criancas[globals.iterador] +
                    " está prontx para sair da dificuldade " +
                    globals.criancasCorDificuldade[globals.iterador] +
                    ' nos exercícios de Cor. Deseja aumentar a dificuldade?'),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Sim'),
              onPressed: () {
                if (globals.criancasCorDificuldade[globals.iterador] == 'Easy')
                  globals.criancasCorDificuldade[globals.iterador] = 'Normal';
                else if (globals.criancasCorDificuldade[globals.iterador] ==
                    'Normal')
                  globals.criancasCorDificuldade[globals.iterador] = 'Hard';
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: const Text('Não'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  Future<void> _showDialogDia() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Atenção'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text(globals.criancas[globals.iterador] +
                    " está prontx para sair da dificuldade " +
                    globals.criancasDiaDificuldade[globals.iterador] +
                    ' nos exercícios de Dia. Deseja aumentar a dificuldade?'),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Sim'),
              onPressed: () {
                if (globals.criancasDiaDificuldade[globals.iterador] == 'Easy')
                  globals.criancasDiaDificuldade[globals.iterador] = 'Normal';
                else if (globals.criancasDiaDificuldade[globals.iterador] ==
                    'Normal')
                  globals.criancasDiaDificuldade[globals.iterador] = 'Hard';
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: const Text('Não'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  Future<void> _showDialogForma() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Atenção'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text(globals.criancas[globals.iterador] +
                    " está prontx para sair da dificuldade " +
                    globals.criancasFormaDificuldade[globals.iterador] +
                    ' nos exercícios de Forma. Deseja aumentar a dificuldade?'),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Sim'),
              onPressed: () {
                if (globals.criancasFormaDificuldade[globals.iterador] ==
                    'Easy')
                  globals.criancasFormaDificuldade[globals.iterador] = 'Normal';
                else if (globals.criancasFormaDificuldade[globals.iterador] ==
                    'Normal')
                  globals.criancasFormaDificuldade[globals.iterador] = 'Hard';
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: const Text('Não'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final titleOnTopSwitch = SettingRow(
        rowData: SettingsYesNoConfig(
            initialValue: _titleOnTop, title: 'Title on top'),
        config: const SettingsRowConfiguration(showAsSingleSetting: true),
        onSettingDataRowChange: (newVal) => setState(() {
              _titleOnTop = newVal;
            }));

    final legalStuff = new Material(
      color: Colors.transparent,
      child: new Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          const Padding(
              padding: const EdgeInsets.fromLTRB(25.0, 5.0, 25.0, 5.0),
              child: const Text('Legal',
                  style: TextStyle(
                    color: CupertinoColors.systemBlue,
                    fontWeight: FontWeight.bold,
                    fontSize: 15.0,
                  ))),
          new SettingRow(
              config: SettingsRowConfiguration(
                  showTitleLeft: !_titleOnTop, showTopTitle: _titleOnTop),
              rowData: SettingsURLConfig(
                  title: 'Privacy',
                  url: 'https://yourprivacystuff.notexistant')),
          SizedBox(height: _titleOnTop ? 10.0 : 0.0),
          new SettingRow(
              config: SettingsRowConfiguration(
                  showTitleLeft: !_titleOnTop, showTopTitle: _titleOnTop),
              rowData: SettingsButtonConfig(
                  title: 'Licenses',
                  tick: true,
                  functionToCall: () => showLicensePage(
                      context: context,
                      applicationName: 'example',
                      applicationVersion: 'v1.1',
                      useRootNavigator: true))),
        ],
      ),
    );

    final privacySettings = new Material(
      color: Colors.transparent,
      child: new Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          const Padding(
              padding: EdgeInsets.fromLTRB(25.0, 5.0, 25.0, 5.0),
              child: const Text(
                'Privacy Settings',
                style: TextStyle(
                  color: CupertinoColors.systemBlue,
                  fontWeight: FontWeight.bold,
                  fontSize: 15.0,
                ),
              )),
          new SettingRow(
            config: SettingsRowConfiguration(
                showTitleLeft: !_titleOnTop, showTopTitle: _titleOnTop),
            rowData: SettingsYesNoConfig(
                initialValue: _chatResult, title: 'Allow Chat'),
            onSettingDataRowChange: onChatSettingChange,
          ),
        ],
      ),
    );

    final profileSettingsTile = new Material(
      color: Colors.transparent,
      child: new Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          const Padding(
              padding: EdgeInsets.fromLTRB(25.0, 5.0, 25.0, 5.0),
              child: const Text(
                'Dificuldade',
                style: TextStyle(
                  color: CupertinoColors.systemBlue,
                  fontSize: 15.0,
                  fontWeight: FontWeight.bold,
                ),
              )),
          // new SettingRow(
          //   rowData: SettingsDropDownConfig(
          //       title: 'Contagem',
          //       initialKey:
          //           globals.criancasContagemDificuldade[globals.iterador],
          //       choices: {'Easy': 'Easy', 'Normal': 'Normal', 'Hard': 'Hard'}),
          //   onSettingDataRowChange: trocaContagem,
          //   config: SettingsRowConfiguration(
          //       showAsTextField: false,
          //       showTitleLeft: false,
          //       showTopTitle: true,
          //       showAsSingleSetting: false),
          // ),
          // new SettingRow(
          //   rowData: SettingsDropDownConfig(
          //       title: 'Cor',
          //       initialKey: globals.criancasCorDificuldade[globals.iterador],
          //       choices: {'Easy': 'Easy', 'Normal': 'Normal', 'Hard': 'Hard'}),
          //   onSettingDataRowChange: trocaCor,
          //   config: SettingsRowConfiguration(
          //       showAsTextField: false,
          //       showTitleLeft: false,
          //       showTopTitle: true,
          //       showAsSingleSetting: false),
          // ),
          // new SettingRow(
          //   rowData: SettingsDropDownConfig(
          //       title: 'Forma',
          //       initialKey: globals.criancasFormaDificuldade[globals.iterador],
          //       choices: {'Easy': 'Easy', 'Normal': 'Normal', 'Hard': 'Hard'}),
          //   onSettingDataRowChange: trocaForma,
          //   config: SettingsRowConfiguration(
          //       showAsTextField: false,
          //       showTitleLeft: false,
          //       showTopTitle: true,
          //       showAsSingleSetting: false),
          // ),
          // new SettingRow(
          //   rowData: SettingsDropDownConfig(
          //       title: 'Dia da Semana',
          //       initialKey: globals.criancasDiaDificuldade[globals.iterador],
          //       choices: {'Easy': 'Easy', 'Normal': 'Normal', 'Hard': 'Hard'}),
          //   onSettingDataRowChange: trocaDia,
          //   config: SettingsRowConfiguration(
          //       showAsTextField: false,
          //       showTitleLeft: false,
          //       showTopTitle: true,
          //       showAsSingleSetting: false),
          // ),
          //       SizedBox(height: _titleOnTop ? 10.0 : 0.0),
          if (globals.exs[globals.iteradorex]['Contagem'] == true)
            new SettingRow(
              rowData: SettingsSliderConfig(
                title: 'Contagem ' +
                    globals.criancasContagemDificuldade[globals.iterador],
                from: 0,
                to: 100,
                initialValue: 50,
                justIntValues: true,
                unit: ' %',
              ),
              onSettingDataRowChange: (double resultVal) {
                globals.exsim[globals.iteradorex]['Contagem'] = resultVal;
              },
              config: SettingsRowConfiguration(
                  showAsTextField: false,
                  showTitleLeft: false,
                  showTopTitle: true,
                  showAsSingleSetting: false),
            ),
          if (globals.exs[globals.iteradorex]['Cor'] == true)
            new SettingRow(
              rowData: SettingsSliderConfig(
                title:
                    'Cor ' + globals.criancasCorDificuldade[globals.iterador],
                from: 0,
                to: 100,
                initialValue: 50,
                justIntValues: true,
                unit: ' %',
              ),
              onSettingDataRowChange: (double resultVal) {
                globals.exsim[globals.iteradorex]['Cor'] = resultVal;
              },
              config: SettingsRowConfiguration(
                  showAsTextField: false,
                  showTitleLeft: false,
                  showTopTitle: true,
                  showAsSingleSetting: false),
            ),
          if (globals.exs[globals.iteradorex]['Forma'] == true)
            new SettingRow(
              rowData: SettingsSliderConfig(
                title: 'Forma ' +
                    globals.criancasFormaDificuldade[globals.iterador],
                from: 0,
                to: 100,
                initialValue: 50,
                justIntValues: true,
                unit: ' %',
              ),
              onSettingDataRowChange: (double resultVal) {
                globals.exsim[globals.iteradorex]['Forma'] = resultVal;
              },
              config: SettingsRowConfiguration(
                  showAsTextField: false,
                  showTitleLeft: false,
                  showTopTitle: true,
                  showAsSingleSetting: false),
            ),
          if (globals.exs[globals.iteradorex]['Dia'] == true)
            new SettingRow(
              rowData: SettingsSliderConfig(
                title:
                    'Dia ' + globals.criancasDiaDificuldade[globals.iterador],
                from: 0,
                to: 100,
                initialValue: 50,
                justIntValues: true,
                unit: ' %',
              ),
              onSettingDataRowChange: (double resultVal) {
                globals.exsim[globals.iteradorex]['Dia'] = resultVal;
              },
              config: SettingsRowConfiguration(
                  showAsTextField: false,
                  showTitleLeft: false,
                  showTopTitle: true,
                  showAsSingleSetting: false),
            ),
          new Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              new TextButton(
                onPressed: () {
                  globals.historyList.add(globals.History(
                      nome: globals.criancas[globals.iterador],
                      ex: 'Contagem',
                      dificulty:
                          globals.criancasContagemDificuldade[globals.iterador],
                      nota: globals.exsim[globals.iteradorex]['Contagem'],
                      dateTime: DateTime.now()));
                  globals.historyList.add(globals.History(
                      nome: globals.criancas[globals.iterador],
                      ex: 'Cor',
                      dificulty:
                          globals.criancasCorDificuldade[globals.iterador],
                      nota: globals.exsim[globals.iteradorex]['Cor'],
                      dateTime: DateTime.now()));
                  globals.historyList.add(globals.History(
                      nome: globals.criancas[globals.iterador],
                      ex: 'Forma',
                      dificulty:
                          globals.criancasFormaDificuldade[globals.iterador],
                      nota: globals.exsim[globals.iteradorex]['Forma'],
                      dateTime: DateTime.now()));
                  globals.historyList.add(globals.History(
                      nome: globals.criancas[globals.iterador],
                      ex: 'Dia',
                      dificulty:
                          globals.criancasDiaDificuldade[globals.iterador],
                      nota: globals.exsim[globals.iteradorex]['Dia'],
                      dateTime: DateTime.now()));
                  if (globals.exsim[globals.iteradorex]['Contagem'] >= 60 &&
                      globals.criancasContagemDificuldade[globals.iterador] !=
                          'Hard') _showDialogContagem();
                  if (globals.exsim[globals.iteradorex]['Cor'] >= 60 &&
                      globals.criancasCorDificuldade[globals.iterador] !=
                          'Hard') _showDialogCor();
                  if (globals.exsim[globals.iteradorex]['Forma'] >= 60 &&
                      globals.criancasFormaDificuldade[globals.iterador] !=
                          'Hard') _showDialogForma();
                  if (globals.exsim[globals.iteradorex]['Dia'] >= 60 &&
                      globals.criancasDiaDificuldade[globals.iterador] !=
                          'Hard') _showDialogDia();
                },
                child: const Text('Enviar'),
              ),
              Container(height: 20.0), //SizedBox(height: 20.0),
            ],
          ),
          //       SizedBox(height: _titleOnTop ? 10.0 : 0.0),
          //       new SettingRow(
          //         rowData: SettingsSliderFromToConfig(
          //           title: 'Weight',
          //           from: 40,
          //           to: 120,
          //           initialFrom: 50,
          //           initialTo: 80,
          //           justIntValues: true,
          //           unit: 'kg',
          //         ),
          //         onSettingDataRowChange: (List<double> resultVals) {},
          //         config: SettingsRowConfiguration(
          //             showAsTextField: false,
          //             showTitleLeft: !_titleOnTop,
          //             showTopTitle: _titleOnTop,
          //             showAsSingleSetting: false),
          //       ),
          //       SizedBox(height: _titleOnTop ? 10.0 : 0.0),
          //       new SettingRow(
          //         rowData: SettingsTextFieldConfig(
          //           title: 'Name',
          //           initialValue: 'Chris',
          //         ),
          //         onSettingDataRowChange: (String resultVal) {},
          //         config: SettingsRowConfiguration(
          //             showAsTextField: false,
          //             showTitleLeft: !_titleOnTop,
          //             showTopTitle: _titleOnTop,
          //             showAsSingleSetting: false),
          //       ),
        ],
      ),
    );

    // final modifyProfileTile = new Material(
    //     color: Colors.transparent,
    //     child: new Column(
    //         crossAxisAlignment: CrossAxisAlignment.start,
    //         children: <Widget>[
    //           const Padding(
    //               padding: EdgeInsets.fromLTRB(25.0, 5.0, 25.0, 5.0),
    //               child: const Text(
    //                 'Profile Options',
    //                 style: TextStyle(
    //                   color: CupertinoColors.systemBlue,
    //                   fontWeight: FontWeight.bold,
    //                   fontSize: 15.0,
    //                 ),
    //               )),
    //           SettingRow(
    //             rowData: SettingsButtonConfig(
    //               title: 'Delete Profile',
    //               tick: true,
    //               functionToCall: () {},
    //             ),
    //             style: const SettingsRowStyle(
    //                 backgroundColor: CupertinoColors.lightBackgroundGray),
    //             config: SettingsRowConfiguration(
    //                 showAsTextField: false,
    //                 showTitleLeft: !_titleOnTop,
    //                 showTopTitle: _titleOnTop,
    //                 showAsSingleSetting: false),
    //           )
    //         ]));

    final List<Widget> widgetList = [
      //titleOnTopSwitch,
      //const SizedBox(height: 15.0),
      profileSettingsTile,
      const SizedBox(height: 15.0),
      //privacySettings,
      const SizedBox(height: 15.0),
      //legalStuff,
      const SizedBox(height: 15.0),
      //Row(children: [Expanded(child: modifyProfileTile)]),
    ];

    return new Scaffold(
      appBar: AppBar(
        title: Text("Cadastro"),
        leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (context) => BluetoothApp()),
              );
            }),
        backgroundColor: Colors.red,
      ),
      body: Padding(
          padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
          child: ListView(
              children: widgetList,
              physics: const AlwaysScrollableScrollPhysics())),
    );
  }

  void onChatSettingChange(bool data) {
    setState(() {
      _chatResult = data;
    });
  }

  void trocaContagem(String data) {
    setState(() {
      globals.criancasContagemDificuldade[globals.iterador] = data;
    });
  }

  void trocaCor(String data) {
    setState(() {
      globals.criancasCorDificuldade[globals.iterador] = data;
    });
  }

  void trocaDia(String data) {
    setState(() {
      globals.criancasDiaDificuldade[globals.iterador] = data;
    });
  }

  void trocaForma(String data) {
    setState(() {
      globals.criancasFormaDificuldade[globals.iterador] = data;
    });
  }
}
