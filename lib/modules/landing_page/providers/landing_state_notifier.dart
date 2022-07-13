part of 'landing_provider.dart';

class LandingStateNotifier extends StateNotifier<LandingState>{
  LandingStateNotifier() : super(const LandingState.initial()){
    _detectPlatform();
  }

  void _detectPlatform() async {
    final prefs = await SharedPreferences.getInstance();
    state = const LandingState.loading();
    try {
      if(Platform.isAndroid){
        state = await prefs.setBool(PreferenceKeys.isAndroid, true) ?
        const LandingState.data() :
        const LandingState.error('Error in detecting platform');
      }else if(Platform.isIOS){
        state = await prefs.setBool(PreferenceKeys.isIos, true) ?
        const LandingState.data() :
        const LandingState.error('Error in detecting platform');
      }
    } on Exception catch (e) {
      state = LandingState.error(e.toString());
    }
  }

}