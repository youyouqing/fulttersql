import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:sqliteflutter/page/dataPage.dart' as prefix0;
import 'package:sqliteflutter/page/home.dart';
import 'package:sqliteflutter/tabBar.dart';
import '../page/mine.dart';
import '../page/dataPage.dart';
class Routerss{
  static const root = '/';
  static const login = '/login';
  static const register = '/register';
  static const settings = '/setting';
   static const home = '/home';
   static const tab = '/tabbar';
    static const dataPag = '/dataPage';
  static configureRoutes(Router router){
    // router.notFoundHandler = notFoundHandler;

  }
  Widget _getPage(String url,dynamic params){
    if(url.startsWith('https://')||url.startsWith('http://')){
      // return Webviewp
    }else
    {
      switch (url) {
        case home:return homePage();
         case tab:return tabBar();
         case settings:return setPage();
          case dataPag:return dataPage();
        default:
      }
    }
    return null;
  }
  Routerss.pushNoParams(BuildContext context,String url){
    Navigator.push(context, MaterialPageRoute(builder: (context){
      return _getPage(url,  null);
    }));
    
  }
  Routerss.push(BuildContext context,String url,dynamic params){
      
    // Navigator.push(context, MaterialPageRoute(builder: (context){
    //   return _getPage(url, params);
    // }))  ;
    // Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context){
    //   return _getPage(url, params);
    // }), predicate)
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context){
      return _getPage(url, params);
     }));
  }
}