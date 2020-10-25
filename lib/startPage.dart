import 'package:flutter/material.dart';
import 'package:memory_game/main.dart';

class StartPage extends StatefulWidget {
  @override
  _StartPageState createState() => _StartPageState();
}

class _StartPageState extends State<StartPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: 
      Container(
        decoration: BoxDecoration(
          image:DecorationImage(
            image: AssetImage(
              "assets/startPage.jpg"
            ),
            fit:BoxFit.cover
          ),

        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(left:50.0,right:50.0),
              child: MaterialButton(
                color: Colors.white,
               padding: EdgeInsets.all(15.0),
                shape: RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(18.0),  
                    ),
                onPressed: (){
                  Navigator.of(context).push(MaterialPageRoute(builder: (context)=> new HomePage()));
                },
              child: Center(
                child:Text("Start Game",style:TextStyle(color: Colors.deepOrange,fontSize: 20.0,fontWeight: FontWeight.bold))
              ),),
            )
          ],
        ),
      )),
    );
  }
}