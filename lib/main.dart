import 'dart:io';
import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart' show timeDilation; // 动画执行速度

class Photo extends StatelessWidget {
  const Photo({Key key, this.photo, this.color, this.onTap}) : super(key: key);

  final String photo;
  final VoidCallback onTap;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Theme.of(context)
          .primaryColor
          .withOpacity(0.25), //            InkWell 墨水池
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
    );
  }
}

class RadialExpansion extends StatelessWidget {
  RadialExpansion({Key key, this.maxRadius, this.child})
      : clipRectSize = 2.0 * (maxRadius / math.sqrt2),
        super(key: key);

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
  static const opacityCurve =
      const Interval(0.0, 0.75, curve: Curves.fastOutSlowIn);

  static RectTween _createRectTween(Rect begin, Rect end) {
    //    方形到圆形的辅助类
    return MaterialRectArcTween(begin: begin, end: end);
  }

//  创建页面
  static Widget _buildPage(
      BuildContext context, String imageName, String description) {
    return Container(
      color: Theme.of(context).canvasColor, // 主题canvasColor
      child: Center(
        child: Card(
          elevation: 8.0, // 阴影
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              SizedBox(
                width: kMaxRadius * 2.0,
                height: kMaxRadius * 2.0,
                child: Hero(
                    // createRectTween 描述形状变化
                    createRectTween: _createRectTween,
                    tag: imageName,
                    child: RadialExpansion(
                      maxRadius: kMaxRadius,
                      child: Photo(
                        photo: imageName,
                        onTap: () {
                          Navigator.of(context).pop();
                        },
                      ),
                    )),
              ),
              Text(
                description,
                style: TextStyle(fontWeight: FontWeight.bold),
                textScaleFactor: 3.0,
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHero(
      BuildContext context, String imageName, String description) {
    return Container(
      width: kMinRadius * 2,
      height: kMinRadius * 2,
      child: Hero(
          createRectTween: _createRectTween,// 镜像动画与普通动画的区别
          tag: imageName,
          child: RadialExpansion(
            maxRadius: kMaxRadius,
            child: Photo(
              photo: imageName,
              onTap: () {
                //  PageRouteBuilder生成一次性路由
                Navigator.of(context).push(PageRouteBuilder<void>(pageBuilder:
                    (BuildContext context, Animation<double> animation,
                        Animation<double> secondaryAnimation) {
                  // AnimatedBuilder 回调改变当前页面opacity值
                  return AnimatedBuilder(
                    animation: animation,
                    builder: (BuildContext context, Widget child) {
                      return Opacity(
                        opacity: opacityCurve.transform(animation.value),
                        child: _buildPage(context, imageName, description),
                      );
                    },
                  );
                }));
              },
            ),
          )),
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
            mainAxisAlignment: MainAxisAlignment.spaceBetween, // 横向排列平分
            children: [
              _buildHero(
                  context,
                  'https://www.cume.cc/img/small_banner_3.jpg',
                  'Chair'),
              _buildHero(
                  context,
                  'https://www.cume.cc/img/small_banner_2.jpg',
                  'Binoculars'),
              _buildHero(
                  context,
                  'https://www.cume.cc/img/small_banner_4.jpg',
                  'Beach ball'),
            ],
          ),
        ));
  }
}

void main() {
  runApp(MaterialApp(
    home: RadialExpansionDemo(),
  ));
}
