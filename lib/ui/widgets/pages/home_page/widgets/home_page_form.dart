import 'package:chat/ui/form_key_extension.dart';
import 'package:chat/ui/validators.dart';
import 'package:chat/ui/widgets/pages/home_page/home_page_notifier.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final _formKey = GlobalKey<FormState>();

class HomePageForm extends HookConsumerWidget {
  const HomePageForm({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final obscureText = ref.watch(homePageNotifierProvider.select((s) {
      return s.obscureText;
    }));

    final emailFocusNode = useFocusNode();
    final passwordFocusNode = useFocusNode();

    return Form(
      key: _formKey,
      child: GestureDetector(
        onTap: () {
          emailFocusNode.unfocus();
          passwordFocusNode.unfocus();
        },
        behavior: HitTestBehavior.opaque,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            spacing: 16,
            children: [
              TextFormField(
                focusNode: emailFocusNode,
                decoration: InputDecoration(labelText: 'Email'),
                keyboardType: TextInputType.emailAddress,
                textInputAction: TextInputAction.next,
                autofocus: true,
                onSaved: (email) {
                  ref.read(homePageNotifierProvider.notifier).setEmail(email!);
                },
                validator: (email) {
                  return emailValidator(email);
                },
              ),
              TextFormField(
                focusNode: passwordFocusNode,
                decoration: InputDecoration(
                  labelText: 'Password',
                  suffixIcon: IconButton(
                    onPressed: () {
                      ref
                          .read(homePageNotifierProvider.notifier)
                          .toggleObscureText();
                    },
                    icon: Icon(
                      obscureText ? Icons.visibility_off : Icons.visibility,
                    ),
                  ),
                ),
                keyboardType: TextInputType.visiblePassword,
                obscureText: obscureText,
                onSaved: (password) {
                  ref
                      .read(homePageNotifierProvider.notifier)
                      .setPassword(password!);
                },
                validator: (password) {
                  return passwordValidator(password);
                },
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  OutlinedButton(
                    onPressed: () async {
                      final isSuccess = _formKey.validateAndSave();
                      if (!isSuccess) {
                        return;
                      }

                      await ref
                          .read(homePageNotifierProvider.notifier)
                          .signIn();
                    },
                    child: Text('Sign in'),
                  ),
                  FilledButton(
                    onPressed: () async {
                      final isSuccess = _formKey.validateAndSave();
                      if (!isSuccess) {
                        return;
                      }

                      await ref
                          .read(homePageNotifierProvider.notifier)
                          .signUp();
                    },
                    child: Text('Sign up'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
