import 'package:flutter/material.dart';

class LinkedListDisplayWidget extends StatefulWidget {
  const LinkedListDisplayWidget({super.key});
  @override
  State<LinkedListDisplayWidget> createState() =>
      _LinkedListDisplayWidgetState();
}

class _LinkedListDisplayWidgetState extends State<LinkedListDisplayWidget> {
  TextEditingController linkedListController1 = TextEditingController();
  TextEditingController linkedListController2 = TextEditingController();
  TextEditingController linkedListController3 = TextEditingController();
  List<int> linkedListData = [];

  @override
  void dispose() {
    linkedListController1.dispose();
    linkedListController2.dispose();
    linkedListController3.dispose();
    linkedListData.clear();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    List<int> sortedList = List<int>.from(linkedListData);
    sortedList.sort();
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      // child: Column(
      //   children: [
      //     const SizedBox(
      //       height: 50,
      //     ),
      //     Padding(
      //       padding: const EdgeInsets.all(8.0),
      //       child: TextField(
      //         controller: linkedListController1,
      //         keyboardType: TextInputType.number,
      //         onSubmitted: (value) {
      //           setState(() {
      //             linkedListData.add(int.parse(value));
      //             linkedListController1.clear();
      //           });
      //         },
      //         decoration: const InputDecoration(
      //           labelText: 'Add into LinkedList',
      //           border: OutlineInputBorder(),
      //         ),
      //       ),
      //     ),
      //     Padding(
      //       padding: const EdgeInsets.all(8.0),
      //       child: TextField(
      //         controller: linkedListController2,
      //         keyboardType: TextInputType.number,
      //         onSubmitted: (value) {
      //           setState(() {
      //             linkedListData.remove(int.parse(value));
      //             linkedListController2.clear();
      //           });
      //         },
      //         decoration: const InputDecoration(
      //           labelText: 'Remove from LinkedList',
      //           border: OutlineInputBorder(),
      //         ),
      //       ),
      //     ),
      //     Padding(
      //       padding: const EdgeInsets.all(8.0),
      //       child: TextField(
      //         controller: linkedListController3,
      //         keyboardType: TextInputType.number,
      //         onSubmitted: (value) {
      //           setState(() {
      //             linkedListData.removeAt(int.parse(value));
      //             linkedListController3.clear();
      //           });
      //         },
      //         decoration: const InputDecoration(
      //           labelText: 'Remove via index',
      //           border: OutlineInputBorder(),
      //         ),
      //       ),
      //     ),
      //     const SizedBox(
      //       height: 30,
      //     ),
      //     Container(
      //       alignment: Alignment.topLeft,
      //       child: const Text(
      //         "Displaying Linked List here",
      //         style: TextStyle(
      //           fontSize: 15,
      //           fontWeight: FontWeight.bold,
      //         ),
      //       ),
      //     ),
      //     Container(
      //       color: Colors.grey.withOpacity(0.2),
      //       height: 45,
      //       child: ListView.separated(
      //         scrollDirection: Axis.horizontal,
      //         itemCount: linkedListData.length,
      //         itemBuilder: (context, index) {
      //           return Padding(
      //             padding: const EdgeInsets.all(4),
      //             child: Row(
      //               children: [
      //                 Container(
      //                   decoration: BoxDecoration(
      //                     color: (index & 1 == 0) ? Colors.amber : Colors.grey,
      //                     border: Border.all(
      //                       color: Colors.black,
      //                       width: 1,
      //                     ),
      //                   ),
      //                   width: 40,
      //                   child: Center(
      //                     child: Text(
      //                       linkedListData[index].toString(),
      //                       style: const TextStyle(
      //                         fontSize: 18,
      //                         fontWeight: FontWeight.bold,
      //                       ),
      //                     ),
      //                   ),
      //                 ),
      //                 Container(
      //                   decoration: BoxDecoration(
      //                     color: (index & 1 == 0) ? Colors.amber : Colors.grey,
      //                     border: Border.all(
      //                       color: Colors.black,
      //                       width: 1,
      //                     ),
      //                   ),
      //                   width: 40,
      //                 ),
      //               ],
      //             ),
      //           );
      //         },
      //         separatorBuilder: (BuildContext context, int index) {
      //           return Container(
      //             alignment: Alignment.center,
      //             width: 30,
      //             child: const Text('-->'),
      //           );
      //         },
      //       ),
      //     ),
      //     const SizedBox(
      //       height: 50,
      //     ),
      //     const SizedBox(
      //       height: 50,
      //     ),
      //     Container(
      //       padding: const EdgeInsets.all(8.0),
      //       child: Text(
      //         'LinkedList Length: ${linkedListData.length}',
      //         style: const TextStyle(
      //           fontWeight: FontWeight.bold,
      //           fontSize: 16,
      //         ),
      //       ),
      //     ),
      //     SizedBox(
      //       height: MediaQuery.of(context).size.height * 0.3,
      //     )
      //   ],
      // ),
    );
  }
}
