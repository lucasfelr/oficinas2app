// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'globals.dart' as globals;
// import 'crianca.dart';
// import 'package:flutter_blue/flutter_blue.dart';
// import 'package:flutter/material.dart';

// class MyHomePage extends StatefulWidget {
//   MyHomePage({Key key, this.title}) : super(key: key);

//   final String title;
//   final FlutterBlue flutterBlue = FlutterBlue.instance;
//   // ignore: deprecated_member_use
//   final List<BluetoothDevice> devicesList = new List<BluetoothDevice>();

//   @override
//   _MyHomePageState createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   var _services;
//   var _connectedDevice;
//   _addDeviceTolist(final BluetoothDevice device) {
//     if (!widget.devicesList.contains(device)) {
//       setState(() {
//         widget.devicesList.add(device);
//       });
//     }
//   }

//   @override
//   void initState() {
//     super.initState();
//     widget.flutterBlue.connectedDevices
//         .asStream()
//         .listen((List<BluetoothDevice> devices) {
//       for (BluetoothDevice device in devices) {
//         _addDeviceTolist(device);
//       }
//     });
//     widget.flutterBlue.scanResults.listen((List<ScanResult> results) {
//       for (ScanResult result in results) {
//         _addDeviceTolist(result.device);
//       }
//     });
//     widget.flutterBlue.startScan();
//   }

//   ListView _buildListViewOfDevices() {
//     List<Container> containers = new List<Container>();
//     for (BluetoothDevice device in widget.devicesList) {
//       containers.add(
//         Container(
//           height: 50,
//           child: Row(
//             children: <Widget>[
//               Expanded(
//                 child: Column(
//                   children: <Widget>[
//                     Text(device.name == '' ? '(unknown device)' : device.name),
//                     Text(device.id.toString()),
//                   ],
//                 ),
//               ),
//               FlatButton(
//                 color: Colors.blue,
//                 child: Text(
//                   'Connect',
//                   style: TextStyle(color: Colors.white),
//                 ),
//                 onPressed: () {
//                   //setState(() async {
//                   widget.flutterBlue.stopScan();
//                   try {
//                     /*await*/ device.connect();
//                   } catch (e) {
//                     if (e.code != 'already_connected') {
//                       throw e;
//                     }
//                   } finally {
//                     _services = /*await*/ device.discoverServices();
//                   }
//                   _connectedDevice = device;
//                   //});
//                 },
//               ),
//             ],
//           ),
//         ),
//       );
//     }

//     return ListView(
//       padding: const EdgeInsets.all(8),
//       children: <Widget>[
//         ...containers,
//       ],
//     );
//   }

//   List<ButtonTheme> _buildReadWriteNotifyButton(
//       BluetoothCharacteristic characteristic) {
//     List<ButtonTheme> buttons = new List<ButtonTheme>();

//     if (characteristic.properties.read) {
//       buttons.add(
//         ButtonTheme(
//           minWidth: 10,
//           height: 20,
//           child: Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 4),
//             child: RaisedButton(
//               color: Colors.blue,
//               child: Text('READ', style: TextStyle(color: Colors.white)),
//               onPressed: () {},
//             ),
//           ),
//         ),
//       );
//     }
//     if (characteristic.properties.write) {
//       buttons.add(
//         ButtonTheme(
//           minWidth: 10,
//           height: 20,
//           child: Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 4),
//             child: RaisedButton(
//               child: Text('WRITE', style: TextStyle(color: Colors.white)),
//               onPressed: () {},
//             ),
//           ),
//         ),
//       );
//     }
//     if (characteristic.properties.notify) {
//       buttons.add(
//         ButtonTheme(
//           minWidth: 10,
//           height: 20,
//           child: Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 4),
//             child: RaisedButton(
//               child: Text('NOTIFY', style: TextStyle(color: Colors.white)),
//               onPressed: () {},
//             ),
//           ),
//         ),
//       );
//     }

//     return buttons;
//   }

//   ListView _buildConnectDeviceView() {
//     List<Container> containers = new List<Container>();

//     for (BluetoothService service in _services) {
//       List<Widget> characteristicsWidget = new List<Widget>();
//       for (BluetoothCharacteristic characteristic in service.characteristics) {
//         characteristic.value.listen((value) {
//           print(value);
//         });
//         characteristicsWidget.add(
//           Align(
//             alignment: Alignment.centerLeft,
//             child: Column(
//               children: <Widget>[
//                 Row(
//                   children: <Widget>[
//                     Text(characteristic.uuid.toString(),
//                         style: TextStyle(fontWeight: FontWeight.bold)),
//                   ],
//                 ),
//                 Row(
//                   children: <Widget>[
//                     ..._buildReadWriteNotifyButton(characteristic),
//                   ],
//                 ),
//                 Divider(),
//               ],
//             ),
//           ),
//         );
//       }
//       containers.add(
//         Container(
//           child: ExpansionTile(
//               title: Text(service.uuid.toString()),
//               children: characteristicsWidget),
//         ),
//       );
//     }

//     return ListView(
//       padding: const EdgeInsets.all(8),
//       children: <Widget>[
//         ...containers,
//       ],
//     );
//   }

//   ListView _buildView() {
//     if (_connectedDevice != null) {
//       return _buildConnectDeviceView();
//     }
//     return _buildListViewOfDevices();
//   }

//   @override
//   Widget build(BuildContext context) => Scaffold(
//         appBar: AppBar(
//           title: Text("Bluetooth"),
//         ),
//         body: _buildView(),
//       );
// }
