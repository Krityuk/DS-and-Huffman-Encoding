import 'package:flutter/material.dart';

import '../models/huffman_model.dart';
import '../presentation/huffman_stats.dart';
import '../presentation/huffman_tree_screen.dart';

class TreeDisplayWidget extends StatefulWidget {
  const TreeDisplayWidget({super.key});

  @override
  State<TreeDisplayWidget> createState() => _TreeDisplayWidgetState();
}

class _TreeDisplayWidgetState extends State<TreeDisplayWidget> {
  final _formKey = GlobalKey<FormState>();
  final formController = TextEditingController();
  Huffman? huffman;

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    formController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(maxWidth: 1000),
      // child: Column(
      //   crossAxisAlignment: CrossAxisAlignment.center,
      //   children: [
      //     const Padding(
      //       padding: EdgeInsets.symmetric(vertical: 20.0),
      //       child: Text(
      //         'Huffman code',
      //         style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
      //       ),
      //     ),
      //     Row(
      //       children: [
      //         Flexible(
      //           child: Padding(
      //             padding: const EdgeInsets.all(8.0),
      //             child: Form(
      //               key: _formKey,
      //               child: TextFormField(
      //                 autofocus: true,
      //                 controller: formController,
      //                 validator: (value) {
      //                   if (value == null || value.isEmpty) {
      //                     return 'Please enter message to encode';
      //                   }
      //                   return null;
      //                 },
      //                 decoration: const InputDecoration(
      //                   border: OutlineInputBorder(),
      //                   hintText: 'Enter message to encode',
      //                 ),
      //                 maxLines: null,
      //               ),
      //             ),
      //           ),
      //         ),
      //         Padding(
      //           padding: const EdgeInsets.fromLTRB(0, 8, 8, 8),
      //           child: IconButton(
      //             splashRadius: 20,
      //             onPressed: () {
      //               if (_formKey.currentState!.validate()) {
      //                 setState(() {
      //                   huffman = Huffman(formController.text);
      //                   debugPrint('${huffman!.encoded}     😎');
      //                 });
      //               }
      //             },
      //             icon: const Icon(Icons.arrow_forward),
      //           ),
      //         ),
      //       ],
      //     ),
      //     if (huffman != null)
      //       HuffmanStats(
      //         huffman: huffman!,
      //         pushGraph: () => {
      //           Navigator.push(
      //             context,
      //             MaterialPageRoute(
      //               builder: (context) => HuffmanTreeScreen(
      //                 huffmanHeight: huffman!.height,
      //                 root: huffman!.root,
      //               ),
      //             ),
      //           ),
      //         },
      //       ),
      //   ],
      // ),
    );
  }
}
