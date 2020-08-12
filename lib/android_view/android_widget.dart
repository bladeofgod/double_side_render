/*
* Author : LiJiqqi
* Date : 2020/8/12
*/

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutterdoublerender/android_view/android_widget_controller.dart';

class AndroidWidget extends StatefulWidget{

  final Size size;

  const AndroidWidget({Key key, this.size}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return AndroidWidgetState(size);
  }
  
}

class AndroidWidgetState extends State<AndroidWidget> {

  final Size size;

  AndroidWidgetState(this.size);

  final AndroidWidgetController androidWidgetController = AndroidWidgetController();
  Rect _rect;
  Timer _resizeTimer;

  var onBack;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _resizeTimer?.cancel();
  }


  @override
  Widget build(BuildContext context) {
    return AndroidPlaceHolder(
      onRectChanged: (Rect value){
        if(_rect == null){
          _rect = value;
          androidWidgetController.launchView(rect: _rect);
        }else{
          if(_rect != value){
            _rect = value;
            _resizeTimer?.cancel();
            _resizeTimer = Timer(const Duration(milliseconds: 250),(){
              androidWidgetController.resize(rect: _rect);
            });
          }
        }
      },
    );
  }
}


class AndroidPlaceHolder extends SingleChildRenderObjectWidget{

  final ValueChanged<Rect> onRectChanged;

  AndroidPlaceHolder({this.onRectChanged});

  @override
  RenderObject createRenderObject(BuildContext context) {
    return AndroidPlaceHolderRender();
  }

  @override
  void updateRenderObject(BuildContext context, AndroidPlaceHolderRender renderObject) {
    renderObject
      ..onRectChanged = onRectChanged;
  }

}

class AndroidPlaceHolderRender extends RenderProxyBox {


  AndroidPlaceHolderRender({ValueChanged<Rect> callback})
    : _callback = callback;

  ValueChanged<Rect> _callback;
  Rect _rect;

  Rect get rect=>_rect;

  set onRectChanged(ValueChanged<Rect> callback){
    if(callback != _callback){
      callback = _callback;
      notifyRect();
    }
  }

  void notifyRect() {
    if(_callback != null && _rect != null){
      _callback(_rect);
    }
  }

  @override
  void paint(PaintingContext context, Offset offset) {

    super.paint(context, offset);
    final rect = offset & size;
    if(_rect!=rect){
      _rect = rect;
      notifyRect();
    }
  }

}






















