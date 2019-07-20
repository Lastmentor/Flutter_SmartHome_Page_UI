import 'package:flutter_smart_home_ui/profile.dart';
import 'package:flutter_smart_home_ui/home.dart';
import 'package:flutter_smart_home_ui/schedules.dart';
import 'package:flutter_smart_home_ui/settings.dart';
import 'package:flutter_smart_home_ui/notifications.dart';
import 'package:flutter_smart_home_ui/stats.dart';

typedef T Constructor<T>();

final Map<String, Constructor<Object>> _constructors = <String, Constructor<Object>>{};

void register<T>(Constructor<T> constructor) {
  _constructors[T.toString()] = constructor;
}

class ClassBuilder {
  static void registerClasses() {
    register<Home>(() => Home());
    register<Profile>(() => Profile());
    register<Notifications>(() => Notifications());
    register<Stats>(() => Stats());
    register<Schedules>(() => Schedules());
    register<Settings>(() => Settings());
  }

  static dynamic fromString(String type) {
    return _constructors[type]();
  }
}