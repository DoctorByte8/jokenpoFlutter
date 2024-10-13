import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(MaterialApp(
      title: "JoKenPo",
      debugShowCheckedModeBanner: false,
      home: MainApp()
    )
  );
}

class MainApp extends StatefulWidget {
  MainApp({super.key});

  @override
  State<MainApp> createState() => MainAppState();
}

class MainAppState extends State<MainApp>{

  String playerOption = "Escolha sua opção!";

  String gameOption = "../images/placeholder.png";

  int partidas = 0;

  void changePlayerOption(String option) => setState(() {
      playerOption = "Sua escolha foi: " + option;
      int ran = Random().nextInt(3);
      partidas += 1;
      if (ran == 0){
        gameOption = "../images/pedra.png";
      } else {
        if (ran == 1){
          gameOption = "../images/papel.png";
        } else gameOption = "../images/tesoura.png";
      }
  });

  @override
    Widget build(BuildContext context) {
      return MaterialApp(
        home: Scaffold(
          appBar: AppBar(
            title: Text("JoKenPo"),
            centerTitle: true,
            backgroundColor: Color.fromARGB(255, 255, 166, 0),
          ),
          body: Center(
            child: Container(
              alignment: Alignment.center,
              decoration: BoxDecoration(
                border: Border.all(
                  width: 1,
                  color: Colors.blue
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text("Quantidade de partidas: " + partidas.toString()),
                  Image.asset(
                    gameOption,
                    height: (MediaQuery.sizeOf(context).height/5),
                  ),
                  Text(playerOption),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      IconButton(
                        onPressed: () => changePlayerOption("papel"),
                        icon: Image.asset("../images/papel.png"),
                        iconSize: (MediaQuery.sizeOf(context).height/8),
                      ),
                      IconButton(
                        onPressed: () => changePlayerOption("pedra"),
                        icon: Image.asset("../images/pedra.png"),
                        iconSize: (MediaQuery.sizeOf(context).height/8),
                      ),
                      IconButton(
                        onPressed: () => changePlayerOption("tesoura"),
                        icon: Image.asset("../images/tesoura.png"),
                        iconSize: (MediaQuery.sizeOf(context).height/8),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      );
    }
}
