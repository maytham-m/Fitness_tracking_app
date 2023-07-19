import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:app/graph_data.dart';

class GraphPage extends StatelessWidget {
  final GraphInfo graphInfo;

  GraphPage(this.graphInfo);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Graph Page'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Stack(
          children: [
            Container(
              height: 400,
              width: MediaQuery.of(context).size.width,
              child: LineChart(
                LineChartData(
                  lineBarsData: [
                    LineChartBarData(
                      spots: graphInfo.data,
                      isCurved: true,
                      colors: [Colors.blue],
                      barWidth: 2,
                    ),
                  ],
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomLeft,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Text('Average: ${graphInfo.avgY.toStringAsFixed(2)}'),
                  Text('Peak: ${graphInfo.peakY.toStringAsFixed(2)}'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
