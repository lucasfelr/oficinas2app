import 'dart:typed_data';
import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bluetooth_serial/flutter_bluetooth_serial.dart';
import 'package:network_info_plus/network_info_plus.dart';
import 'package:ola_mundo/crianca.dart';
import 'package:ola_mundo/customise.dart';
import 'package:ola_mundo/historico.dart';
import 'package:ola_mundo/settings.dart';
import 'package:ola_mundo/waiting.dart';
import 'package:ping_discover_network/ping_discover_network.dart';
import 'globals.dart' as globals;
import 'package:http/http.dart' as http;

class BluetoothApp extends StatefulWidget {
  @override
  _BluetoothAppState createState() => _BluetoothAppState();
}

class _BluetoothAppState extends State<BluetoothApp> {
  //Inicializando uma globalKey, pois isso nos ajudá a mostrar uma SnackBar posteriormente
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  //Obtém uma instância do bluetooth
  // FlutterBluetoothSerial bluetooth = FlutterBluetoothSerial.instance;

  //Defina algumas variáveis, que serão necessárias posteriormente
  // List<BluetoothDevice> _devicesList = [];
  Future connect() async {
    var wifiIP = await (NetworkInfo().getWifiIP());
    final String subnet = wifiIP.substring(0, wifiIP.lastIndexOf('.'));
    final int port = 13376;

    final stream = NetworkAnalyzer.discover2(subnet, port);
    stream.listen((NetworkAddress addr) {
      if (addr.exists) {
        setState(() {
          globals.ip = addr.ip;
        });
      }
    });
  }

  var jason = {};

  String getEx1() {
    String result = '';
    if (globals.listaEx1['Contagem'] == true) {
      if (globals.diff[0][globals.iterador] == 'Easy') {
        globals.message[0] = 'http://' + globals.ip + ':13376/excont/1';
      } else if (globals.diff[0][globals.iterador] == 'Normal') {
        globals.message[0] = 'http://' + globals.ip + ':13376/excont/2';
      } else if (globals.diff[0][globals.iterador] == 'Hard') {
        globals.message[0] = 'http://' + globals.ip + ':13376/excont/3';
      }
      result = result + 'Contagem';
    }
    if (globals.listaEx1['Cor'] == true) {
      if (globals.diff[1][globals.iterador] == 'Easy') {
        globals.message[1] = 'http://' + globals.ip + ':13376/excor/1';
      }
      if (globals.diff[1][globals.iterador] == 'Normal') {
        globals.message[1] = 'http://' + globals.ip + ':13376/excor/2';
      }
      if (globals.diff[1][globals.iterador] == 'Haerd') {
        globals.message[1] = 'http://' + globals.ip + ':13376/excor/3';
      }
      result = result + ' Cor';
    }
    if (globals.listaEx1['Forma'] == true) {
      if (globals.diff[2][globals.iterador] == 'Easy') {
        globals.message[2] = 'http://' + globals.ip + ':13376/exforma/1';
      }
      if (globals.diff[2][globals.iterador] == 'Normal') {
        globals.message[2] = 'http://' + globals.ip + ':13376/exforma/2';
      }
      if (globals.diff[2][globals.iterador] == 'Hard') {
        globals.message[2] = 'http://' + globals.ip + ':13376/exforma/3';
      }
      result = result + ' Forma';
    }
    if (globals.listaEx1['Dia'] == true) {
      if (globals.diff[3][globals.iterador] == 'Easy') {
        globals.message[3] = 'http://' + globals.ip + ':13376/exdias/1';
      }
      if (globals.diff[3][globals.iterador] == 'Normal') {
        globals.message[3] = 'http://' + globals.ip + ':13376/exdias/2';
      }
      if (globals.diff[3][globals.iterador] == 'Hard') {
        globals.message[3] = 'http://' + globals.ip + ':13376/exdias/3';
      }
      result = result + ' Dia';
    }
    return result;
  }

  String getEx2() {
    String result = '';
    if (globals.listaEx1['Contagem'] == true) {
      if (globals.diff[0][globals.iterador] == 'Easy') {
        globals.message[0] = 'http://' + globals.ip + ':13376/excont/1';
      } else if (globals.diff[0][globals.iterador] == 'Normal') {
        globals.message[0] = 'http://' + globals.ip + ':13376/excont/2';
      } else if (globals.diff[0][globals.iterador] == 'Hard') {
        globals.message[0] = 'http://' + globals.ip + ':13376/excont/3';
      }
      result = result + 'Contagem';
    }
    if (globals.listaEx1['Cor'] == true) {
      if (globals.diff[1][globals.iterador] == 'Easy') {
        globals.message[1] = 'http://' + globals.ip + ':13376/excor/1';
      }
      if (globals.diff[1][globals.iterador] == 'Normal') {
        globals.message[1] = 'http://' + globals.ip + ':13376/excor/2';
      }
      if (globals.diff[1][globals.iterador] == 'Haerd') {
        globals.message[1] = 'http://' + globals.ip + ':13376/excor/3';
      }
      result = result + ' Cor';
    }
    if (globals.listaEx1['Forma'] == true) {
      if (globals.diff[2][globals.iterador] == 'Easy') {
        globals.message[2] = 'http://' + globals.ip + ':13376/exforma/1';
      }
      if (globals.diff[2][globals.iterador] == 'Normal') {
        globals.message[2] = 'http://' + globals.ip + ':13376/exforma/2';
      }
      if (globals.diff[2][globals.iterador] == 'Hard') {
        globals.message[2] = 'http://' + globals.ip + ':13376/exforma/3';
      }
      result = result + ' Forma';
    }
    if (globals.listaEx1['Dia'] == true) {
      if (globals.diff[3][globals.iterador] == 'Easy') {
        globals.message[3] = 'http://' + globals.ip + ':13376/exdias/1';
      }
      if (globals.diff[3][globals.iterador] == 'Normal') {
        globals.message[3] = 'http://' + globals.ip + ':13376/exdias/2';
      }
      if (globals.diff[3][globals.iterador] == 'Hard') {
        globals.message[3] = 'http://' + globals.ip + ':13376/exdias/3';
      }
      result = result + ' Dia';
    }
    return result;
  }

  String getEx3() {
    String result = '';
    if (globals.listaEx1['Contagem'] == true) {
      if (globals.diff[0][globals.iterador] == 'Easy') {
        globals.message[0] = 'http://' + globals.ip + ':13376/excont/1';
      } else if (globals.diff[0][globals.iterador] == 'Normal') {
        globals.message[0] = 'http://' + globals.ip + ':13376/excont/2';
      } else if (globals.diff[0][globals.iterador] == 'Hard') {
        globals.message[0] = 'http://' + globals.ip + ':13376/excont/3';
      }
      result = result + 'Contagem';
    }
    if (globals.listaEx1['Cor'] == true) {
      if (globals.diff[1][globals.iterador] == 'Easy') {
        globals.message[1] = 'http://' + globals.ip + ':13376/excor/1';
      }
      if (globals.diff[1][globals.iterador] == 'Normal') {
        globals.message[1] = 'http://' + globals.ip + ':13376/excor/2';
      }
      if (globals.diff[1][globals.iterador] == 'Haerd') {
        globals.message[1] = 'http://' + globals.ip + ':13376/excor/3';
      }
      result = result + ' Cor';
    }
    if (globals.listaEx1['Forma'] == true) {
      if (globals.diff[2][globals.iterador] == 'Easy') {
        globals.message[2] = 'http://' + globals.ip + ':13376/exforma/1';
      }
      if (globals.diff[2][globals.iterador] == 'Normal') {
        globals.message[2] = 'http://' + globals.ip + ':13376/exforma/2';
      }
      if (globals.diff[2][globals.iterador] == 'Hard') {
        globals.message[2] = 'http://' + globals.ip + ':13376/exforma/3';
      }
      result = result + ' Forma';
    }
    if (globals.listaEx1['Dia'] == true) {
      if (globals.diff[3][globals.iterador] == 'Easy') {
        globals.message[3] = 'http://' + globals.ip + ':13376/exdias/1';
      }
      if (globals.diff[3][globals.iterador] == 'Normal') {
        globals.message[3] = 'http://' + globals.ip + ':13376/exdias/2';
      }
      if (globals.diff[3][globals.iterador] == 'Hard') {
        globals.message[3] = 'http://' + globals.ip + ':13376/exdias/3';
      }
      result = result + ' Dia';
    }
    return result;
  }

  String getEx4() {
    String result = '';
    if (globals.listaEx1['Contagem'] == true) {
      if (globals.diff[0][globals.iterador] == 'Easy') {
        globals.message[0] = 'http://' + globals.ip + ':13376/excont/1';
      } else if (globals.diff[0][globals.iterador] == 'Normal') {
        globals.message[0] = 'http://' + globals.ip + ':13376/excont/2';
      } else if (globals.diff[0][globals.iterador] == 'Hard') {
        globals.message[0] = 'http://' + globals.ip + ':13376/excont/3';
      }
      result = result + 'Contagem';
    }
    if (globals.listaEx1['Cor'] == true) {
      if (globals.diff[1][globals.iterador] == 'Easy') {
        globals.message[1] = 'http://' + globals.ip + ':13376/excor/1';
      }
      if (globals.diff[1][globals.iterador] == 'Normal') {
        globals.message[1] = 'http://' + globals.ip + ':13376/excor/2';
      }
      if (globals.diff[1][globals.iterador] == 'Haerd') {
        globals.message[1] = 'http://' + globals.ip + ':13376/excor/3';
      }
      result = result + ' Cor';
    }
    if (globals.listaEx1['Forma'] == true) {
      if (globals.diff[2][globals.iterador] == 'Easy') {
        globals.message[2] = 'http://' + globals.ip + ':13376/exforma/1';
      }
      if (globals.diff[2][globals.iterador] == 'Normal') {
        globals.message[2] = 'http://' + globals.ip + ':13376/exforma/2';
      }
      if (globals.diff[2][globals.iterador] == 'Hard') {
        globals.message[2] = 'http://' + globals.ip + ':13376/exforma/3';
      }
      result = result + ' Forma';
    }
    if (globals.listaEx1['Dia'] == true) {
      if (globals.diff[3][globals.iterador] == 'Easy') {
        globals.message[3] = 'http://' + globals.ip + ':13376/exdias/1';
      }
      if (globals.diff[3][globals.iterador] == 'Normal') {
        globals.message[3] = 'http://' + globals.ip + ':13376/exdias/2';
      }
      if (globals.diff[3][globals.iterador] == 'Hard') {
        globals.message[3] = 'http://' + globals.ip + ':13376/exdias/3';
      }
      result = result + ' Dia';
    }
    return result;
  }

  BluetoothDevice _device;
  bool _connected = false;
  bool _pressed = false;

  // List<DropdownMenuItem<BluetoothDevice>> _getDeviceItems() {
  //   List<DropdownMenuItem<BluetoothDevice>> items = [];
  //   if (_devicesList.isEmpty) {
  //     items.add(DropdownMenuItem(
  //       child: Text('NONE'),
  //     ));
  //   } else {
  //     _devicesList.forEach((device) {
  //       items.add(DropdownMenuItem(
  //         child: Text(device.name),
  //         value: device,
  //       ));
  //     });
  //   }
  //   return items;
  // }

// Método que conecta o bluetooth
  // void _connect() {
  //   if (_device == null) {
  //     show('No device selected');
  //   } else {
  //     bluetooth.isConnected.then((isConnected) {
  //       if (!isConnected) {
  //         bluetooth
  //             .connect(_device)
  //             .timeout(Duration(seconds: 10))
  //             .catchError((error) {
  //           setState(() => _pressed = false);
  //         });
  //         setState(() => _pressed = true);
  //       }
  //     });
  //   }
  // }

// Método que desconecta o bluetooth
  // void _disconnect() {
  //   bluetooth.disconnect();
  //   setState(() => _pressed = true);
  // }

// Método que exibe a Snackbar com a mensagem
  // Future show(
  //   String message, {
  //   Duration duration: const Duration(seconds: 3),
  // }) async {
  //   await new Future.delayed(new Duration(milliseconds: 100));
  //   // ignore: deprecated_member_use
  //   _scaffoldKey.currentState.showSnackBar(
  //     new SnackBar(
  //       content: new Text(
  //         message,
  //       ),
  //       duration: duration,
  //     ),
  //   );
  // }

  // void _sendOnMessageToBluetooth(message) {
  //   bluetooth.isConnected.then((isConnected) {
  //     if (isConnected) {
  //       bluetooth.write(message);
  //       show('Device Turned On');
  //     }
  //   });
  // }

  // void _sendMessageToBluetooth(message) {
  //   bluetooth.isConnected.then((isConnected) {
  //     if (isConnected) {
  //       bluetooth.write(message);
  //     }
  //   });
  // }

  // void _readMessageToBluetooth() {
  //   bluetooth.isConnected.then((isConnected) {
  //     if (isConnected) {
  //       bluetooth.onRead();
  //     }
  //   });
  // }

  // @override
  // void initState() {
  //   super.initState();
  //   // bluetoothConnectionState();
  // }

// Aqui nós vamos utilizar um callback async utilizando await
  // Future<void> bluetoothConnectionState() async {
  //   List<BluetoothDevice> devices = [];

// Obtemos a lista de dispositivos pareados
  // try {
  //   // devices = await bluetooth.getBondedDevices();
  // } on PlatformException {
  //   print("Error");
  // }

// neste ponto verificamos se o bluetooth está conectado ou desconectado
  // bluetooth.onStateChanged().listen((state) {
  //     switch (state) {
  //       case FlutterBluetoothSerial.CONNECTED:
  //         setState(() {
  //           _connected = true;
  //           _pressed = false;
  //         });

  //         break;

  //       case FlutterBluetoothSerial.DISCONNECTED:
  //         setState(() {
  //           _connected = false;
  //           _pressed = false;
  //         });
  //         break;

  //       default:
  //         print(state);
  //         break;
  //     }
  //   });

  //   if (!mounted) {
  //     return;
  //   }

  //   setState(() {
  //     // _devicesList = devices;
  //   });
  // }

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
              if (globals.ip == null)
                FlatButton(
                  onPressed: () async {
                    await connect();
                  },
                  child: Text("Conectar"),
                ),
              // Padding(
              //   padding: const EdgeInsets.only(top: 8.0),
              //   child: Text(
              //     "PAIRED DEVICES",
              //     style: TextStyle(fontSize: 20, color: Colors.blue),
              //     textAlign: TextAlign.center,
              //   ),
              // ),
              // Padding(
              //   padding: const EdgeInsets.all(8.0),
              //   child: Row(
              //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //     children: <Widget>[
              //       Text(
              //         'Device:',
              //         style: TextStyle(
              //           fontWeight: FontWeight.bold,
              //         ),
              //       ),
              //       // DropdownButton(
              //       //   // To be implemented : _getDeviceItems()
              //       //   items: _getDeviceItems(),
              //       //   onChanged: (value) => setState(() => _device = value),
              //       //   value: _device,
              //       // ),
              //       // ignore: deprecated_member_use
              //       RaisedButton(
              //         onPressed:
              //             // To be implemented : _disconnect and _connect
              //             _pressed
              //                 ? null
              //                 : _connected
              //                     ? _disconnect
              //                     : _connect,
              //         child: Text(_connected ? 'Disconnect' : 'Connect'),
              //       ),
              //     ],
              //   ),
              // ),
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
                            // print(message[0]);
                            // print(message[1]);
                            // print(message[2]);
                            // print(message[3]);
                            // print((Uri.parse(
                            //     'http://' + globals.ip + ':13376/exformas')));
                            // http.get(Uri.parse(
                            //     'http://' + globals.ip + ':13376/exformas'));
                            getEx1();
                            for (var i; i < 4; i++) {
                              if (globals.message[i] != null) {
                                http.get(Uri.parse(globals.message[i]));
                              }
                            }
                            // _sendMessageToBluetooth(message[0]);
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
                            getEx2();
                            for (var i; i < 4; i++) {
                              if (globals.message[i] != null) {
                                http.get(Uri.parse(globals.message[i]));
                              }
                            }
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
                            getEx3();
                            for (var i; i < 4; i++) {
                              if (globals.message[i] != null) {
                                http.get(Uri.parse(globals.message[i]));
                              }
                            }
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
                            getEx4();
                            for (var i; i < 4; i++) {
                              if (globals.message[i] != null) {
                                http.get(Uri.parse(globals.message[i]));
                              }
                            }
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
                    MaterialPageRoute(builder: (context) => Customise()),
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
