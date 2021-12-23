import 'package:flutter/material.dart';
import 'package:flutterfoldingcellsample/soccer_player_details.dart';
import 'package:folding_cell/folding_cell.dart';

class MyFoldingCellScreen extends StatefulWidget {
  @override
  _MyFoldingCellScreenState createState() => _MyFoldingCellScreenState();
}

class _MyFoldingCellScreenState extends State<MyFoldingCellScreen> {

  List<SoccerPlayerDetails> listSoccerPlayerDetails;

  @override
  void initState() {
    super.initState();
    listSoccerPlayerDetails = [
      SoccerPlayerDetails( "https://resources.premierleague.com/premierleague/photos/players/40×40/p14937.png", "Cristiano Ronaldo", "Forward", "Manchester United", "Portugal"),
      SoccerPlayerDetails( "https://resources.premierleague.com/premierleague/photos/players/40×40/p78830.png", "Harry Kane", "Forward", "Tottenham Hotspur", "England"),
      SoccerPlayerDetails( "https://resources.premierleague.com/premierleague/photos/players/40×40/p61366.png", "Kevin De Bruyne", "Midfielder", "Manchester City", "Belgium"),
      SoccerPlayerDetails( "https://resources.premierleague.com/premierleague/photos/players/40×40/p101668.png", "Jamie Vardy", "Forward", "Leicester City", "England"),
      SoccerPlayerDetails( "https://resources.premierleague.com/premierleague/photos/players/40×40/p97032.png", "Virgil van Dijk", "Defender", "Liverpool", "Netherlands"),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Flutter Folding Cell Sample')),
        body: Container(
          child: ListView.builder(
            itemCount: listSoccerPlayerDetails.length,
            itemBuilder: (context, index) {
              return SimpleFoldingCell.create(
                padding: EdgeInsets.all(12),
                borderRadius: 12,
                frontWidget: buildListWidget(index),
                innerWidget: buildDetailsWidget(index),
                cellSize: Size(MediaQuery.of(context).size.width, 125),
                animationDuration: Duration(milliseconds: 200),
                onOpen: () {},
                onClose: () {},
              );
            },
          ),
        ),
    );
  }

  Widget buildListWidget(int index) {
    var getSoccerPlayerDetails = listSoccerPlayerDetails[index];
    return Builder(
      builder: (BuildContext context) {
        return Container(
          color:  Colors.orangeAccent,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                getSoccerPlayerDetails.playerName,
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: Colors.white
                ),
              ),
              SizedBox(height: 15),
              ElevatedButton(
                child: Text("Expand", style: TextStyle(color: Colors.orangeAccent, fontSize: 22)),
                style: ElevatedButton.styleFrom(
                  primary: Colors.white,
                ),
                onPressed: () {
                  final foldingCellState = context.findAncestorStateOfType<SimpleFoldingCellState>();
                  foldingCellState?.toggleFold();
                },
              ),
            ],
          ),
        );
      },
    );
  }

  Widget buildDetailsWidget(int index) {
    var getSoccerPlayerDetails = listSoccerPlayerDetails[index];
    return Builder(
      builder: (context) {
        return Container(
          color: Colors.pinkAccent,
          padding: EdgeInsets.all(12),
          child: Column(
            children: [
              SizedBox(height: 15),
              Align(
                alignment: Alignment.center,
                child: Text(
                  getSoccerPlayerDetails.playingPosition,
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                  ),
                ),
              ),
              SizedBox(height: 15),
              Align(
                alignment: Alignment.center,
                child: Text(
                  getSoccerPlayerDetails.clubName,
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                  ),
                ),
              ),
              SizedBox(height: 15),
              Align(
                alignment: Alignment.center,
                child: Text(
                  getSoccerPlayerDetails.countryName,
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                  ),
                ),
              ),
              SizedBox(height: 25),
                ElevatedButton(
                  child: Text("Shrink", style: TextStyle(color: Colors.pinkAccent, fontSize: 22)),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.white,
                  ),
                  onPressed: () {
                    final foldingCellState = context.findAncestorStateOfType<SimpleFoldingCellState>();
                    foldingCellState?.toggleFold();
                  },
                ),
            ],
          )
        );
      },
    );
  }
}