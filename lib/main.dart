import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:learning/Day_2_Actions.dart';
import 'package:learning/day_1_input.dart';
import 'package:learning/location.dart';

void main() {
  runApp(const MyApp());
}

// Day 0
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.brown),
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0, _selectedIndex = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  void _onNavClick(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void _decrementCounter() => setState(() => _counter--);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: switch (_selectedIndex) {
        0 => WidgetsScreen(counter: _counter),
        1 => const Driver(),
        _ => const SizedBox.shrink(),
      },
      floatingActionButton: Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          FloatingActionButton(
            onPressed: _decrementCounter,
            tooltip: 'Decrement',
            child: const Icon(CupertinoIcons.minus),
          ),
          const SizedBox(
            width: 10,
          ),
          FloatingActionButton(
            onPressed: _incrementCounter,
            tooltip: 'Increment',
            child: const Icon(Icons.add),
          ),
        ],
      ),
      bottomNavigationBar: NavigationBar(
        onDestinationSelected: _onNavClick,
        selectedIndex: _selectedIndex,
        indicatorShape: const StadiumBorder(),
        destinations: [
          NavigationDestination(
            icon: Icon(
              CupertinoIcons.home,
              color: (Theme.of(context).brightness == Brightness.light)
                  ? Colors.blueGrey.shade200
                  : Colors.blueGrey.shade700,
            ),
            label: 'Dashboard',
            selectedIcon: const Icon(
              CupertinoIcons.home,
            ),
          ),
          NavigationDestination(
            icon: Icon(
              CupertinoIcons.location,
              color: (Theme.of(context).brightness == Brightness.light)
                  ? Colors.blueGrey.shade200
                  : Colors.blueGrey.shade700,
            ),
            selectedIcon: const Icon(
              CupertinoIcons.location_fill,
            ),
            label: 'Search',
          ),
        ],
      ),
    );
  }
}

class WidgetsScreen extends StatefulWidget {
  const WidgetsScreen({
    super.key,
    required int counter,
  }) : _counter = counter;

  final int _counter;

  @override
  State<WidgetsScreen> createState() => _WidgetsScreenState();
}

class _WidgetsScreenState extends State<WidgetsScreen> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // keyboard dismiss globally
        FocusScopeNode currentFocus = FocusScope.of(context);
        if (!currentFocus.hasPrimaryFocus &&
            currentFocus.focusedChild != null) {
          FocusManager.instance.primaryFocus?.unfocus();
        }
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: const Text("Widgets"),
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.only(
            left: 15,
            right: 15,
            top: 20,
            bottom: 70,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text(
                'You have pushed the button this many times:',
              ),
              Text(
                '${widget._counter}',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              const SizedBox(
                height: 25,
              ),
              const InputFields(),
              const SizedBox(
                height: 25,
              ),
              const ActionsWidgets(),
            ],
          ),
        ),
      ),
    );
  }
}
