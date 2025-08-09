import 'package:flutter/material.dart';

class CSEClassRoutineScreen extends StatelessWidget {
  CSEClassRoutineScreen({Key? key}) : super(key: key);

  final List<Map<String, String>> cseRoutine = [
    {
      'subject': 'CSE101 - Introduction to Programming',
      'teacher': 'Mimun Barid Sir',
      'image': 'https://randomuser.me/api/portraits/men/10.jpg',
      'time': '9:00 AM - 10:00 AM',
    },
    {
      'subject': 'CSE102 - Data Structures',
      'teacher': 'Afrida Mam',
      'image': 'https://randomuser.me/api/portraits/women/20.jpg',
      'time': '10:15 AM - 11:15 AM',
    },
    {
      'subject': 'CSE201 - Algorithms',
      'teacher': 'Faruk Sir',
      'image': 'https://randomuser.me/api/portraits/men/30.jpg',
      'time': '11:30 AM - 12:30 PM',
    },
    {
      'subject': 'CSE202 - Database Systems',
      'teacher': 'Rubel Sir',
      'image': 'https://randomuser.me/api/portraits/men/40.jpg',
      'time': '1:30 PM - 2:30 PM',
    },
    {
      'subject': 'CSE301 - Operating Systems',
      'teacher': 'Mimun Barid Sir',
      'image': 'https://randomuser.me/api/portraits/men/10.jpg',
      'time': '2:45 PM - 3:45 PM',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('CSE Class Routine'),
        backgroundColor: Colors.indigo,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: cseRoutine.length,
        itemBuilder: (context, index) {
          final item = cseRoutine[index];
          return Card(
            margin: const EdgeInsets.symmetric(vertical: 10),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
            elevation: 4,
            child: ListTile(
              contentPadding: const EdgeInsets.all(16),
              leading: CircleAvatar(
                radius: 30,
                backgroundImage: NetworkImage(item['image']!),
              ),
              title: Text(
                item['subject']!,
                style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              subtitle: Padding(
                padding: const EdgeInsets.only(top: 6.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      item['teacher']!,
                      style: const TextStyle(fontSize: 16),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      item['time']!,
                      style: TextStyle(fontSize: 14, color: Colors.grey[700]),
                    ),
                  ],
                ),
              ),
              trailing: const Icon(Icons.schedule, color: Colors.indigo),
            ),
          );
        },
      ),
    );
  }
}
