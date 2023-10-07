import 'dart:math';

import 'package:collection/collection.dart';

class Huffman {
  final Map<String, String> _dict = <String, String>{};
  HuffmanNode? _root;
  String _encoded = '';
  double _entropy = 0.0;
  double _avgLength = 0.0;
  int height = 1;

  //getters
  HuffmanNode get root => _root ?? HuffmanNode('-', 0, null, null);
  Map<String, String> get code => _dict;
  String get encoded => _encoded;
  double get entropy => _entropy;
  double get avgLength => _avgLength;

  Huffman(String phrase) {
    Map<String, int> freq = _count(phrase);

    //create queue that sorts characters ascending by their frequencies
    PriorityQueue<HuffmanNode> queue =
        PriorityQueue((a, b) => a.frequency.compareTo(b.frequency));
    freq.forEach((key, value) {
      queue.add(HuffmanNode(key, value, null, null));
    });

    //edge case for one character
    if (queue.length == 1) {
      _root = queue.removeFirst();
      var c = {_root!.character: '1'};
      _dict.addAll(c);
      height = 1;
    } else {
      //build the tree
      while (queue.length > 1) {
        HuffmanNode x = queue.removeFirst();
        HuffmanNode y = queue.removeFirst();

        HuffmanNode f = HuffmanNode('-', x.frequency + y.frequency, x, y);

        _root = f;

        queue.add(f);
      }
      height = _makeDict(_root!, "", 1);
    }

    //encode original phrase using codes from dictionary
    phrase.split('').forEach((c) {
      _encoded += _dict[c] ?? '';
    });

    //calculate statistics
    int freqSum = _root!.frequency;
    freq.forEach((key, value) {
      double p = value / freqSum;
      int dictLength = _dict[key]?.length ?? 0;
      _entropy += p * log(1.0 / p) / ln2;
      _avgLength += p * dictLength;
    });
  }

  ///helper function for counting character frequencies in phrase
  Map<String, int> _count(String phrase) {
    Map<String, int> result = <String, int>{};
    phrase.split('').forEach((c) {
      result.update(c, (value) => value + 1, ifAbsent: () => 1);
    });
    return result;
  }

  ///helper function for creating code dictionary for each character
  int _makeDict(HuffmanNode node, String s, int height) {
    if (node.left == null && node.right == null) {
      var c = {node.character: s};
      _dict.addAll(c);
      return height;
    } else {
      int leftHeight = _makeDict(node.left!, '${s}0', height);
      int rightHeight = _makeDict(node.right!, '${s}1', height);
      return max(leftHeight, rightHeight) + 1;
    }
  }
}

class HuffmanNode {
  final String character;
  final int frequency;

  HuffmanNode? left;
  HuffmanNode? right;

  HuffmanNode(this.character, this.frequency, this.left, this.right);

  @override
  String toString() {
    return '$character $frequency';
  }
}
