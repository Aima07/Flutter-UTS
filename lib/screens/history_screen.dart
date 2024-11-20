import 'package:flutter/material.dart';
import 'login_screen.dart';
import '../widgets/leave_history_item.dart';

class HistoryScreen extends StatelessWidget {
  const HistoryScreen({Key? key}) : super(key: key);

  void _logout(BuildContext context) {
    // Navigasi kembali ke halaman login
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const LoginScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Leave History'),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () => _logout(context),
          ),
        ],
      ),
      body: ListView(
        children: const [
          LeaveHistoryItem(
            leaveType: "Annual Leave",
            status: "Approved",
            date: "2024-11-15",
          ),
          LeaveHistoryItem(
            leaveType: "Medical Leave",
            status: "Pending",
            date: "2024-11-10",
          ),
          LeaveHistoryItem(
            leaveType: "Unpaid Leave",
            status: "Rejected",
            date: "2024-11-05",
          ),
        ],
      ),
    );
  }
}
