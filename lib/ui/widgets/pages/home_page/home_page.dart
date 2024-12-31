import 'package:chat/ui/widgets/pages/home_page/home_page_notifier.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(ref.watch(homePageNotifierProvider).toString()),
            TextField(
              decoration: InputDecoration(hintText: 'email'),
              onChanged: ref.read(homePageNotifierProvider.notifier).setEmail,
            ),
            TextField(
              decoration: InputDecoration(hintText: 'password'),
              onChanged:
                  ref.read(homePageNotifierProvider.notifier).setPassword,
            ),
            TextButton(
              onPressed: ref
                  .read(homePageNotifierProvider.notifier)
                  .createUserWithEmailAndPassword,
              child: Text('createUserWithEmailAndPassword'),
            ),
            TextButton(
              onPressed: ref
                  .read(homePageNotifierProvider.notifier)
                  .signInWithEmailAndPassword,
              child: Text('signInWithEmailAndPassword'),
            ),
            TextButton(
              onPressed: ref.read(homePageNotifierProvider.notifier).signOut,
              child: Text('signOut'),
            ),
          ],
        ),
      ),
    );
  }
}
