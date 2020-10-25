import 'package:flutter/material.dart';
import 'package:memory_game/data/data.dart';
import 'package:memory_game/model/tile_model.dart';
import 'package:memory_game/replayPage.dart';
import 'package:memory_game/startPage.dart';
// import 'package:memory_game/image_editing_pro_package.dart';

// import 'animation/flare_package.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
       
        primarySwatch: Colors.deepOrange,
      ),
      debugShowCheckedModeBanner: false,
      home: StartPage(),
    );
  }
}


class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

int _timer = 0;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    pairs = getPairs();
    //هلشان يخليهم مش مرتبين
    pairs.shuffle();
    visiblePairs = pairs;
selected = true;
Future.delayed(Duration(seconds: 1),(){
setState(() {
  _timer ++;
});
});
    Future.delayed(Duration(seconds: 5),(){
      setState(() {
visiblePairs = getQuestion();
        selected = false;
      });
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   elevation: 0.0,
      //   title:Text("Memory Game",style:TextStyle(color: Colors.white,fontSize: 20.0)),
      //   centerTitle: true,

      // ),
      body: SafeArea(

              child: Container(
                decoration: BoxDecoration(
                 image:DecorationImage(
                   image: AssetImage("assets/bg.jpg"),
                   fit: BoxFit.cover
                 )
               ),
          // padding: EdgeInsets.symmetric(
          //   vertical: 50.0,
          //   horizontal: 20.0
          // ),
          child: Padding(
            padding: const EdgeInsets.all(25.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                // SizedBox(height:10.0),
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.end,
                //   children: <Widget>[
                //     Text("00:$_timer/00:20")
                //   ],
                // ),
                SizedBox(height:40.0),
              (points != 800)?  Column(
                  children: <Widget>[
                    Text("$points/800",style: TextStyle(fontSize: 34.0,color:Colors.deepOrange),),
                Text("points",style: TextStyle(fontSize: 24.0,color:Colors.deepOrange)),
                  ],
                ):Container(),
                SizedBox(height:40.0),
               (points != 800)? GridView(
                    shrinkWrap: true,
                    gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent
                    (maxCrossAxisExtent:100.0,
                    mainAxisSpacing: 0.0),
                    children:List.generate(visiblePairs.length, (index) {
                      return Tile(
                        assetImagePath: visiblePairs[index].getImageAssetPath(),
                        // selected: visiblePairs[index].getIsSelected(),
                        parent: this,
                        tileIndex: index,
                      );
                    }),
                  ):
                  
               Replay()
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class Tile extends StatefulWidget {
 final String assetImagePath;
//  final bool selected;
 final _HomePageState parent;
 final int tileIndex;
  Tile({this.assetImagePath,this.parent,this.tileIndex});
  @override
  _TileState createState() => _TileState();
}

class _TileState extends State<Tile> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        if(!selected){
          if(selectedAssetImagePath != ""){
            if(selectedAssetImagePath == pairs[widget.tileIndex].getImageAssetPath()){
              print("correct");
              selected =true;
              Future.delayed(Duration(seconds: 2),(){
                setState(() {
                   points+=100;
                });
               selected =false;
                widget.parent.setState(() {
                  pairs[widget.tileIndex].setImageAssetPath("");
                  pairs[selectedTileIndex].setImageAssetPath("");

                });
                  selectedAssetImagePath = "";

              });
            }
            else{print("wrong selected");
            selected =true;
            Future.delayed(Duration(seconds: 2),(){
              selected =false;
                widget.parent.setState(() {
                   pairs[widget.tileIndex].setIsSelected(false);
                  pairs[selectedTileIndex].setIsSelected(false);
                });
                  selectedAssetImagePath = "";
            });
            }
          }
          else{
           selectedTileIndex = widget.tileIndex;
              selectedAssetImagePath = pairs[widget.tileIndex].getImageAssetPath();
            
          }
          setState(() {
            pairs[widget.tileIndex].setIsSelected(true);
          });
          print("you clicked me");
        }
      },
          child: Container(
        margin: EdgeInsets.all(5),
        child: pairs[widget.tileIndex].getImageAssetPath() != ""?
        Image.asset(!pairs[widget.tileIndex].getIsSelected()?
        widget.assetImagePath:pairs[widget.tileIndex].getImageAssetPath()):
        Image.asset("assets/correct.png")
        ,
      ),
    );
  }
}