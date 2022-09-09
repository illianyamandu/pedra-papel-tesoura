
import 'dart:math';

import 'package:flutter/material.dart';

class GamePPT extends StatefulWidget{
  const GamePPT({super.key});
  @override
  State<GamePPT> createState() => _GamePPTState();
}

class _GamePPTState extends State<GamePPT>{

  var _imgInterrogacao = const AssetImage('assets/images/interrogacao.png');
  var _imgRobo = const AssetImage('');
  String _msgResultado = '';

  void _escolha(String escolhaJogador){
    var escolha = ["pedra", "papel", "tesoura"];
    var num = Random().nextInt(3);
    var escolhaBoot = escolha[num];

    setState(() {
      if(escolhaBoot == 'pedra'){
        _imgInterrogacao = const AssetImage('assets/images/pedra.png');
      }
      else if(escolhaBoot == 'tesoura'){
        _imgInterrogacao = const AssetImage('assets/images/tesoura.png');
      }
      else{        
        _imgInterrogacao = const AssetImage('assets/images/papel.png');
      }
    });

    setState(() {
      if((escolhaJogador == 'pedra' && escolhaBoot == 'tesoura') ||
         (escolhaJogador == 'tesoura' && escolhaBoot == 'papel') ||
         (escolhaJogador == 'papel' && escolhaBoot == 'pedra')){
          
          _msgResultado = "Você ganhou";
          _imgRobo = const AssetImage('assets/images/sorriso.png');
      }
      else if((escolhaJogador == 'tesoura' && escolhaBoot == 'pedra') ||
              (escolhaJogador == 'pedra' && escolhaBoot == 'papel') ||
              (escolhaJogador == 'papel' && escolhaBoot == 'tesoura')){
                _msgResultado = "Você perdeu";
                _imgRobo = const AssetImage('assets/images/chorando.png');
      }
      else{
        _msgResultado = "Empatou";
        _imgRobo = const AssetImage('assets/images/pokerface.png');
      }
      _mostrarSnackBar();
    });
  }

  void _mostrarSnackBar(){
    final snackBar = SnackBar(
      content: Center(
        child: Column(
          children: [
            Container(
              height: 300,
            ),
            Text(
              _msgResultado,
              style: const TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 50),
              child: Image(
                image: _imgRobo,
                height: 120,
                ),
            ),
          ],
        ),
      ),
      duration: const Duration(seconds: 2),
      backgroundColor: Colors.black
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);

  }
  
  @override
  Widget build(BuildContext context) {
   return Scaffold(
    appBar: AppBar(
      title: const Text(
        'Pedra Papel Tesoura',
        style: TextStyle(
          fontSize: 20,
          color: Colors.white,
          fontWeight: FontWeight.bold
        ),
      ),
      centerTitle: true,
      toolbarHeight: 80,
    ),
    body: Center(
      child: Column(
        children:  [
         const Padding(
            padding: EdgeInsets.all(32.0),
            child: Text(
              'Escolha da máquinha',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold
              ),
              ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 50),
            child: Image(
              image: _imgInterrogacao,
              height: 300,
              ),
          ),
          const Padding(
            padding: EdgeInsets.all(55),
            child: Text(
              'Escolha uma opção abaixo',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GestureDetector(
                  onTap: () => _escolha('pedra'),
                  child: const Image(
                    image: AssetImage('assets/images/pedra.png'),
                    height: 110,
                  ),
                ),
                GestureDetector(
                  onTap: () => _escolha('papel'),
                  child: const Image(
                    image: AssetImage('assets/images/papel.png'),
                    height: 110,
                  ),
                ),
                GestureDetector(
                  onTap: () => _escolha('tesoura'),
                  child: const Image(
                    image: AssetImage('assets/images/tesoura.png'),
                    height: 110,
                  ),
                ),
              ],
            ),
          ),
          
        ],
      ),
    ),   
   );
  }
}