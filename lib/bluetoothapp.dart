import 'dart:typed_data';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bluetooth_serial/flutter_bluetooth_serial.dart';
import 'package:ola_mundo/crianca.dart';
import 'package:ola_mundo/historico.dart';
import 'package:ola_mundo/settings.dart';
import 'package:ola_mundo/waiting.dart';
import 'globals.dart' as globals;

class BluetoothApp extends StatefulWidget {
  @override
  State<BluetoothApp> createState() {
    return _BluetoothAppState();
  }
}

class _BluetoothAppState extends State<BluetoothApp> {
  //Inicializando uma globalKey, pois isso nos ajudá a mostrar uma SnackBar posteriormente
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  //Obtém uma instância do bluetooth
  FlutterBluetoothSerial bluetooth = FlutterBluetoothSerial.instance;

  //Defina algumas variáveis, que serão necessárias posteriormente
  List<BluetoothDevice> _devicesList = [];

  String getEx1() {
    String result = '';
    if (globals.listaEx1['Contagem'] == true) {
      result = result + 'Contagem';
    }
    if (globals.listaEx1['Cor'] == true) {
      result = result + ', Cor';
    }
    if (globals.listaEx1['Forma'] == true) {
      result = result + ', Forma';
    }
    if (globals.listaEx1['Dia'] == true) {
      result = result + ', Dia';
    }
    return result;
  }

  String getEx2() {
    String result = '';
    if (globals.listaEx2['Contagem'] == true) {
      result = result + 'Contagem';
    }
    if (globals.listaEx2['Cor'] == true) {
      result = result + ', Cor';
    }
    if (globals.listaEx2['Forma'] == true) {
      result = result + ', Forma';
    }
    if (globals.listaEx2['Dia'] == true) {
      result = result + ', Dia';
    }
    return result;
  }

  String getEx3() {
    String result = '';
    if (globals.listaEx3['Contagem'] == true) {
      result = result + 'Contagem';
    }
    if (globals.listaEx3['Cor'] == true) {
      result = result + ', Cor';
    }
    if (globals.listaEx3['Forma'] == true) {
      result = result + ', Forma';
    }
    if (globals.listaEx3['Dia'] == true) {
      result = result + ', Dia';
    }
    return result;
  }

  String getEx4() {
    String result = '';
    if (globals.listaEx4['Contagem'] == true) {
      result = result + 'Contagem';
    }
    if (globals.listaEx4['Cor'] == true) {
      result = result + ', Cor';
    }
    if (globals.listaEx4['Forma'] == true) {
      result = result + ', Forma';
    }
    if (globals.listaEx4['Dia'] == true) {
      result = result + ', Dia';
    }
    return result;
  }

  BluetoothDevice _device;
  bool _connected = false;
  bool _pressed = false;

  List<DropdownMenuItem<BluetoothDevice>> _getDeviceItems() {
    List<DropdownMenuItem<BluetoothDevice>> items = [];
    if (_devicesList.isEmpty) {
      items.add(DropdownMenuItem(
        child: Text('NONE'),
      ));
    } else {
      _devicesList.forEach((device) {
        items.add(DropdownMenuItem(
          child: Text(device.name),
          value: device,
        ));
      });
    }
    return items;
  }

// Método que conecta o bluetooth
  void _connect() {
    if (_device == null) {
      show('No device selected');
    } else {
      bluetooth.isConnected.then((isConnected) {
        if (!isConnected) {
          bluetooth
              .connect(_device)
              .timeout(Duration(seconds: 10))
              .catchError((error) {
            setState(() => _pressed = false);
          });
          setState(() => _pressed = true);
        }
      });
    }
  }

// Método que desconecta o bluetooth
  void _disconnect() {
    bluetooth.disconnect();
    setState(() => _pressed = true);
  }

// Método que exibe a Snackbar com a mensagem
  Future show(
    String message, {
    Duration duration: const Duration(seconds: 3),
  }) async {
    await new Future.delayed(new Duration(milliseconds: 100));
    // ignore: deprecated_member_use
    _scaffoldKey.currentState.showSnackBar(
      new SnackBar(
        content: new Text(
          message,
        ),
        duration: duration,
      ),
    );
  }

  void _sendOnMessageToBluetooth() {
    bluetooth.isConnected.then((isConnected) {
      if (isConnected) {
        bluetooth.write("1");
        show('Device Turned On');
      }
    });
  }

  void _sendOffMessageToBluetooth() {
    bluetooth.isConnected.then((isConnected) {
      if (isConnected) {
        bluetooth.write("0");
        show('Device Turned Off');
      }
    });
  }

  @override
  void initState() {
    super.initState();
    bluetoothConnectionState();
  }

// Aqui nós vamos utilizar um callback async utilizando await
  Future<void> bluetoothConnectionState() async {
    List<BluetoothDevice> devices = [];

// Obtemos a lista de dispositivos pareados
    try {
      devices = await bluetooth.getBondedDevices();
    } on PlatformException {
      print("Error");
    }

// neste ponto verificamos se o bluetooth está conectado ou desconectado
    bluetooth.onStateChanged().listen((state) {
      switch (state) {
        case FlutterBluetoothSerial.CONNECTED:
          setState(() {
            _connected = true;
            _pressed = false;
          });

          break;

        case FlutterBluetoothSerial.DISCONNECTED:
          setState(() {
            _connected = false;
            _pressed = false;
          });
          break;

        default:
          print(state);
          break;
      }
    });

    if (!mounted) {
      return;
    }

    setState(() {
      _devicesList = devices;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        key: _scaffoldKey,
        appBar: AppBar(
          title: Text("Flutter Bluetooth"),
          leading: IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () {
                globals.criancasValue[0] = false;
                globals.criancasValue[1] = false;
                globals.criancasValue[2] = false;
                globals.criancasValue[3] = false;
                globals.historyList = [];
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (context) => Crianca()),
                );
              }),
          backgroundColor: Colors.red,
        ),
        body: Container(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Text(
                  "PAIRED DEVICES",
                  style: TextStyle(fontSize: 20, color: Colors.blue),
                  textAlign: TextAlign.center,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      'Device:',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    DropdownButton(
                      // To be implemented : _getDeviceItems()
                      items: _getDeviceItems(),
                      onChanged: (value) => setState(() => _device = value),
                      value: _device,
                    ),
                    // ignore: deprecated_member_use
                    RaisedButton(
                      onPressed:
                          // To be implemented : _disconnect and _connect
                          _pressed
                              ? null
                              : _connected
                                  ? _disconnect
                                  : _connect,
                      child: Text(_connected ? 'Disconnect' : 'Connect'),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(1.0),
                child: Card(
                  elevation: 4,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    // Defining a Row containing THREE main Widgets:
                    // 1. Text (wrapped with “Expanded”)
                    // 2. FlatButton
                    // 3. FlatButton
                    child: Row(
                      children: <Widget>[
                        Expanded(
                          child: Text(
                            getEx1(),
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.green,
                            ),
                          ),
                        ),
                        // ignore: deprecated_member_use
                        FlatButton(
                          onPressed: () {
                            // To be implemented : _sendOnMessageToBluetooth()
                            // _connected ? _sendOnMessageToBluetooth : null,
                            globals.iteradorex = 0;
                            Navigator.of(context).pushReplacement(
                              MaterialPageRoute(
                                  builder: (context) => Waiting()),
                            );
                          },
                          child: Text("Começar"),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(1.0),
                child: Card(
                  elevation: 4,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    // Defining a Row containing THREE main Widgets:
                    // 1. Text (wrapped with “Expanded”)
                    // 2. FlatButton
                    // 3. FlatButton
                    child: Row(
                      children: <Widget>[
                        Expanded(
                          child: Text(
                            getEx2(),
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.green,
                            ),
                          ),
                        ),
                        // ignore: deprecated_member_use
                        FlatButton(
                          onPressed: () {
                            // To be implemented : _sendOnMessageToBluetooth()
                            // _connected ? _sendOnMessageToBluetooth : null,
                            globals.iteradorex = 1;
                            Navigator.of(context).pushReplacement(
                              MaterialPageRoute(
                                  builder: (context) => Waiting()),
                            );
                          },
                          child: Text("Começar"),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(1.0),
                child: Card(
                  elevation: 4,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    // Defining a Row containing THREE main Widgets:
                    // 1. Text (wrapped with “Expanded”)
                    // 2. FlatButton
                    // 3. FlatButton
                    child: Row(
                      children: <Widget>[
                        Expanded(
                          child: Text(
                            getEx3(),
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.green,
                            ),
                          ),
                        ),
                        // ignore: deprecated_member_use
                        FlatButton(
                          onPressed: () {
                            // To be implemented : _sendOnMessageToBluetooth()
                            // _connected ? _sendOnMessageToBluetooth : null,
                            globals.iteradorex = 2;
                            Navigator.of(context).pushReplacement(
                              MaterialPageRoute(
                                  builder: (context) => Waiting()),
                            );
                          },
                          child: Text("Começar"),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(1.0),
                child: Card(
                  elevation: 4,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    // Defining a Row containing THREE main Widgets:
                    // 1. Text (wrapped with “Expanded”)
                    // 2. FlatButton
                    // 3. FlatButton
                    child: Row(
                      children: <Widget>[
                        Expanded(
                          child: Text(
                            getEx4(),
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.green,
                            ),
                          ),
                        ),
                        // ignore: deprecated_member_use
                        FlatButton(
                          onPressed: () {
                            // To be implemented : _sendOnMessageToBluetooth()
                            // _connected ? _sendOnMessageToBluetooth : null,
                            globals.iteradorex = 3;
                            Navigator.of(context).pushReplacement(
                              MaterialPageRoute(
                                  builder: (context) => Waiting()),
                            );
                          },
                          child: Text("Começar"),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              TextButton(
                style: TextButton.styleFrom(
                  textStyle: const TextStyle(fontSize: 20),
                ),
                onPressed: () {
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (context) => Settings()),
                  );
                },
                child: const Text('Configurações'),
              ),
              TextButton(
                style: TextButton.styleFrom(
                  textStyle: const TextStyle(fontSize: 20),
                ),
                onPressed: () {
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (context) => HistoryPage()),
                  );
                },
                child: const Text('Histórico'),
              ),
              TextButton(
                style: TextButton.styleFrom(
                  textStyle: const TextStyle(fontSize: 20),
                ),
                onPressed: () {
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (context) => Settings()),
                  );
                },
                child: const Text('Customizar Exercícios'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
