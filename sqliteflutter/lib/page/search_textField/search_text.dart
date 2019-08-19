
import 'package:flutter/material.dart';
class SearchTextField extends StatelessWidget {
final ValueChanged<String> obSubmitted;
final VoidCallback onTab;
final String hinText;
final EdgeInsetsGeometry margin;

  const SearchTextField({Key key, this.obSubmitted, this.onTab, this.hinText, this.margin}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin == null?EdgeInsets.all(0):margin,
      width: MediaQuery.of(context).size.width,
      alignment:Alignment.center,
      height: 37,
      decoration: BoxDecoration(
        color: Colors.blue,
        borderRadius: BorderRadius.circular(24),
      ),
      child: TextField(
        onSubmitted: obSubmitted,
        onTap: onTab,
        cursorColor: Colors.blueAccent,
        decoration: InputDecoration(contentPadding: EdgeInsets.only(top: 8),
        border: InputBorder.none,
        hintText: hinText,
        hintStyle: TextStyle(color: Colors.brown),
        prefixIcon:Icon(Icons.search,size:25,color:Colors.amberAccent), 
        ),
        style: TextStyle(fontSize: 17),
        
      ),
    );
  }
}