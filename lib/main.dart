import 'package:flutter/material.dart';
import 'apiservices.dart';

void main() {
  runApp(const CatFactApp());
}

class CatFactApp extends StatefulWidget {
  const CatFactApp({super.key});
  @override
  State<CatFactApp> createState() => _CatFactAppState();
}

class _CatFactAppState extends State<CatFactApp> {
  String _fact = "Press the button to get a cat fact!";

  Future<void> _fetchCatFact() async {
    try {
      final catfact = await fetchCatFact();
      setState(() {
        _fact = catfact?.fact ?? "No fact found.";
      });
    } catch (e) {
      setState(() {
        _fact = "Exception: $e";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Random Cat Fact"),
          backgroundColor: Colors.deepPurple,
          titleTextStyle: const TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.purple[50],
        body: Center(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: FloatingActionButton(
                  onPressed: _fetchCatFact,
                  child: const Icon(Icons.pets),
                ),
              ),
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(_fact, style: const TextStyle(fontSize: 18)), //แสดงข้อมูล fact
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
