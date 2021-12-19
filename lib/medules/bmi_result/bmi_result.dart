import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BmiResult extends StatelessWidget{
  final bool ismale;
  final int age;
  final double result;
  final String classifi;
  const BmiResult({
    required this.ismale,
    required this.age,
    required this.result,
    required this.classifi
});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        leading: IconButton(
            icon: const Icon(Icons.keyboard_arrow_left),
            onPressed: (){
              Navigator.pop(context);
            },
        ),
        title: const Text('result',
        style: TextStyle(fontSize: 25),),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(height: 20,),
            const Image(image: AssetImage('asset/image/bmi_calc.png'),),
            const SizedBox(
              height: 10,
            ),
            Text('Gander : ${ismale ? 'male' : 'female'}',
            style: const TextStyle(
              fontSize: 30
            ),),
            const SizedBox(
              height: 10,
            ),
            Text('Age : $age',
              style: const TextStyle(
                fontSize: 30
            ),),
            const SizedBox(
              height: 10,
            ),
            Text('Result : ${result.round()}',
              style: const TextStyle(
                fontSize: 30
            ),),
            const SizedBox(
              height: 30,
            ),
            PhysicalModel(
              color: Colors.white,
              shadowColor: Colors.grey,
              elevation: 8,
              borderRadius: BorderRadius.circular(25),
              child:Container(
                padding: const EdgeInsets.all(30),
                child: Text('you in : $classifi',
                  style: const TextStyle(
                      fontSize: 30
                  ),),
              ),
            ),
          ],
        ),
      ),
    );
  }

}