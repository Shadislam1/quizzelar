
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
        backgroundColor: Colors.black,
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
  List <Icon>scoreKeeper = [];
  List<String>questions =[
      'You can lead a cow down stairs but not up stairs.',
      'Approximately one quarter of human are in the feet.'
      'A slug\'s  blood is green.',

  ];
  List<bool> answers =[
    false,
    true,
    true,
  ];
  
  int questionNumber= 0;
 
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
                questions[questionNumber],
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 25.0,
                  color: Colors.white,
                ),
              ),),
            ),
            
          
          ),

          
            Expanded(
             child: Padding(
             padding: EdgeInsets.all(15.0),
             child: TextButton(
             style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(Colors.red),
              ),
              
             child: Text(
                'True',
               style: TextStyle(
                 fontSize: 20.0,
                 color: Colors.white,
           ),
          ),
           onPressed: () {

              bool correctAnswer =answers[questionNumber];

              if(correctAnswer == true){
                print('user got it right');

              }else{
                print('user got it wrong');
              }
                
                setState(() {
                  questionNumber = questionNumber+1;
                });
        
          
           print(questionNumber);
        
                 
             },
       ),
     ),
  ),


    Expanded(child: Padding(
      padding: EdgeInsets.all(15.0),
      child: TextButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(Colors.green.shade900),
          
        ),
        
        child: Text(
          'False',
          style: TextStyle(
            fontSize: 20.0,
            color: Colors.white,
          ),
        ),
        onPressed: () {

               bool correctAnswer =answers[questionNumber];

              if(correctAnswer == false){
                print('user got it right');

              }else{
                print('user got it wrong');
              }
          setState(() {
            questionNumber = questionNumber+1;
          });
          
          print(questionNumber);
        },
        
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

