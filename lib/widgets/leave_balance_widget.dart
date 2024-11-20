import 'package:flutter/material.dart';

class LeaveBalanceWidget extends StatelessWidget {
  const LeaveBalanceWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(10),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Leave Balance",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Table(
              border: TableBorder.all(color: Colors.grey),
              columnWidths: const {
                0: FlexColumnWidth(2),
                1: FlexColumnWidth(1),
                2: FlexColumnWidth(1),
              },
              children: [
                _buildTableRow("Leave Type", "Used", "Remaining",
                    isHeader: true),
                _buildTableRow("Annual Leave", "5", "10"),
                _buildTableRow("Medical Leave", "2", "3"),
                _buildTableRow("Unpaid Leave", "0", "5"),
              ],
            ),
          ],
        ),
      ),
    );
  }

  TableRow _buildTableRow(String type, String used, String remaining,
      {bool isHeader = false}) {
    return TableRow(
      decoration: BoxDecoration(
        color: isHeader ? Colors.grey[300] : null,
      ),
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(type,
              style: TextStyle(
                  fontWeight: isHeader ? FontWeight.bold : FontWeight.normal)),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(used, textAlign: TextAlign.center),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(remaining, textAlign: TextAlign.center),
        ),
      ],
    );
  }
}
