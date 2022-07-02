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
        crossAxisCount: 2,
      ),
      primary: false,
      padding: const EdgeInsets.all(20),
      itemCount: 20,
      itemBuilder: (context, index) {
        return Container(
          padding: const EdgeInsets.all(20),
          child: InkWell(
            child: Container(
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  color: Colors.blue),
              padding: const EdgeInsets.all(8),
              child: const Center(
                  child: Text(
                "Tile 3",
                style:
                    TextStyle(fontWeight: FontWeight.w800, color: Colors.white),
              )),
            ),
            onTap: () {
              Navigator.of(context).pushNamed('type');
            },
          ),
        );
      },
    ));
  }
}
