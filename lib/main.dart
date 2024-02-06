import 'package:flutter/material.dart';

void main() {
  runApp(Quizzler());
    
}

class Quizzler extends StatelessWidget {
  const Quizzler({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.blue,
        body: SafeArea(
          child: Padding(
            padding:EdgeInsets.symmetric(horizontal: 10.0) ,
            child: QuizPage(),
            ),
          
          ),
        
        ),

  );
  }
}

class QuizPage extends StatefulWidget {
  const QuizPage({super.key});

  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  List <Icon>scoreKeeper = [

       Icon(
                Icons.check,
                color: Colors.green,
              ),
              Icon(
                Icons.close,
                color: Colors.red,
              ),
               Icon(
                Icons.close,
                color: Colors.red,
              ),
               Icon(
                Icons.close,
                color: Colors.red,
              ),
               Icon(
                Icons.close,
                color: Colors.red,
              ),
  ];

 
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Expanded(

         flex: 5, 
          child:Padding(
            padding:EdgeInsets.all(10.0) ,
            child: Center(
              child: Text(
                'This is where the question text will go.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 25.0,
                  color: Colors.white,
                ),
              ),),
            ),
            
          
          ),

           Expanded(
            child: Padding(padding: EdgeInsets.all(10.0),
            child: TextButton(
              
              onPressed: () {
                
              },
              child: Text(
                'True',
                
                style: TextStyle(
                  
                  color: Colors.green.shade900,
                  fontSize: 20,
                ),
                ),
              ),
            
            )
            
            ),

            Expanded(
  child: Padding(
    padding: EdgeInsets.all(15.0),
    child: TextButton(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(Colors.red),
      ),
      onPressed: () {
        // The user picked false.
      },
      child: Text(
        'False',
        style: TextStyle(
          fontSize: 20.0,
          color: Colors.white,
        ),
      ),
    ),
  ),
),

          Row(

            children: scoreKeeper,
          ),
      ],
    );
  }
}

