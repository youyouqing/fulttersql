
import 'package:flutter/material.dart';
import '../components/userIconWidget.dart';
import '../LoginModel/post.dart';
class setPage extends StatefulWidget {
  @override
  _setPageState createState() => _setPageState();
}

class _setPageState extends State<setPage> {
  @override
  Widget build(BuildContext context) {
    Widget buidRow(childs, title, isEnd){
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Expanded(
         child: Container(
         alignment: AlignmentDirectional.center,
            child: Container(
            decoration: !isEnd ? BoxDecoration(color: Colors.red,border: Border(bottom: BorderSide(width: 4,color: Colors.brown)),borderRadius: BorderRadius.circular(4)): null,
            padding: EdgeInsets.only(top:16),
            margin: EdgeInsets.only(left: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Container(
                  child: Text('container---title',style: TextStyle(fontSize: 25),),
                  margin: EdgeInsets.only(left: 20),

                ),
                Container(
                  child: Row(
                    children: <Widget>[
                      Container(
                      padding:EdgeInsets.only(bottom: 12,right: 5),
                      child: childs,
                      ),  
                      Container(
                          child: Icon(Icons.access_alarm,color:Colors.brown),

                          margin: EdgeInsets.only(bottom: 12,right: 5),
                     ),                  
                   ],
                  ),

                ),
                
              ],
            ),
        ),
        ),
          ),
      ],
    );


  }
Widget userImage = new UserIconWidget(
  padding: EdgeInsets.all(4),
  width: 55,
  height: 55,
  image: 'static/images/default_nor_avatar.png',
  isNetWork: false,
  onPressed: (){

  },

);
return Scaffold(
   appBar: AppBar(
        title: Text('个人信息'),
        elevation: 0.0,
      ),
      body: CustomScrollView(
        slivers: <Widget>[
          SliverToBoxAdapter(
            
            child: Stack(
              children: <Widget>[
              Container(
                padding: EdgeInsets.only(left: 10,bottom: 10),
                color: Colors.blueGrey,
                child: Row(
                  
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Padding(padding: EdgeInsets.only(left: 10,top: 10),
                    child: CircleAvatar(backgroundColor: Colors.cyan,backgroundImage:NetworkImage(
                     "http://img8.zol.com.cn/bbs/upload/23765/23764201.jpg") ,radius: 40,
                     ),),
                 Container(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                   child: Column(
                     children: <Widget>[
                     
                        Text('title',style:TextStyle(fontSize:30)),
                       Text('subtitle',style:TextStyle(fontSize:15)),
                      
                     ],
                   ),
                 ),

                  
                  ],
                ),
              ),
            Positioned(
              right: 22,
              top: 22,
              child: RaisedButton(
                    
                  child: Icon(Icons.offline_bolt),
                  onPressed: (){
                    print('object');
                  },
),
            ),
              ],
                       
            ),
          ),
          SliverPadding(
          padding: EdgeInsets.symmetric(horizontal: 12,vertical: 20),
          sliver: SliverToBoxAdapter(
            
            child: Container(
              // color: Colors.cyan,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                Container(
                 
                  child: Row(
                  children: <Widget>[
                  Icon(Icons.nature_people),
                  Padding(padding: EdgeInsets.only(left: 15),
                  child: Text('hello,设置',style: TextStyle(fontSize: 17),
                  ),
                  ),
                  
                  ],
                ),),
                  Icon(Icons.arrow_right),
                ],
              ),
            ),
          ),
          ),
          SliverGrid(
            delegate: SliverChildBuilderDelegate(
              (_, intdex){
              return  InkWell(
                  child: Container(child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Icon(Icons.near_me),
                      Expanded(child: Text(posts[intdex].title,style: TextStyle(fontSize: 16),maxLines: 1,),),
                      Expanded(child: Text(posts[intdex].author,style: TextStyle(fontSize: 16),maxLines: 1,),),
                    ],
                  ),),
                  onTap: (){},
                );
              },
              childCount: 8
            ),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 4,mainAxisSpacing: 5,crossAxisSpacing: 10
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate((_, intdex){
              return  Container(
                padding: EdgeInsets.all(10),
                height: 63,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                     Expanded(child: Text(posts[intdex].title,maxLines: 1,overflow: TextOverflow.ellipsis,),) ,
                      Icon(Icons.not_interested),
                      
                    ],
                  ),
                  Divider(height: 5,color: Colors.grey,)
                    ],
                  ),
              );
              },
              childCount: posts.length
              ),
          ),
           SliverFixedExtentList(delegate: SliverChildBuilderDelegate(
              (context,index){
              return  Container(
                  padding: EdgeInsets.only(left: 20),
                   child: Text(posts[index].title+'$index', style: TextStyle(color: Colors.black),),
                );
              },
              childCount: 3,
          ), itemExtent: 30),
        ],
      ),
    );
  }
}