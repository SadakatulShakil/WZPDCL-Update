import 'package:flutter/material.dart';
import 'package:wzpdcl_app_flutter/screens/ledger&usage/barChartSeries.dart';
import 'package:charts_flutter/flutter.dart' as charts;

///need to retrieve bar chart api data when api is available
class UsageGraphApi {
  final List<BarChartSeries> data = [
    BarChartSeries(
      unit: 10,
      barColor: charts.ColorUtil.fromDartColor(Colors.blue),
      months: "Jan",
    ),
    BarChartSeries(
      unit: 20,
      barColor: charts.ColorUtil.fromDartColor(Colors.blue),
      months: "Feb",
    ),
    BarChartSeries(
      unit: 40,
      barColor: charts.ColorUtil.fromDartColor(Colors.blue),
      months: "Mar",
    ),
    BarChartSeries(
      unit: 60,
      barColor: charts.ColorUtil.fromDartColor(Colors.blue),
      months: "Apr",
    ),

    BarChartSeries(
      unit: 80,
      barColor: charts.ColorUtil.fromDartColor(Colors.blue),
      months: "May",
    ),
    BarChartSeries(
      unit: 10,
      barColor: charts.ColorUtil.fromDartColor(Colors.blue),
      months: "June",
    ),
    BarChartSeries(
      unit: 50,
      barColor: charts.ColorUtil.fromDartColor(Colors.blue),
      months: "July",
    ),
    BarChartSeries(
      unit: 30,
      barColor: charts.ColorUtil.fromDartColor(Colors.blue),
      months: "Aug",
    ),
    BarChartSeries(
      unit: 20,
      barColor: charts.ColorUtil.fromDartColor(Colors.blue),
      months: "Sep",
    ),
    BarChartSeries(
      unit: 70,
      barColor: charts.ColorUtil.fromDartColor(Colors.blue),
      months: "Oct",
    ),
    BarChartSeries(
      unit: 90,
      barColor: charts.ColorUtil.fromDartColor(Colors.blue),
      months: "Nov",
    ),
    BarChartSeries(
      unit: 20,
      barColor: charts.ColorUtil.fromDartColor(Colors.blue),
      months: "Dec",
    ),
  ];
}
