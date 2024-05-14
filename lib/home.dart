import 'dart:html';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:untitled4/result.dart';
class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool Ismale=true;
  int weight=50;
  double height=170;
  int age=18;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Body Mass Index",style:Theme.of(context).textTheme.headline2,),centerTitle:true,),
    body:SafeArea(
      child:Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Row(
              children: [
                m1Expanded(context,'male'),
                const SizedBox(
                  width: 15,
                ),
                m1Expanded(context,'female'),
             ] ),

         const   Padding(padding: EdgeInsets.symmetric(vertical:20)),
            Container(
              padding:const EdgeInsets.all(20),
              decoration:BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                color: Colors.blueGrey,
              ),
              child: Column(
                children: [
                const  Padding(padding:EdgeInsets.symmetric(vertical: 25)),
                  Text('Height',style: Theme.of(context).textTheme.headline2,),
               const   SizedBox(height: 10,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline:TextBaseline.alphabetic,
                      children: [
                        Text(height.toStringAsFixed(1),style: Theme.of(context).primaryTextTheme.headline1,),
                        Text('cm',style: Theme.of(context).textTheme.bodyMedium,),
                      ] ),
                  Slider(
                    min:90,
                    max: 220,
                    value:height, onChanged:(newValue){
                      setState(() {
                        height=newValue;
                      });
                  },
                  )
                ],
              ),
            ),

            const   Padding(padding: EdgeInsets.symmetric(vertical:20)),
            Row(
                children: [
                  m2Expanded(context,'weight'),
                  const SizedBox(
                    width: 15,
                  ),
                  m2Expanded(context,'age'),
                ] ),

           Container(
           margin:const EdgeInsets.symmetric(vertical: 25),
             height: MediaQuery.of(context).size.height/20,
             color: Colors.teal,
               width: double.infinity,
               child: TextButton(onPressed: (){
                 var result=weight/pow(height/100,2);
                 Navigator.of(context).push(MaterialPageRoute(builder:(context){
                   return Result(Ismale:Ismale, result:result, age: age);
                 }));
               }, child: Text('Calculate',style:Theme.of(context).textTheme.headline2)))
          ],
        ),
      ),
      ),
    );
  }

  Expanded m1Expanded(BuildContext context,String type) {
    return Expanded(
        child: GestureDetector(
          onTap: (){
            setState(() {
             Ismale= type=='male'?true:false;
            });
          },
          child: Container(
            padding:const EdgeInsets.all(20),
            decoration:BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color:(Ismale&&type=='male')||(!Ismale&&type=='female')?Colors.teal:Colors.blueGrey
            ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(type=='male'?Icons.male:Icons.female,size: 55,),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(type=='male'?'Male':'Female',style:Theme.of(context).textTheme.headline2,)
                ],
              ),
            ),
        ),
      );
  }
  Expanded m2Expanded(BuildContext context,String type) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration:BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color:Colors.blueGrey,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(
              height: 20,
            ),
            Text(type=='weight'?'Weight':'Age',style:Theme.of(context).textTheme.headline2,),
            Text(type=='weight'?'$weight':'$age',style:Theme.of(context).primaryTextTheme.headline1,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                FloatingActionButton(
                  // heroTag: type=='age'?age--:weight--,
                  onPressed: (){
                setState(() {
                  type=='age'?age--:weight--;
                });
                },
                  child: const Icon(Icons.remove,),
                  mini: true,
                ),
                FloatingActionButton(
                  // heroTag: type=='age'?age++:weight++,
                  onPressed: (){
                    setState(() {
                      type=='age'?age++:weight++;
                    });
                },
                  child: const Icon(Icons.add,),
                  mini: true,
                ),
              ],
            )

          ],
        ),
      ),
    );
  }
}
