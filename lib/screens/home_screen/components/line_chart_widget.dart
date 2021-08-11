import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';


class LineReportChart extends StatelessWidget {
  LineReportChart({Key? key}) : super(key: key);

  final List<FlSpot>? _getSports = [
    FlSpot(0, .7),
    FlSpot(1, .8),
    FlSpot(2, 1),
    FlSpot(3, 1),
    FlSpot(4, .9),
    FlSpot(5, 1),
    FlSpot(6, 1.5),
    FlSpot(7, 1.7),
    FlSpot(8, 1.7),
    FlSpot(9, 1.5),
    FlSpot(10, 1.5),
    FlSpot(11, 1.7),
    FlSpot(12, 2),
    FlSpot(13, 2.1),
    FlSpot(14, 2),
    FlSpot(15, 1.8),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      child: LineChart(
        LineChartData(
          gridData: FlGridData(show: false),
          borderData: FlBorderData(show: false),
          titlesData: FlTitlesData(show: false),
          lineBarsData: [
            LineChartBarData(
              spots: _getSports,
              isCurved: true,
              dotData: FlDotData(show: false),
              belowBarData: BarAreaData(show: false),
            ),
          ],
        ),
        
      ),
    );
  }
}
