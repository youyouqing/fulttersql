import 'package:flutter/material.dart';
import '../Request/request.dart';
import '../LoginModel/dictionModel.dart';
import 'dart:convert';
import 'package:convert/convert.dart';
import 'package:crypto/crypto.dart';
import '../Request/http_util.dart';
import 'dart:io';
import 'dart:convert' as Convert;
import 'dart:io';
import 'package:flutter/cupertino.dart';

class dataPage extends StatefulWidget {
  // final int pageIndex ;

  // const dataPage({Key key, this.pageIndex}) : super(key: key);

  @override
  _dataPageState createState() => _dataPageState();
}

class _dataPageState extends State<dataPage>
    with AutomaticKeepAliveClientMixin {
  List<bool> checkBoxList = [];
  bool isSelected = false;
  var totalnum = 0;
  List<Lists> listsubjectModel;
  String _groupValue = '升压';
  getPage() async {
    var pageIndex = 1.toString();

    HttpUtils http = HttpUtils();

    var parameter = Map<String, String>();
    parameter["pageIndex"] = pageIndex;
    parameter["pageSize"] = '10';
    parameter["agencyId"] = '55';

    String signStr =
        pageIndex + '^' + "10" + "^" + "55" + "9ol.)P:?3edc\$RFV5tgb";

    String sign = generateMd5(signStr);
    print('$sign--sd****************************************-sdsd---$signStr');

    var resp = await http.getRequest(
        'https://ws.xiekang.net/APIService.svc/SynchrodataAIODictionaryDetail?pageIndex=$pageIndex&pageSize=10&agencyId=55&sign=$sign');

    var result = Convert.jsonDecode(resp.toString());
    print('-88888888-----$result-*totalnum**--$resp');
    var resultList = result['list'];

    setState(() {
      listsubjectModel =
          resultList.map<Lists>((item) => Lists.fromJson(item)).toList();
      print('--listsubjectModel**------resultList**--$resultList' +
          listsubjectModel.toString());
      for (var i = 0; i < listsubjectModel.length; i++) {
        // listsubjectModel[i].checkBox = false;
        checkBoxList.add(false);
      }

      totalnum = result["totalnum"];
      print('--$totalnum**-----------totalnum**totalnum**--' +
          listsubjectModel.toString());
    });
    /* -88888888-----{Status: 200, totalnum: 926, list: [{DictionaryDetailId: 365, DictionaryMainId: 90, DictionaryKey: 1, DictionaryValue: 无, DictionaryCreatDate: 1467697633000}, {DictionaryDetailId: 366, DictionaryMainId: 90, DictionaryKey: 2, DictionaryValue: 独用, DictionaryCreatDate: 1467697651000}, {DictionaryDetailId: 367, DictionaryMainId: 90, DictionaryKey: 3, DictionaryValue: 合用, DictionaryCreatDate: 1467697658000}, {DictionaryDetailId: 415, DictionaryMainId: 101, DictionaryKey: 1, DictionaryValue: 户籍, DictionaryCreatDate: 1467703714000}, {DictionaryDetailId: 416, DictionaryMainId: 101, DictionaryKey: 2, DictionaryValue: 非户籍, DictionaryCreatDate: 1467703730000}, {DictionaryDetailId: 417, DictionaryMainId: 102, DictionaryKey: 0, DictionaryValue: 男, DictionaryCreatDate: 1467703767000}, {DictionaryDetailId: 418, DictionaryMainId: 102, DictionaryKey: 1, DictionaryValue: 女, DictionaryCreatDate: 1467703778000}, {DictionaryDetailId: 419, DictionaryMainId: 102, Diction<…>
flutter: --listsubjectModel**------resultList**--[{DictionaryDetailId: 365, DictionaryMainId: 90, DictionaryKey: 1, DictionaryValue: 无, DictionaryCreatDate: 1467697633000}, {DictionaryDetailId: 366, DictionaryMainId: 90, DictionaryKey: 2, DictionaryValue: 独用, DictionaryCreatDate: 1467697651000}, {DictionaryDetailId: 367, DictionaryMainId: 90, DictionaryKey: 3, DictionaryValue: 合用, DictionaryCreatDate: 1467697658000}, {DictionaryDetailId: 415, DictionaryMainId: 101, DictionaryKey: 1, DictionaryValue: 户籍, DictionaryCreatDate: 1467703714000}, {DictionaryDetailId: 416, DictionaryMainId: 101, DictionaryKey: 2, DictionaryValue: 非户籍, DictionaryCreatDate: 1467703730000}, {DictionaryDetailId: 417, DictionaryMainId: 102, DictionaryKey: 0, DictionaryValue: 男, DictionaryCreatDate: 1467703767000}, {DictionaryDetailId: 418, DictionaryMainId: 102, DictionaryKey: 1, DictionaryValue: 女, DictionaryCreatDate: 1467703778000}, {DictionaryDetailId: 419, DictionaryMainId: 102, DictionaryKey: 9<…>
flutter: --926**-----------totalnum**totalnum**--[Instance of 'Lists', Instance of 'Lists', Instance of 'Lists', Instance of 'Lists', Instance of 'Lists', Instance of 'Lists', Instance of 'Lists', Instance of 'Lists', Instance of 'Lists', Instance of 'Lists'].toString()*/
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    getPage();
  }

  @override
  bool get wantKeepAlive => true;
  @override
  Widget build(BuildContext context) {
    if (listsubjectModel.length == 0) {
      //loading
      return CupertinoActivityIndicator();
    }

    return Container(
      // color: Colors.blueAccent,
      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 20),
      child: CustomScrollView(
        slivers: <Widget>[
          SliverToBoxAdapter(
            child: RaisedButton(
              onPressed: () {
                setState(() {
                  isSelected = !isSelected;
                  // checkBoxList.forEach((f) {
                  //   f = true;
                  // });
                  print('ssssss-------' + checkBoxList.toString()+isSelected.toString());
                  if (isSelected) {
                      var mapTest = checkBoxList.map((f) =>f=true);
                       print(mapTest.toString()+'maptest' + mapTest.toList().toString());
                      checkBoxList = mapTest.toList();
                    } else {
                      var mapTest = checkBoxList.map((f) =>f=false);
                       print(mapTest.toString()+'maptest' + mapTest.toList().toString());
                       checkBoxList = mapTest.toList();
                    }
                 
                 
                });
              },
              child: Text('多选框全'+ (isSelected==true ?'选':'不选') +'按钮'),
            ),
          ),
          SliverGrid(
              delegate: SliverChildBuilderDelegate(
                  (_, index) => Container(
                        padding: EdgeInsets.symmetric(vertical: 30),
                        child: RadioListTile(
                          title: Text(listsubjectModel[index].dictionaryValue,
                              style: TextStyle(
                                  color:
                                      listsubjectModel[index].dictionaryValue ==
                                              _groupValue
                                          ? Colors.blue
                                          : Colors.black)),
                          subtitle: Text(
                              listsubjectModel[index]
                                  .dictionaryDetailId
                                  .toString(),
                              style: TextStyle(color: Colors.black)),
                          value: listsubjectModel[index].dictionaryValue,
                          groupValue: _groupValue,
                          onChanged: (value) {
                            setState(() {
                              _groupValue = value;
                            });
                          },
                          activeColor: Colors.blue,
                          dense: true,
                          isThreeLine: true,
                          selected: listsubjectModel[index].dictionaryValue ==
                                  _groupValue
                              ? true
                              : false,
                        ),
                      ),
                  childCount: listsubjectModel.length),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  mainAxisSpacing: 20,
                  crossAxisSpacing: 20)),
          SliverList(
            delegate:
                SliverChildBuilderDelegate((BuildContext context, int index) {
              return CheckboxListTile(
                title: Text(listsubjectModel[index].dictionaryValue,
                    style: TextStyle(
                        color: listsubjectModel[index].dictionaryValue ==
                                _groupValue
                            ? Colors.blue
                            : Colors.black)),
                subtitle: Text(
                    listsubjectModel[index].dictionaryDetailId.toString(),
                    style: TextStyle(color: Colors.black)),
                value: checkBoxList[index],
                onChanged: (value) {
                  setState(() {
                    checkBoxList[index] = value;
                  });
                },
                activeColor: Colors.blue,
                dense: true,
                isThreeLine: true,
              );
            }, childCount: listsubjectModel.length),
          ),
          SliverFixedExtentList(
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  return Container(
                    padding: EdgeInsets.only(left: 20),
                    child: Text(
                      '$index',
                      style: TextStyle(color: Colors.black),
                    ),
                  );
                },
                childCount: 3,
              ),
              itemExtent: 30),
        ],
      ),

      //   ],

      // ),
    );
  }
}
