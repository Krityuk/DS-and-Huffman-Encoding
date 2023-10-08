import 'package:flutter/material.dart';

import 'widgets/array_widget.dart';
import 'widgets/linklist_widget.dart';
import 'widgets/queue_widget.dart';
import 'widgets/stack_widget.dart';
import 'widgets/tree_widget.dart';

class DisplayPage extends StatefulWidget {
  final String? dsa;

  const DisplayPage({super.key, required this.dsa});

  @override
  State<DisplayPage> createState() => _DisplayPageState();
}

class _DisplayPageState extends State<DisplayPage> {
  @override
  Widget build(BuildContext context) {
    debugPrint('Starting displayPage here       😎😎😎😎😎😎😎😎');
    Widget? displayWidget;

    // Based on the selected data type, determine which widget to display
    if (widget.dsa == 'Array') {
      displayWidget = const ArrayDisplayWidget();
    } else if (widget.dsa == 'LinkedList') {
      displayWidget = const LinkedListDisplayWidget();
    } else if (widget.dsa == 'Stack') {
      displayWidget = const StackDisplayWidget();
    } else if (widget.dsa == 'Queue') {
      displayWidget = const QueueDisplayWidget();
      } else if (widget.dsa == 'Tree') {
        displayWidget = const TreeDisplayWidget();
    } else {
      // Handle the case when no data type is selected
      displayWidget = const Center(child: Text('Please select a data type'));
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('${widget.dsa} Display'),
      ),
      body: SingleChildScrollView(
        child: displayWidget,
      ),
    );
  }
}
