import 'package:dsa_project/presentation/huffman_table.dart';
import 'package:flutter/material.dart';

import '../models/huffman_model.dart';

class HuffmanStats extends StatelessWidget {
  const HuffmanStats({Key? key, required this.huffman, required this.pushGraph})
      : super(key: key);

  final Huffman huffman;
  final Function pushGraph;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Card(
          elevation: 0,
          shape: RoundedRectangleBorder(
            side: BorderSide(
              color: Theme.of(context).colorScheme.outline,
            ),
            borderRadius: const BorderRadius.all(Radius.circular(12)),
          ),
          margin: const EdgeInsets.all(9),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Text(
                      'Code: ',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Flexible(
                      child: Text(
                        huffman.encoded,
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Text(
                      'Entropy: ',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Flexible(child: Text('${huffman.entropy}')),
                  ],
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Text(
                      'Average length of code: ',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Flexible(child: Text('${huffman.avgLength}')),
                  ],
                ),
              ],
            ),
          ),
        ),
        HuffmanTable(dict: huffman.code),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: OutlinedButton(
            onPressed: () => {pushGraph()},
            child: const Text('Show diagram'),
          ),
        ),
      ],
    );
  }
}
