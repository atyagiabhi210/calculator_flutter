import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CalculatorView extends StatefulWidget {
  const CalculatorView({super.key});

  @override
  State<CalculatorView> createState() => _CalculatorViewState();
}

class _CalculatorViewState extends State<CalculatorView> {
  int x = 0;
  num z = 0;
  int y = 0;

  final displayOneController = TextEditingController();
  final displayTwoController = TextEditingController();

  @override
  void initState() {
    super.initState();
    displayTwoController.text = y.toString();
    displayOneController.text = x.toString();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.amber,
        appBar: AppBar(
            title: const Text(
              "CALCULATOR",
            ),
            backgroundColor: Colors.amber),
        body: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            //crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(
                height: 20,
              ),
              displayOne(
                  hint: "Enter 1st number", controller: displayOneController),
              SizedBox(
                height: 10,
              ),
              displayOne(
                  hint: "Enter 2nd number", controller: displayTwoController),
              Spacer(),
              SizedBox(
                height: 10,
              ),
              Text(
                z.toString(),
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontSize: 30.00),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  FloatingActionButton(
                    onPressed: () {
                      setState(() {
                        z = num.tryParse(displayOneController.text)! +
                            num.tryParse(displayTwoController.text)!;
                      });
                    },
                    child: Icon(CupertinoIcons.add, color: Colors.white),
                    backgroundColor: Colors.red,
                  ),
                  FloatingActionButton(
                    onPressed: () {
                      setState(() {
                        z = num.tryParse(displayOneController.text)! -
                            num.tryParse(displayTwoController.text)!;
                      });
                    },
                    child: Icon(CupertinoIcons.minus, color: Colors.white),
                    backgroundColor: Colors.red,
                  ),
                  FloatingActionButton(
                    onPressed: () {
                      setState(() {
                        z = num.tryParse(displayOneController.text)! *
                            num.tryParse(displayTwoController.text)!;
                      });
                    },
                    child: Icon(CupertinoIcons.multiply, color: Colors.white),
                    backgroundColor: Colors.red,
                  ),
                  FloatingActionButton(
                    onPressed: () {
                      setState(() {
                        z = num.tryParse(displayOneController.text)! /
                            num.tryParse(displayTwoController.text)!;
                      });
                    },
                    child: Icon(CupertinoIcons.divide, color: Colors.white),
                    backgroundColor: Colors.red,
                  ),
                  FloatingActionButton.extended(
                    onPressed: () {
                      setState(() {
                        x = 0;
                        y = 0;
                        z = 0;
                        displayOneController.clear();
                        displayTwoController.clear();
                      });
                    },
                    label: Text(
                      "CLEAR",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 30,
                          fontWeight: FontWeight.bold),
                    ),
                    backgroundColor: Colors.red,
                  )
                ],
              ),
              SizedBox(height: 10),

            ],
          ),
        ));
  }
}

class displayOne extends StatelessWidget {
  const displayOne({super.key, required this.hint, required this.controller});

  final String? hint;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
          hintText: hint,
          focusColor: Colors.red,
          hoverColor: Colors.red,
          focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.white, width: 2.00),
              borderRadius: BorderRadius.all(Radius.circular(20.00))),
          border: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.white, width: 2.00),
              borderRadius: BorderRadius.all(Radius.circular(20.00)))),
      keyboardType: TextInputType.numberWithOptions(),
      autofocus: true,
    );
  }
}
