import 'package:flutter/material.dart';
import 'package:pinesville_admin/bar%20chart/chart_column2.dart';

import 'bar chart/chart_column1.dart';

class AnalyticsPage extends StatelessWidget {
  const AnalyticsPage({super.key});

  @override
  Widget build(BuildContext context) {
    String? _selectedValue;

    return SingleChildScrollView(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Analytics',
          style: TextStyle(
            fontFamily: 'Montserrat',
            fontSize: 25,
            fontWeight: FontWeight.bold
          ),),

          const Divider(color: Colors.grey),
          SizedBox(height: 20),

          Row(
            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                // flex: 2,
                child: Text('Month',
                style: TextStyle(
                  fontFamily: 'Montserrat',
                  fontWeight: FontWeight.bold,
                  fontSize: 25,
                ),)
              ),
              Expanded(
                // flex: 1,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    DropdownButtonFormField<String>(
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20.0),
                            borderSide: BorderSide(width: 1, color: Colors.grey),
                          )
                      ),

                      hint: Text('Month',
                        style: TextStyle(
                          fontFamily: 'Montserrat',
                          fontSize: 14,
                        ),),

                      value: _selectedValue,
                      items: <String>['January', 'February', 'March', 'April', 'May',
                        'June', 'July', 'August', 'September', 'October', 'November',
                        'December'].map((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );

                      }).toList(),
                      icon: Icon(Icons.arrow_drop_down),
                      iconSize: 20,
                      onChanged: (String? value) {
                      },
                    ),
                  ],
                ),
              )
            ],
          ),

          SizedBox(height: 20),

          //UTILITIES ANALYTICS ROW
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [

              Container(
                height: 400,
                width: 800,
                child: chartColumn1(),
              ),

              Container(
                height: 400,
                width: 800,
                child: chartColumn2(),
              ),

              SizedBox(height: 5),


            ],
          ),

          SizedBox(height: 10),

          //RENT ANALYTICS ROW
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [

              // SizedBox(width: 5),

              Container(
                  height: 400,
                  width: 800,
                  child: Padding(
                    padding: EdgeInsets.all(30),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text('Rent Analytics',
                          style: TextStyle(
                            fontFamily: 'Montserrat',
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),),
                        Text('Units Occupied', ),
                        Text('16 out of 16 units'),
                        Text('Total Revenue'),
                        Text('P12,139'),
                        Text('Total Expenses'),
                        Text('P12,139'),
                        Text('Total Net Income'),
                        Text('P12,139'),
                      ],
                    ),
                  )
              ),

              Container(
                  height: 400,
                  width: 800,
                  /* decoration: BoxDecoration(
                  color: Colors.blue,
                ),*/
                  child: Padding(
                    padding: EdgeInsets.all(30),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text('Utilities Analytics',
                          style: TextStyle(
                            fontFamily: 'Montserrat',
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),),
                        Text('Electricity',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Montserrat'
                          ),),
                        Text('Total Consumption (Kilowatts)'),
                        Text('12,139 Kilowatts'),
                        Text('Total Amount'),
                        Text('P12,139'),

                        SizedBox(height: 5),

                        Text('Water',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Montserrat'
                          ),),
                        Text('Total Consumption (Cubic Meter)'),
                        Text('150 cubic meter'),
                        Text('Total Amount'),
                        Text('P12,139'),
                      ],
                    ),
                  )
              )
            ],
          ),

        ],
      ),
    );
  }

}
