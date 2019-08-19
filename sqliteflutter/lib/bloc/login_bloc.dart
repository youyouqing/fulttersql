import 'package:flutter/material.dart';
import 'bloc_provider.dart';
import 'package:rxdart/rxdart.dart';

class loginBloc extends BaseBloc {
BehaviorSubject<String> _numberStr =  BehaviorSubject();
BehaviorSubject<String> _passWordStr = BehaviorSubject();

Observable<String> get _numberStrStream => Observable(_numberStr.stream);
Observable<String> get _passWordStrStream => Observable(_passWordStrStream);


  
 @override
  void dispose() {
   
    _numberStr.close();
    _passWordStr.close();
    
    // TODO: implement dispose
  }

}