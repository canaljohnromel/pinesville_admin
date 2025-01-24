import 'package:flutter/material.dart';
import 'package:pinesville_admin/bar%20chart/chart_column3.dart';
import 'package:pinesville_admin/bar%20chart/pie_chart.dart';
import 'package:pinesville_admin/login.dart';
import 'package:pinesville_admin/tenants.dart';
import 'package:pinesville_admin/chats.dart';
import 'package:pinesville_admin/bills_payments.dart';
import 'package:pinesville_admin/announcements.dart';
import 'package:pinesville_admin/reports_requests.dart';
import 'package:pinesville_admin/analytics.dart';

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
    ChatsPage(selectedTenant: {},), // Correctly add the ChatsPage instance here
    BillsAndPaymentsPage(),
    AnnouncementsPage(),
    ReportsRequestsPage(),
    AnalyticsPage(),
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
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 16),

          // Statistics Section
          Expanded(
            child: GridView.count(
              crossAxisCount: 6,
              crossAxisSpacing: 16,
              mainAxisSpacing: 16,
              childAspectRatio: 1,
              children: [
                _buildStatCard('5', 'Total Number of Paid Tenants'),
                _buildStatCard('2', 'Total Number of Pending Tenants'),
                _buildStatCard('16', 'Total Number of Tenants'),
                _buildStatCard('₱12,345', 'Amount Collected'),
                _buildStatCard('₱12,345', 'Amount Remaining'),
                _buildStatCard('₱24,690', 'Total Amount'),
              ],
            ),
          ),

          // Analytics Section
          SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: Container(
                  height: 500,
                  width: 100,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8.0),
                    border: Border.all(color: Colors.grey.shade300),
                  ),
                  child: pieChart(),
                ),
              ),
              SizedBox(width: 16),
              Expanded(
                child: Container(
                  height: 500,
                  width: 500,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8.0),
                    border: Border.all(color: Colors.grey.shade300),
                  ),
                  child: chartColumn3(),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildStatCard(String value, String label) {
    return Container(
      padding: EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8.0),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            value,
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.red),
          ),
          SizedBox(height: 8),
          Text(label, textAlign: TextAlign.center),
        ],
      ),
    );
  }
}

