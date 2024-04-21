import 'dart:math';

import 'package:bmi_calc/result.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({
    Key? key,
  }) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool isMale = true;
  double height = 170;
  int weight = 80;
  int age = 27;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("BMI App"),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(18.0),
                child: Row(
                  children: [
                    reusableGenderCard(context, "male"),
                    const SizedBox(
                      width: 14,
                    ),
                    reusableGenderCard(context, "female"),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 18.0),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.blueGrey,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Height", style: Theme.of(context).textTheme.headline3,),
                      const SizedBox(
                        width: 14,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(height.toStringAsFixed(1), style: Theme.of(context).textTheme.headline2,),
                          Text("CM",style: Theme.of(context).textTheme.headline3,),
                        ],
                      ),
                      const SizedBox(
                        width: 14,
                      ),
                      Slider(value: height, activeColor: Colors.teal.shade300, inactiveColor: Colors.teal, max: 220, min: 150, onChanged: (newValue)=> setState(() => height = newValue),),
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(18.0),
                child: Row(
                  children: [
                    reusableWeightAgeCard(context, "weight"),
                    const SizedBox(
                      width: 14,
                    ),
                    reusableWeightAgeCard(context, "age"),
                  ],
                ),
              ),
            ),
            Container(
              color: Colors.teal,
              width: double.infinity,
              height: MediaQuery.of(context).size.height / 16,
              child: TextButton(
                onPressed: () {
                  var result = weight / pow(height / 100, 2);
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (_) => Result(
                              result: result,
                              age: age,
                              isMale: isMale,
                            )),
                  );
                },
                child: const Text(
                  "Calculate",
                  style: TextStyle(fontSize: 24, color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget reusableGenderCard(BuildContext context, String gender) {
    return Expanded(
      child: GestureDetector(
        onTap: () {
          setState(() {
            isMale = (gender == "male") ? true : false;
          });
        },
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: isMale && gender == "male" || !isMale && gender == "female"
                ? Colors.teal
                : Colors.blueGrey,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                gender == "male" ? Icons.male : Icons.female,
                size: 60,
              ),
              const SizedBox(
                height: 14,
              ),
              Text(
                gender == "male" ? "Male" : "Female",
                style: Theme.of(context).textTheme.headline3,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget reusableWeightAgeCard(BuildContext context, String value) {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.blueGrey,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              value == "weight" ? "Weight" : "Age",
              style: Theme.of(context).textTheme.headline3,
            ),
            const SizedBox(
              height: 4,
            ),
            Text(
              value == "weight" ? "$weight" : "$age",
              style: Theme.of(context).textTheme.headline2,
            ),
            const SizedBox(
              height: 4,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FloatingActionButton(
                  child: const Icon(
                    Icons.add,
                    size: 36,
                  ),
                  onPressed: () =>
                      setState(() => value == "weight" ? weight++ : age++),
                ),
                const SizedBox(
                  width: 8,
                ),
                FloatingActionButton(
                  child: const Icon(
                    Icons.remove,
                    size: 36,
                  ),
                  onPressed: () =>
                      setState(() => value == "weight" ? weight-- : age--),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
