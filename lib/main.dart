import 'package:dsa_project/display_page.dart';
import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(home: LandingPage());
  }
}

class LandingPage extends StatefulWidget {
  const LandingPage({super.key});

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  String? selectedDataType = "Select Your Data Type";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('DSA Project'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const Text('DSA - Simulator'),
            Center(
              child: DropdownButton<String>(
                value: selectedDataType,
                onChanged: (String? newValue) {
                  setState(() {
                    selectedDataType = newValue;
                  });
                  debugPrint('$selectedDataType is selectedDataType   😎😎');
                },
                items: <String>[
                  'Select Your Data Type',
                  'Array',
                  'LinkedList',
                  'Stack',
                  'Queue',
                  'Tree',
                ].map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            DisplayPage(dsa: selectedDataType)));
              },
              child: Text("Explore $selectedDataType"),
            ),
            const SizedBox(
              height: 200,
            )
          ],
        ),
      ),
    );
  }
}
