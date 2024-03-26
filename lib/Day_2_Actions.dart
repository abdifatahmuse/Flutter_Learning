import 'package:flutter/material.dart';

class ActionsWidgets extends StatefulWidget {
  const ActionsWidgets({super.key});

  @override
  State<ActionsWidgets> createState() => _ActionsWidgetsState();
}

enum Calendar { day, week, month, year }

class _ActionsWidgetsState extends State<ActionsWidgets> {
  int _volume = 0;
  bool standardSelected = false;
  Calendar calendarView = Calendar.day;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const Text("Buttons"),
          ElevatedButton(
            onPressed: () {},
            child: const Text('Elevated'),
          ),
          const SizedBox(
            height: 10,
          ),
          FilledButton(onPressed: () {}, child: const Text('Filled')),
          const SizedBox(
            height: 10,
          ),
          FilledButton.tonal(
              onPressed: () {}, child: const Text('Filled Tonal')),
          const SizedBox(
            height: 10,
          ),
          OutlinedButton(onPressed: () {}, child: const Text('Outlined')),
          const SizedBox(
            height: 10,
          ),
          TextButton(onPressed: () {}, child: const Text('Text')),
          const SizedBox(
            height: 15,
          ),
          IconButton(
            icon: const Icon(Icons.volume_up),
            tooltip: 'Increase volume by 10',
            onPressed: () {
              setState(() {
                _volume += 10;
              });
            },
          ),
          Text("Volume $_volume"),
          const SizedBox(
            height: 15,
          ),
          Image.network(
              "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSzo_3ZWErfkWyEgg3AXKOTcrebyQY9VWPZI2-FPb3YWA&s"),
          const SizedBox(
            height: 15,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              IconButton(
                isSelected: standardSelected,
                icon: const Icon(Icons.settings_outlined),
                selectedIcon: const Icon(Icons.settings),
                onPressed: () {
                  setState(() {
                    standardSelected = !standardSelected;
                  });
                },
              ),
              const SizedBox(width: 10),
              IconButton(
                isSelected: standardSelected,
                icon: const Icon(Icons.settings_outlined),
                selectedIcon: const Icon(Icons.settings),
                onPressed: null,
              ),
            ],
          ),
          const SizedBox(
            height: 15,
          ),
          SegmentedButton<Calendar>(
            segments: const <ButtonSegment<Calendar>>[
              ButtonSegment<Calendar>(
                  value: Calendar.day,
                  label: Text('Day'),
                  icon: Icon(Icons.calendar_view_day)),
              ButtonSegment<Calendar>(
                  value: Calendar.week,
                  label: Text('Week'),
                  icon: Icon(Icons.calendar_view_week)),
              ButtonSegment<Calendar>(
                  value: Calendar.month,
                  label: Text('Month'),
                  icon: Icon(Icons.calendar_view_month)),
              ButtonSegment<Calendar>(
                  value: Calendar.year,
                  label: Text('Year'),
                  icon: Icon(Icons.calendar_today)),
            ],
            selected: <Calendar>{calendarView},
            onSelectionChanged: (Set<Calendar> newSelection) {
              setState(() {
                // By default there is only a single segment that can be
                // selected at one time, so its value is always the first
                // item in the selected set.
                calendarView = newSelection.first;
              });
            },
          )
        ],
      ),
    );
  }
}
