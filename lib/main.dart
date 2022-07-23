import 'package:flutter/material.dart';
import 'package:flutter_riverpod_hook/counter/counter.screen.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final counterProvider = StateProvider((ref) => 0, name: 'counter');
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
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
        appBar:
            AppBar(title: const Text('Bài tập counter sử dụng riverpop hook')),
        body: const Center(
          child: CounterScreen(),
        ),
      ),
    );
  }
}
