import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;
class BarChartSeries{
  late final int unit;
  late final charts.Color barColor;
  late final String months;
  BarChartSeries({required this.unit,required this.barColor,required this.months});
}