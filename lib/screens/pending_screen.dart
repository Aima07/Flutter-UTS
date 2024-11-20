import 'package:flutter/material.dart';
import '../widgets/leave_history_item.dart';

class PendingScreen extends StatelessWidget {
  const PendingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Data semua riwayat cuti
    final leaveHistory = [
      {
        "leaveType": "Annual Leave",
        "status": "Approved",
        "date": "2024-11-15",
      },
      {
        "leaveType": "Medical Leave",
        "status": "Pending",
        "date": "2024-11-10",
      },
      {
        "leaveType": "Unpaid Leave",
        "status": "Rejected",
        "date": "2024-11-05",
      },
    ];

    // Filter data hanya untuk status "Pending"
    final pendingLeaves =
        leaveHistory.where((leave) => leave['status'] == "Pending").toList();

    return ListView.builder(
      itemCount: pendingLeaves.length,
      itemBuilder: (context, index) {
        final leave = pendingLeaves[index];
        return LeaveHistoryItem(
          leaveType: leave["leaveType"] as String,
          status: leave["status"] as String,
          date: leave["date"] as String,
        );
      },
    );
  }
}
