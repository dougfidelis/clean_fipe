import 'package:clean_fipe/presentation/ui/splash/splash_page.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends HookConsumerWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    //final tmePro = ref.watch(themeMode.state);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const SplashPage(),
      
      theme: ThemeData(
        primarySwatch: Colors.grey,

      ),
    
    );
  }   
}
