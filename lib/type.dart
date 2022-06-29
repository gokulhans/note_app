import 'package:flutter/material.dart';


class Type extends StatelessWidget {
  const Type({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Select Type'),
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
                child: const Text("Type 1",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w900,
                  fontSize: 18
                ),
                ),
                 onPressed: () {
                        Navigator.of(context).pushNamed('file');}
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
