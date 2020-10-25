// import 'package:flare_flutter/flare_actor.dart';
// import 'package:flutter/material.dart';
// import 'package:cupertino_icons/placeholder.txt';

// class FlareDemo extends StatefulWidget {
//   @override
//   _FlareDemoState createState() => _FlareDemoState();
// }

// class _FlareDemoState extends State<FlareDemo> {

//   bool isOpen = false;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Color.fromARGB(255, 102, 10,222),
//       body: FlareActor("imgs/",animation:isOpen?"activate":"deactivate",
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:flare_flutter/flare_actor.dart';
class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return new FlareActor("assets/Filip.flr", alignment:Alignment.center, fit:BoxFit.cover, animation:"idle");
  }
}