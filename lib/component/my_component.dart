import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:techblog/gen/assets.gen.dart';
import 'package:techblog/models/fake_data.dart';
import 'package:techblog/constant/my_colors.dart';
import 'package:url_launcher/url_launcher.dart';

class techDivider extends StatelessWidget {
  const techDivider({super.key, required this.size});

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Divider(
      thickness: 1.5,
      color: SolidColors.dividerColor,
      indent: size.width / 6,
      endIndent: size.width / 6,
    );
  }
}

class MainTags extends StatelessWidget {
  MainTags({super.key, required this.theme, required this.index});

  final TextTheme theme;
  var index;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(24)),
        gradient: LinearGradient(
          colors: GradientColors.tags,
          begin: Alignment.centerRight,
          end: Alignment.centerLeft,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(16, 8, 8, 8),
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

myLaunchUrl(String url) async {
  var uri = Uri.parse(url);

  if (await canLaunchUrl(uri)) {
    await launchUrl(uri);
  } else {
    // ignore: avoid_print
    print("Could not launch $url");
  }
}

class Loading extends StatelessWidget {
  const Loading({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(child: SpinKitFadingCube(color: SolidColors.primaryColor, size: 32));
  }
}
