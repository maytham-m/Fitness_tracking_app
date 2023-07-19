import 'package:flutter/material.dart';
import 'package:app/Latest_training.dart';
import 'package:app/history_page.dart';
import 'package:app/average_page.dart';
import 'package:app/bluetooth_page.dart'; // import the BluetoothPage

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Home Page')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              child: Text('Latest Training Session'),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => LatestTraining()));
              },
            ),
            ElevatedButton(
              child: Text('History'),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => HistoryPage()));
              },
            ),
            ElevatedButton(
              child: Text('Total Average'),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => AvgPage()));
              },
            ),
            ElevatedButton(
              child: Text('Pair'), // Add the new Pair button
              onPressed: () {
                // Navigate to the BluetoothPage when the button is pressed.
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => BluetoothPage()));
              },
            ),
          ],
        ),
      ),
    );
  }
}
