// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';

class StackDisplayWidget extends StatefulWidget {
  const StackDisplayWidget({super.key});
  @override
  State<StackDisplayWidget> createState() => _StackDisplayWidgetState();
}

class _StackDisplayWidgetState extends State<StackDisplayWidget> {
  TextEditingController StackController1 = TextEditingController();
  TextEditingController StackController2 = TextEditingController();
  List<int> StackData = [];

  @override
  void dispose() {
    StackController1.dispose();
    StackController2.dispose();
    StackData.clear();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          const SizedBox(
            height: 50,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: StackController1,
              keyboardType: TextInputType.number,
              onSubmitted: (value) {
                setState(() {
                  StackData.add(int.parse(value));
                  StackController1.clear();
                });
              },
              decoration: const InputDecoration(
                labelText: 'Push into Stack',
                border: OutlineInputBorder(),
              ),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              setState(() {
                if (StackData.isNotEmpty) {
                  StackData.removeLast();
                }
              });
            },
            child: const Text("Pop from Stack"),
          ),
          const SizedBox(
            height: 30,
          ),
          Container(
            alignment: Alignment.topLeft,
            child: const Text(
              "Displaying Stack here",
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'Top: ${StackData.length - 1}',
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
          ),
          const SizedBox(
            height: 40,
          ),
          Container(
            color: Colors.grey.withOpacity(0.2),
            height: 400,
            width: 150,
            child: ListView.builder(
              reverse: true,
              itemCount: StackData.length,
              itemBuilder: (context, index) {
                return Container(
                  width: 150,
                  decoration: BoxDecoration(
                    color: (index & 1 == 0) ? Colors.amber : Colors.grey,
                    border: Border.all(
                      color: Colors.black,
                      width: 1,
                    ),
                  ),
                  margin: const EdgeInsets.all(4),
                  child: Center(
                    child: Text(
                      StackData[index].toString(),
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          const SizedBox(
            height: 50,
          ),
          const SizedBox(
            height: 50,
          ),
          Container(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'Stack Length: ${StackData.length}',
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.3,
          )
        ],
      ),
    );
  }
}
