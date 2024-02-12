
import 'package:flutter/material.dart';
// ignore: unused_import
import 'package:quizzelar/question.dart';
import 'package:quizzelar/quize_brain.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

QuizeBrain quizeBrain = QuizeBrain();
 
void main() {
  runApp(const Quizzler());
    
}

class Quizzler extends StatelessWidget {
  const Quizzler({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
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
  List <Icon>scoreKeeper = [

  
  ];
  
  void cheekAnswer(bool userPickedAnswer){
    

        bool correctAnswer = quizeBrain.getCorrectAnswer();
         setState(() {

          if(quizeBrain.isFinished()==true){

            Alert(
              context: context,
               title: 'Finished!', 
               desc: "Flutter is awesome.")
               .show();
               quizeBrain.reset();
               scoreKeeper =[];
          }

      else{
              if(userPickedAnswer == correctAnswer){
               

                scoreKeeper.add(const Icon(Icons.check,color: Colors.red,),);

              }else{
               
               scoreKeeper.add(const Icon(Icons.close,color: Colors.white,));
              }
                
               
                  quizeBrain.nextQuestion();
      }
                });
  }
 
  
 
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Expanded(

         flex: 5, 
          child:Padding(
            padding:const EdgeInsets.all(10.0) ,
            child: Center(
              child: Text(
                quizeBrain.getQuestionText( ),
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 25.0,
                  color: Colors.white,
                ),
              ),),
            ),
            
          
          ),

          
            Expanded(
             child: Padding(
             padding: const EdgeInsets.all(15.0),
             child: TextButton(
             style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(Colors.red),
              ),
              
             child: const Text(
                'True',
               style: TextStyle(
                 fontSize: 20.0,
                 color: Colors.white,
           ),
          ),
           onPressed: () {

             // quizeBrain.questionBank[questionNumber].questionAnswer = true;

          
        cheekAnswer(true);
          
        
                 
             },
       ),
     ),
  ),


    Expanded(child: Padding(
      padding: const EdgeInsets.all(15.0),
      child: TextButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(Colors.green.shade900),
          
        ),
        
        child: const Text(
          'False',
          style: TextStyle(
            fontSize: 20.0,
            color: Colors.white,
          ),
        ),
        onPressed: () {

                cheekAnswer(false) ;
          
        
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

