import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:syncfusion_flutter_charts/sparkcharts.dart';

class chartColumn1 extends StatelessWidget {
  const chartColumn1({super.key});

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
            /*Row(
              children: [

              ],
            ),*/
            SfCartesianChart(
              plotAreaBackgroundColor: Colors.transparent,
              margin: EdgeInsets.symmetric(vertical: 10*2),
              borderColor: Colors.transparent,
              borderWidth: 0,
              plotAreaBorderWidth: 0,
              enableSideBySideSeriesPlacement: false,
              primaryXAxis: CategoryAxis(
                isVisible: true,
              ),
              primaryYAxis: NumericAxis(
                isVisible: true,
                minimum: 0,
                maximum: 2,
                interval: 0.5,
              ),
              series: <CartesianSeries>[
                ColumnSeries<ChartColumnData,String>(
                    borderRadius: BorderRadius.circular(20),
                    dataSource: charData,
                    width: 0.5,
                    color: Color(0xFFE9EDF7),
                    xValueMapper: (ChartColumnData data, _)=> data.x,
                    yValueMapper: (ChartColumnData data, _)=> data.y,
                ),
                ColumnSeries<ChartColumnData,String>(
                    borderRadius: BorderRadius.circular(20),
                    dataSource: charData,
                    width: 0.5,
                    color: Color(0xFF01CDDD),
                    xValueMapper: (ChartColumnData data, _)=> data.x,
                    yValueMapper: (ChartColumnData data, _)=> data.y1)
              ],
            )


          ],
        ),
      ),
    );
  }
}


class ChartColumnData {
  ChartColumnData(this.x, this.y, this.y1);
  final String x;
  final double? y;
  final double y1;
}

//THE DATA FOR THE CHART
final List<ChartColumnData> charData = <ChartColumnData>[
  ChartColumnData("Jan", 2, 1),
  ChartColumnData("Feb", 2, 0.5),
  ChartColumnData("Mar", 2, 1.5),
  ChartColumnData("Apr", 2, 0.8),
  ChartColumnData("May", 2, 1.3),
  ChartColumnData("Jun", 2, 1.8),
  ChartColumnData("Jul", 2, 0.5),
  ChartColumnData("Aug", 2, 0.8),
  ChartColumnData("Sep", 2, 1.9),
  ChartColumnData("Oct", 2, 0.9),
  ChartColumnData("Nov", 2, 0.5),
  ChartColumnData("Dec", 2, 1.5),
];