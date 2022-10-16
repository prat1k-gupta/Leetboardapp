import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:leet_board/core/sized_boxes.dart';
import 'package:sizer/sizer.dart';

import '../theme/app_colors.dart';

class RankUser extends StatelessWidget {
  const RankUser(
      {super.key,
      required this.image,
      required this.name,
      required this.rank,
      required this.onPressed,
      required this.height});
  final String name;
  final String image;
  final String rank;
  final double height;
  final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      children: [
        Text(
          rank,
          style: theme.textTheme.bodyText2,
        ),
        InkWell(
          onTap: onPressed,
          child: Container(
            height: 14.h,
            width: 26.w,
            decoration: BoxDecoration(
                boxShadow: const [],
                image: DecorationImage(
                    fit: BoxFit.cover,
                    image: CachedNetworkImageProvider(image)),
                color: Colors.white,
                shape: BoxShape.circle),
          ),
        ),
        Text(
          name,
          style: theme.textTheme.bodyText2,
        ),
        SizedBox(
          height: height,
        ),
      ],
    );
  }
}
