import 'package:flutter/material.dart';

class AdminDashboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Admin Dashboard'),
        actions: [
          IconButton(
            icon: Icon(Icons.logout),
            onPressed: () {
              // Implement logout functionality
              Navigator.pop(context); // Example: pop back to login page
            },
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Welcome to the Admin Dashboard!',
              style: TextStyle(fontSize: 20.0),
            ),
            SizedBox(height: 20.0),
            Container(
              padding: EdgeInsets.all(20.0),
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Column(
                children: [
                  Text(
                    'Total Users',
                    style: TextStyle(fontSize: 18.0, color: Colors.white),
                  ),
                  SizedBox(height: 10.0),
                  Text(
                    '100',
                    style: TextStyle(fontSize: 24.0, color: Colors.white),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20.0),
            Container(
              padding: EdgeInsets.all(20.0),
              decoration: BoxDecoration(
                color: Colors.green,
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Column(
                children: [
                  Text(
                    'Total Revenue',
                    style: TextStyle(fontSize: 18.0, color: Colors.white),
                  ),
                  SizedBox(height: 10.0),
                  Text(
                    '\$10,000',
                    style: TextStyle(fontSize: 24.0, color: Colors.white),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
