import 'package:mobx/mobx.dart';
import 'package:tech_challange/helpers/pref.dart';



part 'intereststate.g.dart';
class InterestSelectionState = _InterestSelectionState with _$InterestSelectionState;



abstract class _InterestSelectionState with Store {
  @observable
  bool funnySelected = false;

  @observable
  bool footballSelected = false;

  @observable
  bool musicSelected = false;

  @observable
  bool animalsSelected = false;

  @action
  changeFunnySelected(bool val) {
      funnySelected = val;
    Prefs.setFunnySelection(funnySelected);
  }

  @action
  changeAnimalsSelected(bool val) {
      animalsSelected = val;
    Prefs.setAnimalsSelection(animalsSelected);
  }

  @action
  changeFootballSelected(bool val) {
      footballSelected = val;
    Prefs.setFootballSelection(footballSelected);
  }

  @action
  changeMusicSelected(bool val) {
      musicSelected = val;
    Prefs.setMusicSelection(musicSelected);
  }

  @action
  changeOboardingPref() {
    Prefs.setOnboardingDone();
  }
}
