import 'package:flutter/material.dart';
import 'package:flutter_riverpod_hook/main.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class Counter extends HookConsumerWidget {
  const Counter({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    AsyncValue<int> counterPref = ref.watch(getCountPrefProvider);
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
              ref.read(saveCountPrefProvider(++value));
            },
            child: Text("count: $value"),
          );
        },
      )),
    );
  }
}
