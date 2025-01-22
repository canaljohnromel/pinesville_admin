import 'package:flutter/material.dart';

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