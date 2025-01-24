import 'package:flutter/material.dart';

class TenantsPage extends StatefulWidget {
  @override
  _TenantsPageState createState() => _TenantsPageState();
}

class _TenantsPageState extends State<TenantsPage> {
  final List<Map<String, String>> tenants = [
    {'name': 'Ralph Edwards', 'room': 'Room 101', 'image': 'assets/images/pinesville_pasig.png'},
    {'name': 'Guy Hawkins', 'room': 'Room 102', 'image': 'assets/images/pinesville_pasig.png'},
    {'name': 'John Doe', 'room': 'Room 103', 'image': 'assets/images/pinesville_pasig.png'},
    {'name': 'Jane Smith', 'room': 'Room 104', 'image': 'assets/images/pinesville_pasig.png'},
    {'name': 'Michael Johnson', 'room': 'Room 105', 'image': 'assets/images/pinesville_pasig.png'},
    {'name': 'Emily Davis', 'room': 'Room 106', 'image': 'assets/images/pinesville_pasig.png'},
    {'name': 'David Williams', 'room': 'Room 107', 'image': 'assets/images/pinesville_pasig.png'},
    {'name': 'Sarah Brown', 'room': 'Room 108', 'image': 'assets/images/pinesville_pasig.png'},
    {'name': 'Daniel Taylor', 'room': 'Room 109', 'image': 'assets/images/pinesville_pasig.png'},
    {'name': 'Linda Anderson', 'room': 'Room 110', 'image': 'assets/images/pinesville_pasig.png'},
    {'name': 'William Moore', 'room': 'Room 111', 'image': 'assets/images/pinesville_pasig.png'},
    {'name': 'Elizabeth Wilson', 'room': 'Room 112', 'image': 'assets/images/pinesville_pasig.png'},
    {'name': 'James White', 'room': 'Room 113', 'image': 'assets/images/pinesville_pasig.png'},
    {'name': 'Olivia Harris', 'room': 'Room 114', 'image': 'assets/images/pinesville_pasig.png'},
    {'name': 'Benjamin Martin', 'room': 'Room 115', 'image': 'assets/images/pinesville_pasig.png'},
    {'name': 'Charlotte Lee', 'room': 'Room 116', 'image': 'assets/images/pinesville_pasig.png'},
  ];

  Map<String, String>? selectedTenant;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0), // Add horizontal padding
    child: Text(
    'Tenants',
    style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
    ),
        ),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(1.0),
          child: Divider(color: Colors.grey),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: selectedTenant == null
            ? _buildTenantGrid()
            : _buildTenantDetails(selectedTenant!),
      ),
    );
  }

  Widget _buildTenantGrid() {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 4, // 4 columns for the grid
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
        childAspectRatio: 2, // Slightly reduced height for each grid item
      ),
      itemCount: tenants.length,
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            setState(() {
              selectedTenant = tenants[index];
            });
          },
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.0),
            ),
            elevation: 4,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                children: [
                  ClipOval(
                    child: Image.asset(
                      tenants[index]['image']!,
                      width: 100,
                      height: 100,
                      fit: BoxFit.cover,
                    ),
                  ),
                  SizedBox(width: 50),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        tenants[index]['name']!,
                        style: TextStyle(
                          fontSize:20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        tenants[index]['room']!,
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.grey.shade600,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildTenantDetails(Map<String, String> tenant) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () {
                setState(() {
                  selectedTenant = null;
                });
              },
            ),
            Text(
              'Back',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        SizedBox(height: 16),
        Row(
          children: [
            ClipOval(
              child: Image.asset(
                tenant['image']!,
                width: 100,
                height: 100,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(width: 16),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  tenant['name']!,
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  tenant['room']!,
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.grey.shade600,
                  ),
                ),
              ],
            ),
          ],
        ),
        SizedBox(height: 32),
        _buildDetailRow('Email:', 'juandelacruz@gmail.com'),
        _buildDetailRow('Contact Number:', '(+63) 9012345678'),
        _buildDetailRow('Move-in Date:', 'January 10, 2024'),
        SizedBox(height: 32),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ElevatedButton(
              onPressed: () {},
              child: Text('View Transaction History'),
            ),
            ElevatedButton(
              onPressed: () {},
              child: Text('Submit Readings'),
            ),
          ],
        ),
        SizedBox(height: 16),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ElevatedButton(
              onPressed: () {},
              child: Text('Add Details'),
            ),
            ElevatedButton(
              onPressed: () {},
              child: Text('Message'),
            ),
            ElevatedButton(
              onPressed: () {},
              child: Text('Remove'),
              style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildDetailRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        children: [
          Text(
            label,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(width: 8),
          Expanded(
            child: Text(
              value,
              style: TextStyle(fontSize: 16),
            ),
          ),
        ],
      ),
    );
  }
}
