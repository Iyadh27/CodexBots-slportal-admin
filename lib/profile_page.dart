import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  Future<Map<String, String>> _fetchProfileDetails() async {
    // Simulating a backend call
    await Future.delayed(Duration(seconds: 2));
    // Mock profile data - replace with actual backend data
    return {
      'name': 'Officer Name',
      'email': 'officer@example.com',
      'department': 'Visa Processing',
    };
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
      ),
      body: FutureBuilder<Map<String, String>>(
        future: _fetchProfileDetails(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error loading profile details.'));
          } else if (!snapshot.hasData) {
            return Center(child: Text('No profile details found.'));
          } else {
            final profile = snapshot.data!;
            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Name: ${profile['name']}'),
                  Text('Email: ${profile['email']}'),
                  Text('Department: ${profile['department']}'),
                ],
              ),
            );
          }
        },
      ),
    );
  }
}