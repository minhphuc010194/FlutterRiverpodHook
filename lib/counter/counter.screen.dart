import 'package:flutter/material.dart';
import 'package:flutter_riverpod_hook/main.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class CounterScreen extends HookConsumerWidget {
  const CounterScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final int count = ref.watch(counterProvider);
    return Center(
      child: TextButton(
        onPressed: () {
          ref.read(counterProvider.notifier).state++;
        },
        child: Text("count: $count"),
      ),
    );
  }
}
