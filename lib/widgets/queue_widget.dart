// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';

class QueueDisplayWidget extends StatefulWidget {
  const QueueDisplayWidget({super.key});
  @override
  State<QueueDisplayWidget> createState() => _QueueDisplayWidgetState();
}

class _QueueDisplayWidgetState extends State<QueueDisplayWidget> {
  TextEditingController QueueController1 = TextEditingController();
  TextEditingController QueueController2 = TextEditingController();
  List<int> QueueData = [];

  @override
  void dispose() {
    QueueController1.dispose();
    QueueController2.dispose();
    QueueData.clear();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    List<int> reverseList = List<int>.from(QueueData.reversed);

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
              controller: QueueController1,
              keyboardType: TextInputType.number,
              onSubmitted: (value) {
                setState(() {
                  QueueData.add(int.parse(value));
                  QueueController1.clear();
                });
              },
              decoration: const InputDecoration(
                labelText: 'Enqueue into Queue',
                border: OutlineInputBorder(),
              ),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              setState(() {
                if (QueueData.isNotEmpty) {
                  QueueData.removeAt(0);
                }
              });
            },
            child: const Text("Dequeue from Queue"),
          ),
          const SizedBox(
            height: 30,
          ),
          Container(
            alignment: Alignment.topLeft,
            child: const Text(
              "Displaying Queue here",
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(
            height: 40,
          ),
          Container(
            color: Colors.grey.withOpacity(0.2),
            height: 50,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: QueueData.length,
              itemBuilder: (context, index) {
                return Container(
                  width: 60,
                  margin: const EdgeInsets.symmetric(vertical: 5),
                  decoration: BoxDecoration(
                    color: (index & 1 == 0) ? Colors.amber : Colors.grey,
                    border: Border.all(
                      color: Colors.black,
                      width: 1,
                    ),
                  ),
                  child: Center(
                    child: Text(
                      reverseList[index].toString(),
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
              'List Length: ${QueueData.length}',
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
