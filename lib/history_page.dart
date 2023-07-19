import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:app/graph_data.dart';
import 'package:app/graph_page.dart';

class HistoryPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('History Page'),
      ),
      body: Consumer<GraphData>(
        builder: (context, graphData, child) {
          return ListView.builder(
            itemCount: graphData.savedGraphs.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text('Graph ${index + 1}'),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                        'Average: ${graphData.savedGraphs[index].avgY.toStringAsFixed(2)}'),
                    Text(
                        'Peak: ${graphData.savedGraphs[index].peakY.toStringAsFixed(2)}'),
                  ],
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          GraphPage(graphData.savedGraphs[index]),
                    ),
                  );
                },
              );
            },
          );
        },
      ),
    );
  }
}
