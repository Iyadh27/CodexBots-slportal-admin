import 'package:flutter/material.dart';

class AnalyticsPage extends StatelessWidget {
  Future<Map<String, dynamic>> _fetchAnalyticsData() async {
    // Simulating a backend call
    await Future.delayed(Duration(seconds: 2));
    // Mock data - replace with actual backend data
    return {
      'totalApplications': 50,
      'approved': 30,
      'denied': 15,
      'pending': 5,
    };
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Analytics'),
      ),
      body: FutureBuilder<Map<String, dynamic>>(
        future: _fetchAnalyticsData(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error loading analytics data.'));
          } else if (!snapshot.hasData) {
            return Center(child: Text('No analytics data available.'));
          } else {
            final data = snapshot.data!;
            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Total Applications: ${data['totalApplications']}'),
                  Text('Approved: ${data['approved']}'),
                  Text('Denied: ${data['denied']}'),
                  Text('Pending: ${data['pending']}'),
                ],
              ),
            );
          }
        },
      ),
    );
  }
}