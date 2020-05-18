import 'package:flutter/material.dart';
import 'Character.dart';
import 'character_widget.dart';

class CharacterListingScreen extends StatefulWidget {
  @override
  _CharacterListingScreenState createState() => _CharacterListingScreenState();
}

class _CharacterListingScreenState extends State<CharacterListingScreen> {

  PageController _pageController;
  int currentPage = 0;

  Widget character_fun(){
    for( var i=0;i<characters.length;i++){
      CharacterWidget();
    }
  }

  @override
  void initState(){
    super.initState();
    _pageController = PageController(
        viewportFraction: 1.0,
        initialPage: currentPage,
        keepPage: false
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.arrow_back_ios),
        actions: <Widget>[
          Padding(
            padding: EdgeInsets.only(right: 16.0),
            child: Icon(Icons.search),
          )
        ],
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(left: 32.0,top: 8.0),
              child: RichText(
                text: TextSpan(
                    children: [
                      TextSpan(
                          text:'Despicable Me',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 30.0,
                              fontWeight: FontWeight.bold
                          )
                      ),
                      TextSpan(
                          text: '\n'
                      ),
                      TextSpan(
                          text: 'Characters',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 26.0,
                          )
                      )
                    ]
                ),
              ),
            ),
            Expanded(
              child: PageView(
                controller: _pageController,
                children: <Widget>[
                  CharacterWidget(character: characters[0],pageController: _pageController,currentPage: 0,),
                  CharacterWidget(character: characters[1],pageController: _pageController,currentPage: 1),
                  CharacterWidget(character: characters[2],pageController: _pageController,currentPage: 2),
                  CharacterWidget(character: characters[3],pageController: _pageController,currentPage: 3),
                  CharacterWidget(character: characters[4],pageController: _pageController,currentPage: 4)
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
