import 'package:flutter/material.dart';
import 'package:flutter_color_plugin/flutter_color_plugin.dart';

void main() => runApp(StatefulGroup());

class StatefulGroup extends StatefulWidget {
  @override
  _StatefulGroupState createState() => _StatefulGroupState();
}

class _StatefulGroupState extends State<StatefulGroup> {
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
          leading: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(Icons.arrow_back),
          ),
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
                          Image.network(
                            'https://wallet-oss.yanuoda.shop/seAdvertisement/20200528/-1739383555961196.jpg',
                            width: 350,
                            height: 150,
                          ),
                          TextField(
                            decoration: InputDecoration(
                                contentPadding: EdgeInsets.fromLTRB(5, 0, 0, 0),
                                hintText: '请输入',
                                hintStyle: TextStyle(fontSize: 16)),
                          ),
                          Container(
                            height: 100,
                            margin: EdgeInsets.only(top: 10),
                            decoration: BoxDecoration(color: Colors.blue),
                            child: PageView(
                              children: <Widget>[
                                _item('page1', Colors.amber),
                                _item('page2', Colors.lightGreenAccent),
                                _item('page3', Colors.greenAccent)
                              ],
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
                onRefresh: _handleRefresh)
            : Text('List Page'),
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
}
