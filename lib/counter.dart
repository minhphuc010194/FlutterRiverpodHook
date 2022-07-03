import 'package:flutter/material.dart';
import 'package:flutter_riverpod_hook/main.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Counter extends HookConsumerWidget {
  const Counter({Key? key}) : super(key: key);

  // const Counter({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // final count = ref.watch(countProvider);
    // final counterPref = ref.watch(getCountPrefProvider);
    AsyncValue<int> counterPref = ref.watch(getCountPrefProvider);
    return counterPref.when(
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
    );
  }

  void handleSave(count) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt('counter', count);
  }

  // getCounter() async {
  //   final prefs = await SharedPreferences.getInstance();
  //   return prefs.getInt('counter');
  // }
}
