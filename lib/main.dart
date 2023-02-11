// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BmiCalcukator(),
    );
  }
}

//stateful widget

class BmiCalcukator extends StatefulWidget {
  const BmiCalcukator({super.key});

  @override
  State<BmiCalcukator> createState() => _BmiCalcukatorState();
}

class _BmiCalcukatorState extends State<BmiCalcukator> {
  //variable for custome radio button
  int currentindex = 0;
  String result = '';
  //lets declr inptcontrlr to get input value
  TextEditingController heightController = TextEditingController();
  TextEditingController weightController = TextEditingController();
  /////////////////////////////////////////////////////////////////////
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:  Center(
          child: Text(
            'BMI CALCULATOR',
            style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),
          ),
        ),
        elevation: 0.0,
        backgroundColor: Color.fromARGB(255, 212, 212, 212),
        actions: [
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.settings,
                color: Colors.black,
              )),
        ],
      ),
      //body
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(12.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  radioButon('Man', Colors.blue,0),
                  radioButon('Women', Colors.pink, 1),
                ],
              ),
              SizedBox(
                height: 15,
              ),
              Text(
                'Your weight in cm: ',
                style: TextStyle(
                  fontSize: 18.0,
                ),
              ),
              SizedBox(
                height: 8.0,
              ),
              TextField(
                keyboardType: TextInputType.number,
                //adding height conroller
                controller: heightController,
                //height cconroller
                textAlign: TextAlign.center,
                decoration: InputDecoration(
                    hintText: 'Your height in cm',
                    filled: true,
                    fillColor: Colors.grey[200],
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                      borderSide: BorderSide.none,
                    )),
              ),
              SizedBox(
                height: 20.0,
              ),

              //for the weight going to c and v same things above
              Text(
                'Your weight in kg: ',
                style: TextStyle(
                  fontSize: 18.0,
                ),
              ),
              SizedBox(
                height: 8.0,
              ),
              TextField(
                keyboardType: TextInputType.number,
                //adding weight conroller
                controller: weightController,
                //weight cconroller
                textAlign: TextAlign.center,
                decoration: InputDecoration(
                    hintText: 'Your weight in kg',
                    filled: true,
                    fillColor: Colors.grey[200],
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                      borderSide: BorderSide.none,
                    )),
              ),
              SizedBox(
                height: 20.0,
              ),

              //now let's add calculate button
              Container(
                width: double.infinity,
                height: 50,
                child: FloatingActionButton(
                  onPressed: () {
                    setState(() {
                      double height = double.parse(heightController.value.text);
                    double weight = double.parse(weightController.value.text);
                     calculateBmi(height, weight);
                    });

                   
                    //
                  },
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0)),
                  child: Text(
                    'Calculate',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              Container(
                width: double.infinity,
                child: Text(
                  'Your BMI is : $result', //calling calculate funtio
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(
                width: 50.0,
              ),
            
            ],
          ),
        ),
      ),
    );
  }

//bmi calculate fun
  void calculateBmi(double height, double weight) {
   
    double finalresult = weight / (height * height / 10000);  // formula rconvert cm to meter
    String bmi = finalresult.toStringAsFixed(2);
    setState(() {
      result = bmi;
    });
  }

  //funtion to change radi button value
  void changIndex(int index) {
    setState(() {
      // ignore: prefer_typing_uninitialized_variables

      currentindex = index;
    });
  }

  //create new cutom widget

  Widget radioButon(String value, Color color, int index) {
    return Expanded(
        child: Container(
      margin: EdgeInsets.symmetric(horizontal: 12.0),
      height: 80.0,
      child: FloatingActionButton(
        backgroundColor: currentindex == index ? color : Colors.grey[200],
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
        onPressed: () {
          changIndex(index);
        },
        child: Text(value,
            style: TextStyle(
                color: currentindex == index ? Colors.white : color,
                fontSize: 18,
                fontWeight: FontWeight.bold)),
      ),
    ));
  }
}
