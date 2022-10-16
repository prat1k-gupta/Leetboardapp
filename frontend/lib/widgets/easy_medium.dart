import 'package:flutter/material.dart';

class EasyMediumHard extends StatelessWidget {
  const EasyMediumHard({super.key,required this.number,required this.type});
final String type;
final String number;
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          type,
          style: theme.textTheme.bodyText1,
        ),
        Text(
          number,
          style: theme.textTheme.bodyText1,
        ),
      ],
    );
  }
}
