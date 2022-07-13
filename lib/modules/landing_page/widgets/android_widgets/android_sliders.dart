import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shaale_task/modules/landing_page/providers/landing_provider.dart';

class AndroidClassicSlider extends ConsumerWidget {
  const AndroidClassicSlider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var landingChangeNotifierProvider = ref.watch(landingChangeNotifier);
    return SizedBox(
      height: 50.h,
      width: 220.w,
      child: Slider(
          value: landingChangeNotifierProvider.sliderValue,
          onChanged: (value){
            landingChangeNotifierProvider.updateSliderValue(value);
          }
      ),
    );
  }
}
