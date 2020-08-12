/*
* Author : LiJiqqi
* Date : 2020/8/12
*/

import 'package:flutter/material.dart';

class DemoPage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return DemoPageState();
  }

}

class DemoPageState extends State<DemoPage> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Material(
      child: Container(
        color: Colors.white,
        width: size.width,height: size.height,
        child: CustomScrollView(
          slivers: [
            wrapChild(Container(
              color: Colors.red,
              width: size.width,height: size.height/2,
            )),
            wrapChild(Container(
              color: Colors.blue,
              width: size.width,height: size.height/2,
            )),
            wrapChild(Container(
              color: Colors.green,
              width: size.width,height: size.height/2,
            ))

          ],
        ),
      ),
    );
  }

  SliverToBoxAdapter wrapChild(Widget child){
    return SliverToBoxAdapter(
      child: child,
    );
  }

}

























