import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:triveous_assignment/views/home.dart';

import 'configs/app_themes/themes.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => ThemeProvider(),
      builder: (context, _) {
        final themeProvider = Provider.of<ThemeProvider>(context);

        return MaterialApp(
          title: 'News Daily',
          themeMode: themeProvider.themeMode,
          theme: MyThemes.lightTheme,
          darkTheme: MyThemes.darkTheme,
          debugShowCheckedModeBanner: false,
          home: Home(),
        );
      },
    ),
  );
}
