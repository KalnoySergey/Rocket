import 'package:flutter/material.dart';
import 'package:rocket/core/widgets/color_circle.dart';

import '../domain/object_model.dart';

class ObjectItem extends StatefulWidget {
  final ObjectModel object;
  final int index;

  const ObjectItem({super.key, required this.object, required this.index});

  @override
  State<ObjectItem> createState() => _ObjectItemState();
}

class _ObjectItemState extends State<ObjectItem> {
  bool expanded = false;

  @override
  Widget build(BuildContext context) {
    final data = widget.object.data ?? {};

    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16.0, vertical: 5.0),
      child: Card(
        child: ExpansionTile(
          title: Text('${widget.index + 1}. ${widget.object.name}'),
          onExpansionChanged: (val) => setState(() => expanded = val),
          children: [
            if (data.isEmpty)
              const Padding(padding: EdgeInsets.all(8.0), child: Text('No data'))
            else
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children:
                      data.entries.map((e) {
                        return Row(
                          children: [
                            const Text('• ', style: TextStyle(fontSize: 18)),
                            Expanded(child: Text('${e.key}: ${e.value}')),
                            if (e.key.toLowerCase().trim().contains('color'))
                              ColorCircle(colorName: e.value.toString()),
                          ],
                        );
                      }).toList(),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
