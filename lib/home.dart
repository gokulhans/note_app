import 'package:flutter/material.dart';


class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: MainPage(),
       
        );
  }
}



class MainPage extends StatefulWidget {
  MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset : false,
     
      body: SingleChildScrollView(
        child: Column(
          children:
            [SingleChildScrollView(
              child: Container(
                color: Colors.white,
                child: Column(children: <Widget>[
                  SizedBox(
                    height: 12,
                  ),
                  Container(
                    height: 48,
                    width: MediaQuery.of(context).size.width,
                    margin: EdgeInsets.only(left: 24, right: 24),
                    padding: EdgeInsets.only(left: 16, right: 16),
                    decoration: BoxDecoration(
                        color: Colors.blueGrey[50],
                        borderRadius: BorderRadius.circular(16)),
                    child: const TextField(
                      decoration: InputDecoration(
                        icon: Icon(
                          Icons.search,
                          size: 14,
                        ),
                        hintText: "Search for your chapter, classes...",
                        hintStyle: TextStyle(
                          fontSize: 12,
                        ),
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 24,
                  ),
                  GridView.count(
                    shrinkWrap: true,
                    crossAxisCount: 3,
                    children: <Widget>[
                      Column(
                        children: <Widget>[
                          Container(
                            height: 64,
                            width: 64,
                            decoration: BoxDecoration(
                                color: Colors.yellow,
                                shape: BoxShape.circle,
                                boxShadow: [
                                  BoxShadow(
                                      color: Colors.black.withOpacity(0.05),
                                      blurRadius: 3,
                                      spreadRadius: 4)
                                ]),
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          TextButton(
                            child: Text("Course"),
                            onPressed: () {
                              Navigator.of(context).pushNamed('semester');
                            },
                          )
                        ],
                      ),
                      Container(
                        child: Column(
                          children: <Widget>[
                            Container(
                              height: 64,
                              width: 64,
                              decoration: BoxDecoration(
                                  color: Colors.green,
                                  shape: BoxShape.circle,
                                  boxShadow: [
                                    BoxShadow(
                                        color: Colors.black.withOpacity(0.05),
                                        blurRadius: 3,
                                        spreadRadius: 4)
                                  ]),
                            ),
                            SizedBox(
                              height: 8,
                            ),
                            TextButton(
                              child: Text("Login"),
                              onPressed: () {
                                Navigator.of(context).pushNamed('login');
                                // Navigator.pushReplacement(
                                //     context,
                                //     MaterialPageRoute(
                                //         builder: (context) => Semester()));
                              },
                            )
                          ],
                        ),
                      ),
                      Container(
                        child: Column(
                          children: <Widget>[
                            Container(
                              height: 64,
                              width: 64,
                              decoration: BoxDecoration(
                                  color: Colors.blue,
                                  shape: BoxShape.circle,
                                  boxShadow: [
                                    BoxShadow(
                                        color: Colors.black.withOpacity(0.05),
                                        blurRadius: 3,
                                        spreadRadius: 4)
                                  ]),
                            ),
                            SizedBox(
                              height: 8,
                            ),
                            TextButton(
                              child: Text("SignUp"),
                              onPressed: () {
                                Navigator.of(context).pushNamed('signup');
                                // Navigator.pushReplacement(
                                //     context,
                                //     MaterialPageRoute(
                                //         builder: (context) => Semester()));
                              },
                            )
                          ],
                        ),
                      ),
                      Container(
                        child: Column(
                          children: <Widget>[
                            Container(
                              height: 64,
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
                            ),
                            SizedBox(
                              height: 8,
                            ),
                            TextButton(
                              child: Text("Splash"),
                              onPressed: () {
                                Navigator.of(context).pushNamed('splash');
                                // Navigator.pushReplacement(
                                //     context,
                                //     MaterialPageRoute(
                                //         builder: (context) => Semester()));
                              },
                            )
                          ],
                        ),
                      ),
                      Container(
                        child: Column(
                          children: <Widget>[
                            Container(
                              height: 64,
                              width: 64,
                              decoration: BoxDecoration(
                                  color: Colors.purple,
                                  shape: BoxShape.circle,
                                  boxShadow: [
                                    BoxShadow(
                                        color: Colors.black.withOpacity(0.05),
                                        blurRadius: 3,
                                        spreadRadius: 4)
                                  ]),
                            ),
                            SizedBox(
                              height: 8,
                            ),
                            TextButton(
                              child: Text("BSc Physics"),
                              onPressed: () {
                                Navigator.of(context).pushNamed('semester');
                                // Navigator.pushReplacement(
                                //     context,
                                //     MaterialPageRoute(
                                //         builder: (context) => Semester()));
                              },
                            )
                          ],
                        ),
                      ),
                      Container(
                        child: Column(
                          children: <Widget>[
                            Container(
                              height: 64,
                              width: 64,
                              decoration: BoxDecoration(
                                  color: Colors.lightGreenAccent,
                                  shape: BoxShape.circle,
                                  boxShadow: [
                                    BoxShadow(
                                        color: Colors.black.withOpacity(0.05),
                                        blurRadius: 3,
                                        spreadRadius: 4)
                                  ]),
                            ),
                            SizedBox(
                              height: 8,
                            ),
                            TextButton(
                              child: Text("BSc Chemistry"),
                              onPressed: () {
                                Navigator.of(context).pushNamed('semester');
                                // Navigator.pushReplacement(
                                //     context,
                                //     MaterialPageRoute(
                                //         builder: (context) => Semester()));
                              },
                            )
                          ],
                        ),
                      ),
                      Container(
                        child: Column(
                          children: <Widget>[
                            Container(
                              height: 64,
                              width: 64,
                              decoration: BoxDecoration(
                                  color: Colors.green,
                                  shape: BoxShape.circle,
                                  boxShadow: [
                                    BoxShadow(
                                        color: Colors.black.withOpacity(0.05),
                                        blurRadius: 3,
                                        spreadRadius: 4)
                                  ]),
                            ),
                            SizedBox(
                              height: 8,
                            ),
                            TextButton(
                              child: Text("BSc Maths"),
                              onPressed: () {
                                Navigator.of(context).pushNamed('semester');
                                // Navigator.pushReplacement(
                                //     context,
                                //     MaterialPageRoute(
                                //         builder: (context) => Semester()));
                              },
                            )
                          ],
                        ),
                      ),
                      Container(
                        child: Column(
                          children: <Widget>[
                            Container(
                              height: 64,
                              width: 64,
                              decoration: BoxDecoration(
                                  color: Colors.blue,
                                  shape: BoxShape.circle,
                                  boxShadow: [
                                    BoxShadow(
                                        color: Colors.black.withOpacity(0.05),
                                        blurRadius: 3,
                                        spreadRadius: 4)
                                  ]),
                            ),
                            const SizedBox(
                              height: 8,
                            ),
                            TextButton(
                              child: Text("New Note"),
                              onPressed: () {
                                Navigator.of(context).pushNamed('new');
                                // Navigator.pushReplacement(
                                //     context,
                                //     MaterialPageRoute(
                                //         builder: (context) => Semester()));
                              },
                            )
                          ],
                        ),
                      ),
                      Column(
                        children: <Widget>[
                          Container(
                            height: 64,
                            width: 64,
                            decoration: BoxDecoration(
                                color: Colors.yellow,
                                shape: BoxShape.circle,
                                boxShadow: [
                                  BoxShadow(
                                      color: Colors.black.withOpacity(0.05),
                                      blurRadius: 3,
                                      spreadRadius: 4)
                                ]),
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          TextButton(
                            child: Text("BA Statistics"),
                            onPressed: () {
                              Navigator.of(context).pushNamed('semester');
                              // Navigator.pushReplacement(
                              //     context,
                              //     MaterialPageRoute(
                              //         builder: (context) => Semester()));
                            },
                          ),
                        ],
                      ),
                    ],
                  )
                ]),
              ),
            ),
          ],
        ),
      ),
    );
  }
}