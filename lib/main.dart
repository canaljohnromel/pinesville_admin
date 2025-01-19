import 'package:flutter/material.dart';
//import 'package:pinesville_admin/lib/login.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Montserrat',
      ),
      home: LoginPage(),
    );
  }
}

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    DashboardContent(),
    TenantsPage(),
    ChatsPage(), // Correctly add the ChatsPage instance here
    BillsAndPaymentsPage(),
    AnnouncementsPage(),
    ReportsRequestsPage(),
    Center(child: Text('Analytics Content', style: TextStyle(fontSize: 24))),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          // Sidebar navigation panel
          Container(
            width: 250,
            color: Color(0xFF006989),
            child: Column(
              children: [
                Container(
                  height: 150,
                  color: Color(0xFF006989),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(width: 10),
                      Container(
                        width: 50,
                        height: 50,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.white,
                        ),
                        child: Image.asset(
                          'images/pinesville_pasig.png',
                          fit: BoxFit.contain,
                          errorBuilder: (context, error, stackTrace) {
                            return Icon(
                              Icons.error_outline,
                              color: Color(0xFF006989),
                            );
                          },
                        ),
                      ),
                      SizedBox(width: 10),
                      Text(
                        'Pinesville Pasig',
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                Divider(color: Colors.white, thickness: 1),
                _buildNavItem(Icons.dashboard, 'Dashboard', 0),
                _buildNavItem(Icons.people, 'Tenants', 1),
                _buildNavItem(Icons.chat, 'Chats', 2),
                _buildNavItem(Icons.payment, 'Bills & Payments', 3),
                _buildNavItem(Icons.announcement, 'Announcements', 4),
                _buildNavItem(Icons.report, 'Reports', 5),
                _buildNavItem(Icons.analytics, 'Analytics', 6),
                Spacer(),
                Divider(color: Colors.white, thickness: 1),
                ListTile(
                  leading: Icon(Icons.logout, color: Colors.white),
                  title: Text('Log out', style: TextStyle(color: Colors.white)),
                  onTap: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => LoginPage()),
                    );
                  },
                ),
              ],
            ),
          ),
          Expanded(
            child: _pages[_selectedIndex],
          ),
        ],
      ),
    );
  }

  Widget _buildNavItem(IconData icon, String title, int index) {
    return Container(
      color: _selectedIndex == index ? Color(0xFF939393) : null,
      child: ListTile(
        leading: Icon(icon, color: Colors.white),
        title: Text(
          title,
          style: TextStyle(color: Colors.white),
        ),
        onTap: () {
          setState(() {
            _selectedIndex = index;
          });
        },
      ),
    );
  }
}

class ChatsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header
          Text(
            'Chats',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          Divider(color: Colors.grey, thickness: 1),
          SizedBox(height: 16),

          // Chat Content
          Expanded(
            child: Row(
              children: [
                // Chat list panel
                Expanded(
                  flex: 1,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: Colors.grey.shade300),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: ListView.builder(
                      itemCount: 10, // Replace with actual chat list data
                      itemBuilder: (context, index) {
                        return ListTile(
                          leading: CircleAvatar(
                            backgroundColor: Colors.grey.shade300,
                            child: Icon(Icons.person, color: Colors.white),
                          ),
                          title: Text('Tenant $index'),
                          subtitle: Text('Last message...'),
                          onTap: () {
                            // Add logic for selecting a chat
                          },
                        );
                      },
                    ),
                  ),
                ),
                SizedBox(width: 16),

                // Chat detail panel
                Expanded(
                  flex: 2,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: Colors.grey.shade300),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Column(
                      children: [
                        // Chat message list
                        Expanded(
                          child: ListView.builder(
                            itemCount: 15, // Replace with actual chat messages
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 8.0, vertical: 4.0),
                                child: Align(
                                  alignment: index % 2 == 0
                                      ? Alignment.centerLeft
                                      : Alignment.centerRight,
                                  child: Container(
                                    padding: EdgeInsets.all(12.0),
                                    decoration: BoxDecoration(
                                      color: index % 2 == 0
                                          ? Colors.grey.shade200
                                          : Colors.blue.shade100,
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    child: Text(
                                      'Message $index',
                                      style: TextStyle(fontSize: 14),
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                        ),

                        // Message input box
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              Expanded(
                                child: TextField(
                                  decoration: InputDecoration(
                                    hintText: 'Type your message...',
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    contentPadding: EdgeInsets.symmetric(
                                        horizontal: 12.0, vertical: 8.0),
                                  ),
                                ),
                              ),
                              SizedBox(width: 8),
                              IconButton(
                                icon: Icon(Icons.send, color: Colors.blue),
                                onPressed: () {
                                  // Add logic for sending messages
                                },
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class LoginPage extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  void handleLogin(BuildContext context) {
    final String email = emailController.text;
    final String password = passwordController.text;

    if (email == 'user@example.com' && password == 'admin123') {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => DashboardScreen()),
      );
    } else {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text('Login Failed'),
          content: Text('Invalid email or password. Please try again.'),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text('OK'),
            ),
          ],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          margin: const EdgeInsets.all(32.0),
          padding: const EdgeInsets.all(16.0),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16.0),
            boxShadow: [
              BoxShadow(
                color: Colors.black26,
                blurRadius: 10,
                offset: Offset(0, 4),
              ),
            ],
          ),
          child: Row(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const SizedBox(height: 60),
                      Text(
                        "Pinesville Pasig",
                        style: TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 8),
                      Text(
                        "Making everything from rent to maintenance requests easier",
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.grey[600],
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 70),
                      TextField(
                        controller: emailController,
                        decoration: InputDecoration(
                          labelText: "Email",
                          border: OutlineInputBorder(),
                        ),
                      ),
                      const SizedBox(height: 16),
                      TextField(
                        controller: passwordController,
                        obscureText: true,
                        decoration: InputDecoration(
                          labelText: "Password",
                          border: OutlineInputBorder(),
                          suffixIcon: Icon(Icons.visibility_off),
                        ),
                      ),
                      const SizedBox(height: 16),
                      ElevatedButton(
                        onPressed: () => handleLogin(context),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.teal,
                          minimumSize: const Size(double.infinity, 50),
                        ),
                        child: const Text("LOGIN"),
                      ),
                      const SizedBox(height: 16),
                      TextButton(
                        onPressed: () {},
                        child: const Text("Forgot Password?"),
                      ),
                      const SizedBox(height: 100),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Developed by:",
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.grey[600],
                            ),
                          ),
                          const SizedBox(width: 8),
                          Image.asset(
                            'images/silcotech.png',
                            height: 24,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: Center(
                  child: Image.asset(
                    'images/pinesville_pasig.png',
                    height: 680,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class DashboardContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Dashboard',
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
            ),
          ),
          Divider(color: Colors.grey, thickness: 1),
          SizedBox(height: 16),

          // Announcement and Sidebar Widgets
          Row(
            children: [
              Expanded(
                flex: 2,
                child: Container(
                  padding: EdgeInsets.all(16.0),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8.0),
                    border: Border.all(color: Colors.grey.shade300),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Announcement',
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 8),
                      Container(
                        height: 50,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey),
                          borderRadius: BorderRadius.circular(4),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(width: 16),
              Expanded(
                flex: 1,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Date and Time Section
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Date: 01/12/2024',
                          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          'Time: 11:43:12 am',
                          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    SizedBox(height: 16),
                    // Messages and Reports Buttons
                    _buildIconWithLabel(Icons.message, 'Messages'),
                    SizedBox(height: 16),
                    _buildIconWithLabel(Icons.report, 'Reports'),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 16),

          // Statistics Section
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildStatCard('0', 'Total Number of Overdue Tenants'),
              _buildStatCard('5', 'Total Number of Paid Tenants'),
              _buildStatCard('2', 'Total Number of Pending Tenants'),
              _buildStatCard('16', 'Total Number of Tenants'), // Fixed number to 16
            ],
          ),
          SizedBox(height: 16),

          // Amount Section
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildStatCard('₱12,345', 'Amount Collected'),
              _buildStatCard('₱12,345', 'Amount Remaining'),
              _buildStatCard('₱24,690', 'Total Amount'), // Updated logical total amount
            ],
          ),
          SizedBox(height: 16),

          // Analytics Section
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8.0),
                      border: Border.all(color: Colors.grey.shade300),
                    ),
                    child: Center(child: Text('Pie Chart')),
                  ),
                ),
                SizedBox(width: 16),
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8.0),
                      border: Border.all(color: Colors.grey.shade300),
                    ),
                    child: Center(child: Text('Graph')),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildIconWithLabel(IconData icon, String label) {
    return Column(
      children: [
        Icon(icon, size: 40),
        Text(label),
      ],
    );
  }

  Widget _buildStatCard(String value, String label) {
    return Expanded(
      child: Container(
        padding: EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8.0),
          border: Border.all(color: Colors.grey.shade300),
        ),
        child: Column(
          children: [
            Text(
              value,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.red),
            ),
            SizedBox(height: 8),
            Text(label, textAlign: TextAlign.center),
          ],
        ),
      ),
    );
  }
}

class TenantsPage extends StatelessWidget {
  final List<Map<String, String>> tenants = [
    {'name': 'Ralph Edwards', 'room': 'Room 101'},
    {'name': 'Guy Hawkins', 'room': 'Room 101'},
    {'name': 'Darrell Steward', 'room': 'Room 101'},
    {'name': 'Savannah Nguyen', 'room': 'Room 101'},
    {'name': 'Eleanor Pena', 'room': 'Room 101'},
    {'name': 'Cody Fisher', 'room': 'Room 101'},
    {'name': 'Theresa Webb', 'room': 'Room 101'},
    {'name': 'Marvin McKinney', 'room': 'Room 101'},
    {'name': 'Arlene McCoy', 'room': 'Room 101'},
    {'name': 'Esther Howard', 'room': 'Room 101'},
    {'name': 'Floyd Miles', 'room': 'Room 101'},
    {'name': 'Jerome Bell', 'room': 'Room 101'},
    {'name': 'Jane Cooper', 'room': 'Room 101'},
    {'name': 'Dianne Russell', 'room': 'Room 101'},
    {'name': 'Darlene Robertson', 'room': 'Room 101'},
    {'name': 'Courtney Henry', 'room': 'Room 101'},
  ];


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header
          Text(
            'Tenants',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          Divider(color: Colors.grey, thickness: 1),
          SizedBox(height: 16),

          // Grid of tenants
          Expanded(
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, // Two columns
                crossAxisSpacing: 16, // Horizontal spacing between columns
                mainAxisSpacing: 16, // Vertical spacing between rows
                childAspectRatio: 3, // Adjust card height-to-width ratio
              ),
              itemCount: tenants.length,
              itemBuilder: (context, index) {
                return _buildTenantCard(tenants[index]);
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTenantCard(Map<String, String> tenant) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        // Circular Avatar
        CircleAvatar(
          radius: 25,
          backgroundColor: Colors.grey.shade200,
          backgroundImage: AssetImage('images/default_avatar.png'), // Replace with actual images
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
    );
  }
}

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
                  width: 200,
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
                columns: const [
                  DataColumn(label: Text('Unit No.')),
                  DataColumn(label: Text('Name')),
                  DataColumn(label: Text('Amount')),
                  DataColumn(label: Text('Due Date')),
                  DataColumn(label: Text('Status')),
                  DataColumn(label: Text('Payment Date')),
                ],
                rows: List.generate(
                  6,
                      (index) => DataRow(cells: [
                    DataCell(Text('101')),
                    DataCell(Text('Juan Dela Cruz')),
                    DataCell(Text('4,500')),
                    DataCell(Text('Jan 10, 2024')),
                    DataCell(Text(index % 2 == 0 ? 'Paid' : 'Pending')),
                    DataCell(Text('Jan 10, 2024')),
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
                  onPressed: () {},
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
              ),
            ),
            Text(label),
          ],
        ),
      ),
    );
  }
}

class AnnouncementsPage extends StatelessWidget {
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
              'Announcements',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20),
            // Filters and Search Bar
            Row(
              children: [
                ToggleButtons(
                  isSelected: [true, false, false, false, false],
                  onPressed: (index) {},
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Text('All'),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Text('Days'),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Text('Weeks'),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Text('Month'),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Text('Year'),
                    ),
                  ],
                ),
                Spacer(),
                // Search Bar
                SizedBox(
                  width: 200,
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
            // Content Area
            Container(
              height: 200,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            SizedBox(height: 20),
            // Action Buttons
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                  onPressed: () {},
                  child: Text('Edit'),
                ),
                ElevatedButton(
                  onPressed: () {},
                  child: Text('Drafts'),
                ),
                ElevatedButton(
                  onPressed: () {},
                  child: Text('Saved'),
                ),
                ElevatedButton(
                  onPressed: () {},
                  child: Text('Delete'),
                ),
                ElevatedButton(
                  onPressed: () {},
                  child: Text('History'),
                ),
              ],
            ),
            SizedBox(height: 20),
            // Input Section
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Recipient Dropdown
                Row(
                  children: [
                    Text('To:'),
                    SizedBox(width: 10),
                    DropdownButton<String>(
                      value: 'Everyone',
                      items: [
                        DropdownMenuItem(
                          value: 'Everyone',
                          child: Text('Everyone'),
                        ),
                        DropdownMenuItem(
                          value: 'Tenants',
                          child: Text('Tenants'),
                        ),
                      ],
                      onChanged: (value) {},
                    ),
                  ],
                ),
                SizedBox(height: 10),
                // Text Input
                TextField(
                  maxLines: 4,
                  decoration: InputDecoration(
                    hintText: 'Write your announcement here...',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                ),
                SizedBox(height: 10),
                // Attachment Icons
                Row(
                  children: [
                    IconButton(
                      icon: Icon(Icons.attach_file),
                      onPressed: () {},
                    ),
                    IconButton(
                      icon: Icon(Icons.image),
                      onPressed: () {},
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

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
