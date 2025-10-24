import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class HistoryChart extends StatelessWidget {
  final String title;
  final Map<String, List<FlSpot>> dataSets; // 👈 nhiều đường
  final Map<String, Color> colors;

  const HistoryChart({
    super.key,
    required this.title,
    required this.dataSets,
    required this.colors,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 10),
        SizedBox(
          height: 250,
          child: LineChart(
            LineChartData(
              borderData: FlBorderData(show: true),
              gridData: FlGridData(show: true),
              titlesData: FlTitlesData(show: true),
              lineBarsData: dataSets.entries.map((entry) {
                return LineChartBarData(
                  spots: entry.value,
                  isCurved: true,
                  color: colors[entry.key],
                  barWidth: 3,
                  dotData: FlDotData(show: false),
                );
              }).toList(),
            ),
          ),
        ),
        const SizedBox(height: 10),
        Wrap(
          spacing: 10,
          children: dataSets.keys.map((name) {
            return Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(width: 12, height: 12, color: colors[name]),
                const SizedBox(width: 4),
                Text(name),
              ],
            );
          }).toList(),
        ),
      ],
    );
  }
}
