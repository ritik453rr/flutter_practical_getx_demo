import 'package:get/get.dart';
import 'package:getx_demo/language/app_strings.dart';

class AppLanguge extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        // English Language
        'en_US': {
          AppStrings.language: 'Language',
        },
        //Hindi Language
        'hi_IN': {
          AppStrings.language: 'भाषा',
        },
      };
}
