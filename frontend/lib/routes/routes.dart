import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:leet_board/models/users_model.dart';
import 'package:leet_board/routes/routes_names.dart';
import 'package:leet_board/view/intro/show_my_rooms.dart';
import 'package:leet_board/view/intro/splash_screen.dart';
import 'package:leet_board/view/profile/profile_screen.dart';
import 'package:leet_board/view/room/add_people_screen.dart';
import 'package:leet_board/view/room/choice_room.dart';
import 'package:leet_board/view/room/create_uid_join.dart';
import 'package:leet_board/view/room/join_room.dart';
import 'package:leet_board/view/room/menu_screen.dart';
import 'package:leet_board/view/upcomingContest/upcoming_contest.dart';
import '../view/home/home_screen.dart';

final appRouter = GoRouter(routes: appRoutes);

final appRoutes = <GoRoute>[
  _generateGoRoute(AppRouteNames.splashScreen, const SplashScreen()),
  _generateGoRoute(AppRouteNames.choiceRoomScreen, const ChoiceRoomScreen()),
  _generateGoRoute(AppRouteNames.joinRoomScreen, const JoinRoom()),
  _generateGoRoute(AppRouteNames.createUidAndJoin, const CreateUidJoin()),
  _generateGoRoute(AppRouteNames.menuScreen, const MenuScreen()),
  _generateGoRoute(AppRouteNames.showContest, const UpcomingContest()),
  _generateGoRoute(AppRouteNames.showMyRooms, const ShowMyRooms()),
  GoRoute(
      path: AppRouteNames.homeScreen,
      pageBuilder: (context, state) {
        final roomId = state.extra as String;
        return CustomTransitionPage(
            child: HomeScreen(
              roomId: roomId,
            ),
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) =>
                    FadeTransition(
                      opacity: animation,
                      child: child,
                    ));
      }),
  GoRoute(
      path: AppRouteNames.profileScreen,
      pageBuilder: (context, state) {
        final userData = state.extra;
        return CustomTransitionPage(
            child: ProfileScreen(
              listData: userData,
            ),
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) =>
                    FadeTransition(
                      opacity: animation,
                      child: child,
                    ));
      }),
  GoRoute(
    path: AppRouteNames.addPeopleScreen,
    pageBuilder: (context, state) {
      final groupName = state.extra.toString();
      final ownerId = state.extra.toString();
      final emailId = state.extra.toString();
      final roomId = state.extra.toString();
      return CustomTransitionPage(
          child: AddPeopleScreen(
            emailId: emailId,
            groupName: groupName,
            ownerId: ownerId,
            roomId: roomId,
          ),
          transitionsBuilder: (context, animation, secondaryAnimation, child) =>
              FadeTransition(
                opacity: animation,
                child: child,
              ));
    },
  ),
];

GoRoute _generateGoRoute(String path, Widget child) {
  return GoRoute(
    path: path,
    pageBuilder: (context, state) => CustomTransitionPage<void>(
      child: child,
      transitionsBuilder: (context, animation, secondaryAnimation, child) =>
          FadeTransition(
        opacity: animation,
        child: child,
      ),
    ),
  );
}
