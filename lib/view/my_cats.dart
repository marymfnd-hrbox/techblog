import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:techblog/gen/assets.gen.dart';
import 'package:techblog/my_strings.dart';

class MyCats extends StatelessWidget {
  const MyCats({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var theme = Theme.of(context).textTheme;
    double bodyMargin = size.width/10;

    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 12),
                SvgPicture.asset(Assets.images.tcbot, height: 100),
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
                      hintText: "نام و نام خانوادگی",
                      hintStyle: theme.displaySmall,
                    ),
                  ),
                ),
                SizedBox(height: 32,),
                Text(
                  MyStrings.chooseCats,
                  style: theme.displaySmall,
                ),
                GridView.builder(
                  shrinkWrap: true,
                  itemCount: 6,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3), 
                  itemBuilder: (context, index){
                    return Container(color: Colors.blue,
                    child: Text("GridView"),);
                  })
              ],
            ),
          ),
        ),
      ),
    );
  }
}
