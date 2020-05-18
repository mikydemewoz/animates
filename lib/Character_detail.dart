import 'package:flutter/material.dart';
import 'Character.dart';
import 'package:after_layout/after_layout.dart';

class CharacterDetailScreen extends StatefulWidget {
  @override
  _CharacterDetailScreenState createState() => _CharacterDetailScreenState();
  final double _expandedBottomSheetBottomPosition = 0;
  final double _collapsedBottomSheetBottomPosition = -250;
  final double _completeCollapsedBottomSheetBottomPosition = -330;
  final Character character;

  CharacterDetailScreen({Key key ,this.character}) : super(key: key);
}

class _CharacterDetailScreenState extends State<CharacterDetailScreen> with AfterLayoutMixin<CharacterDetailScreen>{

  double _bottomSheetBottomPosition = -330;
  bool isCollapsed = false;

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Hero(
            tag: "background-${widget.character.name}",
            child: DecoratedBox(
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        colors: widget.character.colors,
                        begin: Alignment.topRight,
                        end: Alignment.bottomLeft
                    )
                )
            ),
          ),
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SizedBox(height: 40.0,),
                Padding(
                    padding: const EdgeInsets.only(top: 8.0,left: 16.0),
                    child: IconButton(
                        iconSize: 40.0,
                        icon: Icon(Icons.close),
                        color: Colors.white.withOpacity(0.9),
                        onPressed: (){
                          setState(() {
                            _bottomSheetBottomPosition = widget._completeCollapsedBottomSheetBottomPosition;
                          });
                          Navigator.pop(context);
                        })
                ),
                Align(
                  alignment: Alignment.topRight,
                  child: Hero(
                    tag: "image-${widget.character.imagePath}",
                    child: Image.asset(
                      widget.character.imagePath,
                      height: screenHeight * 0.45,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 32.0, vertical: 8),
                  child: Hero(
                    tag: "name-${widget.character.name}",
                    child: Material(
                      color: Colors.transparent,
                      child: Container(
                        child: Text(
                          widget.character.name,
                          style: TextStyle(
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(32.0, 0, 8, 116),
                  child: Text(
                    widget.character.description,
                    style: TextStyle(
                        fontSize: 16.0
                    ),
                  ),
                )
              ],
            ),
          ),
          AnimatedPositioned(
            duration: const Duration(milliseconds: 500),
            curve: Curves.decelerate,
            bottom: _bottomSheetBottomPosition,
            left: 0,
            right: 0,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(40),
                    topRight: Radius.circular(40)
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  InkWell(
                    onTap: _onTap,
                    child: Container(
                      alignment: Alignment.centerLeft,
                      padding: const EdgeInsets.symmetric(horizontal: 32.0),
                      height: 80,
                      child: Text(
                        "Clips",
                        style: TextStyle(
                            fontSize: 16.0
                        ),
                      ),
                    ),
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: _clipsWidget(),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _clipsWidget(){
    return Container(
      height: 250,
      margin: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Row(
        children: <Widget>[
          Column(
            children: <Widget>[
              InkWell(
                onTap: (){

                },
                child: Container(
                  width: 100,
                  height: 100,
                  decoration: BoxDecoration(
                    color: Colors.redAccent,
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                  ),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Image.asset(
                      "images/minions.png",
                      height: 70,
                      width: 70,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20,),
              roundedContainer(Colors.greenAccent)
            ],
          ),
          SizedBox(width: 16.0,),
          Column(
            children: <Widget>[
              roundedContainer(Colors.orangeAccent),
              SizedBox(height: 20,),
              roundedContainer(Colors.purple)
            ],
          ),
          SizedBox(width: 16.0,),
          Column(
            children: <Widget>[
              roundedContainer(Colors.grey),
              SizedBox(height: 20,),
              roundedContainer(Colors.blueGrey)
            ],
          ),
          SizedBox(width: 16.0,),
          Column(
            children: <Widget>[
              roundedContainer(Colors.lightGreenAccent),
              SizedBox(height: 20,),
              roundedContainer(Colors.pinkAccent)
            ],
          ),
        ],
      ),
    );
  }

  Widget roundedContainer(Color color){
    return Container(
      width: 100,
      height: 100,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.all(Radius.circular(20)),
      ),
    );
  }
  _onTap(){
    setState(() {
      _bottomSheetBottomPosition = isCollapsed
          ? widget._expandedBottomSheetBottomPosition
          : widget._collapsedBottomSheetBottomPosition;
      isCollapsed = !isCollapsed;
    });
  }

  @override
  void afterFirstLayout(BuildContext context) {
    Future.delayed(const Duration(milliseconds: 500),(){
      setState(() {
        isCollapsed = true;
        _bottomSheetBottomPosition = widget._collapsedBottomSheetBottomPosition;
      });
    });
  }
}
