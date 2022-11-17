import 'dart:collection';
import 'package:firebase_core/firebase_core.dart';
import 'package:instagram_clone_riverpod/state/auth/backend/authenticator.dart';
import 'package:instagram_clone_riverpod/state/auth/provider/authStateProvider.dart';
import 'package:instagram_clone_riverpod/state/auth/provider/is_logged_in_provider.dart';
import 'firebase_options.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'dart:developer' as devtools show log;

extension Log on Object {
  void log() => devtools.log(toString());
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        brightness: Brightness.dark,
      ),
      debugShowCheckedModeBanner: false,
      darkTheme: ThemeData(
          brightness: Brightness.dark,
          primarySwatch: Colors.blueGrey,
          indicatorColor: Colors.blueGrey),
      themeMode: ThemeMode.dark,
      home: Consumer(
        builder: (context, ref, child) {
          final isLoggedIn = ref.watch(isLoggedInProvider);
          if (isLoggedIn) {
            return const MainView();
          } else {
            return const LogInView();
          }
        },
      ),
    );
  }
}

//for when you are log in
class MainView extends ConsumerWidget {
  const MainView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('instagram'),
        ),
        body: Container(
            child: TextButton(
                onPressed: () async {
                  await ref.read(authStateProvider.notifier).logOut();
                },
                child: const Text('LogOut'))));
  }
}

//when you are not logged in
class LogInView extends StatelessWidget {
  const LogInView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login View'),
      ),
      body: Consumer(
        builder: (BuildContext context, WidgetRef ref, Widget? child) {
          return Column(
            children: [
              TextButton(
                  onPressed: () async {
                    await ref
                        .read(authStateProvider.notifier)
                        .loginWithGoogle();
                    //final result = await Authenticator().loginWithGoogle();
                    //  result.log();
                  },
                  child: const Text('Sign in WIth Google')),
              TextButton(
                  onPressed: () async {
                    ref.read(authStateProvider.notifier).loginWithFacebook();
                    // final result = await Authenticator().loginWithFacebook();
                    // result.log();
                  },
                  child: const Text('Sign in WIth Facebook'))
            ],
          );
        },
      ),
    );
  }
}
