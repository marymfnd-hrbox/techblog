import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:techblog/gen/assets.gen.dart';
import 'package:techblog/component/my_strings.dart';
import 'package:techblog/view/my_cats.dart';

class RegisterIntro extends StatelessWidget {
  const RegisterIntro({super.key});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context).textTheme;
    var size = MediaQuery.of(context).size;

    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(Assets.images.tcbot, height: 100),

              Padding(
                padding: const EdgeInsets.only(top: 16),
                child: RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    text: MyStrings.welcom,
                    style: theme.displaySmall,
                  ),
                ),
              ),

              Padding(
                padding: const EdgeInsets.only(top: 32),
                child: ElevatedButton(
                  onPressed: () {
                    _showEmailBottomSheet(context, size, theme);
                  },
                  child: Text("بزن بریم"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<dynamic> _showEmailBottomSheet(
    BuildContext context,
    Size size,
    TextTheme theme,
  ) {
    return showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: ((context) {
        return Padding(
          padding: EdgeInsets.only(
            // For interrupting keyboard with textfield
            bottom: MediaQuery.of(context).viewInsets.bottom,
          ),
          child: Container(
            height: size.height / 3,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30),
                topRight: Radius.circular(30),
              ),
            ),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(MyStrings.insertYourEmail, style: theme.displaySmall),
                  Padding(
                    padding: const EdgeInsets.all(24),
                    child: TextField(
                      onChanged: (value) {
                        bool isEmail = EmailValidator.validate(value);
                        if (isEmail) {}
                      },
                      textAlign: TextAlign.center,
                      decoration: InputDecoration(
                        hintText: "techblog@email.com",
                        hintStyle: theme.displayLarge,
                      ),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                      _activateCodeBottomSheet(context, size, theme);
                    },
                    child: Text("ادامه"),
                  ),
                ],
              ),
            ),
          ),
        );
      }),
    );
  }

  Future<dynamic> _activateCodeBottomSheet(
    BuildContext context,
    Size size,
    TextTheme theme,
  ) {
    return showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: ((context) {
        return Padding(
          padding: EdgeInsets.only(
            // For interrupting keyboard with textfield
            bottom: MediaQuery.of(context).viewInsets.bottom,
          ),
          child: Container(
            height: size.height / 3,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30),
                topRight: Radius.circular(30),
              ),
            ),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(MyStrings.activateCode, style: theme.displaySmall),
                  Padding(
                    padding: const EdgeInsets.all(24),
                    child: TextField(
                      onChanged: (value) {
                        bool isEmail = EmailValidator.validate(value);
                        if (isEmail) {}
                      },
                      textAlign: TextAlign.center,
                      decoration: InputDecoration(
                        hintText: "******",
                        hintStyle: theme.displayLarge,
                      ),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pushReplacement(
                        MaterialPageRoute(builder: (context) => MyCats()),
                      );
                    },
                    child: Text("ادامه"),
                  ),
                ],
              ),
            ),
          ),
        );
      }),
    );
  }
}
