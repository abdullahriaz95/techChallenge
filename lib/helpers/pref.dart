
import 'package:tech_challange/helpers/shared_preferences.dart';

import '../constants.dart';

class Prefs {

  /*
  * Funny Selected or not
  * */
  static Future<bool> get funnySelected =>
      PreferencesHelper.getBool(Constants.FUNNY_SELECTED);

  static Future setFunnySelection(bool val) =>
      PreferencesHelper.setBool(Constants.FUNNY_SELECTED, val);


  /*
  * Animals Selected or not
  * */
  static Future<bool> get animalsSelected =>
      PreferencesHelper.getBool(Constants.ANIMALS_SELECTED);

  static Future setAnimalsSelection(bool val) =>
      PreferencesHelper.setBool(Constants.ANIMALS_SELECTED, val);


  /*
  * Football Selected or not
  * */
  static Future<bool> get footballSelected =>
      PreferencesHelper.getBool(Constants.FOOTBALL_SELECTED);

  static Future setFootballSelection(bool val) =>
      PreferencesHelper.setBool(Constants.FOOTBALL_SELECTED, val);


  /*
  * Music Selected or not
  * */
  static Future<bool> get musicSelected =>
      PreferencesHelper.getBool(Constants.MUSIC_SELECTED);

  static Future setMusicSelection(bool val) =>
      PreferencesHelper.setBool(Constants.MUSIC_SELECTED, val);



  /*
  * Onboarding done
  * */
  static Future<bool> get onboarding =>
      PreferencesHelper.getBool(Constants.ONBOARDING);

  static Future setOnboardingDone() =>
      PreferencesHelper.setBool(Constants.ONBOARDING, true);





  Future<void> clear() async {
    await Future.wait(
      <Future>[
        setFunnySelection(false),
      ],
    );
  }
}
