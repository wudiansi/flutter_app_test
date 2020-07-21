import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart' show timeDilation; // 动画执行速度

class PhotoHero extends StatelessWidget {
  const PhotoHero({Key key, this.photo, this.onTap, this.width})
      : super(key: key);

  final String photo;
  final VoidCallback onTap;
  final double width;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: Hero(
          tag: photo, // 通过tag标识
          child: Material(
            color: Colors.transparent,
//            InkWell 墨水池
            child: InkWell(
              onTap: onTap,
              child: Image.network(photo, fit: BoxFit.contain),
            ),
          )),
    );
  }
}

class HeroAnimation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    timeDilation = 10.0;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Basic Hero Animation'),
      ),
      body: Center(
        child: PhotoHero(
          photo: 'https://www.cume.cc/img/partner/avatar_white.png',
          width: 300.0,
          onTap: () {
//            of(context) 上下文
            Navigator.of(context)
                .push(MaterialPageRoute<void>(builder: (BuildContext context) {
              return Scaffold(
                appBar: AppBar(
                  title: const Text('Flippers Page'),
                ),
                body: Container(
                  color: Colors.lightGreenAccent,
                  padding: const EdgeInsets.all(16.0),
                  alignment: Alignment.topLeft,
                  child: PhotoHero(
                    photo: 'https://www.cume.cc/img/partner/avatar_white.png',
                    width: 100.0,
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                  ),
                ),
              );
            }));
          },
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: HeroAnimation(),
  ));
}
