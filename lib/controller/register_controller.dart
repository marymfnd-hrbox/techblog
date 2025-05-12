import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:techblog/constant/api_constant.dart';
import 'package:techblog/constant/storage_const.dart';
import 'package:techblog/gen/assets.gen.dart';
import 'package:techblog/main.dart';
import 'package:techblog/services/dio_service.dart';
import 'package:techblog/view/article/manage_article.dart';
import 'package:techblog/view/register/register_intro.dart';

class RegisterController extends GetxController {
  TextEditingController emailTextEditingController = TextEditingController();
  TextEditingController activeCodeTextEditingController =
      TextEditingController();
  var email = "";
  // ignore: non_constant_identifier_names
  var user_id = "";

  register() async {
    Map<String, dynamic> map = {
      'email': emailTextEditingController.text,
      'command': 'register',
    };

    var response = await DioService().postMethod(
      map,
      ApiUrlConstant.postRegister,
    );
    email = emailTextEditingController.text;
    user_id = response.data['user_id'];
  }

  verify() async {
    Map<String, dynamic> map = {
      'email': email,
      'user_id': user_id,
      'code': activeCodeTextEditingController.text,
      'command': 'verify',
    };

    var response = await DioService().postMethod(
      map,
      ApiUrlConstant.postRegister,
    );

    var status = response.data['response'];

    switch (status) {
      case 'verified':
        var box = GetStorage();
        box.write(StorageKey.token, response.data['token']);
        box.write(StorageKey.userId, response.data['user_id']);

        Get.offAllNamed(NamedRoute.routeMainScreen);
        break;

      case 'incorrect_code':
        Get.snackbar('خطا', 'کد فعالسازی غلط است');
        break;

      case 'expired':
        Get.snackbar('خطا', 'کد فعالسازی منقضی شده است');
        break;
    }
  }

  toggleLogin() {
    if (GetStorage().read(StorageKey.token) == null) {
      Get.to(RegisterIntro());
    } else {
      routeToWriteAndRecordBottomSheet();
    }
  }

  routeToWriteAndRecordBottomSheet() {
    Get.bottomSheet(
      Container(
        height: Get.height / 3,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              Row(
                children: [
                  SvgPicture.asset(Assets.images.tcbot, height: 40),
                  const SizedBox(width: 8),
                  const Text("دونسته هات رو با بقیه به اشتراک بذار ..."),
                ],
              ),
              const SizedBox(height: 8),
              const Text(
                ''' فکر کن!! اینجا بودنت به این معناست که یک گیک تکنولوژی هستی
دونسته هات رو با جامعه ی گیک های فارسی زبان به اشتراک بذار ... ''',
              ),

              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                
                  children: [
                    GestureDetector(
                      onTap: () {
                        debugPrint("write article");
                        Get.to(() => ManageArticle());
                      },
                      child: Container(
                        color: Colors.white,
                        child: Row(
                          children: [
                            Image.asset(Assets.icons.writeArticle.path, height: 32),
                            const SizedBox(width: 8),
                            const Text("مدیریت مقاله ها"),
                          ],
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        debugPrint("record podcast");
                      },
                      child: Container(
                        color: Colors.white,
                        child: Row(
                          children: [
                            Image.asset(
                              Assets.icons.writePodcastIcon.path,
                              height: 32,
                            ),
                            const SizedBox(width: 8),
                            const Text("مدیریت پادکست ها"),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
