import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shaale_task/modules/landing_page/providers/landing_provider.dart';
import 'package:shaale_task/modules/landing_page/widgets/android_widgets/android_dialogs.dart';
import 'package:shaale_task/modules/landing_page/widgets/android_widgets/android_radio_button.dart';
import 'package:shaale_task/modules/landing_page/widgets/android_widgets/android_sliders.dart';
import 'package:shaale_task/modules/landing_page/widgets/android_widgets/android_switches.dart';
import 'package:shaale_task/modules/landing_page/widgets/ios_widgets/ios_radio_buttons.dart';
import 'package:shaale_task/modules/landing_page/widgets/ios_widgets/ios_switches.dart';
import 'package:shaale_task/styles/app_text_colors.dart';
import 'package:shaale_task/styles/app_text_styles.dart';

import '../widgets/ios_widgets/ios_dialogs.dart';
import '../widgets/ios_widgets/ios_sliders.dart';

class LandingView extends ConsumerWidget {
  const LandingView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var landingStateNotifierProvider = ref.watch(landingStateNotifier);
    var landingChangeNotifierProvider = ref.watch(landingChangeNotifier);
    return landingStateNotifierProvider.when(initial: () {
      return const Scaffold(
        body: Center(
          child: CircularProgressIndicator(),
        ),
      );
    }, loading: () {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }, data: () {
      return Scaffold(
        appBar: AppBar(
          title: Text(
            'Shaale Task',
            style: AppTextStyles.s16(fontType: FontType.MEDIUM),
          ),
          actions: [
            Padding(
              padding: EdgeInsets.all(10.sp),
              child: GestureDetector(
                onTap: () {
                  landingChangeNotifierProvider.overridePlatform();
                },
                child: Container(
                  width: 100.w,
                  decoration: BoxDecoration(
                    color: AppColor.appGreyShade3,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Center(
                    child: !landingChangeNotifierProvider.isPlatformAndroid
                        ? Text(
                            'Change to Android',
                            style: AppTextStyles.s12(fontType: FontType.MEDIUM),
                            textAlign: TextAlign.center,
                          )
                        : Text(
                            'Change to iOS',
                            style: AppTextStyles.s12(fontType: FontType.MEDIUM),
                            textAlign: TextAlign.center,
                          ),
                  ),
                ),
              ),
            )
          ],
        ),
        body: Padding(
          padding: EdgeInsets.all(20.sp),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      Text(
                        '${landingChangeNotifierProvider.currentPlatform} Slider',
                        style: AppTextStyles.s14(fontType: FontType.MEDIUM),
                      ),
                      landingChangeNotifierProvider.isPlatformAndroid
                          ? const AndroidClassicSlider()
                          : const IOSClassicSlider(),
                    ],
                  ),
                  Column(
                    children: [
                      Text(
                        '${landingChangeNotifierProvider.currentPlatform} Switch',
                        style: AppTextStyles.s14(fontType: FontType.MEDIUM),
                      ),
                      landingChangeNotifierProvider.isPlatformAndroid
                          ? const AndroidClassicSwitch()
                          : const IOSClassicSwitch(),
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: 80.h,
              ),
              Column(
                children: [
                  Text(
                    'Radio Button',
                    style: AppTextStyles.s14(fontType: FontType.MEDIUM),
                  ),
                  landingChangeNotifierProvider.isPlatformAndroid
                      ? const AndroidClassicRadioButton()
                      : const IOSClassicRadioButton(),
                ],
              ),
              SizedBox(
                height: 40.h,
              ),
              TextButton(
                  onPressed: () {
                    showDialog(
                        context: context,
                        builder: (context) {
                          return landingChangeNotifierProvider.isPlatformAndroid
                              ? AndroidClassicAlertDialog(
                                  childWidget: landingChangeNotifierProvider
                                          .isPlatformAndroid
                                      ? const AndroidClassicSlider()
                                      : const IOSClassicSlider())
                              : IOSClassicAlertDialog(
                                  childWidget: landingChangeNotifierProvider
                                          .isPlatformAndroid
                                      ? const AndroidClassicSlider()
                                      : const IOSClassicSlider());
                        });
                  },
                  child: Text(
                    'Show ${landingChangeNotifierProvider.currentPlatform} Slider',
                    style: AppTextStyles.s12(fontType: FontType.MEDIUM),
                  )),
              SizedBox(
                height: 20.h,
              ),
              OutlinedButton(
                  onPressed: () {
                    showDialog(
                        context: context,
                        builder: (context) {
                          return landingChangeNotifierProvider.isPlatformAndroid
                              ? AndroidClassicAlertDialog(
                                  childWidget: landingChangeNotifierProvider
                                          .isPlatformAndroid
                                      ? const AndroidClassicSwitch()
                                      : const IOSClassicSwitch())
                              : IOSClassicAlertDialog(
                                  childWidget: landingChangeNotifierProvider
                                          .isPlatformAndroid
                                      ? const AndroidClassicSwitch()
                                      : const IOSClassicSwitch());
                        });
                  },
                  child: Text(
                    'Show ${landingChangeNotifierProvider.currentPlatform} Switch',
                    style: AppTextStyles.s12(fontType: FontType.MEDIUM),
                  )),
              SizedBox(
                height: 20.h,
              ),
              ElevatedButton(
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (context) {
                        return AndroidClassicAlertDialog(
                          childWidget:
                              landingChangeNotifierProvider.isPlatformAndroid
                                  ? const AndroidClassicRadioButton()
                                  : const IOSClassicRadioButton(),
                        );
                      });
                },
                child: Text(
                  'Show Radio Buttons',
                  style: AppTextStyles.s12(fontType: FontType.MEDIUM),
                ),
              ),
            ],
          ),
        ),
      );
    }, error: (error) {
      return Scaffold(body: Center(child: Text(error!)));
    });
  }
}
