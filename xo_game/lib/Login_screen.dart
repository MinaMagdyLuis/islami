import 'package:flutter/material.dart';
import 'package:xo_game/BoardScreen.dart';

class LoginScreen extends StatelessWidget {
  static const String routeName = "loginScreen";

   String player1Name = '';

  String player2Name = '';

  LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.blue,
        padding: EdgeInsets.all(20),
        child: Column(mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              onSubmitted: (value) {
                player1Name = value;
              },
              decoration: const InputDecoration(hintText: 'player1 '),
            ),
            TextField(
              onSubmitted: (value) {
                player2Name = value;
              },
              decoration: const InputDecoration(hintText: 'player2 '),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pushNamed(BoardScreen.routeName,
                    arguments: BoardScreenArguments(
                        player1Name: player1Name, player2Name: player2Name));
              },
              child: const Text('Login'),
            ),
          ],
        ),
      ),
    );
  }
}
