import 'package:flutter/material.dart';
import 'package:ominous_beeping_app/ominous_shake_detector.dart';
import 'package:provider/provider.dart';
import 'package:simple_animations/simple_animations/controlled_animation.dart';

void main() => runApp(ChangeNotifierProvider(
    builder: (context) => OminousShakeDetector(false), child: MyApp()));

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ominous Beeping App',
      theme: ThemeData(primarySwatch: Colors.deepPurple),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Container(
        color: Color(0xFF06061B),
        child: Center(
          child: Consumer<OminousShakeDetector>(
            builder: (context, shakeDetect, child) {
              print('State from provider on main is: ' +
                  shakeDetect.isShaked().toString());
              return Column(
                children: <Widget>[
                  shakeDetect.isShaked() == true
                      ? AlertCircles()
                      : Container(
                          height: MediaQuery.of(context).size.height / 2,
                          width: MediaQuery.of(context).size.width,
                          child: Center(
                              child: Text(
                            'Shake Me...',
                            style: TextStyle(color: Colors.white),
                          )),
                        ),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Text(
                      'OMINOUS BEEPING APP',
                      style: TextStyle(
                          color: Color(0xFF98EDBD),
                          fontSize:
                              5 * (MediaQuery.of(context).size.width / 28),
                          fontWeight: FontWeight.w600),
                    ),
                  )
                ],
              );
            },
          ),
        ),
      ),
    ));
  }
}

class AlertCircles extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ControlledAnimation(
      playback: Playback.LOOP,
      duration: Duration(milliseconds: 500),
      tween: Tween<double>(begin: 0, end: 2.0),
      builder: (context, animation) {
        return Container(
          height: MediaQuery.of(context).size.height / 2,
          width: MediaQuery.of(context).size.width,
          child: Stack(
            alignment: Alignment.center,
            children: <Widget>[
              Visibility(
                visible: animation > 0.3 ? true : false,
                child: Container(
                  width: (MediaQuery.of(context).size.width / 100) * 20,
                  height: (MediaQuery.of(context).size.height / 100) * 20,
                  decoration: new BoxDecoration(
                    color: Colors.red,
                    shape: BoxShape.circle,
                  ),
                ),
              ),
              Visibility(
                visible: animation > 0.5 ? true : false,
                child: Container(
                  width: (MediaQuery.of(context).size.width / 100) * 40,
                  height: (MediaQuery.of(context).size.width / 100) * 40,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100.0),
                    border: Border.all(
                      width: 20.0,
                      color: Colors.red[600],
                    ),
                  ),
                ),
              ),
              Visibility(
                visible: animation > 0.7 ? true : false,
                child: Container(
                  width: (MediaQuery.of(context).size.width / 100) * 60,
                  height: (MediaQuery.of(context).size.width / 100) * 60,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(150.0),
                    border: Border.all(
                      width: 20.0,
                      color: Colors.red[600],
                    ),
                  ),
                ),
              ),
              Visibility(
                visible: animation > 0.9 ? true : false,
                child: Container(
                  width: (MediaQuery.of(context).size.width / 100) * 80,
                  height: (MediaQuery.of(context).size.width / 100) * 80,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(150.0),
                    border: Border.all(
                      width: 20.0,
                      color: Colors.red[600],
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
