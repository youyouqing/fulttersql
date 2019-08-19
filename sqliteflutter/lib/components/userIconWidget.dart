import 'package:flutter/material.dart';

class UserIconWidget extends StatelessWidget {
final bool isNetWork;
final String image;

final VoidCallback onPressed;
final double width;
final double height;
final EdgeInsetsGeometry padding;

  const UserIconWidget({Key key, this.isNetWork, this.image, this.onPressed, this.width, this.height, this.padding}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(//
      materialTapTargetSize:MaterialTapTargetSize.shrinkWrap,
      padding: padding ?? EdgeInsets.only(left: 12),
    constraints: BoxConstraints(minWidth: 0,minHeight: 0),
    child: ClipRRect(//ClipRRect圆角矩形剪裁 圆角弧度，值越大弧度越大
      borderRadius: BorderRadius.all(Radius.circular(15)),
      child: this.isNetWork ? FadeInImage.assetNetwork(placeholder: 'static/default_nor_avatar.png',fit: BoxFit.fitWidth,
      image: image,
      width: width,
      height: height,

      ):Image.asset(
        image,
         fit: BoxFit.cover,
            width: width,
            height: height,
      ),
      
    ),
    onPressed: onPressed,
    );
  }
}