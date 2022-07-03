import 'package:flutter/material.dart';
import 'package:flutter_riverpod_hook/counter/counter.dart';
import 'package:flutter_riverpod_hook/home/home.screen.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

// final countProvider = StateProvider<int>((ref) => 0);
final getCountPrefProvider = FutureProvider.autoDispose<int>((ref) async {
  final prefs = await SharedPreferences.getInstance();
  final value = prefs.getInt('counter') ?? 0;
  return value;
});

final saveCountPrefProvider =
    FutureProvider.autoDispose.family<void, int>((ref, count) async {
  final prefs = await SharedPreferences.getInstance();
  await prefs.setInt('counter', count);
  ref.refresh(getCountPrefProvider);
});

void main() {
  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends HookConsumerWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Example')),
        body: const Center(
          child: HomeScreen(),
        ),
      ),
    );
  }
}
