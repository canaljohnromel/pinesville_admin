import 'package:flutter/material.dart';
import 'package:pinesville_admin/chats.dart'; // Add this import
import 'package:pinesville_admin/chats.dart';

class TenantsPage extends StatefulWidget {
  @override
  _TenantsPageState createState() => _TenantsPageState();
}

class _TenantsPageState extends State<TenantsPage> {
  final List<Map<String, String>> tenants = [
    {'name': 'Ralph Edwards', 'room': 'Room 101'},
    {'name': 'Guy Hawkins', 'room': 'Room 102'},
    {'name': 'Darrell Steward', 'room': 'Room 103'},
    {'name': 'Savannah Nguyen', 'room': 'Room 104'},
    {'name': 'Eleanor Pena', 'room': 'Room 105'},
    {'name': 'Cody Fisher', 'room': 'Room 106'},
    {'name': 'Theresa Webb', 'room': 'Room 107'},
    {'name': 'Marvin McKinney', 'room': 'Room 108'},
    {'name': 'Arlene McCoy', 'room': 'Room 109'},
    {'name': 'Esther Howard', 'room': 'Room 110'},
    {'name': 'Floyd Miles', 'room': 'Room 111'},
    {'name': 'Jerome Bell', 'room': 'Room 112'},
    {'name': 'Jane Cooper', 'room': 'Room 113'},
    {'name': 'Dianne Russell', 'room': 'Room 114'},
    {'name': 'Darlene Robertson', 'room': 'Room 115'},
    {'name': 'Courtney Henry', 'room': 'Room 116'},
  ];

  Map<String, String>? selectedTenant;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header
          Text(
            selectedTenant == null ? 'Tenants' : 'Tenants',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          Divider(color: Colors.grey, thickness: 1),
          SizedBox(height: 16),

          // Display content based on the selected tenant
          selectedTenant == null
              ? Expanded(
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, // Two columns
                crossAxisSpacing: 2, // Horizontal spacing between columns
                mainAxisSpacing: 16, // Vertical spacing between rows
                childAspectRatio: 9, // Adjust card height-to-width ratio
              ),
              itemCount: tenants.length,
              itemBuilder: (context, index) {
                return _buildTenantCard(tenants[index]);
              },
            ),
          )
              : _buildTenantDetails(selectedTenant!),
        ],
      ),
    );
  }

  Widget _buildTenantCard(Map<String, String> tenant) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedTenant = tenant;
        });
      },
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Circular Avatar
          CircleAvatar(
            radius: 25,
            backgroundColor: Colors.grey.shade200,
            backgroundImage: AssetImage(
                'assets/images/pinesville_pasig.png'), // Replace with actual images
          ),
          SizedBox(width: 16),
          // Name and Room
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                tenant['name']!,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                tenant['room']!,
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.grey.shade600,
                ),
              ),
            ],
          ),
        ],
      ),
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
                  selectedTenant = null; // Reset to show the grid view again
                });
              },
            ),
            Text(
              'Back',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        SizedBox(height: 16),
        // Image and Details with left padding
        Padding(
          padding: const EdgeInsets.only(left: 100.0), // Add left spacing
          child: Row(
            children: [
              CircleAvatar(
                radius: 50,
                backgroundColor: Colors.grey.shade200,
                backgroundImage: AssetImage(
                    'assets/images/pinesville_pasig.png'), // Replace with actual images
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
        ),
        SizedBox(height: 32),
        // Tenant details with left padding
        Padding(
          padding: const EdgeInsets.only(left: 100.0), // Add left spacing
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildDetailRow('Email:', 'juandelacruz@gmail.com'),
              _buildDetailRow('Contact Number:', '(+63) 9012345678'),
              _buildDetailRow('Move-in Date:', 'January 10, 2024'),
            ],
          ),
        ),
        SizedBox(height: 32),
        // Action buttons
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton.icon(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ChatsPage(selectedTenant: selectedTenant!), // Navigate to ChatsPage
                  ),
                );
              },
              icon: Icon(Icons.message),
              label: Text('Message'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.teal,
              ),
            ),
            SizedBox(width: 16),
            ElevatedButton.icon(
              onPressed: () {},
              icon: Icon(Icons.person_remove),
              label: Text('Remove'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.teal,
              ),
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
