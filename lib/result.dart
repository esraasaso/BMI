import 'package:flutter/material.dart';
class Result extends StatelessWidget {
  final bool Ismale;
final  double result;
final int age;
Result({required this.Ismale,required this.result,required this.age});
String get ResultPhrase {
  String resultText=" ";
  if(result>21)
    {resultText="Obese";}
  else if(result>=20&&result<=15)
    {resultText="Normal";}
  else if(result>14&&result<10)
    {resultText="Thin";}
  else{
    resultText="undefine";
  }
  return resultText;
}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Result",style:Theme.of(context).textTheme.headline2),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text('Gender : ${Ismale?'male':'female'}',style:Theme.of(context).textTheme.headline2),
            Text('Result : ${result.toStringAsFixed(1)}',style:Theme.of(context).textTheme.headline2),
            Text('Healthiness : $ResultPhrase'.toString(),style:Theme.of(context).textTheme.headline2),
            Text('Age : $age',style:Theme.of(context).textTheme.headline2),
          ],
        ),
      ),
      ),
    );
  }
}
