import 'package:flutter/material.dart';
import 'package:leet_board/constants/app_strings.dart';
import 'package:leet_board/provider/create_room_provider.dart';
import 'package:leet_board/provider/get_contest_provider.dart';
import 'package:leet_board/provider/home_page_provider.dart';
import 'package:leet_board/provider/show_rooms.provider.dart';
import 'package:leet_board/routes/routes.dart';
import 'package:leet_board/theme/theme.dart';
import 'package:sizer/sizer.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType) {
        return MultiProvider(
          providers: [
            ChangeNotifierProvider<HomePageProvider>(
              create: (context) => HomePageProvider(),
            ),
            ChangeNotifierProvider<CreateRoomProvider>(
              create: (context) => CreateRoomProvider(),
            ),
            ChangeNotifierProvider<GetContestProvider>(
              create: (context) => GetContestProvider(),
            ),
            ChangeNotifierProvider<ShowRoomsProvider>(
              create: (context) => ShowRoomsProvider(),
            ),
          ],
          child: MaterialApp.router(
            debugShowCheckedModeBanner: false,
            title: AppStrings.appName,
            theme: AppTheme().darkTheme,
            routeInformationProvider: appRouter.routeInformationProvider,
            routeInformationParser: appRouter.routeInformationParser,
            routerDelegate: appRouter.routerDelegate,
          ),
        );
      },
    );
  }
}
