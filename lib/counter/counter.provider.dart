import 'package:flutter_riverpod_hook/utils/shared_preferences.provider.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

final getCountProvider = FutureProvider.autoDispose<int>((ref) async {
  final prefs = ref.read(sharedPreferencesProvider);
  final value = prefs.getInt('counter') ?? 0;
  return value;
});

final setCountProvider =
    FutureProvider.autoDispose.family<void, int>((ref, count) async {
  final prefs = await SharedPreferences.getInstance();
  await prefs.setInt('counter', count);
  ref.refresh(getCountProvider);
});
