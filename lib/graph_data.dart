import 'package:flutter/foundation.dart';
import 'package:fl_chart/fl_chart.dart';

class GraphInfo {
  final List<FlSpot> data;
  final double avgY;
  final double peakY;

  GraphInfo({required this.data, required this.avgY, required this.peakY});
}

class GraphData with ChangeNotifier {
  List<GraphInfo> _savedGraphs = [];

  List<GraphInfo> get savedGraphs => _savedGraphs;

  void addGraph(GraphInfo graph) {
    _savedGraphs.add(graph);
    notifyListeners();
  }
}
