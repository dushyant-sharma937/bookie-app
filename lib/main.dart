import 'package:bookie/providers/book_provider.dart';
import 'package:bookie/providers/book_search_provider.dart';
import 'package:bookie/screens/app_home_screen.dart';
import 'package:bookie/screens/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:provider/provider.dart';

// Entry point of the application.
void main() async {
  // Ensures that the Flutter bindings are initialized.
  WidgetsFlutterBinding.ensureInitialized();

  // Loads environment variables from the .env file located in the lib directory.
  await dotenv.load(fileName: "lib/.env");

  // Runs the Bookie app.
  runApp(const Bookie());
}

// The main Bookie application class.
class Bookie extends StatelessWidget {
  const Bookie({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        // Provides the BookSearchProvider to the app as a ChangeNotifier.
        ChangeNotifierProvider(
          create: (context) => BookSearchProvider(),
        ),
        // Loads the data of a single book.
        ChangeNotifierProvider(
          create: (context) => BookProvider(),
        ),
      ],
      child: MaterialApp(
        theme: ThemeData(
          // UI
          brightness: Brightness.dark,
          colorScheme: const ColorScheme.dark(
            primary: Colors.black54,
            secondary: Colors.blueAccent,
          ),

          // font
          fontFamily: 'Georgia',
          //text style
          textTheme: const TextTheme(
            displayLarge:
                TextStyle(fontSize: 72.0, fontWeight: FontWeight.bold),
            displayMedium:
                TextStyle(fontSize: 36.0, fontStyle: FontStyle.italic),
            displaySmall: TextStyle(fontSize: 14.0, fontFamily: 'Hind'),
          ),
        ),
        debugShowCheckedModeBanner: false,
        initialRoute: '/splash',
        routes: {
          '/splash': (context) => const SplashScreen(),
          '/home': (context) =>
              const AppHomeScreen(), // Replace 'HomeScreen' with your home screen widget
        }, // The initial screen of the app.
      ),
    );
  }
}
