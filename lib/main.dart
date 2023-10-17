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
  List<String> dataTypes = [
    'Array',
    'LinkedList',
    'Stack',
    'Queue',
    'Tree',
  ];
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
              child: SizedBox(
                height: 320,
                child: ListView.builder(
                  itemCount: dataTypes.length + 1,
                  itemBuilder: (context, index) {
                    if (index == 0) {
                      return Center(
                        child: Text(selectedDataType!),
                      );
                    }
                    final dataType = dataTypes[index - 1];
                    return Container(
                      decoration: BoxDecoration(border: Border.all()),
                      margin: const EdgeInsets.symmetric(horizontal: 10),
                      child: ListTile(
                        leading: const Icon(Icons.data_array),
                        title: Text(dataType),
                        onTap: () {
                          setState(() {
                            selectedDataType = dataType;
                          });
                          debugPrint(
                              '$selectedDataType is selectedDataType 😎😎');
                        },
                      ),
                    );
                  },
                ),
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
