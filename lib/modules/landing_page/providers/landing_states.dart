import 'package:freezed_annotation/freezed_annotation.dart';

part 'landing_states.freezed.dart';

///Extension Method for easy comparison
extension LandingStates on LandingState {
  bool get isLoading => this is _LandingStateLoading;
}

@freezed
abstract class LandingState with _$LandingState {
  ///Initial
  const factory LandingState.initial() = _LandingStateInitial;

  ///Loading
  const factory LandingState.loading() = _LandingStateLoading;

  ///Data
  const factory LandingState.data() = _LandingStateData;

  ///Error
  const factory LandingState.error([String? error]) = _LandingStateError;
}