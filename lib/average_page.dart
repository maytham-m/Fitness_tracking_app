import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:provider/provider.dart';
import 'package:app/graph_data.dart';

class AvgPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<FlSpot> avgSpots = [];
    int index = 1;

    for (GraphInfo graphInfo in Provider.of<GraphData>(context).savedGraphs) {
      double sum = 0;
      for (var spot in graphInfo.data) {
        sum += spot.y;
      }
      double avg = sum / graphInfo.data.length;
      avgSpots.add(FlSpot(index.toDouble(), avg));
      index++;
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Average Page'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          height: 400,
          width: MediaQuery.of(context).size.width,
          child: LineChart(
            LineChartData(
              lineBarsData: [
                LineChartBarData(
                  spots: avgSpots,
                  isCurved: true,
                  colors: [Colors.blue],
                  barWidth: 2,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
