import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_color_plugin/flutter_color_plugin.dart';

void main() => runApp(FlutterLayoutPages());

class FlutterLayoutPages extends StatefulWidget {
  @override
  FlutterLayoutPage createState() => FlutterLayoutPage();
}

class FlutterLayoutPage extends State<FlutterLayoutPages> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    TextStyle textStyle = TextStyle(fontSize: 20);
    return MaterialApp(
      title: 'StatefulWidget与基础组件',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('StatefulWidget与基础组件'),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.share),
              onPressed: () {},
            )
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentIndex,
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
          items: [
            BottomNavigationBarItem(
                icon: Icon(Icons.home, color: Colors.grey),
                activeIcon: Icon(Icons.home, color: Colors.blue),
                title: Text('Home')),
            BottomNavigationBarItem(
                icon: Icon(Icons.list, color: Colors.grey),
                activeIcon: Icon(Icons.list, color: Colors.blue),
                title: Text('List'))
          ],
        ),
//        drawer: new MyDrawer(),
        floatingActionButton: FloatingActionButton(
          child: Text('点我'),
        ),
        body: _currentIndex == 0
            ? RefreshIndicator(
                child: ListView(
                  children: <Widget>[
                    Container(
                      decoration: BoxDecoration(color: Colors.white),
                      alignment: Alignment.center,
                      child: Column(
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              ClipOval(
                                child: SizedBox(
                                  width: 100,
                                  height: 100,
                                  child: Image.network(
                                      'http://img14.360buyimg.com/ads/jfs/t1/91232/33/5417/154239/5dedbc79E7c0c2390/89e64e75b116c457.jpg'),
                                ),
                              ),
                              Padding(
                                  padding: EdgeInsets.all(10),
                                  child: ClipRRect(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10)),
                                    child: Opacity(
                                      opacity: 0.6,
                                      child: Image.network(
                                        'http://img14.360buyimg.com/ads/jfs/t1/91232/33/5417/154239/5dedbc79E7c0c2390/89e64e75b116c457.jpg',
                                        width: 100,
                                        height: 100,
                                      ),
                                    ),
                                  ))
                            ],
                          ),
                          TextField(
                            decoration: InputDecoration(
                                contentPadding: EdgeInsets.fromLTRB(5, 0, 0, 0),
                                hintText: '请输入',
                                hintStyle: TextStyle(fontSize: 16)),
                          ),
                          Container(
                            height: 100,
                            margin: EdgeInsets.all(10),
//                            decoration: BoxDecoration(color: Colors.blue),
                            child: PhysicalModel(
                              color: Colors.transparent,
                              // 抗锯齿
                              clipBehavior: Clip.antiAlias,
                              borderRadius: BorderRadius.circular(6),
                              child: PageView(
                                children: <Widget>[
                                  _item('page1', Colors.amber),
                                  _item('page2', Colors.lightGreenAccent),
                                  _item('page3', Colors.greenAccent)
                                ],
                              ),
                            ),
                          ),
                          Column(
                            children: <Widget>[
//                              撑满宽度
                              FractionallySizedBox(
                                widthFactor: 1,
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: Colors.greenAccent,
                                  ),
                                  child: Text('撑满宽度'), // 单文字宽度
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                    Stack(
                      children: <Widget>[
                        Image.network(
                          'http://img14.360buyimg.com/ads/jfs/t1/91232/33/5417/154239/5dedbc79E7c0c2390/89e64e75b116c457.jpg',
                          width: 100,
                          height: 100,
                        ),
                        Positioned(
                          left: 0,
                          bottom: 0,
                          child: Image.network(
                            'http://img14.360buyimg.com/ads/jfs/t1/91232/33/5417/154239/5dedbc79E7c0c2390/89e64e75b116c457.jpg',
                            width: 36,
                            height: 36,
                          ),
                        )
                      ],
                    ),
                    Wrap(
                      spacing: 8, // 水平间距
                      runSpacing: 6, //  垂直间距
                      children: <Widget>[
                        _clip('哈哈'),
                        _clip('嘻嘻'),
                        _clip('啦啦'),
                        _clip('呼呼'),
                        _clip('哈哈2'),
                        _clip('嘻嘻2'),
                        _clip('啦啦2'),
                        _clip('呼呼2'),
                      ],
                    )
                  ],
                ),
                onRefresh: _handleRefresh)
            : Column(
                children: <Widget>[
                  Text('List'),
                  //  可用空间 纵向填充填满
                  Expanded(
                      child: Container(
                    decoration: BoxDecoration(color: Colors.red),
                    child: Text('拉伸填满高度'),
                  ))
                ],
              ),
      ),
    );
  }

//  执行顺序和创建Future的先后顺序有关，如果遇到多个 then 嵌套，先执行外面的 then，然后再执行里面的then，如果then里面还有创建Future，要等到then执行完毕，之后执行Future
  Future<Null> _handleRefresh() async {
    //    一个延时
    await Future.delayed(Duration(microseconds: 200));
  }

  _item(String title, Color color) {
    return Container(
      color: color,
      alignment: Alignment.center,
      child: Text(
        title,
        style: TextStyle(fontSize: 20, color: Colors.white),
      ),
    );
  }

  _clip(String label) {
    return Chip(
      backgroundColor: Colors.grey,
      label: Text(label),
      avatar: CircleAvatar(
        backgroundColor: Colors.blue.shade900,
        child: Text(
          label.substring(0, 1).toUpperCase(),
          style: TextStyle(fontSize: 14),
        ),
      ),
    );
  }
}
