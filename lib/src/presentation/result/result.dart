import 'package:flutter/material.dart';

class ResultScreen extends StatelessWidget {
  final List<Map<String, dynamic>> subjectResults = [
    {'code': 'CSE101', 'name': 'Introduction to Programming', 'grade': 'A', 'marks': 85},
    {'code': 'EEE102', 'name': 'Basic Electrical Engineering', 'grade': 'B+', 'marks': 78},
    {'code': 'MATH103', 'name': 'Calculus I', 'grade': 'A-', 'marks': 82},
    {'code': 'PHY104', 'name': 'Physics I', 'grade': 'B', 'marks': 74},
    {'code': 'ENG105', 'name': 'English Composition', 'grade': 'A', 'marks': 88},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Result Sheet"),
        backgroundColor: Colors.indigo,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text(
              "Semester Results",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.indigo),
            ),
            SizedBox(height: 20),
            Table(
              border: TableBorder.all(color: Colors.grey),
              columnWidths: {
                0: FlexColumnWidth(1.2),
                1: FlexColumnWidth(2),
                2: FlexColumnWidth(1),
                3: FlexColumnWidth(1),
              },
              children: [
                TableRow(
                  decoration: BoxDecoration(color: Colors.indigo.shade100),
                  children: [
                    _buildTableHeader('Code'),
                    _buildTableHeader('Subject'),
                    _buildTableHeader('Grade'),
                    _buildTableHeader('Marks'),
                  ],
                ),
                ...subjectResults.map((subject) => TableRow(
                  children: [
                    _buildTableCell(subject['code']),
                    _buildTableCell(subject['name']),
                    _buildTableCell(subject['grade']),
                    _buildTableCell(subject['marks'].toString()),
                  ],
                )),
              ],
            ),
            SizedBox(height: 20),
            Container(
              padding: EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.indigo.shade50,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Text(
                "CGPA: 3.78",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600, color: Colors.indigo),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTableHeader(String title) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(
        title,
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
        textAlign: TextAlign.center,
      ),
    );
  }

  Widget _buildTableCell(String content) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(
        content,
        style: TextStyle(fontSize: 14),
        textAlign: TextAlign.center,
      ),
    );
  }
}
