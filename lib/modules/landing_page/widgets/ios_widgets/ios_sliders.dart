import 'package:flutter/cupertino.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shaale_task/modules/landing_page/providers/landing_provider.dart';

class IOSClassicSlider extends ConsumerWidget {
  const IOSClassicSlider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var landingChangeNotifierProvider = ref.watch(landingChangeNotifier);
    return CupertinoSlider(
        value: landingChangeNotifierProvider.sliderValue,
        onChanged: (value){
          landingChangeNotifierProvider.updateSliderValue(value);
        }
    );
  }
}
