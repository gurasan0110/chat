import 'package:chat/ui/widgets/pages/home_page/home_page_notifier.dart';
import 'package:chat/ui/widgets/pages/home_page/widgets/home_page_form.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class HomePaegBody extends ConsumerWidget {
  const HomePaegBody({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(homePageNotifierProvider.select((s) => s.user));

    if (user == null) {
      return HomePageForm();
    }

    return Center(
      child: Column(children: [
        Text(user.toString()),
        TextButton(
          onPressed: () async {
            await ref.read(homePageNotifierProvider.notifier).signOut();
          },
          child: Text('Sign out'),
        ),
      ]),
    );
  }
}
