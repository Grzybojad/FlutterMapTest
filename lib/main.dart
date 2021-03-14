import 'package:flutter/material.dart';
import 'package:maps_demo/interactive_map.dart';
import 'package:maps_demo/info_card.dart';
import 'package:maps_demo/building.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Kampus SGGw',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: MainScreen(),
    );
  }
}

class MainScreen extends StatefulWidget {
  final List<Building> buildings = [
    Building(lat: 52.16010, lon: 21.04476, name: "Budynek 32", departments: []),
    Building(lat: 52.16203, lon: 21.04632, name: "Budynek 34", departments: ["WZIM", "Leśny", "Technologii Drewna"]),
    Building(lat: 52.16191, lon: 21.04293, name: "Budynek 37", departments: []),
  ];

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  showInfoCard(Building building) {
    print("pls show card of ${building.name}");
    setState(() {
      _showingInfoCard = true;
    });
  }

  bool _showingInfoCard = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Kampus SGGW"),
      ),
      body: Stack(children: [
        InteractiveMap(widget.buildings, showInfoCard),
        InfoCard(),
      ]),
    );
  }
}
