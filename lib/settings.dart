import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ola_mundo/bluetoothapp.dart';
import 'globals.dart' as globals;
import 'crianca.dart';
import 'package:cupertino_setting_control/cupertino_setting_control.dart';

class Settings extends StatefulWidget {
  @override
  _SettingsState createState() => new _SettingsState();
}

class _SettingsState extends State<Settings> {
  bool _chatResult = true;
  String _searchAreaResult = 'Germany';
  bool _titleOnTop = false;

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
          new SettingRow(
            rowData: SettingsDropDownConfig(
                title: 'Contagem',
                initialKey:
                    globals.criancasContagemDificuldade[globals.iterador],
                choices: {'Easy': 'Easy', 'Normal': 'Normal', 'Hard': 'Hard'}),
            onSettingDataRowChange: trocaContagem,
            config: SettingsRowConfiguration(
                showAsTextField: false,
                showTitleLeft: false,
                showTopTitle: true,
                showAsSingleSetting: false),
          ),
          new SettingRow(
            rowData: SettingsDropDownConfig(
                title: 'Cor',
                initialKey: globals.criancasCorDificuldade[globals.iterador],
                choices: {'Easy': 'Easy', 'Normal': 'Normal', 'Hard': 'Hard'}),
            onSettingDataRowChange: trocaCor,
            config: SettingsRowConfiguration(
                showAsTextField: false,
                showTitleLeft: false,
                showTopTitle: true,
                showAsSingleSetting: false),
          ),
          new SettingRow(
            rowData: SettingsDropDownConfig(
                title: 'Forma',
                initialKey: globals.criancasFormaDificuldade[globals.iterador],
                choices: {'Easy': 'Easy', 'Normal': 'Normal', 'Hard': 'Hard'}),
            onSettingDataRowChange: trocaForma,
            config: SettingsRowConfiguration(
                showAsTextField: false,
                showTitleLeft: false,
                showTopTitle: true,
                showAsSingleSetting: false),
          ),
          new SettingRow(
            rowData: SettingsDropDownConfig(
                title: 'Dia da Semana',
                initialKey: globals.criancasDiaDificuldade[globals.iterador],
                choices: {'Easy': 'Easy', 'Normal': 'Normal', 'Hard': 'Hard'}),
            onSettingDataRowChange: trocaDia,
            config: SettingsRowConfiguration(
                showAsTextField: false,
                showTitleLeft: false,
                showTopTitle: true,
                showAsSingleSetting: false),
          ),
          //       SizedBox(height: _titleOnTop ? 10.0 : 0.0),
          //       new SettingRow(
          //         rowData: SettingsSliderConfig(
          //           title: 'Age',
          //           from: 18,
          //           to: 120,
          //           initialValue: 20,
          //           justIntValues: true,
          //           unit: ' years',
          //         ),
          //         onSettingDataRowChange: (double resultVal) {},
          //         config: SettingsRowConfiguration(
          //             showAsTextField: false,
          //             showTitleLeft: !_titleOnTop,
          //             showTopTitle: _titleOnTop,
          //             showAsSingleSetting: false),
          //       ),
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
      const SizedBox(height: 15.0),
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
        title: Text("Configurações " + globals.criancas[globals.iterador]),
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
          padding: const EdgeInsets.fromLTRB(0, 50, 0, 0),
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
