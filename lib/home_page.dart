import 'package:admin_panel/analytics_page.dart';
import 'package:admin_panel/applicationDetail_page.dart';
import 'package:admin_panel/profile_page.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;

  final List<Map<String, String>> _visaApplications = [
    {'id': '123', 'name': 'John Doe', 'status': 'Pending'},
    {'id': '124', 'name': 'Jane Smith', 'status': 'Pending'},
    {'id': '125', 'name': 'Alex Johnson', 'status': 'Approved'},
    {'id': '126', 'name': 'Emily Brown', 'status': 'Rejected'},
    {'id': '127', 'name': 'Michael Wilson', 'status': 'Pending'},
  ];

  void _navigateToApplicationDetail(String id) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ApplicationDetailPage(applicationId: id),
      ),
    );
  }

  void _onNavBarTapped(int index) {
    setState(() {
      _currentIndex = index;
    });

    if (_currentIndex == 1) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => AnalyticsPage()),
      );
    } else if (_currentIndex == 2) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => ProfilePage()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Visa Officer Dashboard'),
      ),
      body: _buildDashboard(),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: _onNavBarTapped,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.analytics), label: 'Analytics'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
      ),
    );
  }

  Widget _buildDashboard() {
    return ListView.builder(
      itemCount: _visaApplications.length,
      itemBuilder: (context, index) {
        final application = _visaApplications[index];
        return Card(
          margin: const EdgeInsets.all(8.0),
          child: ListTile(
            title: Text(application['name']!),
            subtitle: Text('Status: ${application['status']}'),
            onTap: () => _navigateToApplicationDetail(application['id']!),
          ),
        );
      },
    );
  }
}





