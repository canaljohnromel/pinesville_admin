import 'package:flutter/material.dart';
import 'package:data_table_2/data_table_2.dart';

class BillsAndPaymentsPage extends StatefulWidget {
  @override
  _BillsAndPaymentsPageState createState() => _BillsAndPaymentsPageState();
}

class _BillsAndPaymentsPageState extends State<BillsAndPaymentsPage> {
  // Initial table data with only Unit No. and Name
  List<Map<String, String?>> tableData = List.generate(
    16,
        (index) =>
    {
      'Unit No.': '10${index + 1}',
      'Name': 'Tenant ${index + 1}',
      'Billing Period': null,
      'Rent': null,
      'Water': null,
      'Electricity': null,
      'Wi-Fi': null,
      'Parking': null,
      'Extra': null,
      'Due Date': null,
      'Total': null,
      'Status': null,
      'Payment Date': null,
      'Mode': null,
    },
  );

  int? selectedRowIndex; // Track the selected row index
  String searchQuery = ''; // Track the search query

  // Function to filter table data based on the search query
  List<Map<String, String?>> get filteredTableData {
    if (searchQuery.isEmpty) return tableData;

    return tableData
        .where((row) =>
    row['Unit No.']!.toLowerCase().contains(searchQuery.toLowerCase()) ||
        row['Name']!.toLowerCase().contains(searchQuery.toLowerCase()))
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0), // Only horizontal padding
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Removed any additional padding above the text
            Text(
              'Bills & Payments',
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            ),
            Divider(color: Colors.grey, thickness: 1),
            SizedBox(height: 5), // Reduced the height to 5 for less space

            // Search Bar below the divider and aligned to the right
            Align(
              alignment: Alignment.centerRight,
              child: SizedBox(
                width: 300,
                child: TextField(
                  decoration: InputDecoration(
                    labelText: 'Search',
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.search),
                  ),
                  onChanged: (value) {
                    setState(() {
                      searchQuery = value;
                    });
                  },
                ),
              ),
            ),
            SizedBox(
              height: 400, // Fixed height for the table
              child: DataTable2(
                columnSpacing: 5,
                headingRowHeight: 40,
                horizontalMargin: 12,
                minWidth: 800, // Set a minimum width to enable horizontal scrolling if needed
                columns: const [
                  DataColumn(label: Text('Unit No.')),
                  DataColumn(label: Text('Name')),
                  DataColumn(label: Text('Billing Period')),
                  DataColumn(label: Text('Rent')),
                  DataColumn(label: Text('Water')),
                  DataColumn(label: Text('Electricity')),
                  DataColumn(label: Text('Wi-Fi')),
                  DataColumn(label: Text('Parking')),
                  DataColumn(label: Text('Extra')),
                  DataColumn(label: Text('Due Date')),
                  DataColumn(
                      label: Text('Total', style: TextStyle(fontWeight: FontWeight.bold))),
                  DataColumn(label: Text('Status')),
                  DataColumn(label: Text('Payment Date')),
                  DataColumn(label: Text('Mode')),
                ],
                rows: List<DataRow>.generate(
                  filteredTableData.length,
                      (index) => DataRow(
                    color: MaterialStateProperty.resolveWith<Color?>(
                          (states) => selectedRowIndex ==
                          tableData.indexOf(filteredTableData[index])
                          ? Colors.grey[300]
                          : null,
                    ),
                    cells: [
                      DataCell(
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              selectedRowIndex =
                                  tableData.indexOf(filteredTableData[index]);
                            });
                          },
                          child: Text(filteredTableData[index]['Unit No.']!),
                        ),
                      ),
                      DataCell(
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              selectedRowIndex =
                                  tableData.indexOf(filteredTableData[index]);
                            });
                          },
                          child: Text(filteredTableData[index]['Name']!),
                        ),
                      ),
                      DataCell(Text(filteredTableData[index]['Billing Period'] ?? '-')),
                      DataCell(Text(filteredTableData[index]['Rent'] ?? '-')),
                      DataCell(Text(filteredTableData[index]['Water'] ?? '-')),
                      DataCell(Text(filteredTableData[index]['Electricity'] ?? '-')),
                      DataCell(Text(filteredTableData[index]['Wi-Fi'] ?? '-')),
                      DataCell(Text(filteredTableData[index]['Parking'] ?? '-')),
                      DataCell(Text(filteredTableData[index]['Extra'] ?? '-')),
                      DataCell(Text(filteredTableData[index]['Due Date'] ?? '-')),
                      DataCell(Text(filteredTableData[index]['Total'] ?? '-')),
                      DataCell(Text(filteredTableData[index]['Status'] ?? '-')),
                      DataCell(Text(filteredTableData[index]['Payment Date'] ?? '-')),
                      DataCell(Text(filteredTableData[index]['Mode'] ?? '-')),
                    ],
                  ),
                ),
                dataRowHeight: 60, // Adjust the height of rows as needed
                headingRowColor:
                MaterialStateProperty.resolveWith((states) => Colors.grey[200]),
              ),
            ),
            SizedBox(height: 20),
            // Action Buttons
            ElevatedButton(
              onPressed: selectedRowIndex != null
                  ? () => _showConfigureDialog(context)
                  : null, // Disable if no row is selected
              child: Text('Configure'),
            ),
          ],
        ),
      ),
    );
  }




  void _showConfigureDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Configure Billing'),
          content: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Billing Date Configuration
                Text('Billing Date',
                    style: TextStyle(fontWeight: FontWeight.bold)),
                SizedBox(height: 8),
                Row(
                  children: [
                    Expanded(flex: 2, child: Text('Start Date')),
                    SizedBox(width: 8),
                    Expanded(
                      flex: 3,
                      child: TextField(
                        readOnly: true,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          suffixIcon: Icon(Icons.calendar_today),
                        ),
                        onTap: () async {
                          DateTime? pickedDate = await showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime(2000),
                            lastDate: DateTime(2101),
                          );
                          if (pickedDate != null) {
                            // Handle selected start date here
                          }
                        },
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 8),
                Row(
                  children: [
                    Expanded(flex: 2, child: Text('End Date')),
                    SizedBox(width: 8),
                    Expanded(
                      flex: 3,
                      child: TextField(
                        readOnly: true,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          suffixIcon: Icon(Icons.calendar_today),
                        ),
                        onTap: () async {
                          DateTime? pickedDate = await showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime(2000),
                            lastDate: DateTime(2101),
                          );
                          if (pickedDate != null) {
                            // Handle selected end date here
                          }
                        },
                      ),
                    ),
                  ],
                ),
                Divider(),

                // Electricity Configuration
                Text('Electricity',
                    style: TextStyle(fontWeight: FontWeight.bold)),
                SizedBox(height: 8),
                Row(
                  children: [
                    Expanded(flex: 2, child: Text('Previous Reading')),
                    SizedBox(width: 8),
                    Expanded(
                      flex: 3,
                      child: TextField(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                        ),
                        keyboardType: TextInputType.number,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 8),
                Row(
                  children: [
                    Expanded(flex: 2, child: Text('Current Reading')),
                    SizedBox(width: 8),
                    Expanded(
                      flex: 3,
                      child: TextField(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                        ),
                        keyboardType: TextInputType.number,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 8),
                Row(
                  children: [
                    Expanded(flex: 2, child: Text('Amount per Kilowatt')),
                    SizedBox(width: 8),
                    Expanded(
                      flex: 3,
                      child: TextField(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: '16',
                        ),
                        keyboardType: TextInputType.number,
                        enabled: false,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 8),
                Row(
                  children: [
                    Expanded(flex: 2, child: Text('Total Amount')),
                    SizedBox(width: 8),
                    Expanded(
                      flex: 3,
                      child: TextField(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: 'Amount',
                        ),
                        keyboardType: TextInputType.number,
                        enabled: false,
                      ),
                    ),
                  ],
                ),
                Divider(),

                // Water Configuration
                Text('Water', style: TextStyle(fontWeight: FontWeight.bold)),
                SizedBox(height: 8),
                Row(
                  children: [
                    Expanded(flex: 2, child: Text('Previous Reading')),
                    SizedBox(width: 8),
                    Expanded(
                      flex: 3,
                      child: TextField(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                        ),
                        keyboardType: TextInputType.number,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 8),
                Row(
                  children: [
                    Expanded(flex: 2, child: Text('Current Reading')),
                    SizedBox(width: 8),
                    Expanded(
                      flex: 3,
                      child: TextField(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                        ),
                        keyboardType: TextInputType.number,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 8),
                Row(
                  children: [
                    Expanded(flex: 2, child: Text('Amount per Cubic Meter')),
                    SizedBox(width: 8),
                    Expanded(
                      flex: 3,
                      child: TextField(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: '55',
                        ),
                        keyboardType: TextInputType.number,
                        enabled: false,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 8),
                Row(
                  children: [
                    Expanded(flex: 2, child: Text('Total Amount')),
                    SizedBox(width: 8),
                    Expanded(
                      flex: 3,
                      child: TextField(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: 'Amount',
                        ),
                        keyboardType: TextInputType.number,
                        enabled: false,
                      ),
                    ),
                  ],
                ),
                Divider(),

                // Wi-Fi Configuration
                Text('Wi-Fi', style: TextStyle(fontWeight: FontWeight.bold)),
                SizedBox(height: 8),
                Row(
                  children: [
                    Expanded(flex: 2, child: Text('No. of Person')),
                    SizedBox(width: 8),
                    Expanded(
                      flex: 3,
                      child: TextField(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                        ),
                        keyboardType: TextInputType.number,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 8),
                Row(
                  children: [
                    Expanded(flex: 2, child: Text('Amount per Person')),
                    SizedBox(width: 8),
                    Expanded(
                      flex: 3,
                      child: TextField(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: '150',
                        ),
                        keyboardType: TextInputType.number,
                        enabled: false,
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Expanded(flex: 2, child: Text('Total Amount')),
                    SizedBox(width: 8),
                    Expanded(
                      flex: 3,
                      child: TextField(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: 'Amount',
                        ),
                        keyboardType: TextInputType.number,
                        enabled: false,
                      ),
                    ),
                  ],
                ),
                Divider(),

                // Parking Configuration
                Text('Parking', style: TextStyle(fontWeight: FontWeight.bold)),
                SizedBox(height: 8),
                Row(
                  children: [
                    Expanded(flex: 2, child: Text('No. of Person')),
                    SizedBox(width: 8),
                    Expanded(
                      flex: 3,
                      child: TextField(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                        ),
                        keyboardType: TextInputType.number,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 8),
                Row(
                  children: [
                    Expanded(flex: 2, child: Text('Amount per Person')),
                    SizedBox(width: 8),
                    Expanded(
                      flex: 3,
                      child: TextField(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: '150',
                        ),
                        keyboardType: TextInputType.number,
                        enabled: false,
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Expanded(flex: 2, child: Text('Total Amount')),
                    SizedBox(width: 8),
                    Expanded(
                      flex: 3,
                      child: TextField(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: 'Amount',
                        ),
                        keyboardType: TextInputType.number,
                        enabled: false,
                      ),
                    ),
                  ],
                ),
                Divider(),

                // Due Date Configuration
                Text('Due Date', style: TextStyle(fontWeight: FontWeight.bold)),
                SizedBox(height: 8),
                Row(
                  children: [
                    Expanded(flex: 2, child: Text('Due Date')),
                    SizedBox(width: 8),
                    Expanded(
                      flex: 3,
                      child: TextField(
                        readOnly: true,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          suffixIcon: Icon(Icons.calendar_today),
                        ),
                        onTap: () async {
                          DateTime? pickedDate = await showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime(2000),
                            lastDate: DateTime(2101),
                          );
                          if (pickedDate != null) {
                            // Handle selected due date here
                          }
                        },
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),


          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Cancel'),
            ),
            ElevatedButton(
              onPressed: () {
                // Handle the save action here
                Navigator.of(context).pop();
              },
              child: Text('Save'),
            ),
          ],
        );
      },
    );
  }
}