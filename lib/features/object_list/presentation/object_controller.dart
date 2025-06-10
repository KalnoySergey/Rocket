import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../data/object_repository.dart';
import '../domain/object_model.dart';

final objectListProvider = FutureProvider<List<ObjectModel>>((ref) async {
  final repo = ObjectRepository();
  return repo.fetchObjects();
});
