import 'package:flutter/material.dart';
import './page/home.dart';
import './page/mine.dart';
import './page/dataPage.dart';
class _Item{
  String name;
  String activeIcon,normalIcon;
  _Item(this.name,this.activeIcon,this.normalIcon);
}
class tabBar extends StatefulWidget {
  @override
  _tabBarState createState() => _tabBarState();
}

class _tabBarState extends State<tabBar> {
  int _selectIndex = 0;
  List<Widget> pages;
   List<int> pagesWidgets = [0,1,2];
    int pageIndex = 1;
  final defaultItemsColor = Colors.red;
  final itemsName = [
    _Item('首页', 'assets/images/ic_tab_home_active.png', 'assets/images/ic_tab_home_normal.png'),
    _Item('数据库', 'assets/images/ic_tab_subject_active.png', 'assets/images/ic_tab_subject_normal.png'),
     _Item('我的', 'assets/images/ic_tab_profile_active.png', 'assets/images/ic_tab_profile_normal.png')
  ];
  List<BottomNavigationBarItem> itemList;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print('hello tabbar');
    if(pages == null)
    {
      pages = [
        homePage(),
        // dataPage(pageIndex: pageIndex,),
        dataPage(),
        setPage(),
      ];
    }
    if(itemList == null){
      itemList = itemsName.map((item)=>BottomNavigationBarItem(
        icon: Image.asset(item.normalIcon,width:30,height:30),
        title: Text(item.name),
        activeIcon: Image.asset(item.activeIcon,width:30,height:30),

      )).toList();
    }
  }


@override
  void didUpdateWidget(tabBar oldWidget) {
    // TODO: implement didUpdateWidget
    super.didUpdateWidget(oldWidget);
    print('update widget');
  }

  @override
  Widget build(BuildContext context) {
    //第一种Stack + OffStage + TickerMode 堆叠 通过 TickerMode 的 enabled 来控制页面是否显示，当页面的 index 为当期选中的 index 时显示否则隐藏
    // return buildScaffold();
    //IndexedStack 控制页面的显示
    return Scaffold(
      body: IndexedStack(index: _selectIndex,children: pages,
      
      ),
      bottomNavigationBar: buildBottomNavigationBar(),
    );
  }

  Scaffold buildScaffold() {
    return Scaffold(
    body: Stack(
      children: pagesWidgets.map((item)=>Offstage(
      offstage: _selectIndex!=item,
      child: TickerMode(
        enabled: _selectIndex == item,
        child: pages[item],
      ),
    )).toList(),
    ),
    backgroundColor: Colors.yellow,
    bottomNavigationBar: buildBottomNavigationBar(),
  );
  }

  BottomNavigationBar buildBottomNavigationBar() {
    return BottomNavigationBar(
    items: itemList,
    onTap: (int value){
      setState(() {
        _selectIndex = value;
         pageIndex = pageIndex +1;

        // shopPa
      });
    },
    iconSize: 24,
    currentIndex: _selectIndex,
    fixedColor: Colors.blueAccent,
    //选中后，底部BottomNavigationBar内容的颜色(选中时，默认为主题色)（仅当type: BottomNavigationBarType.fixed,时生效）
    type: BottomNavigationBarType.fixed,
  );
  }
}

