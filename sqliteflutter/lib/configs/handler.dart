import 'package:fluro/fluro.dart';
import '../Login.dart';
import '../bloc/bloc_provider.dart';
import '../bloc/login_bloc.dart';
import 'package:flutter/material.dart';

Handler notFoundHandler = Handler(handlerFunc: (_ ,params){
  print('not FoundHandler');
});

// Handler loginHandler = Handler(handlerFunc: (_,params){
//   String passW = params['passWord'].first;
//   String Name = params['loginName'].first;
//   return BlocProvider(child: LoginPage(loginName: Name,passWord: passW,ip:null,port:null),bloc: loginBloc());

// });

// Handler loginssHandler = Handler(handlerFunc: (_,params){
//   String passW = params['passWord'].first;
//   String Name = params['loginName'].first;
//   return  LoginPages(loginName: Name,passWord: passW);

// });
// class LoginPages extends StatelessWidget {
//   String loginName;
//   String passWord;

//  LoginPages({Key key, this.loginName, this.passWord}) : super(key: key);
//   @override
//   Widget build(BuildContext context) {
//     return Container(
      
//     );
//   }
// }