/*
* Author : LiJiqqi
* Date : 2020/8/12
*/

import 'dart:async';
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';

const _kChannel = 'double_side_render_';


class AndroidWidgetController{

  final String viewId;

  
  static AndroidWidgetController getInstance({@required String viewId}){
    final MethodChannel methodChannel = MethodChannel(_kChannel+viewId);
    return AndroidWidgetController._(channel: methodChannel,viewId: viewId);
  }

  final MethodChannel _channel;

  AndroidWidgetController._({ MethodChannel channel, String viewId})
  :_channel = channel,this.viewId = viewId
  {
    _channel.setMethodCallHandler(_handleMessage);
  }

  ///stream area
//  final _onDestroy = StreamController<Null>.broadcast();
//
//  Stream<Null> get onDestroy => _onDestroy.stream;




  ///handle msg from android side
  Future<Null> _handleMessage(MethodCall call)async{
    switch(call.method){
      //todo
    }
  }


  ///send msg to android side
  Future<Null> launchView({Rect rect})async{
    assert(rect != null);
    final args = <String,dynamic>{
      //todo
    };
    args['rect'] = {
      'left':rect.left,
      'top':rect.top,
      'width':rect.width,
      'height':rect.height
    };

    await _channel.invokeMethod('launch',args);
  }

  Future<Null> close()async{
    await _channel.invokeMethod('close');
  }

  void dispose(){
    //todo

  }


  Future<Null> resize({Rect rect})async{
    final args = {};
    args['rect'] = {
      'left': rect.left,
      'top': rect.top,
      'width': rect.width,
      'height': rect.height,
    };
    await _channel.invokeMethod('resize',args);
  }

}

























