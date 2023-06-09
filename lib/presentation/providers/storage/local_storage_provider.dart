import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:cineapp/infrastructure/datasources/isar_datasource.dart';
import 'package:cineapp/infrastructure/repositories/local_storage_repository_impl.dart';

final localStorageRepositoryProvider = Provider((ref) {
  return LocalStorageRepositoryImpl(IsarDataSource());
});
