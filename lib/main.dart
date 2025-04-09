import 'package:flutter/material.dart';
import 'prof.dart'; // Import ProfilePage
import 'book.dart'; // Import BookSessionPage

// Keep the main function:
void main() {
  runApp(const MyApp()); // This starts your app
}

// Modify MyApp to use MainScreen and add BottomNav styling:
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter App', // You can change this title
      theme: ThemeData(
        primarySwatch: Colors.blue,
        // Add theme for BottomNavigationBar for consistency
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          selectedItemColor: Colors.blue, // Active color
          unselectedItemColor: Colors.grey, // Inactive color
          showUnselectedLabels: true, // Keep labels visible
          type: BottomNavigationBarType.fixed, // Use fixed type
        ),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MainScreen(), // *** CHANGE home TO MainScreen ***
    );
  }
}

// --- ADD MainScreen StatefulWidget BELOW MyApp ---
class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0; // Manages the selected tab index

  // List of the pages corresponding to the BottomNavBar items
  static final List<Widget> _widgetOptions = <Widget>[
    const HomePage(),           // Index 0: Home
    const ChatPage(),           // Index 1: Chat (Placeholder)
    BookSessionPage(),      // Index 2: Sessions (Using BookSessionPage for now)
    ProfilePage(),        // Index 3: Profile
  ];

  // Function called when a tab is tapped
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index; // Update the state with the new index
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Display the selected page from the list based on the current index
      body: IndexedStack( // Use IndexedStack to preserve state of inactive pages
         index: _selectedIndex,
         children: _widgetOptions,
      ),
      // Define the Bottom Navigation Bar
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            activeIcon: Icon(Icons.home), // Optional: different icon when active
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.chat_bubble_outline),
            activeIcon: Icon(Icons.chat_bubble),
            label: 'Chat',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_today_outlined),
            activeIcon: Icon(Icons.calendar_today),
            label: 'Sessions',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            activeIcon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
        currentIndex: _selectedIndex, // Tell the bar which item is currently active
        onTap: _onItemTapped, // Set the callback function for tap events
        // Styling is now handled by the theme in MyApp
      ),
    );
  }
}

// --- ADD Placeholder Chat Page ---
class ChatPage extends StatelessWidget {
  const ChatPage({super.key});

  @override
  Widget build(BuildContext context) {
    // You can customize this placeholder page
    return Scaffold(
      appBar: AppBar(
        title: const Text('Chat'),
        backgroundColor: Theme.of(context).primaryColor, // Example styling
      ),
      body: const Center(
        child: Text(
          'Chat Functionality Coming Soon!',
          style: TextStyle(fontSize: 18, color: Colors.grey),
        ),
      ),
    );
  }
}

// --- Keep your existing HomePage class below this --- 
// (Make sure it has a const constructor if needed)
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // AppBar can be added here if needed
      // appBar: AppBar(title: Text('Home')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: kToolbarHeight * 0.5), // Adjust top padding if no AppBar
            Text(
              'Welcome, Student',
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              'How can I help you today?',
              style: TextStyle(fontSize: 16, color: Colors.grey[600]),
            ),
            SizedBox(height: 24),
            Row( // Using Row for the two main action buttons
              children: [
                Expanded(child: _buildActionCard(context, Icons.chat_bubble_outline, 'Chat\nwith AI')),
                SizedBox(width: 16),
                Expanded(child: _buildActionCard(context, Icons.calendar_today_outlined, 'Book\nSession')),
              ],
            ),
            SizedBox(height: 32),
            Text(
              'Resources',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
             _buildResourceItem(
               context,
               Icons.menu_book_outlined, // Or Icons.library_books_outlined
               'Self-Help Guides',
               'Access mental health resources',
            ),
             Divider(height: 1, thickness: 1), // Add a divider between items
            _buildResourceItem(
               context,
               Icons.play_circle_outline,
               'Video Sessions',
               'Watch counseling videos',
            ),

            SizedBox(height: 32),
            Text(
              'Recent Conversations',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            _buildConversationItem(
                context,
                Icons.chat_bubble_outline,
                'Stress Management',
                'Yesterday, 2:30 PM'
            ),
             // Add more conversation items as needed
          ],
        ),
      ),
      // Add the BottomNavigationBar if needed
      // bottomNavigationBar: BottomNavigationBar(...)
    );
  }

  Widget _buildActionCard(BuildContext context, IconData icon, String label) {
    return Card(
       elevation: 2, // Add some shadow
       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
       child: InkWell( // Make the card tappable
          onTap: () {}, // Add navigation/action
          borderRadius: BorderRadius.circular(12),
          child: Padding(
             padding: const EdgeInsets.all(16.0),
             child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                   Icon(icon, size: 36, color: Theme.of(context).primaryColor), // Use theme color
                   SizedBox(height: 12),
                   Text(
                      label,
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                   ),
                ],
             ),
          ),
       ),
    );
 }


  Widget _buildResourceItem(BuildContext context, IconData icon, String title, String subtitle) {
      return ListTile(
        leading: Icon(icon, color: Colors.black54, size: 28),
        title: Text(title, style: TextStyle(fontWeight: FontWeight.w500)),
        subtitle: Text(subtitle, style: TextStyle(color: Colors.grey[600])),
        onTap: () {
          // Handle resource tap
        },
        contentPadding: EdgeInsets.symmetric(vertical: 8.0), // Add vertical padding
      );
  }

   Widget _buildConversationItem(BuildContext context, IconData icon, String title, String timestamp) {
      return Card( // Optionally wrap in a Card for distinct look
         elevation: 0, // Or 1-2 for slight shadow
         margin: EdgeInsets.only(bottom: 8),
         child: ListTile(
            leading: Icon(icon, color: Colors.black54, size: 28),
            title: Text(title, style: TextStyle(fontWeight: FontWeight.w500)),
            subtitle: Text(timestamp, style: TextStyle(color: Colors.grey[600])),
            onTap: () {
              // Handle conversation tap
            },
            contentPadding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
         ),
      );
   }
}
