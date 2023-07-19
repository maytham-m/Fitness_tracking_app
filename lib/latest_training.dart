import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'dart:math';
import 'package:app/graph_data.dart';
import 'package:provider/provider.dart';

class LatestTraining extends StatelessWidget {
  final Random _random = Random();

  List<FlSpot> generateRandomData() {
    return List.generate(
        300, (index) => FlSpot(index.toDouble(), _random.nextDouble() * 100));
  }

  @override
  Widget build(BuildContext context) {
    final dataPoints = generateRandomData();
    double sum = 0;
    double peak = 0;
    for (var spot in dataPoints) {
      sum += spot.y;
      if (spot.y > peak) {
        peak = spot.y;
      }
    }
    double avg = sum / dataPoints.length;

    return Scaffold(
      appBar: AppBar(
        title: Text('Latest Training'),
      ),
      body: Consumer<GraphData>(
        builder: (context, graphData, child) {
          return Stack(
            children: [
              Container(
                height: 400,
                width: MediaQuery.of(context).size.width,
                child: LineChart(
                  LineChartData(
                    lineBarsData: [
                      LineChartBarData(
                        spots: dataPoints,
                        isCurved: true,
                        colors: [Colors.blue],
                        barWidth: 2,
                      ),
                    ],
                  ),
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: ElevatedButton(
                  child: Text('Save'),
                  onPressed: () {
                    graphData.addGraph(
                        GraphInfo(data: dataPoints, avgY: avg, peakY: peak));
                  },
                ),
              ),
              Align(
                alignment: Alignment.bottomRight,
                child: ElevatedButton(
                  child: Text('Back'),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ),
              Align(
                alignment: Alignment.bottomLeft,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Text('Average: ${avg.toStringAsFixed(2)}'),
                    Text('Peak: ${peak.toStringAsFixed(2)}'),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
