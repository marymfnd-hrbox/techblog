import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:techblog/gen/assets.gen.dart';
import 'package:techblog/models/fake_data.dart';
import 'package:techblog/component/my_colors.dart';
import 'package:techblog/component/my_component.dart';
import 'package:techblog/component/my_strings.dart';

class MyCats extends StatefulWidget {
  const MyCats({super.key});

  @override
  State<MyCats> createState() => _MyCatsState();
}

class _MyCatsState extends State<MyCats> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var theme = Theme.of(context).textTheme;
    double bodyMargin = size.width / 10;

    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 40),
                SvgPicture.asset(Assets.images.tcbot, height: 100),
                SizedBox(height: 20),
                Text(
                  MyStrings.successfulRegistration,
                  style: theme.displaySmall,
                ),
                Padding(
                  padding: EdgeInsets.only(right: bodyMargin, left: bodyMargin),
                  child: TextField(
                    textAlign: TextAlign.center,
                    decoration: InputDecoration(
                      alignLabelWithHint: true,
                      hintText: MyStrings.nameAndFamilyName,
                      hintStyle: theme.displaySmall,
                    ),
                  ),
                ),
                SizedBox(height: 32),

                Text(MyStrings.chooseCats, style: theme.displaySmall),

                // TagList
                Padding(
                  padding: const EdgeInsets.only(top: 16),
                  child: SizedBox(
                    width: size.width,
                    height: 130,
                    child: GridView.builder(
                      scrollDirection: Axis.horizontal,
                      physics: ClampingScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: tagList.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        childAspectRatio: 0.1,
                        crossAxisCount: 3,
                        crossAxisSpacing: 5,
                        mainAxisSpacing: 5,
                      ),
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: () {
                            setState(() {
                              if (!myCatList.contains(tagList[index])) {
                                myCatList.add(tagList[index]);
                              } else {
                                debugPrint("${tagList[index].title} exist");
                              }
                            });
                          },
                          child: MainTags(theme: theme, index: index),
                        );
                      },
                    ),
                  ),
                ),

                SizedBox(height: 20),

                Image.asset(Assets.icons.downCatArrow.path, scale: 2),

                Padding(
                  padding: const EdgeInsets.only(top: 16),
                  child: SizedBox(
                    width: double.infinity,
                    height: 130,
                    child: GridView.builder(
                      scrollDirection: Axis.horizontal,
                      physics: ClampingScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: myCatList.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        childAspectRatio: 0.2,
                        crossAxisCount: 2,
                        crossAxisSpacing: 5,
                        mainAxisSpacing: 5,
                      ),
                      itemBuilder: (context, index) {
                        return Container(
                          height: 60,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(24)),
                            color: SolidColors.surface,
                          ),
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(16, 8, 8, 8),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                SizedBox(width: 8),
                                Text(
                                  myCatList[index].title,
                                  style: theme.displaySmall,
                                ),
                                InkWell(
                                  onTap: () {
                                    setState(() {
                                      myCatList.removeAt(index);
                                    });
                                  },
                                  child: Icon(
                                    CupertinoIcons.delete,
                                    color: SolidColors.greyColor,
                                    size: 20,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
