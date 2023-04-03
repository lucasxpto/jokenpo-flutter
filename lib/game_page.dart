import 'dart:math';

import 'package:flutter/material.dart';

class GamePage extends StatefulWidget {
  const GamePage({Key? key}) : super(key: key);

  @override
  State<GamePage> createState() => _GamePageState();
}

class _GamePageState extends State<GamePage> {
  List options = ["pedra", "papel", "tesoura"];
  String message = "Escolha uma opção! 🏁";
  var imageApp = const AssetImage("images/padrao.png");

  var vitorias = 0;
  var derrotas = 0;
  var empates = 0;

  void play(String playerChoice) {
    int i = Random().nextInt(options.length);
    String computerChoice = options[i];

    imageApp = AssetImage("images/$computerChoice.png");

    if (playerChoice == computerChoice) {
      setState(() {
        empates++;
        message = "Empatamos! 👻";
      });
    } else if (playerChoice == "pedra" && computerChoice == "tesoura" ||
        playerChoice == "papel" && computerChoice == "pedra" ||
        playerChoice == "tesoura" && computerChoice == "papel") {
      setState(() {
        vitorias++;
        message = "Você venceu! 🎉";
      });
    } else {
      setState(() {
        derrotas++;
        message = "Você perdeu! 😵‍💫";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('JokenPô'),
        backgroundColor: const Color(0xFFF05C7E),
        // foregroundColor: Color(0xFF035359),
      ),
      body: Column(
        children: [
          const Padding(
            padding: EdgeInsets.only(top: 30, bottom: 30),
            child: Text(
              '🤖',
              style: TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.w500,
                color: Colors.teal,
              ),
            ),
          ),
          Image(
            image: imageApp,
            width: 140,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 40, bottom: 40),
            child: Text(
              message,
              style: const TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.w400,
                color: Colors.teal,
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              GestureDetector(
                onTap: () => play("pedra"),
                child: Image.asset(
                  "images/pedra.png",
                  width: 70,
                ),
              ),
              GestureDetector(
                onTap: () => play("papel"),
                child: Image.asset(
                  "images/papel.png",
                  width: 70,
                ),
              ),
              GestureDetector(
                onTap: () => play("tesoura"),
                child: Image.asset(
                  "images/tesoura.png",
                  width: 70,
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 40, bottom: 50),
            child: Column(
              children: [
                Text(
                  "Vitórias: $vitorias",
                  style: const TextStyle(
                    color: Color(0xFF3CB87E),
                    fontSize: 20,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: Text(
                    "Derrotas: $derrotas",
                    style: const TextStyle(
                      color: Color(0xFFF05C7E),
                      fontSize: 20,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: Text(
                    "Empates: $empates",
                    style: const TextStyle(
                      color: Color(0xFF78DBDF),
                      fontSize: 20,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
