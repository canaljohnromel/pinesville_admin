import 'package:flutter/material.dart';

class BillsAndPaymentsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Title
            Text(
              'Bills & Payments',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),
            Divider(color: Colors.grey, thickness: 1),
            SizedBox(height: 20),
            // Tabs and Filters
            Row(
              children: [
                ToggleButtons(
                  isSelected: [true, false, false],
                  onPressed: (index) {},
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Text('All'),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Text('Paid'),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Text('Overdue'),
                    ),
                  ],
                ),
                Spacer(),
                // Search Bar
                SizedBox(
                  width: 400,
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Search',
                      prefixIcon: Icon(Icons.search),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            // Table
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: DataTable(
                columnSpacing: 52,
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
                  DataColumn(label: Text('Total', style: TextStyle(fontWeight: FontWeight.bold))),
                  DataColumn(label: Text('Status')),
                  DataColumn(label: Text('Payment Date')),
                  DataColumn(label: Text('Mode')),
                ],
                rows: List.generate(
                  6,
                      (index) => DataRow(cells: [
                    DataCell(Text('101')),
                    DataCell(Text('Juan Dela Cruz')),
                        DataCell(Text('Jan 1 - Jan 15')),
                    DataCell(Text('4,500')),
                        DataCell(Text('4,500')),
                        DataCell(Text('4,500')),
                        DataCell(Text('4,500')),
                        DataCell(Text('4,500')),
                        DataCell(Text('-')),
                    DataCell(Text('Jan 10, 2024')),
                        DataCell(Text('14,500')),
                    DataCell(Text(index % 2 == 0 ? 'Paid' : 'Pending')),
                    DataCell(Text('Jan 10, 2024')),
                        DataCell(Text('GCASH')),
                  ]),
                ),
              ),
            ),
            SizedBox(height: 20),
            // Action Buttons
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                  onPressed: () {},
                  child: Text('Remind'),
                ),
                ElevatedButton(
                  onPressed: () {
                    _showConfigureDialog(context);
                  },
                  child: Text('Configure'),
                ),
                ElevatedButton(
                  onPressed: () {},
                  child: Text('Generate Invoice'),
                ),
                ElevatedButton(
                  onPressed: () {},
                  child: Text('View Receipts'),
                ),
              ],
            ),
            SizedBox(height: 20),
            // Summary Cards and Pie Chart
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Summary Cards
                Expanded(
                  flex: 3,
                  child: Column(
                    children: [
                      _buildSummaryCard('P12,345', 'Amount Collected'),
                      _buildSummaryCard('P12,345', 'Amount Remaining'),
                      _buildSummaryCard('P12,345', 'Total Amount'),
                      _buildSummaryCard('5', 'Total Number of Tenants'),
                    ],
                  ),
                ),
                SizedBox(width: 20),
                // Pie Chart
                Expanded(
                  flex: 2,
                  child: Container(
                    height: 200,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Center(
                      child: Text(
                        'Pie Chart',
                        style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
              ],
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
                Text('Billing Date', style: TextStyle(fontWeight: FontWeight.bold)),
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
                Text('Electricity', style: TextStyle(fontWeight: FontWeight.bold)),
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



  Widget _buildSummaryCard(String amount, String label) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 8),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              amount,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.red,
              ),
            ),
            Text(label),
          ],
        ),
      ),
    );
  }
}
