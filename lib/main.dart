import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: MapScreen(),
    );
  }
}

class MapScreen extends StatefulWidget {
  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  double _scale = 1.0;
  TransformationController t_contr = TransformationController();
  final pinImage = Image.asset("assets/pin.png");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Kampus SGGW"),
        ),
        body: Center(
          child: InteractiveViewer(
            constrained: false,
            minScale: .5,
            maxScale: 2,
            child: Stack(
              children: [
                Container(
                  alignment: Alignment.center,
                  child: Image(
                    image: AssetImage("assets/sggw_map.png"),
                  ),
                ),
                Positioned.fill(
                  child: LayoutBuilder(
                    builder: (_, constraints) => Align(
                      alignment: Alignment(0.21, -0.33-(0.01*_scale)),
                      child: SizedBox(
                        width: 50 / _scale,
                        child: Align(
                          heightFactor: 1,
                          widthFactor: 1,
                          alignment: Alignment.bottomCenter,
                          child: pinImage,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            onInteractionUpdate: (ScaleUpdateDetails details) {
              setState(() {
                _scale = t_contr.value.getMaxScaleOnAxis();
              });
            },
            transformationController: t_contr
          ),
        )
    );
  }
}