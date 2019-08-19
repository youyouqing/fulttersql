import 'package:flutter/material.dart';
import 'package:sqliteflutter/configs/routers.dart';
class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String loginName,ip,port;
  String passWord;
  bool _isObscure = true;
  Color _eyeColor;
  final _formKey = GlobalKey<FormState>();
  List _loginList = [
    {
      'title':'wechat',
      'icon':Icon(Icons.wallpaper),
    },
    {
      'title':'QQ',
      'icon':Icon(Icons.youtube_searched_for),
    }
  ];
  @override
  Widget build(BuildContext context) {
    return buildScaffold(context);
  }

  Scaffold buildScaffold(BuildContext context) {
    return Scaffold(
    body: Form(
      key: _formKey,
      child: ListView(
        padding: EdgeInsets.symmetric(horizontal: 20),
        children: <Widget>[
          SizedBox(height: 110,),
          buildTitle(),
          buildLine(),
          SizedBox(height: 30.0),
          buildEmailTextField('主机名'),
         
          buildEmailTextField('端口号'),
          buildEmailTextField('用户名'),
          buildForgetPasswordText(context),
          buildPasswordTextField(),
          
          
          SizedBox(height: 20.0),
          buildLoginButton(),
          SizedBox(height: 30.0),

           buildOtherLoginText(),
           buildOtherButton(context),
           buildRegisterText(context),
        ],
      ),
    ),
  );
  }
Padding buildForgetPasswordText(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: Align(
        alignment: Alignment.centerRight,
        child: FlatButton(
          child: Text(
            '忘记密码？',
            style: TextStyle(fontSize: 14.0, color: Colors.grey),
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
    );
  }
  Align buildRegisterText(BuildContext context) {
    return Align(
             alignment: Alignment.center,
             child: Padding(
               padding: EdgeInsets.only(top: 10),
               child: Row(
                 mainAxisAlignment: MainAxisAlignment.center,
                 children: <Widget>[
                   Text('没有帐号'),
                   GestureDetector(
                     child: Text('点击注册'),
                     onTap: (){
                       print('去注册');
                       Navigator.pop(context);
                     },
                   )
                 ],
               ),
             ),
           );
  }
  Align buildOtherLoginText() {
    return Align(
        alignment: Alignment.center,
        child: Text(
          '其他账号登录',
          style: TextStyle(color: Colors.grey, fontSize: 14.0),
        ));
  }
  Padding buildLine() {
    return Padding(
            padding: EdgeInsets.only(left: 12,top: 4),
            child: Align(
              alignment: Alignment.bottomLeft,
              child: Container(
                color: Colors.black,
                width: 40,
                height: 2.0,
              ),

            ),

          );
  }

  Padding buildTitle() {
    return Padding(
            padding: EdgeInsets.all(8),
            child: Text('Login',style: TextStyle(fontSize: 42),),

          );
  }

  ButtonBar buildOtherButton(BuildContext context) {
    return ButtonBar(
             alignment: MainAxisAlignment.center,
              children: _loginList.map((item)=>Builder(
                builder: (context){
                
              return  IconButton(
                  icon: Icon(Icons.youtube_searched_for,color:Theme.of(context).iconTheme.color),
                  onPressed: (){
                    //底部弹出小黑框提示
                    Scaffold.of(context).showSnackBar(SnackBar(
                      content: Text('${item['title']}登录'),
                      action: SnackBarAction(onPressed: (){},
                      label: '取消',
                      ),
                    ));
                  },
                );
             
                },
              )
                
              ).toList(),
           );
  }
   Align buildLoginButton() {
    return Align(
            child: SizedBox(
              height: 45,
              width: 270,
              child: RaisedButton(
                child: Text('Login',style: TextStyle(color: Colors.white),),
                color: Colors.black,
                onPressed: (){
                  // if(_formKey.currentState.validate()){
                  //   _formKey.currentState.save();
                    print('emial:$loginName,assword:$passWord');
                     Routerss.push(context, Routerss.tab, '首页');
                  // }
                },
                shape: StadiumBorder(side: BorderSide(color: Colors.brown)),
              ),
            ),
          );
  }

  TextFormField buildPasswordTextField() {
    return TextFormField(
            onSaved: (String value) => passWord = value,
            obscureText: _isObscure,
            validator: (String value){
              if (value.isEmpty){
                return '请输入密码';
              }
            },
            decoration: InputDecoration(
              labelText: '密码',
              suffixIcon: IconButton(
                icon: Icon(Icons.remove_red_eye,color:Colors.red),
                onPressed: (){
                 
                 setState(() {
                   _isObscure = !_isObscure;
                   _eyeColor = _isObscure?Colors.grey:Colors.lightGreenAccent;
                 });
                },
              )
            ),
          );
  }

    TextFormField buildEmailTextField(String str) {
    return  TextFormField(
            onSaved: (String value) => passWord = value,
            obscureText: false,
            validator: (String value){
              var resg = RegExp(
            r"[\w!#$%&'*+/=?^_`{|}~-]+(?:\.[\w!#$%&'*+/=?^_`{|}~-]+)*@(?:[\w](?:[\w-]*[\w])?\.)+[\w](?:[\w-]*[\w])?");

              if (!resg.hasMatch(value)){
                return '请输入正确的$str';
              }
            },
            decoration: InputDecoration(
              labelText: str,
              
            ),
          );
  }
}

