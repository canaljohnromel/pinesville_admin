import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class chartColumn3 extends StatefulWidget {
  const chartColumn3({super.key});

  @override
  State<chartColumn3> createState() => _chartColumn4State();
}

class _chartColumn4State extends State<chartColumn3> {
  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      surfaceTintColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20)
      ),
      child: Padding(padding: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Statistic', style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.w700,
                    color: Colors.black,
                  ),),
                  Text('Minm dolor in amet nulla laboris enim....',style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 16,
                    color: Colors.black,
                  ),)
                ],
              ))
            ],
          ),

          SizedBox(height: 10),

          SfCartesianChart(
            margin: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
            borderWidth: 0,
            plotAreaBorderWidth: 0,
            primaryXAxis: CategoryAxis(isVisible: false),
            primaryYAxis: NumericAxis(
              axisLine: const AxisLine(width: 0),
              majorGridLines: MajorGridLines(
                width: 1, color: Colors.black, dashArray: <double>[5,5]),
              // numberFormat: NumberFormat.compact(),
              labelStyle: TextStyle(
                fontWeight: FontWeight.bold, color: Colors.black,
              ),
              minimum: 0,
              maximum: 8000,
              interval: 2000,),
            series: <CartesianSeries>[
              RangeColumnSeries<ChartColumnData,String>(
                borderRadius: BorderRadius.circular(20),
                  dataSource: chartData,
                  width: 0.6,
                  xValueMapper: (ChartColumnData data, _) => data.x,
                  highValueMapper: (ChartColumnData data, _) => data.high,
                  lowValueMapper: (ChartColumnData data, _) => data.low,
                  pointColorMapper: (ChartColumnData data, _) => data.color,
              )
            ],
          )

        ],
      ),
      ),

    );
  }
}

class ChartColumnData {
  ChartColumnData(this.x, this.low, this.high, this.color);
  final String x;
  final double? low;
  final double? high;
  final Color? color;
}

final List<ChartColumnData> chartData = <ChartColumnData> [
  ChartColumnData("Mo", 2600, 5000, const Color(0xFFFFD60A)),
  ChartColumnData("Tu", 1800, 3000, const Color(0xFF4361EE)),
  ChartColumnData("We", 3200, 6000, const Color(0xFFFFD60A)),
  ChartColumnData("Th", 3800, 5000, const Color(0xFF4361EE)),
  ChartColumnData("Fr", 300, 4800, const Color(0xFFE210B4)),
  ChartColumnData("Sa", 2200, 7800, const Color(0xFF4361EE)),
  ChartColumnData("Su", 1800, 4800, const Color(0xFFFFD60A)),
  ChartColumnData("Su2", 2000, 5800, const Color(0xFF4361EE)),
  ChartColumnData("Su3", 3000, 4200, const Color(0xFFFFD60A)),
];

