import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:task_kodevio/constants/constants.dart';
import 'package:task_kodevio/providers/list_provider.dart';
import 'package:task_kodevio/screens/home.dart';
void main() {
  runApp(ProviderScope(child: MyApp()));
}
class MyApp extends ConsumerStatefulWidget {
  const MyApp({super.key});
  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _MyAppState();
}
class _MyAppState extends ConsumerState<MyApp> {
  var themeDarkLight = colorScheme2;
  @override
  Widget build(BuildContext context) {
    bool themeButton = ref.watch(listProviderNotifierProvider).isDarkMode;
    if (!themeButton) {
      themeDarkLight = colorScheme1;
    } else {
      themeDarkLight = colorScheme2;
    }
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData().copyWith(
        useMaterial3: true,
        scaffoldBackgroundColor: themeDarkLight.background,
        appBarTheme: !themeButton
            ? AppBarTheme(
                elevation: 10,
                shadowColor: themeDarkLight.onSecondary,
              )
            : AppBarTheme(),
        colorScheme: themeDarkLight,
        textTheme: GoogleFonts.ubuntuCondensedTextTheme().copyWith(
          titleSmall: GoogleFonts.ubuntuCondensed(fontWeight: FontWeight.bold),
          titleMedium: GoogleFonts.ubuntuCondensed(fontWeight: FontWeight.bold),
          titleLarge: GoogleFonts.ubuntuCondensed(fontWeight: FontWeight.bold),
          bodyMedium: GoogleFonts.ubuntuCondensed(color: themeButton?Colors.white:Colors.black),
          bodySmall: GoogleFonts.ubuntuCondensed(color: themeButton?Colors.white:Colors.black),
          bodyLarge: GoogleFonts.ubuntuCondensed(color: themeButton?Colors.white:Colors.black),
        ),
      ),
      home: HomeScreen(),
    );
  }
}



