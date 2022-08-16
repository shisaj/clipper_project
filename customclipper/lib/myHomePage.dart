import 'dart:ui';

import 'package:flutter/material.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('curve'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            color: Colors.white,
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                FlutterLogo(
                  size: 70,
                ),
                Text(
                  'Welcome to Busble',
                  style: TextStyle(fontSize: 20),
                ),
                Text('lorem mnlb  ,mnkjdva  kjhf / lkajgvj'),
              ],
            ),
          ),
          curveDesignWidget(context), //function
          Container(
            padding: const EdgeInsets.all(20),
            height: 400,
            child: Column(
              children: [
                const TextField(
                  decoration: InputDecoration(
                    labelText: 'Name',
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                const TextField(
                  decoration: InputDecoration(
                    labelText: 'Email',
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                TextButton(
                  style: TextButton.styleFrom(
                    fixedSize: Size(400, 50),
                    backgroundColor: Colors.blue,
                    primary: Colors.white,
                  ),
                  onPressed: () {},
                  child: Text('Login to continue'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget curveDesignWidget(BuildContext context) {
    return Container(
      color: Colors.white,
      height: 100,
      child: Stack(children: [
        ClipPath(
            clipper: CustomClipPath(
                //class
                clipHeightx2: 80,
                clipWidthx2: 10,
                clipHeightx1: 0,
                clipWidthx1: 0.5),
            child: Container(height: 80, color: Colors.blue.shade300)),
        ClipPath(
            clipper: CustomClipPath(
                //class
                clipHeightx2: 60,
                clipWidthx2: 10,
                clipHeightx1: 0,
                clipWidthx1: 0.5),
            child: Container(height: 60, color: Colors.blue.shade600)),
        ClipPath(
          clipper: CustomClipPath(
              //class
              clipHeightx2: 40,
              clipWidthx2: 10,
              clipHeightx1: 0,
              clipWidthx1: 0.5),
          child: Container(height: 40, color: Colors.white),
        ),
      ]),
    );
  }
}

class CustomClipPath extends CustomClipper<Path> {
  final clipHeightx1;
  final clipWidthx1;
  final clipHeightx2;
  final clipWidthx2;

  CustomClipPath(
      {this.clipHeightx1,
      this.clipWidthx1,
      this.clipHeightx2,
      this.clipWidthx2});

  @override
  Path getClip(Size size) {
    double height = size.height;
    double width = size.width;

    Path path = Path();
    path.lineTo(0.0, height - 15);
    // path.quadraticBezierTo(width + width, height - height, width + width, 0);
    path.quadraticBezierTo(width * clipWidthx1, height - clipHeightx1, width,
        height - clipHeightx2);
    path.lineTo(width, height);
    path.lineTo(width, 0.0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => true;
}
