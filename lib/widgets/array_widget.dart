import 'package:flutter/material.dart';

class ArrayDisplayWidget extends StatefulWidget {
  const ArrayDisplayWidget({super.key});
  @override
  State<ArrayDisplayWidget> createState() => _ArrayDisplayWidgetState();
}

class _ArrayDisplayWidgetState extends State<ArrayDisplayWidget> {
  TextEditingController arrayController = TextEditingController();
  List<int> arrayData = [];

  @override
  void dispose() {
    arrayController.dispose();
    arrayData.clear();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    List<int> sortedArray = List<int>.from(arrayData);
    sortedArray.sort();
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
              controller: arrayController,
              keyboardType: TextInputType.number,
              onSubmitted: (value) {
                setState(() {
                  arrayData.add(int.parse(value));
                  arrayController.clear();
                });
              },
              decoration: const InputDecoration(
                labelText: 'Enter Array Elements',
                border: OutlineInputBorder(),
              ),
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          Container(
              alignment: Alignment.topLeft,
              child: const Text(
                "Displaying Array here",
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
              )),
          Container(
            color: Colors.grey,
            height: 80,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: arrayData.length,
              itemBuilder: (context, index) {
                return Container(
                  decoration: BoxDecoration(
                    color: (index & 1 == 0) ? Colors.amber : Colors.grey,
                    border: Border.all(
                      color: Colors.black,
                      width: 1,
                    ),
                  ),
                  width: 80,
                  margin: const EdgeInsets.all(4),
                  child: Center(
                    child: Text(
                      arrayData[index].toString(),
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
          Container(
            alignment: Alignment.centerLeft,
            child: const Text(
              'Sorted Array',
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Container(
            color: Colors.grey,
            height: 80,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: sortedArray.length,
              itemBuilder: (context, index) {
                return Container(
                  decoration: BoxDecoration(
                    color: (index & 1 == 0) ? Colors.amber : Colors.grey,
                    border: Border.all(
                      color: Colors.black,
                      width: 1,
                    ),
                  ),
                  margin: const EdgeInsets.all(4),
                  width: 80,
                  child: Center(
                    child: Text(
                      sortedArray[index].toString(),
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
          Container(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'Array Length: ${arrayData.length}',
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
