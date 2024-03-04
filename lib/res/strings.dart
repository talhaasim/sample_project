import 'package:get/get.dart';

class LocalString extends Translations {

  static String homeInputPlaceholder = 'home_input_placeholder';
  static String homeDropdownLabel = 'home_dowpdown_label';

  @override
  Map<String, Map<String, String>> get keys => {
    'en': {
      homeInputPlaceholder: 'Enter desired amount.',
      homeDropdownLabel: 'Currency',
    },
  };
}

class AppStrings {

  static get homeInputPlaceholder => LocalString.homeInputPlaceholder.tr;
  static get homeDropdownLabel => LocalString.homeDropdownLabel.tr;

}
