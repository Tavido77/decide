import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            // Handle back navigation
            if (Navigator.canPop(context)) {
              Navigator.pop(context);
            }
          },
        ),
        actions: [
          TextButton(
            onPressed: () {
              // Handle Edit action
            },
            child: Text('Edit', style: TextStyle(color: Colors.black)), // Adjust color as needed
          ),
        ],
        backgroundColor: Colors.transparent, // Make AppBar background transparent if needed
        elevation: 0, // Remove shadow if needed
      ),
      body: SingleChildScrollView( // Use SingleChildScrollView to prevent overflow
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            CircleAvatar(
              radius: 50,
              backgroundImage: AssetImage('assets/profile_placeholder.png'), // Replace with your asset
            ),
            SizedBox(height: 16),
            Text(
              'Joseph Dinkunim',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 4),
            Text(
              'd.joseph@school.edu',
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
            SizedBox(height: 24),
            ElevatedButton(
              onPressed: () {
                // Handle View Profile action
              },
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                // primary: Colors.blue, // Set button color
                // onPrimary: Colors.white, // Set text color
              ),
              child: Text('View student profile'),
            ),
            SizedBox(height: 32),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Account',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(height: 8),
            _buildListTile(Icons.lock_outline, 'Change Password'),
            _buildListTile(Icons.chat_bubble_outline, 'Notification Preferences'),
            _buildListTile(Icons.calendar_today_outlined, 'Upcoming Sessions'),
            SizedBox(height: 24),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Support',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(height: 8),
            _buildListTile(Icons.help_outline, 'Help / FAQ'),
            _buildListTile(Icons.email_outlined, 'Contact Us'),
          ],
        ),
      ),
      
    );
  }

/// Builds a ListTile widget with a leading icon and a title.
/// 
/// The `icon` parameter specifies the icon to display at the leading position
/// of the ListTile. The `title` parameter is the text displayed as the title
/// of the ListTile. When the ListTile is tapped, a specific action can be
/// handled within the onTap callback.

  Widget _buildListTile(IconData icon, String title) {
    return ListTile(
      leading: Icon(icon, color: Colors.black54),
      title: Text(title),
      onTap: () {
        // Handle tap action for each item
      },
    );
  }
}

// Add a placeholder asset image in your assets folder or replace the path.