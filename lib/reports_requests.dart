import 'package:flutter/material.dart';

class ReportsRequestsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Reports / Requests',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                Divider(
                  color: Colors.grey,
                  thickness: 1.0,
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                DataTable(
                  columns: [
                    DataColumn(label: Text('Unit No.')),
                    DataColumn(label: Text('Type')),
                    DataColumn(label: Text('Report Date')),
                    DataColumn(label: Text('Description')),
                    DataColumn(label: Text('Status')),
                  ],
                  rows: [
                    DataRow(cells: [
                      DataCell(Text('101')),
                      DataCell(Text('Electrical')),
                      DataCell(Text('January 10, 2024')),
                      DataCell(Text('Lorem ipsum sit amet')),
                      DataCell(Text('In Progress')),
                    ]),
                    DataRow(cells: [
                      DataCell(Text('101')),
                      DataCell(Text('Plumbing')),
                      DataCell(Text('January 10, 2024')),
                      DataCell(Text('Lorem ipsum sit amet')),
                      DataCell(Text('Completed')),
                    ]),
                  ],
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.all(16.0),
            color: Colors.grey[200],
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Details', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                SizedBox(height: 8),
                Text('Unit No: 101'),
                Text('Type: Electrical'),
                Text('Report Date: January 10, 2024'),
                Text('Description: Lorem ipsum dolor sit amet, consectetur adipiscing elit.'),
                Text('Status: In Progress'),
                SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(onPressed: () {}, child: Text('Schedule')),
                    ElevatedButton(onPressed: () {}, child: Text('Postpone')),
                    ElevatedButton(onPressed: () {}, child: Text('Complete')),
                    ElevatedButton(onPressed: () {}, child: Text('Cancel')),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
