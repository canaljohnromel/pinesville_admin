import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

class pieChart extends StatelessWidget {
  const pieChart({super.key});

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
            children: [
              Text(
                'Doughnut',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.w700),
              ),
            ],
          ),
          const Text('Lorem Ipsum dolar imet.',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w400,
            color: Colors.grey,),
          ),
          SizedBox(height: 10),
          Row(
            children: [
              Container(
                width: 27,
                height: 13,
                decoration: BoxDecoration(
                  color: const Color(0xFFB5179E),
                  borderRadius: BorderRadius.circular(20)
                ),
              ),
              SizedBox(width: 10),
              const Text('Property 1', style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: Colors.black
              ),),

              SizedBox(width: 10,),

              Container(
                width: 27,
                height: 13,
                decoration: BoxDecoration(
                    color: const Color(0xFF2D2FF0),
                    borderRadius: BorderRadius.circular(20)
                ),
              ),
              SizedBox(width: 10),
              const Text('Property 2', style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: Colors.black
              ),),

              SizedBox(width: 10),

              Container(
                width: 27,
                height: 13,
                decoration: BoxDecoration(
                    color: const Color(0xFFFFC300),
                    borderRadius: BorderRadius.circular(20)
                ),
              ),
              SizedBox(width: 10),
              const Text('Property 3', style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: Colors.black
              ),)
            ],
          ),


          SfRadialGauge(
            axes: [
              RadialAxis(
                radiusFactor: 0.65,
                axisLineStyle: AxisLineStyle(
                  thickness: 25, color: Colors.grey.shade200
                ),
                startAngle: 270,
                endAngle: 270,
                showLabels: false,
                showTicks: false,
                annotations: [
                  GaugeAnnotation(widget: Text('73%', style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 26,
                    color: Colors.black,
                  ),),
                    angle: 270,
                    positionFactor: 0.1,
                  )

                ],
              ),
              RadialAxis(
                radiusFactor: 0.8,
                pointers: [
                  RangePointer(
                    value: 50, //value
                    color: const Color(0xFFB5179E),
                    width: 50,
                  ),
                ],
                startAngle: 270,
                endAngle: 270,
                showTicks: false,
                showLabels: false,
                showAxisLine: false,
              ),

              RadialAxis(
                radiusFactor: 0.68,
                pointers: [
                  RangePointer(
                    value: 20, //value
                    color: const Color(0xFF2D2FF0),
                    width: 30,
                  ),
                ],
                startAngle: 120,
                endAngle: 120,
                showTicks: false,
                showLabels: false,
                showAxisLine: false,
              ),

              RadialAxis(
                radiusFactor: 0.74,
                pointers: [
                  RangePointer(
                    value: 15,
                    color: const Color(0xFFFFC300),
                    width: 50,
                  ),
                ],
                startAngle: 90,
                endAngle: 90,
                showTicks: false,
                showLabels: false,
                showAxisLine: false,
              ),
            ],
          )


        ],
      ),
      ),
    );
  }
}
