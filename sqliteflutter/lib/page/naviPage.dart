import 'package:flutter/material.dart';
import'./navi_entity.dart';
import 'package:dio/dio.dart';
  //导航数据
static const String NAVI = "navi/json";
class NaviPage extends StatefulWidget {
  NaviPage({Key key}) : super(key: key);

  _NaviPageState createState() => _NaviPageState();
}

class _NaviPageState extends State<NaviPage> {

List<NaviData> _datas = List();//一级分类集合
List<NaviDataArticles> articles = List();//二级分类集合
int index;//一级分类下标

@override
void initState() { 
  super.initState();
  getHttp();
}
void getHttp()async {
  try{
    var resp = await http.getRequest(
        'https://www.wanandroid.com/navi/json');

     Map userMap  = Convert.jsonDecode(resp.toString());
     var naviEntity = NaviEntity.fromJson[userMap];
    setState((){
       _datas = naviEntity.data;
       index = 0;
    });
    print('---------_datas-----$_datas-----------');
  }catch(e){
    print(e);
  }
}
  @override
  Widget build(BuildContext context) {
    return Row(
     mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Expanded(
          flex:2,
          child:Container(
            child:ListView.builder(
              itemCount:_datas.length,
              itemBuilder:(BuildContext context,int postion){
                return getRow(postion);
              }
            ),
          ),
        ),
Expanded(
  flex:5,
  child:ListView(
    children:<Widget>[
      Container(
        alignment:Alignment.topLeft,
        padding:EdgeInsets.all(10),
        color:Colors.red,
        child:getChip(index),//传入一级分类下标
      ),
    ],
  )
),


      ],
    );
  }
Widget getChip(int i){
  _updateArticles(i);
  return Wrap(
    spacing:10.0,
    direction:Axis.horizontal,
    alignment:WrapAlignment.start,
    children:List<Widget>.generate(
      articles.length,
      (int index){
        return ActionChip(
          label:Text(articles[index].title,style:TextStyle(fontSize:16,color:Colors.blue)),
          onPressed:(){
            Navigator.push(
              context,
              // MaterialPageRoute(
              //   builder:(context) => ArticleDetail(
              //     title:articles[index].title,
              //     url:articles[index].link)
              //   ),
              );
           
          },
          elevation:3,
          backgroundColor:Colors.grey.shade200,

        );
      },
    ).toList(),
  );
}


Widget getRow(int i){
  Color textColor = Theme.of(context).primaryColor;
  return GestureDetector(
    child:Container(
      alignment:Alignment.center,
      padding:EdgeInsets.symmetric(vertical:15,horizontal:10),
      color:index == i ? Colors.red:Colors.yellow,
      child:Text(_datas[i].name,style:TextStyle(color:index == i?Colors.red:Colors.yellow,
                // fontWeight:index == i? 32:22,
                fontSize:16
                ),
      onTap:(){
        setState((){
          index = i;
          textColor = Colors.blue;
        });
      }
      ),
    ),
  );
}

//根据一级分类下标更新二级分类集合
List<NaviDataArticle> _updateArticles(int i){
  setState((){
    if(_datas.length != 0) articles = _datas[i].articles;
  });
  return articles;
}

}