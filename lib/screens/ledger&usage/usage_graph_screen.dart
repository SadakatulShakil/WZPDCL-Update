import 'package:flutter/material.dart';
import 'package:wzpdcl_app_flutter/constants.dart';
import 'package:wzpdcl_app_flutter/language/Languages%20.dart';
import 'barChartSeries.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:wzpdcl_app_flutter/components/usageGraphAPI.dart';

class UsageGraphScreen extends StatefulWidget {
  const UsageGraphScreen({Key? key}) : super(key: key);

  @override
  _UsageGraphScreenState createState() => _UsageGraphScreenState();
}

class _UsageGraphScreenState extends State<UsageGraphScreen> {
  final UsageGraphApi usageGraphApi=UsageGraphApi();
 // final List<BarChartSeries> data=usageGraphApi.data;

  @override
  Widget build(BuildContext context) {
    //barchart
    List <charts.Series<BarChartSeries,String>> series=[
      charts.Series(
       id:"BarChart",
       data: usageGraphApi.data,
        domainFn: (BarChartSeries series, _)=>
            series.months,
        measureFn: (BarChartSeries series, _)=>
        series.unit,
        colorFn: (BarChartSeries series, _)=>
            series.barColor,
      ),
    ];
    return Padding(
      padding: const EdgeInsets.only(top:33.0),
      child: Column(
        children: [
        Text(
        Languages.of(context)!.Last12MonthsUsageBarChart,
        overflow: TextOverflow.visible,
        textAlign: TextAlign.center,
        style: TextStyle(
          height: 1.171875,
          fontSize: 14.0,
          fontFamily: 'Inter',
          fontWeight: FontWeight.w400,
          color: Color.fromARGB(255, 99, 99, 99),

          /* letterSpacing: 0.0, */
        ),
      ),
      //2nd line text unit consumed bar chart
          SizedBox(
            //figma
            // height: 5,
            height: 6,
          ),
      Text(
      Languages.of(context)!.UnitConsumedBarChart,
      overflow: TextOverflow.visible,
      textAlign: TextAlign.center,
      style: TextStyle(
      height: 1.171875,
      fontSize: 20.0,
      fontFamily: 'Inter',
      fontWeight: FontWeight.w400,
      color: Color.fromARGB(255, 99, 99, 99),

      /* letterSpacing: 0.0, */
      ),
      ),
          //bar chart
          SizedBox(
            height: 22,
          ),
      Container(
       // width: 303.0,
        height: 300.0,
        child: ClipRRect(
          borderRadius: BorderRadius.zero,
          child: Column(
            children: [
              Expanded
                (
                  child:
                  charts.BarChart(series,animate: true),
              ),
            ],
          ),
        ),
      ),
        ],
      ),
    );
  }
}
