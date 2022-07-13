part of 'landing_provider.dart';

class LandingChangeNotifier extends ChangeNotifier{

  LandingChangeNotifier(){
    _init();
  }

  bool _isPlatformAndroid = false;
  bool _isPlatformIos = false;
  String _currentPlatform = '';
  bool _isSwitchOn = false;
  double _sliderValue = 0.0;
  String _radioSelectedValue = 'Android';

  bool get isPlatformAndroid => _isPlatformAndroid;
  bool get isPlatformIos => _isPlatformIos;
  String get currentPlatform => _currentPlatform;
  bool get isSwitchOn => _isSwitchOn;
  double get sliderValue => _sliderValue;
  String get radioSelectedValue => _radioSelectedValue;

  void _init(){
    _getPreferences();
  }

  void _getPreferences() async {
    final prefs = await SharedPreferences.getInstance();
    _isPlatformAndroid = prefs.getBool(PreferenceKeys.isAndroid) ?? false;
    _isPlatformIos = prefs.getBool(PreferenceKeys.isIos) ?? false;
    _currentPlatform = _isPlatformAndroid ? 'Android' : 'iOS';
    notifyListeners();
  }

  void toggleSwitch(bool value){
    _isSwitchOn = value;
    notifyListeners();
  }

  void updateSliderValue(double value){
    _sliderValue = value;
    notifyListeners();
  }

  void updateRadioSelectedValue(String value){
    _radioSelectedValue = value;
    notifyListeners();
  }

  void overridePlatform() {
    if (_currentPlatform == 'Android') {
      _currentPlatform = 'iOS';
      _isPlatformIos = true;
      _isPlatformAndroid = false;
    }
    else {
      _currentPlatform = 'Android';
      _isPlatformIos = false;
      _isPlatformAndroid = true;
    }
    notifyListeners();
  }
}