import 'package:flutter/material.dart';
import 'package:leet_board/core/sized_boxes.dart';

class ProfileEasy extends StatelessWidget {
  const ProfileEasy({super.key, required this.number, required this.type});
  final String type;
  final String number;
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(type, style: theme.textTheme.bodyText1),
        vSizedBox1,
        Text(
          number,
          // "${usersController.userList[index].data!.matchedUser.submitStatsGlobal!.acSubmissionNum![1].count}",
          style: theme.textTheme.bodyText1,
        ),
      ],
    );
  }
}
