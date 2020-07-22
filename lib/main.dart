import 'dart:io';
import 'dart:math' as math;
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
            color: Theme.of(context).primaryColor.withOpacity(0.25),
//            InkWell 墨水池
            child: InkWell(
              onTap: onTap,
              child: LayoutBuilder(
                builder: (BuildContext context, BoxConstraints size) {
                  return Image.network(
                    photo,
                    fit: BoxFit.contain,
                  );
                },
              ),
            ),
          )),
    );
  }
}

class RadialExpansion extends StatelessWidget {
  RadialExpansion({
    Key key,
    this.maxRadius,
    this.child
  }) : clipRectSize = 2.0 * (maxRadius / math.sqrt2), super();

  final double maxRadius;
  final clipRectSize;
  final Widget child;

  @override
  Widget build(BuildContext context) {
//    ClipOval 可裁切
    return ClipOval(
      child: Center(
        child: SizedBox(
          width: clipRectSize,
          height: clipRectSize,
          child: ClipRect(
            child: child,
          ),
        ),
      ),
    );
  }
}

class RadialExpansionDemo extends StatelessWidget {
  static const double kMinRadius = 32.0;
  static const double kMaxRadius = 128.0;
  static const opacityCurve = const Interval(0.0, 0.75, curve: Curves.fastOutSlowIn);

  static RectTween _createRectTween(Rect begin, Rect end){
    return MaterialRectArcTween(begin: begin, end: end);
  }
//  创建页面
  static Widget _buildPage(BuildContext context, String imageName, String description) {
    return Container(
      color: Theme.of(context).canvasColor,// 主题canvasColor
      child: Center(
        child: Card(
          elevation: 8.0,// 阴影
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              SizedBox(
                width: kMaxRadius * 2.0,
                height: kMaxRadius * 2.0,
                child: Hero(
                    createRectTween: _createRectTween,
                    tag: imageName,
                    child: RadialExpansion(
                    maxRadius: kMaxRadius,
                    child: PhotoHero(
                      photo: imageName,
                      onTap: () {
                        Navigator.of(context).pop();
                      },
                  ),
                )),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHero(BuildContext context, String imageName, String description){
    return Container(
      width: kMinRadius * 2,
      height: kMinRadius * 2,
      child: Hero(
          createRectTween: _createRectTween,
          tag: imageName,
          child: RadialExpansion(
            maxRadius: kMaxRadius,
            child: PhotoHero(
              photo: imageName,
              onTap: () {
                Navigator.of(context).push(
                  PageRouteBuilder<void>(
                    pageBuilder: (BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation){
                      return AnimatedBuilder(
                        animation: animation,
                        builder: (BuildContext context, Widget child) {
                          return Opacity(
                              opacity: opacityCurve.transform(animation.value),
                            child: _buildPage(context, imageName, description),
                          );
                        },
                      );
                    }
                  )
                );
              },
            ),
          )
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    timeDilation = 10.0;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Radial Hero Animation'),
      ),
      body: Container(
        padding: const EdgeInsets.all(32.0),
        alignment: FractionalOffset.bottomLeft,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,// 横向排列平分
          children: [
            _buildHero(context, 'https://raw.githubusercontent.com/flutter/website/master/examples/_animation/radial_hero_animation/images/chair-alpha.png', 'Chair'),
            _buildHero(context, 'https://raw.githubusercontent.com/flutter/website/master/examples/_animation/radial_hero_animation/images/binoculars-alpha.png', 'Binoculars'),
            _buildHero(context, 'https://raw.githubusercontent.com/flutter/website/master/examples/_animation/radial_hero_animation/images/beachball-alpha.png', 'Beach ball'),
          ],
        ),
      )
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
    home: RadialExpansionDemo(),
  ));
}
