import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

const List<String> list = <String>["Regular 87", "Midgrade 89", "Premium 91+"];

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
              body: Center(
                child: Column(
                  children: [
                    const Center(child: Text("Find cheapest gas station")),
                    const Center(
                      child: DropdownButtonGasoline(),
                    ),
                  ],
                ),
              )
            ),
            Scaffold(
              body: Center(
                child: Column(
                  children: [
                    Center(
                      child: Text(
                        "AI car search",
                        style: TextStyle(
                          color: Colors.black.withValues(alpha: 1),
                          fontSize: 20,             
                        )
                      ), 
                    ),
                    Center(
                      child: SearchBar(
                        leading: const Icon(Icons.search),
                        hintText: "Car model",
                      )
                    ),
                  ],
                ),
              )
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

class DropdownButtonGasoline extends StatefulWidget {
  const DropdownButtonGasoline({super.key});

  State<DropdownButtonGasoline> createState() => _DropdownButtonGasoline();
}

class _DropdownButtonGasoline extends State<DropdownButtonGasoline> {
  String dropdownValue = list.first;

  Widget build(BuildContext context) {
    return DropdownButton(
      value: dropdownValue,
      icon: const Icon(Icons.arrow_downward),
      elevation: 16,
      style: const TextStyle(color: Colors.deepPurple),
      underline: Container(height: 2, color: Colors.deepOrange),
      onChanged: (String? value) {
        setState(() {
          dropdownValue = value!;
        });
      },
      items: list.map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(value: value, child: Text(value));
      }).toList(),
    );
  }
}
