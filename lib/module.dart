import 'package:flutter/material.dart';


class Module extends StatelessWidget {
  const Module({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Select Module'),
      ),
      body: const Semlist(),
    );
  }
}

class Semlist extends StatelessWidget {
  const Semlist({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(
        left: 24,
        right: 24,
        top: 24,
      ),
      height: 404,
      child: ListView.separated(
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return Container(
            height: 50,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                    color: Colors.black.withOpacity(0.05),
                    blurRadius: 3,
                    spreadRadius: 4)
              ],
              color: Colors.blue,
            ),
            child: Center(
              child: TextButton(
                child: const Text("Module 1",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w900,
                  fontSize: 18
                ),
                ),
                 onPressed: () {
                        Navigator.of(context).pushNamed('type');}
                ),
            ),
          );
        },
        itemCount: 6,
        separatorBuilder: (context, index) {
          return const Divider();
        },
      ),
    );
  }
}
