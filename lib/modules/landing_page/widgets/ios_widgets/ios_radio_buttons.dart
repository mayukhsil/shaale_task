import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shaale_task/modules/landing_page/providers/landing_provider.dart';
import 'package:shaale_task/styles/app_text_styles.dart';

class IOSClassicRadioButton extends ConsumerWidget {
  const IOSClassicRadioButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var landingChangeNotifierProvider = ref.watch(landingChangeNotifier);
    return SizedBox(
      height: 150.h,
      width: 200.w,
      child: Column(
        children: [
          RadioListTile<String>(
              value: 'Android',
              groupValue: landingChangeNotifierProvider.radioSelectedValue,
              onChanged: (value){
                landingChangeNotifierProvider.updateRadioSelectedValue(value!);
              },
              title: Text('Android',style: AppTextStyles.s14(fontType: FontType.MEDIUM),)
          ),
          RadioListTile<String>(
              value: 'iOS',
              groupValue: landingChangeNotifierProvider.radioSelectedValue,
              onChanged: (value){
                landingChangeNotifierProvider.updateRadioSelectedValue(value!);
              },
              title: Text('iOS',style: AppTextStyles.s14(fontType: FontType.MEDIUM),)
          ),
        ],
      ),
    );
  }
}
