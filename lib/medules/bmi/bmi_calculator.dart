import 'dart:math';

import 'package:bmi_calculator/component/component.dart';
import 'package:bmi_calculator/medules/bmi_result/bmi_result.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BmiCalculator extends StatefulWidget{
  const BmiCalculator({Key? key}) : super(key: key);
  @override
  State<StatefulWidget> createState() => _BmiCalculator();
}
class _BmiCalculator extends State<BmiCalculator>{
  bool isMale = true;
  double value = 120;
  int weight = 40;
  int age = 20;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
          title: const Text('Bmi Calculator'),
      ),
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: (){
                        setState(() {
                          isMale = true;
                        });
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadiusDirectional.circular(12),
                          color: isMale? Colors.lightBlueAccent :Colors.grey[300]
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Image(
                                image:AssetImage('asset/image/male.png'),
                              width: 80,
                              height: 80,
                            ),

                            Text('Male',
                            style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.bold
                            ),)
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Expanded(
                    child: GestureDetector(
                      onTap: (){
                        setState(() {
                          isMale = false;
                        });
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadiusDirectional.circular(12),
                            color: !isMale? Colors.lightBlueAccent :Colors.grey[300]
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Image(image: AssetImage('asset/image/female.png'),
                              width: 80,
                              height: 80,
                            ),
                            Text('Female',
                              style: TextStyle(
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold
                              ),)
                          ],
                        ),
                      ),
                    ),
                  ),

                ],
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadiusDirectional.circular(12),
                  color: Colors.grey[300],
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('Height' ,style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold
                    ),),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: [
                        Text('${value.round()}' ,
                        style: const TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.w900
                        ),),
                        const SizedBox(
                          width: 5,),
                        const Text('cm',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold
                        ),)
                      ],
                    ),
                    Slider(
                      value: value,
                      min: 50,
                      max: 250,
                      onChanged: (value){
                        setState(() {
                          this.value =value;
                        });
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadiusDirectional.circular(12),
                        color: Colors.grey[300],
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text('Age' ,style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.bold
                          ),),
                          Text('$age' ,
                            style: const TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.w900
                            ),),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              FloatingActionButton(
                                onPressed: (){
                                  setState(() {
                                    age -- ;
                                  });
                                },
                                heroTag: 'age-',
                                mini:true ,
                                backgroundColor: Colors.red,
                                child: const Icon(Icons.remove),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              FloatingActionButton(
                                onPressed: (){
                                  setState(() {
                                    age ++ ;
                                  });
                                },
                                heroTag: 'age+',
                                mini:true ,
                                child: const Icon(Icons.add),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadiusDirectional.circular(12),
                        color: Colors.grey[300],
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text('Weight' ,style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.bold
                          ),),
                          Text('$weight' ,
                            style: const TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.w900
                            ),),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              FloatingActionButton(
                                onPressed: (){
                                  setState(() {
                                    weight--;
                                  });
                                },
                                heroTag: 'weight-',
                                mini:true ,
                                backgroundColor: Colors.red,
                                child: const Icon(Icons.remove),
                              ),
                              const SizedBox(width: 10,),
                              FloatingActionButton(
                                onPressed: (){
                                  setState(() {
                                    weight++;
                                  });
                                },
                                heroTag: 'weight+',
                                mini:true ,
                                child: const Icon(Icons.add),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            width: double.infinity,
            height: 60,
            // padding: EdgeInsets.symmetric(horizontal: 20),
            child: MaterialButton(
                onPressed: (){
                  double result = weight / pow(value/100, 2);
                  var classifi =  classification(result);
                  //print(result);
                  Navigator.push(context,
                      MaterialPageRoute(
                          builder: (context) => BmiResult(
                              ismale: isMale,
                              age: age,
                              result: result,
                            classifi: classifi,
                          )
                      ));
                },
              color: Colors.lightBlueAccent,
              child: const Text('calculate',
              style: TextStyle(
                fontSize: 25
              ),
              ),
            ),
          )
        ],
      ),
    );
  }
}