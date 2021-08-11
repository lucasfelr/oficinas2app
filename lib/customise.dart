import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ola_mundo/bluetoothapp.dart';
import 'globals.dart' as globals;
import 'crianca.dart';
import 'package:cupertino_setting_control/cupertino_setting_control.dart';

class Customise extends StatefulWidget {
  @override
  _CustomiseState createState() => new _CustomiseState();
}

class _CustomiseState extends State<Customise> {
  int auxint = 0;
  bool _chatResult1 = false;
  bool _chatResult2 = false;
  bool _chatResult3 = false;
  bool _chatResult4 = false;
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
                initialValue: _chatResult1, title: 'Allow Chat'),
            onSettingDataRowChange: onChatSettingChange1,
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
                'Modos',
                style: TextStyle(
                  color: CupertinoColors.systemBlue,
                  fontSize: 15.0,
                  fontWeight: FontWeight.bold,
                ),
              )),
          new SettingRow(
            config: SettingsRowConfiguration(
                showTitleLeft: false, showTopTitle: true),
            rowData: SettingsYesNoConfig(
                initialValue: _chatResult1, title: 'Contagem'),
            onSettingDataRowChange: onChatSettingChange1,
          ),
          new SettingRow(
            config: SettingsRowConfiguration(
                showTitleLeft: false, showTopTitle: true),
            rowData:
                SettingsYesNoConfig(initialValue: _chatResult2, title: 'Cor'),
            onSettingDataRowChange: onChatSettingChange2,
          ),
          new SettingRow(
            config: SettingsRowConfiguration(
                showTitleLeft: false, showTopTitle: true),
            rowData:
                SettingsYesNoConfig(initialValue: _chatResult3, title: 'Forma'),
            onSettingDataRowChange: onChatSettingChange3,
          ),
          new SettingRow(
            config: SettingsRowConfiguration(
                showTitleLeft: false, showTopTitle: true),
            rowData:
                SettingsYesNoConfig(initialValue: _chatResult4, title: 'Dia'),
            onSettingDataRowChange: onChatSettingChange4,
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
          new RaisedButton(
            onPressed: () {
              if (auxint >= 0 && auxint <= 3) {
                globals.exs[auxint]['Contagem'] = _chatResult1;
                globals.exs[auxint]['Cor'] = _chatResult2;
                globals.exs[auxint]['Forma'] = _chatResult3;
                globals.exs[auxint]['Dia'] = _chatResult4;
              }
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (context) => BluetoothApp()),
              );
            },
            child: Text('Salvar'),
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

  void onChatSettingChange1(bool data) {
    setState(() {
      _chatResult1 = data;
    });
  }

  void onChatSettingChange2(bool data) {
    setState(() {
      _chatResult2 = data;
    });
  }

  void onChatSettingChange3(bool data) {
    setState(() {
      _chatResult3 = data;
    });
  }

  void onChatSettingChange4(bool data) {
    setState(() {
      _chatResult4 = data;
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
