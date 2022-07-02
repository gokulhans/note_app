import 'dart:convert';
import 'dart:developer';

import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:note_app/data/data.dart';
import 'package:note_app/semester.dart';
import 'package:note_app/subject.dart';
import 'package:note_app/module.dart';
import 'package:note_app/type.dart';
import 'package:note_app/file.dart';
import 'package:note_app/login.dart';
import 'package:note_app/signup.dart';
import 'package:note_app/sidebar.dart';
import 'package:note_app/splashscreen.dart';
import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(const MyApp());
}

class FetchData extends StatefulWidget {
  const FetchData({Key? key}) : super(key: key);

  @override
  _FetchDataState createState() => _FetchDataState();
}

class _FetchDataState extends State<FetchData> {
  Future getUserData() async {
    var response =
        await http.get(Uri.https('studygramcu.herokuapp.com', 'courses') );
    var jsonData = jsonDecode(response.body);
    
    List<User> users = [];

    for (var u in jsonData) {
      User user = User(u["_id"], u["name"], u["item"]);
      users.add(user);
    }
   
    print(users);
    return users;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          child: Card(
              child: FutureBuilder(
                  future: getUserData(),
                  builder: (context, AsyncSnapshot snapshot ) {
                    if (snapshot.data == null) {
                      return Center(
                        child: Text('loading'),
                      );
                    } else {
                      return ListView.builder(
                          itemCount: snapshot.data.length,
                          itemBuilder: (context, i) {
                            return ListTile(
                              title: Text(snapshot.data[i].item),
                              subtitle: Text(snapshot.data[i].name),
                              trailing: Text(snapshot.data[i].id),
                            );
                          });
                    }
                  }))),
    );
  }
}

class User {
  final String _id, name, item;

  User(this._id, this.name, this.item);
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        // home: MainPage(),
        home: const FetchData(),
        routes: {
          'semester': (ctx) {
            return const Semester();
          },
          'subject': (ctx) {
            return const Subject();
          },
          'module': (ctx) {
            return const Module();
          },
          'type': (ctx) {
            return const Type();
          },
          'file': (ctx) {
            return const File();
          },
          'login': (ctx) {
            return const MyLogin();
          },
          'signup': (ctx) {
            return const MyRegister();
          },
          'splash': (ctx) {
            return const Splash();
          },
        });
  }
}

class Test extends StatelessWidget {
  const Test({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120.0,
      width: 120.0,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('images/logo.png'),
          fit: BoxFit.fill,
        ),
        shape: BoxShape.circle,
      ),
    );
  }
}

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavDrawer(),
      appBar: AppBar(
        backgroundColor: Colors.white,
        bottomOpacity: 0.0,
        elevation: 0.0,
        centerTitle: true,
        title: const Text(
          "Studygram",
          style: TextStyle(
              color: Colors.black, fontSize: 20, fontWeight: FontWeight.w800),
        ),
        actions: [
          IconButton(
            padding: EdgeInsets.symmetric(horizontal: 24),
            icon: Badge(
              child: Icon(
                Icons.notifications,
                color: Colors.teal,
              ),
              showBadge: true,
              badgeContent: Text(""),
            ),
            onPressed: () {},
          )
        ],
        iconTheme: IconThemeData(color: Colors.green),
      ),
      body: SingleChildScrollView(
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
                Container(
                  child: Column(
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
                        child: Text("TEST"),
                        onPressed: () {
                          print('clicked');
                          final data = saveNote();
                          print(data);
                          // Navigator.of(context).pushNamed('semester');
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
                        child: Text("BA English"),
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
                ),
              ],
            )
          ]),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: 0,
          unselectedLabelStyle: const TextStyle(
            color: Colors.grey,
          ),
          selectedIconTheme: const IconThemeData(
            color: Colors.green,
          ),
          selectedLabelStyle: const TextStyle(
            color: Colors.green,
          ),
          unselectedIconTheme: const IconThemeData(
            color: Colors.grey,
          ),
          showSelectedLabels: true,
          type: BottomNavigationBarType.fixed,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(icon: Icon(Icons.book), label: 'Courses'),
            BottomNavigationBarItem(
                icon: Icon(Icons.graphic_eq_outlined), label: 'Trending'),
            BottomNavigationBarItem(
                icon: Icon(Icons.account_circle), label: 'Profile'),
          ]),
    );
  }

  Future<void> saveNote() async {
    final test = NoteDB().test();
    print(test);
    return test;
  }
}
