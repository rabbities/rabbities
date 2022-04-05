// ignore_for_file: constant_identifier_names, non_constant_identifier_names

part of 'app_pages.dart';

abstract class Routes {
  static const HOME = _Paths.HOME;
  static const WECHAT = _Paths.WECHAT;
  static const RABBIT = _Paths.RABBIT;
  static const WEBSITE = _Paths.WEBSITE;

  static const APP = _Paths.WEBSITE + _Paths.APP;
  static const DASHBOARD = _Paths.WEBSITE + _Paths.DASHBOARD;
  static const CONVERSATION = _Paths.WEBSITE + _Paths.CONVERSATION;

  Routes._();

  static String LOGIN_THEN(String afterSuccessfulLogin) => '$HOME?then=${Uri.encodeQueryComponent(afterSuccessfulLogin)}';
  static String PRODUCT_DETAILS(String productId) => '$HOME/$productId';
}

abstract class _Paths {
  static const HOME = '/';
  static const WECHAT = '/wechat';
  static const RABBIT = '/rabbit';
  static const WEBSITE = '/website';
  static const APP = '/app';
  static const DASHBOARD = '/dashboard';
  static const CONVERSATION = '/conversation';
}
