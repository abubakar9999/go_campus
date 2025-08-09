import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NoticeBoardScreen extends StatelessWidget {
  NoticeBoardScreen({Key? key}) : super(key: key);

  final List<Map<String, dynamic>> notices = [
    {
      'title': 'Final Exam Schedule Released',
      'content': 'The final exam will start from August 10. Please check the detailed schedule on the university website.',
      'date': DateTime(2025, 8, 1),
    },
    {
      'title': 'Library Closed for Maintenance',
      'content': 'The central library will be closed on August 5 and 6 for system maintenance.',
      'date': DateTime(2025, 8, 3),
    },
    {
      'title': 'Guest Lecture on AI',
      'content': 'A guest lecture on Artificial Intelligence by Dr. Sarah Khan will be held on August 8 at 2 PM in Room 101.',
      'date': DateTime(2025, 7, 28),
    },
    {
      'title': 'New Course Registration',
      'content': 'Course registration for the Fall semester will open on August 15. Make sure to register early to secure your spot.',
      'date': DateTime(2025, 8, 4),
    },
  ];

  String formatDate(DateTime date) {
    return DateFormat('dd MMM').format(date);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Notice Board'),
        backgroundColor: Colors.indigo,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: notices.length,
        itemBuilder: (context, index) {
          final notice = notices[index];
          return Card(
            elevation: 5,
            margin: const EdgeInsets.symmetric(vertical: 10),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                children: [
                  // Date box
                  Container(
                    width: 60,
                    height: 60,
                    decoration: BoxDecoration(
                      color: Colors.indigo.shade100,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Center(
                      child: Text(
                        formatDate(notice['date']),
                        style: TextStyle(
                          color: Colors.indigo.shade800,
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 16),
                  // Notice details
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          notice['title'],
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.black87,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          notice['content'],
                          style: TextStyle(
                            fontSize: 15,
                            color: Colors.grey.shade800,
                            height: 1.3,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
