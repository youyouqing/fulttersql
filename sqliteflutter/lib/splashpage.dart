import 'dart:async';
import 'dart:developer';
import 'package:sqliteflutter/Login.dart';

import 'package:flutter/material.dart';
import 'package:sqliteflutter/Login.dart';
import 'dart:ui';
import './configs/configs.dart';
class splashPage extends StatefulWidget {
  @override
  _splashPageState createState() => _splashPageState();
}

class _splashPageState extends State<splashPage> {
  bool showAdervise = true;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Offstage(
          child: LoginPage(),
          offstage: showAdervise,
        ),
        Offstage(
          child: Container(
            color: Colors.white,
            child: Stack(
              children: <Widget>[
                buildAlign(context),
                buildSafeArea(),

              ],
            ),
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
          ),
          offstage: !showAdervise,
        ),
      ],
    );
    
  }

  SafeArea buildSafeArea() {
    return SafeArea(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Align(
                      alignment: Alignment(0, 0),
                      child: Container(
                        margin: EdgeInsets.only(top: 30,right: 20),
                        padding: EdgeInsets.symmetric(horizontal: 10,vertical: 2),
                        child: CountDownWidget(
                          onCountDownFinishCallBack: (bool value){
                            if(value){
                              setState(() {
                                
                                showAdervise = false;

                              });
                            }
                          },
                        ),
                      decoration: BoxDecoration(
                        color: Color(0xffededed),
                        borderRadius: BorderRadius.all(Radius.circular(10)),

                      ),
                      ),
                      
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 40.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Image.asset(
                                Configs.ASSETS_IMG + 'ic_launcher.png',
                                width: 50.0,
                                height: 50.0,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 10.0),
                                child: Text(
                                  'Hi,Demo',
                                  style: TextStyle(
                                      color: Colors.green,
                                      fontSize: 30.0,
                                      fontWeight: FontWeight.bold),
                                ),
                              )
                            ],
                          ),
                        ),
                  ],
                ),
              );
  }

  Align buildAlign(BuildContext context) {
    return Align(
                alignment: Alignment(0,0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    CircleAvatar(
                      radius: MediaQuery.of(context).size.width/3,
                      backgroundColor: Colors.white,
                      backgroundImage: AssetImage(Configs.ASSETS_IMG+'home.png'),
                      
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 20),
                       child: Text(
                        '落花有意随流水,流水无心恋落花',
                        style: TextStyle(fontSize: 15.0, color: Colors.black),
                      ),
                    ),
                  ],
              ),
              );
  }
}
//定时器  6秒后启动图消失
class CountDownWidget extends StatefulWidget {
  final onCountDownFinishCallBack;

  const CountDownWidget({Key key, this.onCountDownFinishCallBack}) : super(key: key);

  @override
  _CountDownWidgetState createState() => _CountDownWidgetState();
}

class _CountDownWidgetState extends State<CountDownWidget> {
  var _seconds = 6;
  Timer _timer ;

@override
  void initState() {
    // TODO: implement initState
    super.initState();
    _startTimer();
  }

  @override
  Widget build(BuildContext context) {
    return Text(
       '$_seconds',
        style: TextStyle(fontSize: 17.0),

     );
  }

  /// 启动倒计时的计时器。
  void _startTimer(){
    _timer = Timer.periodic(Duration(seconds: 1), (timer){
      setState(() {
        if(_seconds<=1){
          widget.onCountDownFinishCallBack(true);
          _cancelTimer();
          return;
        }
        _seconds--;
      });
    });
  }
  void _cancelTimer(){
    _timer?.cancel();
  }
}
