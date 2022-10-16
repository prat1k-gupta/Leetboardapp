import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';

class AppNavigator {
  final BuildContext context;
  AppNavigator(this.context);

  void popModals() => Navigator.of(context, rootNavigator: true).pop();

  void pushNamedReplacement({required String location, dynamic extra}) =>
      GoRouter.of(context).go(location, extra: extra);

  void push({required String location, dynamic extra}) =>
      GoRouter.of(context).push(location, extra: extra);

  /// [AppNavigator.pop()] is used to pop the screens that are push on navigation stack of
  /// GoRouter
  void pop() => GoRouter.of(context).pop();
}
