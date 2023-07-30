import 'package:bookie/screens/search_screen.dart';
import 'package:bookie/widgets/text_widget_home.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// The home screen of the Bookie app.
class AppHomeScreen extends StatelessWidget {
  const AppHomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Bookie"),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  CupertinoPageRoute(
                    fullscreenDialog: true,
                    builder: (context) => const SearchScreen(),
                  ),
                );
              },
              icon: const Icon(Icons.search)),
          PopupMenuButton(
            itemBuilder: (context) {
              return [
                const PopupMenuItem<int>(
                  value: 0,
                  child: Text("Rate us :)"),
                ),
              ];
            },
            onSelected: (value) {
              if (value == 0) {
                // add share button code
                print("Rate us button is tapped");
              }
            },
          )
        ],
      ),
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              TextWidget(
                text: "Search your favorite book!",
                fsize: 22,
                weight: FontWeight.w600,
              ),
              const SizedBox(height: 5),
              MaterialButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    CupertinoPageRoute(
                      fullscreenDialog: true,
                      builder: (context) => const SearchScreen(),
                    ),
                  );
                },
                minWidth: MediaQuery.of(context).size.width * 0.6,
                padding: const EdgeInsets.all(12.0),
                color: Colors.blue,
                child: const Text(
                  "Search",
                  style: TextStyle(fontSize: 18),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
