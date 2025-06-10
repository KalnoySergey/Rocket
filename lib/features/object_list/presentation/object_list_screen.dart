import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'object_controller.dart';
import 'object_item.dart';

class ObjectListScreen extends ConsumerWidget {
  const ObjectListScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final objects = ref.watch(objectListProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Objects list')),
      body: objects.when(
        data:
            (list) => ListView.builder(
              itemCount: list.length,
              itemBuilder: (_, index) => ObjectItem(object: list[index], index: index),
            ),
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (e, _) => Center(child: Text('Error: $e')),
      ),
    );
  }
}
