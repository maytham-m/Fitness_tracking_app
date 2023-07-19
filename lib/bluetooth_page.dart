import 'package:flutter/material.dart';
import 'package:flutter_blue_plus/flutter_blue_plus.dart';

class BluetoothPage extends StatefulWidget {
  BluetoothPage({Key? key}) : super(key: key);

  @override
  _BluetoothPageState createState() => _BluetoothPageState();
}

class _BluetoothPageState extends State<BluetoothPage> {
  FlutterBluePlus flutterBlue = FlutterBluePlus.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bluetooth Page'),
      ),
      body: Center(
        child: ElevatedButton(
          child: Text('Scan for devices'),
          onPressed: () async {
            // Scan for devices;
            flutterBlue.startScan(timeout: Duration(seconds: 4));

            // Wait for scan to finish;
            flutterBlue.scanResults.listen((results) {
              // Do something with scan results
              for (ScanResult r in results) {
                print('${r.device.name} found! rssi: ${r.rssi}');
              }
            });

            // Stop scanning;
            //flutterBlue.stopScan();
          },
        ),
      ),
    );
  }
}
