import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'providers/providers.dart';
import 'screens/screens.dart';

void main() => runApp( const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {

    return MultiProvider(
      providers: [
        ChangeNotifierProvider( create: (_) => UiProvider() ),
        ChangeNotifierProvider( create: (_) => ScanListProvider() ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'QR Reader',
        initialRoute: 'home',
        routes: {
          'home': (_) => const HomeScreen(),
          'mapa': (_) => const MapaScreen()
        },
        theme: ThemeData(
          primaryColor: Colors.teal,
          floatingActionButtonTheme: 
            const FloatingActionButtonThemeData( backgroundColor: Colors.teal, ),
          appBarTheme: 
            const AppBarTheme( backgroundColor: Colors.teal ),
          bottomNavigationBarTheme: 
            const BottomNavigationBarThemeData( selectedItemColor: Colors.teal)
        ),
      ),
    );

  }
}