
import 'package:flutter/material.dart';
import '/home.dart';
import '/result.dart';

void main() => runApp(const MyApp());
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      title:'BMI',
      debugShowCheckedModeBanner: false,
      theme:ThemeData(

        iconTheme: const IconThemeData(color: Colors.white),
        floatingActionButtonTheme:const FloatingActionButtonThemeData(backgroundColor:Colors.teal),
        canvasColor: Colors.black,
        appBarTheme: const AppBarTheme(color: Colors.teal),
        textTheme: const TextTheme(headline2:TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.white),),
          primaryTextTheme: const TextTheme(headline1:TextStyle(fontSize:20,fontWeight: FontWeight.bold,color: Colors.black)),

      ),
      home: MyHomePage(),
    );
  }
}
// Result(Ismale:false,result:50,age:18),