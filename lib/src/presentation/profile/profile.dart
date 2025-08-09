import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  final String role;
  const ProfileScreen({required this.role, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Profile"),
        backgroundColor: Colors.indigo,
      ),
      backgroundColor: Color(0xFFF4F6FA),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            // Profile Avatar
            CircleAvatar(
              radius: 60,
              backgroundImage: NetworkImage("https://i.pravatar.cc/150?img=4"),
            ),
            SizedBox(height: 15),
            Text(
              "Abu Bakar",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            Text(
              role,
              style: TextStyle(fontSize: 16, color: Colors.grey[700]),
            ),
            SizedBox(height: 20),

            // Info Card
            Card(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
              elevation: 3,
              margin: EdgeInsets.symmetric(vertical: 10),
              child: Padding(
                padding: const EdgeInsets.all(18.0),
                child: Column(
                  children: [
                    _buildInfoRow(Icons.phone, "Phone", "+8801234567890"),
                    Divider(),
                    _buildInfoRow(Icons.email, "Email", "john.doe@email.com"),
                    Divider(),
                    _buildInfoRow(Icons.location_on, "Address", "Mirpur, Dhaka, Bangladesh"),
                    Divider(),
                    _buildInfoRow(Icons.map, "Latitude", "23.8103"),
                    Divider(),
                    _buildInfoRow(Icons.map_outlined, "Longitude", "90.4125"),
                    Divider(),
                    _buildInfoRow(Icons.home, "Home", "Dhaka City"),
                    Divider(),
                    _buildInfoRow(Icons.school, "University", "University of South Asia"),
                    Divider(),
                    _buildInfoRow(Icons.directions_bus, "Bus Number", "Campus-07"),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoRow(IconData icon, String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          Icon(icon, color: Colors.indigo),
          SizedBox(width: 16),
          Expanded(
            child: Text(
              "$label:",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            ),
          ),
          Text(
            value,
            style: TextStyle(fontSize: 16, color: Colors.black87),
          ),
        ],
      ),
    );
  }
}
