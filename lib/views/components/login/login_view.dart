import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:instagram_clone_riverpod/state/auth/provider/authStateProvider.dart';
import 'package:instagram_clone_riverpod/views/components/constants/app_colors.dart';
import 'package:instagram_clone_riverpod/views/components/constants/strings.dart';
import 'package:instagram_clone_riverpod/views/components/login/divider_with_margines.dart';
import 'package:instagram_clone_riverpod/views/components/login/facebook_button.dart';
import 'package:instagram_clone_riverpod/views/components/login/google_button.dart';
import 'package:instagram_clone_riverpod/views/components/login/login_view_signp_link.dart';

class LoginView extends ConsumerWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(Strings.appName),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(
                height: 40.0,
              ),
              Text(
                Strings.welcomeToAppName,
                style: Theme.of(context).textTheme.displaySmall,
              ),
              const DividerWithMargin(),
              Text(
                Strings.logIntoYourAccount,
                style: Theme.of(context)
                    .textTheme
                    .subtitle1
                    ?.copyWith(height: 1.5),
              ),
              const SizedBox(
                height: 20,
              ),
              TextButton(
                onPressed:
                    ref.read(authStateProvider.notifier).loginWithFacebook,
                style: TextButton.styleFrom(
                    backgroundColor: AppColor.loginButtonColor,
                    foregroundColor: AppColor.loginButtoonTextColor),
                child: const FacebookButton(),
              ),
              const SizedBox(
                height: 20,
              ),
              TextButton(
                onPressed: ref.read(authStateProvider.notifier).loginWithGoogle,
                style: TextButton.styleFrom(
                    backgroundColor: AppColor.loginButtonColor,
                    foregroundColor: AppColor.loginButtoonTextColor),
                child: const GoogleButton(),
              ),
              const DividerWithMargin(),
              const LoginViewSignUpLink(),
            ],
          ),
        ),
      ),
    );
  }
}
