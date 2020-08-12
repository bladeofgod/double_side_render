/*
* Author : LiJiqqi
* Date : 2020/8/12
*/

import 'dart:ui';

import 'package:flutter/services.dart';

const _kChannel = 'flutter_android_view';


class AndroidWidgetController{

  static AndroidWidgetController _instance;

  factory AndroidWidgetController(){
    if(_instance == null){
      const MethodChannel methodChannel = const MethodChannel(_kChannel);
      _instance = AndroidWidgetController._(methodChannel);
    }
    return _instance;
  }

  final MethodChannel _channel;

  AndroidWidgetController._(this._channel){
    _channel.setMethodCallHandler(_handleMessage);
  }

  Future<Null> _handleMessage(MethodCall call)async{
    switch(call.method){
      //todo
    }
  }

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

  Future<Null> resize({Rect rect})async{}

}

























