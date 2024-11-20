import 'package:flutter/material.dart';

class LeaveHistoryItem extends StatelessWidget {
  final String leaveType;
  final String status;
  final String date;

  const LeaveHistoryItem({
    Key? key,
    required this.leaveType,
    required this.status,
    required this.date,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
      child: ListTile(
        leading: const Icon(Icons.file_copy, color: Colors.blue),
        title: Text(
          leaveType,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Text("Date: $date\nStatus: $status"),
        trailing: Icon(
          status == "Approved" ? Icons.check_circle : Icons.pending,
          color: status == "Approved" ? Colors.green : Colors.orange,
        ),
      ),
    );
  }
}
