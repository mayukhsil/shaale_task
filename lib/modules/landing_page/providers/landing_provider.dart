import 'dart:io';

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shaale_task/utils/preference_keys.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'landing_states.dart';

part 'landing_state_notifier.dart';
part 'landing_change_notifier.dart';

var landingStateNotifier = StateNotifierProvider<LandingStateNotifier, LandingState>(
  (_) => LandingStateNotifier(),
);

var landingChangeNotifier = ChangeNotifierProvider<LandingChangeNotifier>(
  (_) => LandingChangeNotifier(),
);
