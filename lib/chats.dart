import 'package:flutter/material.dart';
import 'package:pinesville_admin/services/chat_service.dart';

class ChatsPage extends StatefulWidget {
  final Map<String, String> selectedTenant; // Accept selectedTenant

  // Constructor to accept selectedTenant
  const ChatsPage({Key? key, required this.selectedTenant}) : super(key: key);
  @override

  _ChatsPageState createState() => _ChatsPageState();

}

final ChatService _ChatService = ChatService();


Map<String, String>? selectedTenant;
class _ChatsPageState extends State<ChatsPage> {
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


  final Map<String, List<String>> messages = {
    'Ralph Edwards': ['Hello Ralph!', 'How are you?', 'See you soon.'],
    'Guy Hawkins': ['Hi Guy!', 'Can we meet tomorrow?', 'Thanks!'],
    'Darrell Steward': ['Hi Darrell!', 'Please confirm the booking.', 'Good day!'],
    // Add messages for other tenants as needed
  };


  @override
  Widget build(BuildContext context) {

    final ChatService _ChatService = ChatService();

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
                      itemCount: tenants.length,
                      itemBuilder: (context, index) {
                        final tenant = tenants[index];
                        return ListTile(
                          leading: CircleAvatar(
                            backgroundColor: Colors.grey.shade300,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(30),
                              child: Image.asset(
                                'assets/images/pinesville_pasig.png',
                                fit: BoxFit.cover,
                                width: 40,
                                height: 40,
                              ),
                            ),
                          ),
                          title: Text(tenant['name']!),
                          subtitle: Text(tenant['room']!),
                          onTap: () {
                            setState(() {
                              selectedTenant = tenant;
                            });
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
                          child: selectedTenant == null
                              ? Center(
                            child: Text(
                              'Select a tenant to view messages.',
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.grey,
                              ),
                            ),
                          )
                              : ListView.builder(
                            itemCount:
                            messages[selectedTenant!['name']]?.length ?? 0,
                            itemBuilder: (context, index) {
                              final message =
                              messages[selectedTenant!['name']]![index];
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
                                      borderRadius:
                                      BorderRadius.circular(8),
                                    ),
                                    child: Text(
                                      message,
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







