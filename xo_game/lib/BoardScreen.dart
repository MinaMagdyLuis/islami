import 'package:flutter/material.dart';
import 'package:xo_game/board_screen_button.dart';

class BoardScreen extends StatefulWidget {
  static const String routeName = 'BoardScreen';

  const BoardScreen({super.key});

  @override
  State<BoardScreen> createState() => _BoardScreenState();
}

class _BoardScreenState extends State<BoardScreen> {
  List<String> boardState = [
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
  ];

  @override
  Widget build(BuildContext context) {
    var argument =
        ModalRoute.of(context)?.settings.arguments as BoardScreenArguments;
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      '${argument.player1Name} (X)',
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 25,
                      ),
                    ),
                    Text(
                      'Score : ',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 25,
                      ),
                    ),
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      '${argument.player2Name} (O)',
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 25,
                      ),
                    ),
                    Text(
                      'Score : ',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 25,
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
          Expanded(
            child:
                Row(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
              Expanded(
                  child: BoardScreenButton(
                text: boardState[0],
                onBoardScreenButtonClick: onButtonClick,
                index: 0,
              )),
              Expanded(
                  child: BoardScreenButton(
                text: boardState[1],
                onBoardScreenButtonClick: onButtonClick,
                index: 1,
              )),
              Expanded(
                  child: BoardScreenButton(
                text: boardState[2],
                onBoardScreenButtonClick: onButtonClick,
                index: 2,
              )),
            ]),
          ),
          Expanded(
            child:
                Row(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
              Expanded(
                  child: BoardScreenButton(
                text: boardState[3],
                onBoardScreenButtonClick: onButtonClick,
                index: 3,
              )),
              Expanded(
                  child: BoardScreenButton(
                text: boardState[4],
                onBoardScreenButtonClick: onButtonClick,
                index: 4,
              )),
              Expanded(
                  child: BoardScreenButton(
                text: boardState[5],
                onBoardScreenButtonClick: onButtonClick,
                index: 5,
              )),
            ]),
          ),
          Expanded(
            child:
                Row(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
              Expanded(
                  child: BoardScreenButton(
                text: boardState[6],
                onBoardScreenButtonClick: onButtonClick,
                index: 6,
              )),
              Expanded(
                  child: BoardScreenButton(
                text: boardState[7],
                onBoardScreenButtonClick: onButtonClick,
                index: 7,
              )),
              Expanded(
                  child: BoardScreenButton(
                text: boardState[8],
                onBoardScreenButtonClick: onButtonClick,
                index: 8,
              )),
            ]),
          ),
        ],
      ),
    );
  }

  int counter = 0;
  int player1Score = 0;
  int player2Score = 0;

  void onButtonClick(String text, int index) {
    if (boardState[index].isNotEmpty) {
      return;
    }
      if (counter.isEven) {
        setState(() {
          boardState[index] = 'X';
        });
      } else {
        setState(() {
          boardState[index] = 'O';
        });
      }
      counter++;
      if (checkWinner('X')) {
       setState(() {
         player1Score+=5;
       });
        
      }  else if (checkWinner('O')){
       setState(() {
         player2Score+=5;
       });
      }

  }

  bool checkWinner(String symbol) {
    for (int i = 0; i < 9; i + 3) {
      if (boardState[i] == symbol &&
          boardState[i + 1] == symbol &&
          boardState[i + 2] == symbol) {
        return true;
      }
    }
    for (int i = 0; i < 3; i + 1) {
      if (boardState[i] == symbol &&
          boardState[i + 3] == symbol &&
          boardState[i + 6] == symbol) {
        return true;
      }
    }
    if (boardState[0] == symbol &&
        boardState[4] == symbol &&
        boardState[8] == symbol) {
      return true;
    }
    if (boardState[2] == symbol &&
        boardState[4] == symbol &&
        boardState[6] == symbol) {
      return true;
    }

    return false;
  }
}

class BoardScreenArguments {
  final String player1Name;

  final String player2Name;

  BoardScreenArguments({
    required this.player1Name,
    required this.player2Name,
  });
}
