import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class CalendarPage extends StatefulWidget {
  const CalendarPage({Key? key}) : super(key: key);

  @override
  State<CalendarPage> createState() => _CalendarPageState();
}

class _CalendarPageState extends State<CalendarPage> {
  late Map<DateTime, List<String>>
      _leaveEvents; // Map untuk menyimpan event cuti
  DateTime _selectedDay = DateTime.now(); // Tanggal yang dipilih
  List<String> _selectedEvents = []; // Event untuk tanggal yang dipilih

  @override
  void initState() {
    super.initState();

    // Dummy data cuti
    _leaveEvents = {
      DateTime(2024, 11, 10): ["Medical Leave (Pending)"],
      DateTime(2024, 11, 15): ["Annual Leave (Approved)"],
      DateTime(2024, 11, 20): ["Unpaid Leave (Rejected)"],
    };

    // Inisialisasi event untuk tanggal saat ini
    _selectedEvents = _leaveEvents[_selectedDay] ?? [];
  }

  // Fungsi untuk memperbarui event berdasarkan tanggal yang dipilih
  void _onDaySelected(DateTime selectedDay, DateTime focusedDay) {
    setState(() {
      _selectedDay = selectedDay;
      _selectedEvents = _leaveEvents[selectedDay] ?? [];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Calendar Page"),
      ),
      body: Column(
        children: [
          TableCalendar(
            firstDay: DateTime.utc(2023, 1, 1),
            lastDay: DateTime.utc(2025, 12, 31),
            focusedDay: _selectedDay,
            selectedDayPredicate: (day) => isSameDay(day, _selectedDay),
            onDaySelected: _onDaySelected,
            eventLoader: (day) => _leaveEvents[day] ?? [],
            calendarStyle: const CalendarStyle(
              todayDecoration:
                  BoxDecoration(color: Colors.blue, shape: BoxShape.circle),
              selectedDecoration:
                  BoxDecoration(color: Colors.orange, shape: BoxShape.circle),
              markerDecoration:
                  BoxDecoration(color: Colors.red, shape: BoxShape.circle),
            ),
          ),
          const SizedBox(height: 16),
          Expanded(
            child: _selectedEvents.isEmpty
                ? const Center(child: Text("No leave events on this day."))
                : ListView.builder(
                    itemCount: _selectedEvents.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        leading: const Icon(Icons.event, color: Colors.blue),
                        title: Text(_selectedEvents[index]),
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }
}
