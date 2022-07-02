import 'package:flutter/material.dart';

class Semester extends StatelessWidget {
  const Semester({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Select Semester'),
      ),
      body: const Semlist(),
    );
  }
}

class Semlist extends StatelessWidget {
  const Semlist({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
        child: GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
      ),
      primary: false,
      padding: const EdgeInsets.all(20),
      itemCount: 6,
      itemBuilder: (context, index) {
        return TextButton(
          child: Column(
            children: <Widget>[
              Container(
                height: 60,
                width: 64,
                decoration: BoxDecoration(
                    color: Colors.red,
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black.withOpacity(0.05),
                          blurRadius: 3,
                          spreadRadius: 4)
                    ]),
                child: const Center(
                    child: Text(
                  "S1",
                  style: TextStyle(
                      fontWeight: FontWeight.w900,
                      fontSize: 18,
                      color: Colors.white),
                )),
              ),
              SizedBox(
                height: 8,
              ),
              Text("Semester 1")
            ],
          ),
          onPressed: () {
            Navigator.of(context).pushNamed('subject');
          },
        );
      },
    ));
  }
}
