import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class File extends StatelessWidget {
  const File({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Select File'),
      ),
      body: const Ss(),
    );
  }
}

class Ss extends StatelessWidget {
  const Ss({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [const Semlist(), const Tt()],
    );
  }
}

class Tt extends StatelessWidget {
  const Tt({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextButton(
            onPressed: () async {
              const url = 'https://blog.logrocket.com';
              if (await canLaunchUrl(Uri.parse(url))) {
                await launch(url, forceWebView: true, enableJavaScript: true);
              } else {
                throw 'Could not launch $url';
              }
            },
            child: const Text("click me")),
        Image.network(
          'https://wallpapercave.com/wp/wp11186570.jpg',
          width: 200.0,
        ),
      ],
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
                  child: const Text(
                    "File 1",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w900,
                        fontSize: 18),
                  ),
                  onPressed: () {
                    Navigator.of(context).pushNamed('file');
                  }),
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
