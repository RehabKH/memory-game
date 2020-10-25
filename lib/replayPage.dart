import 'package:flutter/material.dart';

import 'data/data.dart';
import 'main.dart';

class Replay extends StatefulWidget {
  @override
  _ReplayState createState() => _ReplayState();
}

class _ReplayState extends State<Replay> {
  @override
  Widget build(BuildContext context) {
    return 
    Container(
                    padding: EdgeInsets.symmetric(vertical: 12,horizontal: 24),
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(24)
                    ),
                    child: MaterialButton(
                      onPressed: (){
                        setState(() {
                          points =0;
                        });
                        Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=> HomePage()));
                      },
                                        child: Text("replay",style: TextStyle(
                        fontSize: 17.0,
                      fontWeight: FontWeight.w500,
                      color:Colors.white
                      ),),
                    ),
                  );
  }
}