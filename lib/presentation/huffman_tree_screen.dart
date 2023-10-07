import 'dart:math';

import 'package:flutter/material.dart';

import '../models/huffman_model.dart';

class HuffmanTreeScreen extends StatefulWidget {
  const HuffmanTreeScreen(
      {Key? key, required this.root, required this.huffmanHeight})
      : super(key: key);

  final HuffmanNode root;
  final int huffmanHeight;

  @override
  State<HuffmanTreeScreen> createState() => _HuffmanTreeScreenState();
}

class _HuffmanTreeScreenState extends State<HuffmanTreeScreen> {
  final ScrollController scrollController = ScrollController();

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final double huffmanWidth = pow(2, widget.huffmanHeight - 1) - 1;
    final double offsetW = size.width / huffmanWidth;

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.arrow_back),
        onPressed: () => Navigator.pop(context),
      ),
      body: Center(
        child: Scrollbar(
          scrollbarOrientation: ScrollbarOrientation.bottom,
          controller: scrollController,
          child: SingleChildScrollView(
            controller: scrollController,
            scrollDirection: Axis.horizontal,
            child: CustomPaint(
              painter: HuffmanTreePainter(widget.huffmanHeight, widget.root),
              size: offsetW > 45
                  ? Size(size.width * 0.9, size.height * 0.9)
                  : Size(45 * huffmanWidth, size.height * 0.9),
            ),
          ),
        ),
      ),
    );
  }
}

class HuffmanTreePainter extends CustomPainter {
  final HuffmanNode root;
  final int huffmanHeight;
  final Paint paintP = Paint()
    ..color = Colors.black
    ..strokeWidth = 1
    ..style = PaintingStyle.stroke
    ..strokeCap = StrokeCap.round;
  final TextStyle style = const TextStyle(
    color: Colors.black,
    fontSize: 12,
  );

  HuffmanTreePainter(this.huffmanHeight, this.root);

  @override
  void paint(Canvas canvas, Size size) {
    double offsetVert = size.height / huffmanHeight;
    _paintNode(
        root, size.width / 2.0, 20, size.width / 4.0, offsetVert, canvas);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }

  ///Paints node of Huffman code tree diagram
  void _paintNode(
    HuffmanNode node,
    double width,
    double heigth,
    double offsetH,
    double offsetV,
    Canvas canvas,
  ) {
    double radius = 15;

    //paint node with children
    if (node.character == '-') {
      canvas.drawCircle(Offset(width, heigth), radius, paintP);
      _paintText(canvas, node.frequency.toString(), width, heigth);

      //paint left child
      if (node.left != null) {
        double newWidth = width - offsetH;
        double newHeigth = heigth + offsetV;

        canvas.drawLine(Offset(width, heigth + radius),
            Offset(newWidth, newHeigth - radius), paintP);
        //paint edge label
        _paintText(canvas, '0', width - radius, heigth + radius);
        _paintNode(
            node.left!, newWidth, newHeigth, offsetH / 2.0, offsetV, canvas);
      }
      //paint right child
      if (node.right != null) {
        double newWidth = width + offsetH;
        double newHeigth = heigth + offsetV;

        canvas.drawLine(Offset(width, heigth + radius),
            Offset(newWidth, newHeigth - radius), paintP);
        //paint edge label
        _paintText(canvas, '1', width + radius, heigth + radius);
        _paintNode(
            node.right!, newWidth, newHeigth, offsetH / 2.0, offsetV, canvas);
      }
    }
    //paint leaf
    else {
      canvas.drawRect(
          Rect.fromCenter(
              center: Offset(width, heigth),
              width: 2.5 * radius,
              height: 2 * radius),
          paintP);
      _paintText(canvas, '\'${node.character}\': ${node.frequency.toString()}',
          width, heigth);
    }
  }

  ///Helper function to paint text on diagram
  void _paintText(Canvas canvas, String text, double width, double heigth) {
    final TextPainter textPainter = TextPainter(
        text: TextSpan(text: text, style: style),
        textAlign: TextAlign.center,
        textDirection: TextDirection.ltr)
      ..layout();
    textPainter.paint(
        canvas,
        Offset(width - textPainter.width / 2.0,
            heigth - textPainter.height / 2.0));
  }
}
