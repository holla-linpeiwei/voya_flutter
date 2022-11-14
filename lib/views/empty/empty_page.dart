/*
 * @Descripttion: 
 * @version: 
 * @Author: chenguanqi
 * @Date: 2021-04-25 15:24:20
 * @LastEditors: cgq
 * @LastEditTime: 2021-04-25 15:57:34
 */
import 'package:flutter/material.dart';
import 'dart:ui';
import 'package:flutter/services.dart';

class EmptyPage extends StatefulWidget {
  var index;

  EmptyPage({Key? key}) : super(key: key);

  @override
  _EmptyPageState createState() => _EmptyPageState();
}

class _EmptyPageState extends State<EmptyPage> {
  static const _widgetChannel = MethodChannel('com.jiuwei.jianzhimao');

  @override
  Widget build(BuildContext context) {
    print("index:" + widget.index.toString());
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Colors.black, //修改颜色
        ),
        automaticallyImplyLeading: true,
        title: const Text(
          '空白页',
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
        leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios),
            onPressed: () => _widgetChannel.invokeMethod('backToNative')),
      ),
      body: Container(
        width: window.physicalSize.width,
        height: window.physicalSize.height,
        color: Colors.white,
      ),
    );
  }
}
