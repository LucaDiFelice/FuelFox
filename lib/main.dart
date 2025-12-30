import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => MyAppState(),
      child: MaterialApp(
        title: 'Namer App',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepOrange),
        ),
        home: MyHomePage(),
      ),
    );
  }
}

class MyAppState extends ChangeNotifier {
  var current = WordPair.random();
}

class MyHomePage extends StatefulWidget {

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool isVisibleFP = true;
  bool isVisibleSP = false;

  void clickButton() {
    print("button clicked");
    setState(() => isVisibleFP = !isVisibleFP);
  }

  void clickSecondButton() {
    print("second button clicked");
    setState(() => isVisibleFP = !isVisibleFP);

  }

  @override
  Widget build(BuildContext context) {
    var appState = context.watch<MyAppState>();


    return DefaultTabController(
      length: 3, 
      child: Scaffold(
        appBar: AppBar(
          bottom: const TabBar (
            tabs: [
              Tab(
                icon: Icon(Icons.help),
              ),
              Tab(
                icon: Icon(Icons.local_gas_station),
              ),
              Tab(
                icon: Icon(Icons.car_repair),
              ),
            ],
          ),
          title: const Text("Fuel Fox"),
        ),
        body: TabBarView(
          children: [
            Scaffold(
              body: Center(
                child: Column(
                  children: [
                    
                  ],
                ),
              ),
            ),
            Scaffold(
            ),
            Scaffold(
            ),
          ],
        ),
      ),
    );
    /*
    return Scaffold(
      appBar: AppBar(title: Text("Fuel Fox"), backgroundColor: Colors.amber),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Visibility(
              visible: isVisibleFP,
              child: ElevatedButton(onPressed: clickButton, child: Text("gas car")),
            ),
            SizedBox(height: 12),
            Visibility(
              visible: isVisibleFP,
              child: ElevatedButton(onPressed: clickSecondButton, child: Text("electric car"))
            ),
          ],
        ),
      ),
    );
    */
  }
}
