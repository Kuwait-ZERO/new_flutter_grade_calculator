import 'package:flutter/material.dart';

void main() {
  runApp(GradeCalculatorApp());
}

class GradeCalculatorApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Grade Calculator',
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  @override
  HomeScreenState createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  final scoreController = TextEditingController();
  String grade = '';

  void calculateGrade() {                 // made this funtion seperatly to just call it in the onPressed
    var score = double.parse(scoreController.text);
    if (scoreController.text.isNotEmpty) {
      setState(() {
        if (score >= 90) {
          grade = 'A';
        } else if (score >= 80) {
          grade = 'B';
        } else if (score >= 70) {
          grade = 'C';
        } else if (score >= 60) {
          grade = 'D';
        } else {
          grade = 'F';
        }
      });
    } else {
      setState(() {
        grade = 'invalid';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 244, 118, 160),
        title: Text('Grade_Calculator'),
        centerTitle: true,
      ),
      body: Container(
        padding: const EdgeInsets.all(30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextField(                              // Text field 
              controller: scoreController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                hintText: 'Type your score',
                border: OutlineInputBorder(),

                enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(30), // circular border 
      borderSide: BorderSide(
        color: Colors.blue, // border color 
        width: 2,
      ),
    ),

                
              ),
            ),
            
            Container(height: 50),  // Calculate button
            Container(
              width: 150,
              height: 50,
              child: ElevatedButton.icon(
                icon: Icon(Icons.calculate), // calculate icon
                label: Text(
                  'Calculate',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color.fromARGB(255, 250, 137, 175)
                ),
                onPressed: calculateGrade,
              ),
            ),
            Container(height: 50), 
            Text(
              grade,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(255, 222, 76, 125),
                fontSize: 40,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
