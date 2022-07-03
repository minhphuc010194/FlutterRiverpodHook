import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'counter.provider.dart';

class CounterScreen extends HookConsumerWidget {
  const CounterScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    AsyncValue<int> counterPref = ref.watch(getCountProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('screen counter'),
      ),
      body: Center(
        child: counterPref.when(
          loading: () => const CircularProgressIndicator(),
          error: (err, stack) => Text('Error: $err'),
          data: (value) {
            return TextButton(
              onPressed: () {
                ref.read(setCountProvider(++value));
              },
              child: Text("count: $value"),
            );
          },
        ),
      ),
    );
  }
}
