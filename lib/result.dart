import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  const Result(
      {Key? key, required this.isMale, required this.age, required this.result})
      : super(key: key);

  final bool isMale;
  final int age;
  final double result;

  String get getHealthiness{
    String healthiness = "";
    if(result >= 30)
      {
        healthiness = "Obese";
      }
    else if(result < 30 && result >= 25)
      {
        healthiness = "Overweight";
      }
    else if(result < 25 && result >= 18.5)
      {
        healthiness = "Normal";
      }
    else
      {
        healthiness = "Underweight";
      }

    return healthiness;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Result"),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "Gender: ${isMale ? "Male" : "Female"}",
                style: Theme.of(context).textTheme.headline4,
              ),
              Text(
                "Result: ${result.toStringAsFixed(1)} ",
                style: Theme.of(context).textTheme.headline4,
              ),
              Text(
                "Healthiness: $getHealthiness ",
                style: Theme.of(context).textTheme.headline4,
                textAlign: TextAlign.center,
              ),
              Text(
                "Age: $age ",
                style: Theme.of(context).textTheme.headline4,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
