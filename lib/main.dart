import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var wtControler = TextEditingController();
  var ftControler = TextEditingController();
  var inControler = TextEditingController();
  var result = "";
  var bgColor = Colors.grey.shade100;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text("BMI")),
      ),
      body: Container(
        color: bgColor,
        child: Center(
          child: Container(
            width: 300,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "BMI",
                  style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
                ),
                TextField(
                  controller: wtControler,
                  decoration: const InputDecoration(
                      label: Text("Enter Your Weight"),
                      prefixIcon: Icon(Icons.line_weight)),
                  keyboardType: TextInputType.phone,
                ),
                const SizedBox(
                  height: 10,
                ),
                TextField(
                  controller: ftControler,
                  decoration: const InputDecoration(
                      label: Text("Enter Your height in Feet"),
                      prefixIcon: Icon(Icons.height)),
                  keyboardType: TextInputType.phone,
                ),
                const SizedBox(
                  height: 10,
                ),
                TextField(
                  controller: inControler,
                  decoration: const InputDecoration(
                      label: Text("Enter Your Height in inch "),
                      prefixIcon: Icon(Icons.height)),
                  keyboardType: TextInputType.phone,
                ),
                const SizedBox(
                  height: 5,
                ),
                ElevatedButton(
                    onPressed: () {
                      var wt = wtControler.text.toString();
                      var ft = ftControler.text.toString();
                      var inch = inControler.text.toString();

                      if (wt != "" && ft != "" && inch != "") {
                        var iWt = int.parse(wt);
                        var iFt = int.parse(ft);
                        var iInch = int.parse(inch);

                        var tInch = (iFt * 12) + iInch;
                        var tCM = tInch * 2.54;
                        var tM = tCM / 100;

                        var bmi = iWt / (tM * tM);
                        var msg = "";

                        if (bmi > 25) {
                          msg = "You are over weight!! ";
                          bgColor = Colors.orange.shade200;
                        } else if (bmi < 18) {
                          msg = "You are under Weight";
                          bgColor = Colors.red.shade200;
                        } else {
                          msg = "You are Healthy!! ";
                          bgColor = Colors.green;
                        }

                        setState(() {
                          result =
                              " $msg \n your BMI is : ${bmi.toStringAsFixed(4)}";
                        });
                      } else {
                        setState(() {
                          result = "please fill all the required blanks";
                        });
                      }
                    },
                    child: const Text('Calculate')),
                Text(
                  result,
                  style: const TextStyle(fontSize: 19),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
