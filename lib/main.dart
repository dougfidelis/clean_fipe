import 'package:clean_fipe/presentation/ui/splash/splash_page.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

void main() {
  runApp(ProviderScope(child: MyApp()));
}

var theme = lightTheme;

final themeMode = StateProvider.autoDispose((ref) => theme);

var darkTheme = ThemeData(
  primarySwatch: Colors.red,
  brightness: Brightness.dark,
  visualDensity: VisualDensity.adaptivePlatformDensity,
);

var lightTheme = ThemeData(
  primarySwatch: Colors.green,
  brightness: Brightness.light,
  visualDensity: VisualDensity.adaptivePlatformDensity,
);

class MyApp extends HookConsumerWidget {
  MyApp({Key? key}) : super(key: key);

  changeTheme() {
    var brightness = WidgetsBinding.instance.window.platformBrightness;
    brightness == Brightness.dark ? theme = darkTheme : theme = lightTheme;
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tmePro = ref.watch(themeMode.state);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const SplashPage(),
      theme: ref.read(themeMode),
    );
  }
}
