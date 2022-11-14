import 'package:event_bus/event_bus.dart';
import 'dart:async';
// 通知工具类
class NoticeUtils {
  static final EventBus _eventBus =  EventBus();

  //获取单例
  static EventBus getInstance() {
    return _eventBus;
  } 
//返回某事件的订阅者
  static StreamSubscription<T> listen<T extends Event>(
      Function(T event) onData) {
    //内部流属于广播模式，可以有多个订阅者
    return _eventBus.on<T>().listen(onData);
  }

  //发送事件
  static void fire<T extends Event>(T e) {
    _eventBus.fire(e);
  }
}

abstract class Event {}

class CommonEvent extends Event {
  Map paramet;
  // paramet = {'tag':'标签名',参数1,参数2...}
  CommonEvent({required this.paramet});
}

/*
使用案例：
监听：
  StreamSubscription<CommonEvent> loginSubscription;
  void initState() {
    this.loginSubscription = NoticeUtils.listen((event){
        if(event.paramet==null||event.paramet['tag'] != '标签名'){
          return;
        }

    });
  );
  注意 ： 监听需要释放
  void dispose() {
    print('--------dispose---------');
    this.loginSubscription.cancel();
    super.dispose();
  }
发送：
   NoticeUtils.fire(CommonEvent(paramet: {'tag':'标签名'}));

*/
