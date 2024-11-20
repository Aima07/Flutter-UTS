import 'package:flutter/material.dart';
import 'calendar_screen.dart';
import 'history_screen.dart';
import 'pending_screen.dart';
import '../widgets/leave_balance_widget.dart';

List<Map<String, String>> historyData = [
  {"title": "Leave Request 1", "status": "Approved"},
  {"title": "Leave Request 2", "status": "Pending"},
  {"title": "Leave Request 3", "status": "Approved"},
  {"title": "Leave Request 4", "status": "Pending"},
];

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;
  final List<Widget> _pages = [
    const HistoryScreen(),
    const CalendarPage(),
    const PendingScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("eLeave"),
      ),
      body: _pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.history), label: "History"),
          BottomNavigationBarItem(
              icon: Icon(Icons.calendar_today), label: "Calendar"),
          BottomNavigationBarItem(icon: Icon(Icons.pending), label: "Pending"),
        ],
      ),
    );
  }
}
