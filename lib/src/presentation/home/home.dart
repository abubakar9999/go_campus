import 'package:flutter/material.dart';
import 'package:go_campus/src/presentation/bus_screen/bus.dart';
import 'package:go_campus/src/presentation/home/widgets/class_routine.dart';
import 'package:go_campus/src/presentation/home/widgets/notice.dart';
import 'package:go_campus/src/presentation/inbox/inbox.dart' show InboxScreen;
import 'package:go_campus/src/presentation/profile/profile.dart';
import 'package:go_campus/src/presentation/result/result.dart';

class HomePage extends StatelessWidget {
  final String role;
  const HomePage({required this.role});

  @override
  Widget build(BuildContext context) {
    final tabs = [
      HomeScreen(role: role),
      ResultScreen(),
      BusLocationScreen(),
      InboxScreen(),
      ProfileScreen(role: role),
    ];

    return DefaultTabController(
      length: tabs.length,
      child: Scaffold(
        body: TabBarView(children: tabs),
        bottomNavigationBar: TabBar(
          labelColor: Colors.indigo,
          unselectedLabelColor: Colors.grey,
          indicator: UnderlineTabIndicator(borderSide: BorderSide.none),
          tabs: [
            Tab(icon: Icon(Icons.home), text: 'Home'),
            Tab(icon: Icon(Icons.school), text: 'Result'),
            Tab(icon: Icon(Icons.directions_bus), text: 'Bus'),
            Tab(icon: Icon(Icons.message), text: 'Inbox'),
            Tab(icon: Icon(Icons.person), text: 'Profile'),
          ],
        ),
      ),
    );
  }
}

class HomeScreen extends StatelessWidget {
  final String role;
  const HomeScreen({required this.role});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Welcome $role",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
          SizedBox(height: 20),
          Expanded(
            child: GridView.count(
              crossAxisCount: 2,
              crossAxisSpacing: 16,
              mainAxisSpacing: 16,
              children: [
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => CSEClassRoutineScreen(),
                      ),
                    );
                  },
                  child: _buildGridCard(Icons.schedule, "Class Routine")),
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => NoticeBoardScreen(),
                      ),
                    );
                  },
                  
                  child: _buildGridCard(Icons.notifications, "Notice Board")),
                _buildGridCard(Icons.grade, "CGPA: 3.65"),
                _buildGridCard(Icons.directions_bus, "Bus Last Seen: 5 min ago"),
                _buildGridCard(Icons.school, "Total Credits: 93"),
                _buildGridCard(Icons.book, "Program: BSc in CSE"),
                _buildGridCard(Icons.check_circle, "Attendance: 87%"),
                _buildGridCard(Icons.bookmark, "Completed Courses: 30"),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _buildGridCard(IconData icon, String title) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.indigo.shade100,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, size: 40, color: Colors.indigo.shade800),
            SizedBox(height: 10),
            Text(
              title,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}

  
  
