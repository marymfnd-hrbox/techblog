import 'package:flutter/material.dart';
import 'package:techblog/gen/assets.gen.dart';
import 'package:techblog/models/fake_data.dart';
import 'package:techblog/my_colors.dart';

class techDivider extends StatelessWidget {
  const techDivider({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Divider(
      thickness: 1.5,
      color: SolidColors.dividerColor,
      indent: size.width/6,
      endIndent: size.width/6,
    );
  }
}


class MainTags extends StatelessWidget {
  MainTags({
    super.key,
    required this.theme,
    required this.index
  });

  final TextTheme theme;
  var index;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(24),
        ),
        gradient: LinearGradient(
          colors: GradientColors.tags,
          begin: Alignment.centerRight,
          end: Alignment.centerLeft,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(
          16,
          8,
          8,
          8,
        ),
        child: Row(
          children: [
            ImageIcon(
              Assets.icons.hashtagicon.provider(),
              color: Colors.white,
              size: 15,
            ),
            SizedBox(width: 8),
            Text(
              tagList[index].title,
              overflow: TextOverflow.ellipsis,
              style: theme.headlineMedium,
            ),
          ],
        ),
      ),
    );
  }
}