import 'package:flutter/material.dart';
import '../page/search_textField/search_text.dart';
import '../LoginModel/subJect_model.dart';
import '../Request/http_util.dart';
import 'dart:convert';
import 'package:convert/convert.dart';
import 'package:crypto/crypto.dart';
// import 'package:cipher2/cipher2.dart';
import 'dart:io';
import '../Request/request.dart';
import '../page/home_app_bar.dart' as myapp;

class homePage extends StatefulWidget {
  @override
  _homePageState createState() => _homePageState();
}

var _tabs = ['动态', '推荐'];

class _homePageState extends State<homePage> {
  @override
  Widget build(BuildContext context) {
    print(
        'homepage');

    return DefaultTabController(
      length: 2,
      initialIndex: 0,
      child: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverOverlapAbsorber(
              handle: NestedScrollView.sliverOverlapAbsorberHandleFor(context),
              child: myapp.SliverAppBar(
                pinned: true,
                expandedHeight: 120.0,
                primary: true,
                titleSpacing: 0.0,
                backgroundColor: Colors.redAccent,
                flexibleSpace: FlexibleSpaceBar(
                  collapseMode: CollapseMode.pin,
                  background: Container(
                    color: Colors.cyanAccent,
                    child: SearchTextField(
                      hinText: '数据库显示',
                      margin: EdgeInsets.only(left: 15, right: 15),
                      onTab: () {},
                    ),
                    alignment: AlignmentDirectional.center,
                  ),
                ),
                bottomTextString: _tabs,
                bottom: TabBar(
                  tabs: _tabs
                      .map((f) => Container(
                            child: Text(
                              f,
                              style: TextStyle(
                                  color: Colors.lightGreen, fontSize: 32),
                            ),
                            padding: EdgeInsets.only(bottom: 5),
                          ))
                      .toList(),
                ),
              ),
            ),
          ];
        },
        body: TabBarView(
          children: _tabs
              .map((f) => new SliverContainer(
                    name: f,
                  ))
              .toList(),
        ),
      ),
    );
  }
}

class _SliverContainerState extends State<SliverContainer> {
  List<Subject> listsubject_model;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print('homeSliverContainer');
  }

  @override
  Widget build(BuildContext context) {
    print( '1');
    if (widget.name == _tabs[0]) {
      return Align(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 15.0, bottom: 25.0),
              child: Text(
                '登录后查看',
                style: TextStyle(fontSize: 16.0, color: Colors.grey),
              ),
            ),
            GestureDetector(
              child: Container(
                child: Text(
                  '登录本拉登',
                  style: TextStyle(color: Colors.lightGreen, fontSize: 32),
                ),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.green),
                  borderRadius: BorderRadius.all(Radius.circular(4)),
                ),
              ),
            ),
          ],
        ),
      );
    }
    print( '2');
    return SafeArea(
      top: false,
      bottom: false,
      child: Builder(
        builder: (BuildContext context) =>buildCustomScrollView(context),
      ),
    );
  }

  CustomScrollView buildCustomScrollView(BuildContext context) {
  print( '3');

    return CustomScrollView(
      physics: BouncingScrollPhysics(),
      // key: Pag,
      slivers: <Widget>[
        SliverOverlapInjector(
          handle: NestedScrollView.sliverOverlapAbsorberHandleFor(context),
        ),
        SliverList(
          delegate: SliverChildBuilderDelegate(
            ((BuildContext context, int index) {
              return Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        CircleAvatar(backgroundColor: Colors.yellowAccent,child: Icon(Icons.ac_unit),radius: 25,),
                        Padding(padding: EdgeInsets.all(4),child: Text('data'),),
                        Expanded(child: Align(child: Icon(Icons.access_alarm), alignment: Alignment.centerRight,),),

                      ],
                    ),
                    Expanded(
                      child: Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: <Widget>[
                            Expanded(
                              child: Card(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.all(Radius.circular(20)),
                                  
                                ),
                                color: Colors.yellow,
                                clipBehavior: Clip.antiAlias,
                                // child: Image.network(
                                  
                                // ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              );
            }),
            childCount: 5,
          ),
        ),
      ],
    );
  }
}

class SliverContainer extends StatefulWidget {
  final String name;

  const SliverContainer({Key key, this.name}) : super(key: key);

  @override
  _SliverContainerState createState() => _SliverContainerState();
}
