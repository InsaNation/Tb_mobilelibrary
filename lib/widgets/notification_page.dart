import 'package:flutter/material.dart';

class NotificationPage extends StatelessWidget {
  final List<String> notifications = [
    'Notification 1: You have a new message',
    'Notification 2: Your book is due tomorrow',
    'Notification 3: New book added to the library',
  ];

  void _showNotificationDetails(BuildContext context, String notification) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Notification Details'),
          content: Text(notification),
          actions: [
            TextButton(
              child: Text('Close'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Notifications'),
        backgroundColor: Color(0xff9DB2BF),
      ),
      backgroundColor: Color(0xff27374D), // Match the background color of the Scaffold
      body: Padding(
        padding: EdgeInsets.all(16.0), // Use Padding instead of margin on the Container
        child: Container(
          decoration: BoxDecoration(
            color: Color(0xff27374D), // Ensure the inner Container has the same color
            borderRadius: BorderRadius.circular(8.0),
          ),
          child: ListView.builder(
            itemCount: notifications.length,
            itemBuilder: (context, index) {
              return Card(
                color: Color.fromARGB(255, 41, 82, 107),
                child: ListTile(
                  title: Text(
                    notifications[index],
                    style: TextStyle(color: Colors.white),
                  ),
                  onTap: () => _showNotificationDetails(context, notifications[index]),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
